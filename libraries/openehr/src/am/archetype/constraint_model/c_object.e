indexing
	component:   "openEHR Archetype Project"
	description: "[
				 Any OBJECT node in ADL parse tree, including real OBJECTs,
				 simple OBJECTs, real OBJECT 'use' references, and OBJECTs
				 which represent constraints on other archetypes.
				 ]"
	keywords:    "test, ADL"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2003 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

deferred class C_OBJECT

inherit
	ARCHETYPE_CONSTRAINT
		redefine
			parent, default_create, representation
		end

	ARCHETYPE_TERM_CODE_TOOLS
		export
			{NONE} all;
			{ANY} specialisation_depth_from_code;
		undefine
			default_create
		end

	C_COMMON
		export
			{NONE} all
		undefine
			default_create
		end

feature -- Initialisation

	default_create is
		do
			occurrences := default_occurrences.deep_twin
		end

feature -- Access

	rm_type_name: STRING
			-- type name from reference model, of object to instantiate

	node_id: STRING is
			--
		do
			Result := representation.node_id
		end

	occurrences: INTERVAL[INTEGER]

	parent: C_ATTRIBUTE

	sibling_order: SIBLING_ORDER
			-- set if this node should be ordered with respect to an inherited sibling; only settable
			-- on specialised nodes

	specialisation_depth: INTEGER is
			-- specialisation level of this node if identified
		do
			Result := representation.specialisation_depth
		end

feature -- Source Control

	specialisation_status (spec_level: INTEGER): SPECIALISATION_STATUS is
			-- status of this node in the source text of this archetype with respect to the
			-- specialisation hierarchy. Values are defined in SPECIALISATION_STATUSES
		do
			if not is_valid_code(node_id) then
				create Result.make(ss_propagated)
			else
				if specialisation_depth < spec_level then
					create Result.make(ss_inherited)
				else
					Result := specialisation_status_from_code (node_id, spec_level)
				end
			end
		end

feature -- Status Report

	is_valid: BOOLEAN is
			-- report on validity
		do
			create invalid_reason.make(0)
			invalid_reason.append(rm_type_name + "{" + generating_type + "} ")
			if is_addressable then
				invalid_reason.append("[" + node_id + "]")
			end
			invalid_reason.append(": ")

			if occurrences = Void then	-- FIXME: Delete this check! It's guaranteed by the invariant, so why are we checking it here?
				invalid_reason.append("occurrences must be specified")
			elseif parent /= Void then
				if not parent.is_multiple and occurrences.upper > 1 then	-- FIXME: Delete this check! It's guaranteed by the invariant, so why are we checking it here?
					invalid_reason.append("occurrences max can only be 1 for single parent attribute")
				else
					Result := True
				end
			else
				Result := True
			end
		end

	is_occurrences_default: BOOLEAN is
			-- True if occurrences is set at default value
		do
			Result := occurrences.is_equal(default_occurrences)
		end

