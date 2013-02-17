note
	component:   "openEHR Archetype Project"
	description: "Descriptor of a node in a directory of archetypes"
	keywords:    "ADL, archetype"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2006- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "See notice at bottom of class"

deferred class ARCH_CAT_ITEM

inherit
	SHARED_RESOURCES
		export
			{NONE} all
		undefine
			is_equal
		end

	ARCHETYPE_DEFINITIONS
		export
			{NONE} all
		undefine
			is_equal
		end

	IDENTIFIED_TOOL_ARTEFACT
		undefine
			is_equal
		end

	BMM_DEFINITIONS
		export
			{NONE} all;
			{ANY} package_name_delimiter, section_separator
		undefine
			is_equal
		end

	ITERABLE [ARCH_CAT_ITEM]
		undefine
			is_equal
		end

	COMPARABLE

feature -- Access

	group_name: STRING
			-- Name distinguishing the type of item and the group to which its `repository' belongs.
			-- Useful as a logical key to pixmap icons, etc.
		deferred
		ensure
			not_empty: not Result.is_empty
		end

	qualified_name: STRING
			-- semantic name of this node, relative to parent concept, which is either class or package name, or else as concept name of archetype
			-- used to generate ontological path
			-- For Classes, will be the name of the top-level package & class e.g. EHR-OBSERVATION
			-- For archetypes will be the id
		deferred
		end

	qualified_key: STRING
			-- lower-case form of `qualified_name' for safe matching
		do
			Result := qualified_name.as_lower
		ensure
			Is_lower: Result.same_string (Result.as_lower)
		end

	name: STRING
			-- name of this node to use in display context
		deferred
		end

	path: STRING
			-- path from root of directory structure down to this point
			-- for classes in the RM, it will look lie 			/content_item/care_entry/observation
			-- for archetypes, it will look like 				/content_item/care_entry/observation/lab_result
			-- for specialised archetypes, it will look like 	/content_item/care_entry/observation/lab_result/microbiology
		do
			create Result.make (0)
			if attached parent as p then
				Result.append (p.path + Ontological_path_separator)
			end
			Result.append (name)
		end

   	subtree_artefact_count (artefact_types: ARRAY [INTEGER]): INTEGER
   			-- number of artefacts below this node of the types mentioned in `artefact_types'
   		local
			i: INTEGER
		do
 			from i := artefact_types.lower until i > artefact_types.upper loop
 				Result := Result + subtree_artefact_counts.item (artefact_types[i])
 				i := i + 1
 			end
		end

	child_with_qualified_key (a_key: STRING): like children.item
		require
			has_child_with_qualified_key (a_key)
		do
			check attached children as c then
				from c.start until c.off or c.item.qualified_key.same_string (a_key) loop
					c.forth
				end
				Result := c.item
			end
		end

	global_artefact_category: STRING
			-- tool-wide category for this artefact, useful for indexing visual type indeicators
			-- like pixmap etc
		do
			Result := group_name
		end

	new_cursor: ITERATION_CURSOR [like children.item]
			-- Fresh cursor associated with current structure
		do
			Result := children.new_cursor
		end

feature -- Status Report

	has_artefacts: BOOLEAN
			-- True if there are any artefacts at or below this point
		deferred
		end

	is_root: BOOLEAN
			-- True if this node is the root of the tree
		do
			Result := parent = Void
		end

	has_children: BOOLEAN
		do
			Result := attached children
		end

	has_child (a_child: like children.item): BOOLEAN
		do
			Result := attached children as c and then c.has (a_child)
		end

	has_child_with_qualified_key (a_key: STRING): BOOLEAN
		require
			Lower_case_key: a_key.as_lower.same_string (a_key)
		do
			Result := attached children as c and then c.there_exists (
				agent (a_child: like children.item; key: STRING):BOOLEAN
					do
						Result := a_child.qualified_key.same_string (key)
					end (?, a_key)
			)
		end

   	has_matching_children (test_agt: FUNCTION [ANY, TUPLE [ARCH_CAT_ITEM], BOOLEAN]): BOOLEAN
   			-- true if any direct children of the types mentioned in `artefact_types'
		do
 			Result := attached children as c and then
 				across c as child_csr some test_agt.item ([child_csr.item]) end
		end

feature {ARCHETYPE_CATALOGUE} -- Modification

	put_child (a_child: like children.item)
		local
			att_children: attached like children
		do
			if attached children as c then
				att_children := c
			else
				create att_children.make
				children := att_children
			end
			att_children.extend (a_child)
			a_child.set_parent (Current)
			reset_subtree_artefact_count
		end

	remove_child (a_child: like children.item)
		require
			has_child (a_child)
		do
			check attached children as c then
				c.prune (a_child)
			end
			reset_subtree_artefact_count
		end

	wipe_out
		do
			children := Void
		end

feature {ARCH_CAT_ITEM} -- Modification

	set_parent (a_parent: like parent)
		do
			parent := a_parent
		end

feature -- Comparison

	is_less alias "<" (other: like Current): BOOLEAN
			-- Is current object less than `other'?
		do
			Result := qualified_name < other.qualified_name
		end

feature {ARCH_CAT_ITEM, ARCHETYPE_CATALOGUE} -- Implementation

	children: detachable SORTED_TWO_WAY_LIST [ARCH_CAT_ITEM]
			-- list of child nodes

	parent: detachable ARCH_CAT_ITEM
			-- parent node

	subtree_artefact_counts: HASH_TABLE [INTEGER, INTEGER]
			-- counter of archetype child objects, keyed by artefact type,
			-- i.e. archetype & template counts stored separately
		local
			atf_types: ARRAYED_LIST [INTEGER]
		do
			if attached subtree_artefact_counts_cache as sacc then
				Result := sacc
			else
				-- create empty set of counters
				create Result.make(0)
				atf_types := (create {ARTEFACT_TYPE}).types.linear_representation
				across atf_types as atf_types_csr loop
					Result.put (0, atf_types_csr.item)
				end

				-- aggregate child counts and local count
				if has_children then
					across children as child_csr loop
						-- FIXME: the following is technically naughty, since it creates a dependency on a descendant type, but
						-- the code reduction seems worth it
						across Result as subtree_counts_csr loop
							Result.replace (subtree_counts_csr.item +
									child_csr.item.subtree_artefact_counts.item (subtree_counts_csr.key), subtree_counts_csr.key)
						end
						if attached {ARCH_CAT_ARCHETYPE} child_csr.item as ara then
							Result.replace (Result.item (ara.artefact_type) + 1, ara.artefact_type)
						end
					end
				end
				subtree_artefact_counts_cache := Result
			end
		end

	subtree_artefact_counts_cache: detachable HASH_TABLE [INTEGER, INTEGER]
			-- stored counter of archetype child objects, keyed by artefact type,
			-- i.e. archetype & template counts stored separately

	reset_subtree_artefact_count
		local
			csr: detachable ARCH_CAT_ITEM
		do
			subtree_artefact_counts_cache := Void
			from csr := parent until csr = Void loop
				csr.reset_subtree_artefact_count
				csr := csr.parent
			end
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
--| The Original Code is archetype_directory_item.e.
--|
--| The Initial Developer of the Original Code is Thomas Beale.
--| Portions created by the Initial Developer are Copyright (C) 2006
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
