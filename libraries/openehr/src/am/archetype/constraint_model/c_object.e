note
	component:   "openEHR Archetype Project"
	description: "[
				 Any OBJECT node in ADL parse tree, including real OBJECTs,
				 simple OBJECTs, real OBJECT 'use' references, and OBJECTs
				 which represent constraints on other archetypes.
				 ]"
	keywords:    "test, ADL"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.com>"
	copyright:   "Copyright (c) 2003-2009 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

deferred class C_OBJECT

inherit
	ARCHETYPE_CONSTRAINT
		redefine
			parent, representation, rm_descriptor
		end

	ARCHETYPE_TERM_CODE_TOOLS
		export
			{NONE} all;
			{ANY} specialisation_depth_from_code;
		end

	SHARED_REFERENCE_MODEL_ACCESS
		export
			{NONE} all
		end

feature -- Access

	rm_type_name: STRING
			-- type name from reference model, of object to instantiate

	rm_descriptor: BMM_TYPE_SPECIFIER
			-- descriptor from RM representation; used for various validation and flattening operations

	node_id: STRING
			--
		do
			Result := representation.node_id
		end

	occurrences: MULTIPLICITY_INTERVAL

	parent: C_ATTRIBUTE

	sibling_order: SIBLING_ORDER
			-- set if this node should be ordered with respect to an inherited sibling; only settable
			-- on specialised nodes

	specialisation_depth: INTEGER
			-- specialisation level of this node if identified
		do
			Result := representation.specialisation_depth
		end

feature -- Source Control

	specialisation_status (spec_level: INTEGER): SPECIALISATION_STATUS
			-- status of this node in the source text of this archetype with respect to the
			-- specialisation hierarchy. Values are defined in SPECIALISATION_STATUSES
			-- detects specialisation status for identified nodes
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

feature -- Comparison

	node_congruent_to (other: like Current): BOOLEAN
			-- True if this node on its own (ignoring any subparts) expresses the same constraints as `other'.
			-- `other' is assumed to be in a flat archetype
			-- Returns False if any of the following is different:
			--	rm_type_name
			--	occurrences
			-- 	sibling order
			-- The node_id may be redefined however.
		do
			Result := rm_type_name.is_equal (other.rm_type_name) and (occurrences = Void or occurrences.equal_interval(other.occurrences)) and node_id_conforms_to (other)
		end

	node_conforms_to (other: like Current): BOOLEAN
			-- True if this node on its own (ignoring any subparts) expresses the same or narrower constraints as `other'.
			-- `other' is assumed to be in a flat archetype
			-- Returns False if any of the following is incompatible:
			--	rm_type_name
			--	occurrences
			--	node_id (& specialisation depth)
		do
			if is_addressable and other.is_addressable then
				if node_id.is_equal (other.node_id) then
					Result := rm_type_name.is_equal (other.rm_type_name) and (occurrences = Void or else occurrences.equal_interval(other.occurrences))
				else
					Result := (rm_type_conforms_to(other) and occurrences_conforms_to (other) and node_id_conforms_to (other))
				end
			elseif not is_addressable and not other.is_addressable then
				Result := rm_type_conforms_to(other) and occurrences_conforms_to (other)
			end
		end

	rm_type_conforms_to (other: like Current): BOOLEAN
			-- True if this node rm_type_name conforms to other.rm_type_name by either being equal, or being a subtype
			-- according to the underlying reference model
			-- `other' is assumed to be in a flat archetype
		do
			Result := rm_type_name.is_equal (other.rm_type_name) or rm_checker.is_sub_type_of(rm_type_name, other.rm_type_name)
		end

	occurrences_conforms_to (other: like Current): BOOLEAN
			-- True if this node occurrences conforms to other.occurrences; `other' is assumed to be in a flat archetype
		require
			other_exists: other /= Void
			other_is_flat: other.occurrences /= Void
		do
			Result := occurrences = Void or
					occurrences.equal_interval (other.occurrences) or
					other.occurrences.contains (occurrences)
		end

	node_id_conforms_to (other: like Current): BOOLEAN
			-- True if this node id conforms to other.node_id; `other' is assumed to be in a flat archetype
		do
			Result := codes_conformant (node_id, other.node_id)
		end

	valid_occurrences(occ: MULTIPLICITY_INTERVAL): BOOLEAN
			-- check if `occ' is valid to be set as occurrences on this object
		require
			Occurrences_attached: occ /= Void
		do
			Result := parent /= Void and parent.is_single implies occ.upper <= 1
		end

feature -- Modification

	set_occurrences(occ: MULTIPLICITY_INTERVAL)
			--
		require
			Occurrences_valid: occ /= Void and then valid_occurrences(occ)
		do
			occurrences := occ
		ensure
			occurrences = occ
		end

	remove_occurrences
		do
			occurrences := Void
		ensure
			occurrences = Void
		end

	set_sibling_order (a_sibling_order: SIBLING_ORDER)
			-- set sibling order
		require
			a_sibling_order /= Void and specialisation_depth > 0
		do
			sibling_order := a_sibling_order
		ensure
			sibling_order_set: sibling_order = a_sibling_order
		end

	set_sibling_order_before (a_node_id: STRING)
			-- set sibling order of this node to be before the inherited sibling node with id a_node_id
		require
			a_node_id /= Void and not a_node_id.is_empty
		do
			create sibling_order.make_before (a_node_id)
		ensure
			sibling_order_set: sibling_order /= Void and (sibling_order.is_before and sibling_order.sibling_node_id.is_equal (a_node_id))
		end

	set_sibling_order_after (a_node_id: STRING)
			-- set sibling order of this node to be after the inherited sibling node with id a_node_id
		require
			a_node_id /= Void and specialisation_depth_from_code (a_node_id) < specialisation_depth
		do
			create sibling_order.make_after (a_node_id)
		ensure
			sibling_order_set: sibling_order /= Void and (sibling_order.is_after and sibling_order.sibling_node_id.is_equal (a_node_id))
		end

	clear_sibling_order
			-- remove sibling order
		do
			sibling_order := Void
		end

	set_node_id (an_object_id: STRING)
		require
			Object_id_valid: an_object_id /= Void and then not an_object_id.is_empty
		do
			representation.set_node_id (an_object_id)
		end

	overlay_differential (other: like Current)
			-- apply any differences from `other' to this object node including:
			-- 	node_id
			-- 	overridden rm_type_name
			-- 	occurrences
			-- Current is assumed to be in a flat archetype
		require
			Other_valid: other /= Void and then other.node_conforms_to (Current)
			Flat_archetype: occurrences /= Void
		do
			if not other.node_id.is_equal(node_id) then
				set_node_id (other.node_id.twin)
			end
			if not other.rm_type_name.is_equal(rm_type_name) then
				rm_type_name := other.rm_type_name.twin
			end
			if other.occurrences /= Void and then not other.occurrences.equal_interval (occurrences) then
				set_occurrences (other.occurrences.deep_twin)
			end
		end

feature -- Output

	occurrences_as_string: STRING is
			-- output string representing `occurrences', even if occurrences is Void
		do
			if occurrences = Void then
				Result := "(none)"
			else
				Result := occurrences.as_string
			end
		end

feature -- Representation

	representation: attached OG_OBJECT

invariant
	rm_type_name_valid: rm_type_name /= Void and then not rm_type_name.is_empty
	Occurrences_validity: occurrences /= Void implies valid_occurrences(occurrences)

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
