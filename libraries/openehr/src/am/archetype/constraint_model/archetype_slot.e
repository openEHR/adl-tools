note
	component:   "openEHR Archetype Project"
	description: "[
			     Subtype of C_OBJECT representing an archetype %"slot%", i.e.
			     a specification of what archetypes can come at a chaining
			     point in the archetype. If the includes list is non-empty,
			     only archetypes matching the list items are allowed; if the
			     excludes list is non-empty, matching archetypes are not allowed.
			     If both lists are empty, any archetype of the rm_type is
			     allowed.
			 ]"
	keywords:    "archetype, ADL"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2004 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class ARCHETYPE_SLOT

inherit
	C_REFERENCE_OBJECT
		redefine
			representation, default_create, out, enter_subtree, exit_subtree
		end

create
	make_identified, make_anonymous

feature -- Initialisation

	default_create
			--
		do
			precursor
			create includes.make(0)
			create excludes.make(0)
		end

	make_identified (a_rm_type_name, an_object_id: attached STRING)
			-- set type name, object_id
		require
			Rm_type_name_valid: not a_rm_type_name.is_empty
			Object_id_valid: not an_object_id.is_empty
		do
			default_create
			create representation.make (an_object_id, Current)
			rm_type_name := a_rm_type_name
		end

	make_anonymous (a_rm_type_name: attached STRING)
			-- set type name
		require
			Rm_type_name_valid: not a_rm_type_name.is_empty
		do
			default_create
			create representation.make_anonymous (Current)
			rm_type_name := a_rm_type_name
		end

feature -- Access

	includes: attached ARRAYED_LIST [ASSERTION]
			-- list of assertions on archetypes of type 'type_name' defining
			-- allowed archetypes

	excludes: attached ARRAYED_LIST [ASSERTION]
			-- list of assertions on archetypes of type 'type_name' defining
			-- excluded archetypes

feature -- Status Report

	any_allowed: BOOLEAN
			-- True if any value allowed i.e. no includes or excludes defined, and
			-- slot is not closed
		do
			Result := includes.is_empty and excludes.is_empty and not is_closed
		end

	has_any_includes: BOOLEAN
			-- true if there are any includes at all
		do
			Result := not includes.is_empty and then not includes.first.matches_any
		end

	has_any_excludes: BOOLEAN
			-- true if there are any excludes at all
		do
			Result := not excludes.is_empty and then not excludes.first.matches_any
		end

	has_substantive_includes: BOOLEAN
			-- true if there are substantive includes, i.e. not just matching 'any'
		do
			Result := not includes.is_empty and then not includes.first.matches_any
		end

	has_substantive_excludes: BOOLEAN
			-- true if there are substantive excludes, i.e. not just matching 'any'
		do
			Result := not excludes.is_empty and then not excludes.first.matches_any
		end

	has_open_includes: BOOLEAN
			-- true if there are substantive includes, i.e. not just matching 'any'
		do
			Result := not includes.is_empty and then includes.first.matches_any
		end

	has_open_excludes: BOOLEAN
			-- true if there are substantive excludes, i.e. not just matching 'any'
		do
			Result := not excludes.is_empty and then excludes.first.matches_any
		end

	status_required: BOOLEAN
			-- True if there are substantive includes or excludes which are required
		do
			Result := (not includes.is_empty and excludes.is_empty) or (not excludes.is_empty and includes.is_empty)
		end

	is_closed: BOOLEAN
			-- True if this slot specification in this template exhaustively mentions all fillers,
			-- in which case, the slot will not be available for further filling in either
			-- specialised archetypes or at runtime.
			-- Default value False, i.e. unless explicitly set, slots remain open.

feature -- Comparison

	is_subset_of (other: like Current): BOOLEAN
			-- True if this node is a subset, i.e. a redefinition of, `other'
			-- Returns False if they are the same, or if they do not correspond
		do
			if other.any_allowed then
				Result := True
			elseif not any_allowed then
				-- FIXME - tobe implemented
			end
		end

feature -- Modification

	add_include (assn: attached ASSERTION)
			-- add includes constraint
		do
			includes.extend (assn)
		ensure
			includes.has(assn)
		end

	add_exclude (assn: attached ASSERTION)
			-- add excludes constraint
		do
			excludes.extend (assn)
		ensure
			excludes.has(assn)
		end

	set_includes (assn_list: attached ARRAYED_LIST[ASSERTION])
			-- set includes constraints
		do
			includes := assn_list
		end

	set_excludes (assn_list: attached ARRAYED_LIST[ASSERTION])
			-- set excludes constraints
		do
			excludes := assn_list
		end

	set_closed
			-- set `is_closed'
		do
			is_closed := True
		end

feature -- Output

	out: STRING
			--
		do
			create Result.make(0)
			Result.append (rm_type_name + "[" + representation.node_id + "] ")
			if attached occurrences then
				Result.append (occurrences.as_string)
			end
		end

feature -- Representation

	representation: attached OG_OBJECT_LEAF

feature -- Visitor

	enter_subtree (visitor: C_VISITOR; depth: INTEGER)
			-- perform action at start of block for this node
		do
			precursor (visitor, depth)
			visitor.start_archetype_slot (Current, depth)
		end

	exit_subtree (visitor: C_VISITOR; depth: INTEGER)
			-- perform action at end of block for this node
		do
			precursor (visitor, depth)
			visitor.end_archetype_slot (Current, depth)
		end

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
--| The Original Code is cadl_object_node.e.
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
