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
			create includes.make(0)
			create excludes.make(0)
		end

	make_identified (a_rm_type_name, an_object_id: STRING)
			-- set type name, object_id
		require
			Rm_type_name_valid: a_rm_type_name /= Void and then not a_rm_type_name.is_empty
			Object_id_valid: an_object_id /= Void and then not an_object_id.is_empty
		do
			default_create
			create representation.make(an_object_id, Current)
			rm_type_name := a_rm_type_name
		end

	make_anonymous (a_rm_type_name: STRING)
			-- set type name
		require
			Rm_type_name_valid: a_rm_type_name /= Void and then not a_rm_type_name.is_empty
		do
			default_create
			create representation.make_anonymous(Current)
			rm_type_name := a_rm_type_name
		end

feature -- Access

	includes: ARRAYED_LIST [ASSERTION]
			-- list of assertions on archetypes of type 'type_name' defining
			-- allowed archetypes

	excludes: ARRAYED_LIST [ASSERTION]
			-- list of assertions on archetypes of type 'type_name' defining
			-- excluded archetypes

feature -- Status Report

	any_allowed: BOOLEAN
			-- True if any value allowed
			-- i.e. no terminology_id or code_list
		do
			Result := not (has_includes or has_excludes)
		end

	has_includes: BOOLEAN
			-- true if there are invariants
		do
			Result := includes /= Void and then includes.count > 0
		end

	has_excludes: BOOLEAN
			-- true if there are invariants
		do
			Result := excludes /= Void and then excludes.count > 0
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

	add_include(assn: ASSERTION)
			-- add includes constraint
		require
			assn /= Void
		do
			if includes = Void then
				create includes.make(0)
			end
			includes.extend (assn)
		ensure
			includes.has(assn)
		end

	add_exclude(assn: ASSERTION)
			-- add excludes constraint
		require
			assn /= Void
		do
			if excludes = Void then
				create excludes.make(0)
			end
			excludes.extend (assn)
		ensure
			excludes.has(assn)
		end

	set_includes(assn_list: ARRAYED_LIST[ASSERTION])
			-- set includes constraints
		require
			assn_list /= Void
		do
			includes := assn_list
		end

	set_excludes(assn_list: ARRAYED_LIST[ASSERTION])
			-- set excludes constraints
		require
			assn_list /= Void
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
			if occurrences /= Void then
				Result.append(occurrences.as_string)
			end
		end

feature -- Representation

	representation: attached OG_OBJECT_LEAF

feature -- Visitor

	enter_subtree(visitor: C_VISITOR; depth: INTEGER)
			-- perform action at start of block for this node
		do
			precursor(visitor, depth)
			visitor.start_archetype_slot(Current, depth)
		end

	exit_subtree(visitor: C_VISITOR; depth: INTEGER)
			-- perform action at end of block for this node
		do
			precursor(visitor, depth)
			visitor.end_archetype_slot(Current, depth)
		end

invariant
	includes_valid: includes /= Void
	excludes_valid: excludes /= Void

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
