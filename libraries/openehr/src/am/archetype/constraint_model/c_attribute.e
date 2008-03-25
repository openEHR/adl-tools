indexing
	component:   "openEHR Archetype Project"
	description: "node in ADL parse tree"
	keywords:    "test, ADL"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.com>"
	copyright:   "Copyright (c) 2003-2008 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class C_ATTRIBUTE

inherit
	ARCHETYPE_CONSTRAINT
		redefine
			default_create, parent, representation
		end

create
	make_single, make_multiple

feature -- Initialisation

	default_create is
			--
		do
			create children.make (0)
			set_existence (create {INTERVAL [INTEGER]}.make_bounded (1, 1, True, True))
		end

	make_single(a_name: STRING) is
			-- make representing a single-valued attribute with attr name
		require
			a_name_valid: a_name /= Void and then not a_name.is_empty
		do
			default_create
			create representation.make_single (a_name, Current)
		ensure
			not is_multiple
		end

	make_multiple(a_name: STRING; a_cardinality: CARDINALITY) is
			-- make representing a container attribute with attr name & cardinality
		require
			a_name_valid: a_name /= Void and then not a_name.is_empty
			cardinality_exists: a_cardinality /= Void
		do
			default_create
			create representation.make_multiple (a_name, Current)
			set_cardinality(a_cardinality)
		ensure
			is_multiple
		end

feature -- Access

	rm_attribute_name: STRING is
			-- name of this attribute in reference model
		do
			Result := representation.node_id
		end

	existence: INTERVAL [INTEGER]

	cardinality: CARDINALITY

	parent: C_COMPLEX_OBJECT

	children: ARRAYED_LIST [C_OBJECT]

	child_count: INTEGER is
			-- number of children; 0 if any_allowed is True
		do
			Result := children.count
		end

feature -- Source Control

	specialisation_status (specialisation_level: INTEGER): SPECIALISATION_STATUS is
			-- status of this node in the source text of this archetype with respect to the
			-- specialisation hierarchy. Values are: defined_here; redefined, added, unknown
		do
			create Result.make(ss_propagated)
		end

feature -- Status Report

	any_allowed: BOOLEAN is
			-- Is any value allowed ('*' received in parsed input) - i.e. no children?
		do
			Result := children.is_empty
		end

	is_relationship: BOOLEAN is
			-- (in the UML sense) - True if attribute target type is not a primitive data type
		require
			has_children: not any_allowed
		local
			a_prim: C_PRIMITIVE_OBJECT
		do
			a_prim ?= children.first
			Result := a_prim = Void
		end

	is_multiple: BOOLEAN is
			-- True if this attribute has multiple cardinality
		do
			Result := representation.is_multiple
		end

	is_valid: BOOLEAN is
			-- report on validity
		do
			create invalid_reason.make (0)
			invalid_reason.append (rm_attribute_name + ": ")

			if not (any_allowed xor representation.has_children) then
				invalid_reason.append("must be either 'any' node or have child nodes")
			elseif existence = Void then	-- FIXME: Delete this check! It's guaranteed by the invariant, so why are we checking it here?
				invalid_reason.append("existence must be specified")
			else
				from
					Result := True
					children.start
				until
					not Result or children.off
				loop
					-- check occurrences consistent with attribute cardinality
					if not is_multiple and children.item.occurrences.upper > 1 then
						Result := False
						invalid_reason.append ("occurrences on child node " + children.item.node_id.out +
							" must be singular for non-container attribute")
					elseif not children.item.is_valid then
						Result := False
						invalid_reason.append ("(invalid child node) " + children.item.invalid_reason + "%N")
					end

					children.forth
				end
			end
		end

	has_child_with_id (a_node_id: STRING): BOOLEAN is
			-- has a child node with id a_node_id
		require
			Node_id_valid: a_node_id /= void and then not a_node_id.is_empty
		do
			Result := representation.has_child_with_id (a_node_id)
		end

	has_child (a_node: C_OBJECT): BOOLEAN is
			-- True if a_node is actually one of the children
		require
			Node_valid: a_node /= Void
		do
			Result := children.has (a_node)
		end

feature -- Modification

	set_existence(an_interval: INTERVAL[INTEGER]) is
			-- set existence constraint on this relation - applies whether single or multiple
		require
			Interval_exists: an_interval /= Void
		do
			existence := an_interval
		end

	set_cardinality(a_cardinality: CARDINALITY) is
			--
		require
			cardinality_exists: a_cardinality /= Void
		do
			cardinality := a_cardinality
		end

	put_child(an_obj: C_OBJECT) is
			-- put a new child node
		require
			Object_exists: an_obj /= Void
			Object_occurrences_valid: not is_multiple implies an_obj.occurrences.upper <= 1
			Object_id_valid: not (an_obj.is_addressable and has_child(an_obj))
		do
			representation.put_child(an_obj.representation)
			children.extend(an_obj)
			an_obj.set_parent(Current)
		end

	remove_child(an_obj: C_OBJECT) is
			-- remove an existing child node
		require
			Object_valid: an_obj /= Void and then has_child (an_obj)
		do
			representation.remove_child (an_obj.node_id)
			children.prune_all(an_obj)
		end

feature -- Representation

	representation: !OG_ATTRIBUTE_NODE

feature -- Serialisation

	enter_subtree(visitor: C_VISITOR; depth: INTEGER) is
			-- perform serialisation at start of block for this node
		do
			visitor.start_c_attribute(Current, depth)
		end

	exit_subtree(visitor: C_VISITOR; depth: INTEGER) is
			-- perform serialisation at end of block for this node
		do
			visitor.end_c_attribute(Current, depth)
		end

invariant
	Rm_attribute_name_valid: rm_attribute_name /= Void and then not rm_attribute_name.is_empty
	Existence_set: existence /= Void
	Children_validity: children /= Void
	Any_allowed_validity: any_allowed xor not children.is_empty
	Is_multiple_validity: is_multiple implies cardinality /= Void

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
--| The Original Code is cadl_rel_node.e.
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
