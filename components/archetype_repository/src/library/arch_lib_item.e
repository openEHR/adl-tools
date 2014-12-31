note
	component:   "openEHR ADL Tools"
	description: "Descriptor of a node in a directory of archetypes"
	keywords:    "ADL, archetype"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2006- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

deferred class ARCH_LIB_ITEM

inherit
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
			{ANY} package_name_delimiter
		undefine
			is_equal
		end

	ITERABLE [ARCH_LIB_ITEM]
		undefine
			is_equal
		end

	COMPARABLE


feature -- Definitons

	Semantic_path_separator: STRING = "/"

feature -- Access

	group_name: STRING
			-- Name distinguishing the type of item and the group to which its `repository' belongs.
			-- Useful as a logical key to pixmap icons, etc.
		deferred
		ensure
			not_empty: not Result.is_empty
		end

	qualified_name: IMMUTABLE_STRING_8
			-- semantic name of this node, relative to parent concept, which is either class or package name, or else as concept name of archetype
			-- used to generate ontological path
			-- For Classes, will be the name of the top-level package & class e.g. EHR-OBSERVATION
			-- For archetypes will be the id
		deferred
		end

	qualified_key: IMMUTABLE_STRING_8
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
				Result.append (p.path + Semantic_path_separator)
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

   	subtree_artefact_total: INTEGER
   			-- number of artefacts below this node of any type
		do
 			across subtree_artefact_counts as count_csr loop
 				Result := Result + count_csr.item
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

	child_with_name (a_name: STRING): like children.item
		require
			has_child_with_name (a_name)
		do
			check attached children as c then
				from c.start until c.off or c.item.name.same_string (a_name) loop
					c.forth
				end
				Result := c.item
			end
		end

	first_child: detachable like children.item
		do
			check attached children as c then
				if not c.is_empty then
					Result := c.first
				end
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
			Result := attached children as c and then across c as child_csr some child_csr.item.qualified_key.same_string (a_key) end
		end

	has_child_with_name (a_key: STRING): BOOLEAN
		require
			Lower_case_key: a_key.as_lower.same_string (a_key)
		do
			Result := attached children as c and then across c as child_csr some child_csr.item.name.same_string (a_key) end
		end

   	has_matching_children (test_agt: FUNCTION [ANY, TUPLE [ARCH_LIB_ITEM], BOOLEAN]): BOOLEAN
   			-- true if any direct children of the types mentioned in `artefact_types'
		do
 			Result := attached children as c and then
 				across c as child_csr some test_agt.item ([child_csr.item]) end
		end

feature {ARCHETYPE_LIBRARY, ARCHETYPE_LIBRARY_SOURCE} -- Modification

	put_child (a_child: like children.item)
		require
			a_child /= Current and then not has_child (a_child)
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

feature {ARCH_LIB_ITEM} -- Modification

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

feature {ARCH_LIB_ITEM} -- Implementation

	children: detachable FAST_SORTED_TWO_WAY_LIST [ARCH_LIB_ITEM]
			-- list of child nodes

feature {ARCH_LIB_ITEM, ARCHETYPE_LIBRARY} -- Implementation

	parent: detachable ARCH_LIB_ITEM
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
						if attached {ARCH_LIB_ARCHETYPE} child_csr.item as ara then
							Result.replace (Result.item (ara.artefact_type.value) + 1, ara.artefact_type.value)
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
			csr: detachable ARCH_LIB_ITEM
		do
			subtree_artefact_counts_cache := Void
			from csr := parent until csr = Void loop
				csr.reset_subtree_artefact_count
				csr := csr.parent
			end
		end

end