feature -- Comparison

	is_subset_of (other: like Current): BOOLEAN is
			-- True if this node is a subset, i.e. a redefinition of, `other' in the ADL constraint sense, i.e. that all
			-- aspects of the definition of this node and all child nodes define a narrower, wholly
			-- contained instance space of `other'.
			-- Returns False if they are the same, or if they do not correspond
		deferred
		end

	is_node_conformant_to (other: like Current): BOOLEAN is
			-- True if this node on its own (ignoring any subparts) expresses the same or narrower constraints as `other'.
			-- Returns False if any of the following is incompatible:
			--	rm_type_name
			--	occurrences
			--	node_id (& specialisation depth)
			-- An error message can be obtained by calling node_conformance_failure_reason
		do
			if rm_type_name.is_equal (other.rm_type_name) or rm_checker.is_subclass_of(rm_type_name, other.rm_type_name) then
				if occurrences.is_equal (other.occurrences) or other.occurrences.contains (occurrences) then
					Result := codes_conformant (node_id, other.node_id)
				end
			end
		end

	node_conformance_failure_reason (other: like Current): STRING is
			-- generate an error message explaining why is_node_conformant_to() returned False
		do
			create Result.make_empty
			if not (rm_type_name.is_equal (other.rm_type_name) or rm_checker.is_subclass_of(rm_type_name, other.rm_type_name)) then
				Result.append("Class " + rm_type_name + " does not conform to type " + other.rm_type_name  + "%N")
			elseif not (occurrences.is_equal (other.occurrences) or other.occurrences.contains (occurrences)) then
				Result.append("Occurrences " + occurrences.as_string + " does not conform to " + other.occurrences.as_string  + "%N")
			elseif not codes_conformant (node_id, other.node_id) then
				Result.append("Code " + node_id + " does not conform to code " + other.node_id  + "%N")
			end
		end

feature -- Modification

	set_occurrences(ivl: INTERVAL[INTEGER]) is
			--
		require
			Interval_exists: ivl /= Void
		do
			occurrences := ivl
		ensure
			occurrences = ivl
		end

	set_sibling_order (a_sibling_order: SIBLING_ORDER) is
			-- set sibling order
		require
			a_sibling_order /= Void and specialisation_depth > 0
		do
			sibling_order := a_sibling_order
		ensure
			sibling_order_set: sibling_order = a_sibling_order
		end

	set_sibling_order_before (a_node_id: STRING) is
			-- set sibling order of this node to be before the inherited sibling node with id a_node_id
		require
			a_node_id /= Void and not a_node_id.is_empty
		do
			create sibling_order.make_before (a_node_id)
		ensure
			sibling_order_set: sibling_order /= Void and (sibling_order.is_before and sibling_order.sibling_node_id.is_equal (a_node_id))
		end

	set_sibling_order_after (a_node_id: STRING) is
			-- set sibling order of this node to be after the inherited sibling node with id a_node_id
		require
			a_node_id /= Void and specialisation_depth_from_code (a_node_id) < specialisation_depth
		do
			create sibling_order.make_after (a_node_id)
		ensure
			sibling_order_set: sibling_order /= Void and (sibling_order.is_after and sibling_order.sibling_node_id.is_equal (a_node_id))
		end

	set_object_id(an_object_id:STRING) is
		require
			Object_id_valid: an_object_id /= Void and then not an_object_id.is_empty
		do
			representation.set_node_id(an_object_id)
		end

	overlay_differential(other: like Current) is
			-- apply any differences from `other' to this object node including:
			-- 	node_id
			-- 	overridden rm_type_name
			-- 	occurrences
		require
			Other_valid: other /= Void and then other.is_node_conformant_to (Current)
		do
			if not other.node_id.is_equal(node_id) then
				set_object_id(other.node_id)
			end
			if not other.rm_type_name.is_equal(rm_type_name) then
				rm_type_name := other.rm_type_name.twin
			end
			if not other.occurrences.is_equal (occurrences) then
				set_occurrences (other.occurrences.deep_twin)
			end
		end

feature -- Representation

	representation: !OG_OBJECT

invariant
	rm_type_name_valid: rm_type_name /= Void and then not rm_type_name.is_empty
	Occurrences_validity: occurrences /= Void and then
		(parent /= Void implies (not parent.is_multiple implies occurrences.upper <= 1))

end


--|
--| ***** BEGIN LICENSE BLOCK *****
--| Version: MPL 1.1/GPL 2.0/LGPL 2.1
--|
--| The contents of this file are subject to the Mozilla Public License Version
--| 1.1 (the 'License'); you may not use this file except in compliance with
--| the License. You may obtain a copy of the License at
--| http://www.mozilla.org/MPL/
--|
--| Software distributed under the License is distributed on an 'AS IS' basis,
--| WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License
--| for the specific language governing rights and limitations under the
--| License.
--|
--| The Original Code is cadl_object_item.e.
--|
--| The Initial Developer of the Original Code is Thomas Beale.
--| Portions created by the Initial Developer are Copyright (C) 2003-2004
--| the Initial Developer. All Rights Reserved.
--|
--| Contributor(s):
--|
--| Alternatively, the contents of this file may be used under the terms of
--| either the GNU General Public License Version 2 or later (the 'GPL'), or
--| the GNU Lesser General Public License Version 2.1 or later (the 'LGPL'),
--| in which case the provisions of the GPL or the LGPL are applicable instead
--| of those above. If you wish to allow use of your version of this file only
--| under the terms of either the GPL or the LGPL, and not to allow others to
--| use your version of this file under the terms of the MPL, indicate your
--| decision by deleting the provisions above and replace them with the notice
--| and other provisions required by the GPL or the LGPL. If you do not delete
--| the provisions above, a recipient may use your version of this file under
--| the terms of any one of the MPL, the GPL or the LGPL.
--|
--| ***** END LICENSE BLOCK *****
--|
