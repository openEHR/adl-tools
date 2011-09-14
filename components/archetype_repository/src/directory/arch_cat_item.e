note
	component:   "openEHR Archetype Project"
	description: "Descriptor of a node in a directory of archetypes"
	keywords:    "ADL, archetype"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2006 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"


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

	BMM_DEFINITIONS
		export
			{NONE} all;
			{ANY} package_name_delimiter, section_separator
		undefine
			is_equal
		end

	COMPARABLE

feature -- Definitions

	Ontological_path_separator: STRING = "/"

feature -- Initialisation

	make
		do
		end

feature -- Access

	group_name: attached STRING
			-- Name distinguishing the type of item and the group to which its `repository' belongs.
			-- Useful as a logical key to pixmap icons, etc.
		deferred
		ensure
			not_empty: not Result.is_empty
		end

	qualified_name: attached STRING
			-- semantic name of this node, relative to parent concept, which is either class or package name, or else as concept name of archetype
			-- used to generate ontological path
			-- For Classes, will be the name of the top-level package & class e.g. EHR-OBSERVATION
			-- For archetypes will be the id
		deferred
		end

	qualified_key: attached STRING
			-- uppercase form of qualified_name, for safe matching
		deferred
		end

	name: STRING
			-- name of this node to use in display context
		deferred
		end

	path: STRING
			-- path from root of ontology structure down to this point
			-- for classes in the RM, it will look lie 			/content_item/care_entry/observation
			-- for archetypes, it will look like 				/content_item/care_entry/observation/lab_result
			-- for specialised archetypes, it will look like 	/content_item/care_entry/observation/lab_result/microbiology
		do
			create Result.make (0)
			if parent /= Void then
				Result.append (parent.path + Ontological_path_separator)
			end
			Result.append (name)
		end

	subtree_artefact_counts: HASH_TABLE [INTEGER, INTEGER]
			-- stored counter of archetype child objects, keyed by artefact type,
			-- i.e. archetype & template counts stored separately
		local
			atf_types: ARRAYED_LIST [INTEGER]
		do
			if subtree_artefact_counts_cache = Void then
				-- create empty set of counters
				create subtree_artefact_counts_cache.make(0)
				atf_types := (create {ARTEFACT_TYPE}).types.linear_representation
				from atf_types.start until atf_types.off loop
					subtree_artefact_counts_cache.put (0, atf_types.item)
					atf_types.forth
				end

				-- aggregate child counts and local count
				if has_children then
					from children.start until children.off loop
						-- the following is technically naughty, since it creates a dependency on a descendant type, but
						-- the code reduction seems worth it
						from subtree_artefact_counts_cache.start until subtree_artefact_counts_cache.off loop
							subtree_artefact_counts_cache.replace (subtree_artefact_counts_cache.item_for_iteration +
																	children.item.subtree_artefact_counts.item(subtree_artefact_counts_cache.key_for_iteration),
																	subtree_artefact_counts_cache.key_for_iteration)
							subtree_artefact_counts_cache.forth
						end
						if attached {ARCH_CAT_ARCHETYPE} children.item as ara then
							subtree_artefact_counts_cache.replace(subtree_artefact_counts_cache.item(ara.artefact_type) + 1, ara.artefact_type)
						end
						children.forth
					end
				end
			end
			Result := subtree_artefact_counts_cache
		end

   	sub_tree_artefact_count (artefact_types: attached ARRAY [INTEGER]): INTEGER
   			-- number of artefacts below this node of the types mentioned in `artefact_types'
   		local
			i: INTEGER
		do
 			from i := artefact_types.lower until i > artefact_types.upper loop
 				Result := Result + subtree_artefact_counts.item(artefact_types[i])
 				i := i + 1
 			end
		end

	child_with_qualified_name (a_name: attached STRING): like child_type
		require
			has_child_with_qualified_name (a_name)
		do
			from children.start until children.off or children.item.qualified_name.same_string (a_name) loop
				children.forth
			end
			Result := children.item
		end

feature -- Status Report

	has_artefacts: BOOLEAN
			-- True if there are any artefacts at or below this point
		deferred
		end

	has_children: BOOLEAN
			-- True if there are any child nodes
		do
			Result := children /= Void
		end

	is_root: BOOLEAN
			-- True if this node is the root of the tree
		do
			Result := parent = Void
		end

	has_child (a_child: attached like child_type): BOOLEAN
		do
			if children /= Void then
				Result := children.has (a_child)
			end
		end

	has_child_with_qualified_name (a_name: attached STRING): BOOLEAN
		do
			if children /= Void then
				Result := children.there_exists (
					agent (a_child: like child_type; s: STRING):BOOLEAN
						do
							Result := a_child.qualified_key.same_string (s)
						end (?, a_name.as_upper)
				)
			end
		end

feature -- Iteration

	child_start
			-- iterate through child nodes
		require
			has_chidlren: has_children
		do
			children.start
		end

	child_off: BOOLEAN
		require
			has_chidlren: has_children
		do
			Result := children.off
		end

	child_forth
		require
			has_chidlren: has_children
		do
			children.forth
		end

	child_item: like child_type
		require
			has_chidlren: has_children
		do
			Result := children.item
		end

feature {ARCHETYPE_CATALOGUE} -- Modification

	put_child (a_child: attached like child_type)
		do
			if children = Void then
				create children.make
			end
			children.extend (a_child)
			a_child.set_parent (Current)
		end

	remove_child (a_child: attached like child_type)
		require
			has_child (a_child)
		do
			children.prune (a_child)
		end

feature {ARCH_CAT_ITEM} -- Modification

	set_parent (a_parent: attached ARCH_CAT_ITEM)
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

	children: SORTED_TWO_WAY_LIST [like child_type]
			-- list of child nodes

	child_type: ARCH_CAT_ITEM
			-- type of allowable child node

	parent: ARCH_CAT_ITEM
			-- parent node

	subtree_artefact_counts_cache: HASH_TABLE [INTEGER, INTEGER]
			-- stored counter of archetype child objects, keyed by artefact type,
			-- i.e. archetype & template counts stored separately

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
