indexing
	component:   "openEHR Archetype Project"
	description: "[
				 Archteype directory - a data structure containing archetypes found in one or more
				 physical repositories, each of which is on some medium, such as the file system or
				 a web-accessible repository. The structure of the directory is ontological, meaning
				 that it expresses the classification structure of items in it. Each item has an 
				 ontological path therefore, such as /openehr/ehr/entry/observation/lab_result. The 
				 concept part of the archetype id becomes part of the path. Specialised archetypes are 
				 thus subordinates of their parent archetypes, if the latter are known, else they are 
				 on the level of the parent; e.g. the archetype openEHR-EHR-OBSERVATION.lab_result-lipids.v1
				 will have a path such as /openehr/ehr/entry/observation/lab_result/lipids. Note that start
				 of the path may vary due to the user having chosen a different root point for the
				 source repositories that are merged into the directory.
				 
				 The directory is populated at startup, using the source repository paths stored in a
				 configuration file or elsewhere.
				 
				 Archetypes can also be explicitly chosen by the user at runtime, outside of the 
				 repositories, e.g. the user wants to look at an archetype sent to them in email and
				 stored in /tmp. These archetypes are remembered on the 'adhoc_repository', and this 
				 is also merged into the directory by 'grafting'.
				 
				 In the resulting directory, the archetype descriptors from each repository are marked
				 so that calling routines can distinguish them, e.g. to use different coloured icons on 
				 the screen.
				 ]"
	keywords:    "ADL"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2006 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL: $"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate: $"


class ARCH_DIRECTORY

inherit
	SHARED_RESOURCES
		export
			{NONE} all
		end

	ARCHETYPE_DEFINITIONS
		export
			{NONE} all
		end

	MESSAGE_BILLBOARD
		export
			{NONE} all
		end

create
	make

feature -- Initialisation

	make
		do
			create source_repositories.make (0)
			create adhoc_source_repository.make (1)
			clear
		end

feature -- Access

	source_repositories: DS_HASH_TABLE [ARCHETYPE_INDEXED_REPOSITORY_I, INTEGER]
			-- Physical repositories of archetypes, keyed by logical id.
			-- Each such repository consists of archetypes arranged in a directory structure
			-- mimicking an ontological structure, e.g. ehr/entry/observation, etc.

	adhoc_source_repository: ARCHETYPE_ADHOC_FILE_REPOSITORY
			-- An additional 'repository' where archetypes may be found, but not necessarily classified
			-- under any structure - used e.g. to represent the file local system where isolated archetypes
			-- may be found, e.g. in c:\temp, /tmp or wherever. This repository is just a list of
			-- archetypes keyed by path on the file system. They are not merged onto the directory
			-- but 'grafted' - a simpler operation.

	directory: TWO_WAY_TREE [ARCH_REP_ITEM]
			-- The logical directory of archetypes, in an ontology-based structure.
			-- Result of merging all source repositories in ontology structure (where specialised
			-- archetypes now appear as child nodes, rather than sibling nodes, as they do
			-- in the file system), as well as grafting on adhoc archetypes.

	ontology_index: DS_HASH_TABLE [like directory, STRING]
			-- Index of archetypes, keyed by ontology path.
			-- Relative ontology path of item with respect to root; for folder nodes,
			-- this will look like the relative directory path; for archetype nodes, this will be
			-- the concatenation of the directory path and archetype specialisation parent path.

	archetype_id_index: DS_HASH_TABLE [ARCH_REP_ARCHETYPE, STRING]
			-- Index of archetype nodes keyed by archetype id.

	selected_item: ARCH_REP_ITEM
			-- The archetype or folder at `selected_node'.

	selected_archetype: ARCH_REP_ARCHETYPE
			-- The archetype at `selected_node'.
		do
			Result ?= selected_item
		ensure
			consistent: Result /= Void implies Result = selected_item
		end

	selected_node: like directory
			-- The selected node in `directory'.
		do
			Result ?= node_from_item (selected_item)
		ensure
			consistent: Result /= Void implies Result.item = selected_item
		end

	archetype_descriptor_from_full_path (full_path: STRING): ARCH_REP_ARCHETYPE
			-- The archetype descriptor in the directory that is designated by `full_path'; else Void.
		require
			path_valid: adhoc_source_repository.is_valid_path (full_path)
		do
			from
				archetype_id_index.start
			until
				archetype_id_index.off or Result /= Void
			loop
				if archetype_id_index.item_for_iteration.full_path.is_equal (full_path) then
					Result := archetype_id_index.item_for_iteration
				end

				archetype_id_index.forth
			end
		ensure
			has_full_path_if_attached: Result /= Void implies Result.full_path.is_equal (full_path)
		end

	node_from_item (item: ARCH_REP_ITEM): like directory
			-- The node in `directory', if any, containing the archetype or folder `item'.
		do
			if item /= Void and then ontology_index.has (item.ontological_path) then
				Result := ontology_index.item (item.ontological_path)
			end
		end

	matching_ids (a_regex, an_rm_type: STRING): ARRAYED_LIST[STRING] is
			-- generate list of archetype ids that match the pattern and optional rm_type. If rm_type is supplied,
			-- we assume that the regex itself does not contain an rm type
		require
			Regex_valid: a_regex /= Void and then not a_regex.is_empty
			Rm_type_valid: an_rm_type /= Void implies not an_rm_type.is_empty
		local
			regex_matcher: LX_DFA_REGULAR_EXPRESSION
			arch_rm_type, slot_rm_type: STRING
		do
			create Result.make (0)
			if an_rm_type /= Void then
				slot_rm_type := an_rm_type.twin
				slot_rm_type.to_lower
			end
			create regex_matcher.compile_case_insensitive (a_regex)
			if regex_matcher.is_compiled then
				from
					archetype_id_index.start
				until
					archetype_id_index.off
				loop
					if regex_matcher.matches (archetype_id_index.key_for_iteration) then
						if slot_rm_type /= Void then
							arch_rm_type := (create {ARCHETYPE_ID}.make_from_string (archetype_id_index.key_for_iteration)).rm_entity
							arch_rm_type.to_lower
							if slot_rm_type.is_equal (arch_rm_type) then
								Result.extend(archetype_id_index.key_for_iteration)
							end
						else
							Result.extend(archetype_id_index.key_for_iteration)
						end
					end
					archetype_id_index.forth
				end
			else
				-- broken regex
				Result.extend("ERROR: Invalid regular expression " + a_regex)
			end
		end

feature -- Status Report

	has_selected_archetype: BOOLEAN
			-- Has an archetype been selected?
		do
			Result := selected_archetype /= Void
		end

feature -- Comparison

	valid_repository_path (dir_name: STRING): BOOLEAN
			-- Does `dir_name' correspond to a real directory, which is not the same as, or a
			-- parent or child of, any directory already used to populate the tree?
		local
			s1, s2: STRING
		do
			Result := directory_exists (dir_name)

			if Result then
				s1 := file_system.canonical_pathname (dir_name)

				if s1.item (s1.count) /= os_directory_separator then
					s1.append_character (os_directory_separator)
				end

				from
					source_repositories.start
				until
					source_repositories.off or not Result
				loop
					s2 := source_repositories.item_for_iteration.root_path.twin

					if s2.item (s2.count) /= os_directory_separator then
						s2.append_character (os_directory_separator)
					end

					Result := s1.substring_index (s2, 1) /= 1 and s2.substring_index (s1, 1) /= 1
					source_repositories.forth
				end
			end
		ensure
			false_if_void: Result implies dir_name /= Void
		end

feature -- Commands

	clear
			-- Clear `directory' and its index tables.
		do
			selected_item := Void
			create ontology_index.make (0)
			create archetype_id_index.make (0)
			create directory.make (Void)
		end

	put_repository (dir_name: STRING; group_id: INTEGER)
			-- Put the repository logically identified by `group_id' at path `dir_name'.
		require
			dir_name_valid: valid_repository_path (dir_name)
			group_id_valid: group_id > 0
		local
			repository: ARCHETYPE_INDEXED_FILE_REPOSITORY_IMP
		do
			create repository.make (file_system.canonical_pathname (dir_name), group_id)
			source_repositories.force (repository, group_id)
		ensure
			has_group_id: source_repositories.has (group_id)
		end

	build_directory
			-- Rebuild `directory' from source repositories.
		do
			clear

			from
				source_repositories.start
			until
				source_repositories.off
			loop
				source_repositories.item_for_iteration.repopulate
				do_subtree (source_repositories.item_for_iteration.directory, agent merge_enter, Void)
				source_repositories.forth
			end
		end

	graft_adhoc_item (ara: ARCH_REP_ARCHETYPE)
			-- Graft ad hoc archetype `ara' into `directory'. Use its archetype id to figure out
			-- its ontological path, by finding archetypes in the same semantic category.
			-- If `ara' specialises an archetype already in `directory', graft it there.
		require
			ara_attached: ara /= Void
		local
			semantic_category, key: STRING
			archetype_in_same_semantic_category: ARCH_REP_ARCHETYPE
			node, parent_node: like directory
		do
			from
				semantic_category := ara.id.qualified_rm_entity
				semantic_category.append_character ({ARCHETYPE_ID}.axis_separator)
				archetype_id_index.start
			until
				archetype_id_index.off or parent_node /= Void
			loop
				key := archetype_id_index.key_for_iteration

				if key.substring_index (semantic_category, 1) = 1 then
					archetype_in_same_semantic_category := archetype_id_index.item_for_iteration

					if archetype_in_same_semantic_category.id.semantic_id.is_equal (ara.id.semantic_parent_id) then
						parent_node := node_from_item (archetype_in_same_semantic_category)
					end
				end

				archetype_id_index.forth
			end

			create node.make (ara)

			if parent_node = Void then
				node := node_from_item (archetype_in_same_semantic_category)

				if node /= Void then
					parent_node := node.parent
				else
					parent_node := directory
				end
			end

			-- FIXME: Need to check that this doesn't duplicate another archetype:
--			if ontology_index.has (ara.ontological_path) then
--				post_error (Current, "graft_adhoc_item", "arch_dir_dup_archetype", <<ara.full_path>>)
--			else

			parent_node.child_start
			parent_node.put_child_left (node)
			ontology_index.force (node, ara.ontological_path)
			archetype_id_index.force (ara, ara.id.as_string)
		end

feature -- Traversal

	do_subtree (subtree: like directory; enter_action, exit_action: PROCEDURE [ANY, TUPLE [like directory]])
			-- On `subtree', execute `enter_action' when entering a node, then recurse
			-- into its subnodes, then execute `exit_action' when leaving the node.
		require
			enter_action_attached: enter_action /= Void
		do
			if subtree /= Void then
				do_all_nodes (subtree, enter_action, exit_action,
					agent (node: like directory): like directory
						do
							Result := node.child
						end)
			end
		end

	do_all (enter_action, exit_action: PROCEDURE [ANY, TUPLE [ARCH_REP_ITEM]])
			-- On `directory', execute `enter_action' when entering a node, then recurse
			-- into subnodes, then execute `exit_action' when leaving the node.
		require
			enter_action_attached: enter_action /= Void
		do
			do_all_nodes (directory, enter_action, exit_action,
				agent (node: like directory): ARCH_REP_ITEM
					do
						Result := node.child_item
					end)
		end

feature -- Modification

	set_selected_item (value: ARCH_REP_ITEM)
			-- Set `selected_archetype' and `selected_item'.
		do
			selected_item := value
		ensure
			selected_item_set: selected_item = value
		end

	add_adhoc_item (full_path: STRING)
			-- Add the archetype designated by `full_path' to the ad hoc repository, and graft it into the directory.
		require
			path_valid: adhoc_source_repository.is_valid_path (full_path)
		do
			if archetype_descriptor_from_full_path (full_path) = Void then
				adhoc_source_repository.add_item (full_path)

				if adhoc_source_repository.has (full_path) then
					graft_adhoc_item (adhoc_source_repository [full_path])
				end
			end
		end

feature {NONE} -- Implementation

	do_all_nodes (node: like directory; enter_action, exit_action: PROCEDURE [ANY, TUPLE]; argument_generator: FUNCTION [ANY, TUPLE [like directory], ANY])
			-- recursive version of routine due to lack of useful recursive routines on Eiffel tree structures
			-- processes treats each node of the tree separately
		require
			node_attached: node /= Void
			enter_action_attached: enter_action /= Void
			generator_attached: argument_generator /= Void
		local
			arg: ANY
		do
			from
				node.child_start
			until
				node.child_off
			loop
	 			debug("arch_dir")
					shifter.extend ('%T')
				end

				arg := argument_generator.item ([node])

				if arg /= Void then
					enter_action.call ([arg])
				end

				do_all_nodes (node.child, enter_action, exit_action, argument_generator)

				if arg /= Void and exit_action /= Void then
					exit_action.call ([arg])
				end

				debug("arch_dir")
					shifter.remove_tail (1)
				end

				node.child_forth
			end
		end

	merge_enter (a_node: like directory)
			-- merge a_node into directory - node enter
		local
			arf: ARCH_REP_FOLDER
			ara, parent_ara: ARCH_REP_ARCHETYPE
			arch_node, parent_node: like directory
		do
			debug("arch_dir")
				io.put_string(shifter + "===> " + a_node.item.ontological_path)
			end

			arf ?= a_node.item

			if arf /= Void then
				if not ontology_index.has (arf.ontological_path) then
					if ontology_index.has (arf.ontological_parent_path) then
						parent_node := ontology_index.item (arf.ontological_parent_path)
					else
						parent_node := directory
					end

					create arch_node.make (arf)
					parent_node.put_child_right (arch_node)
					parent_node.child_forth
					ontology_index.force (arch_node, arf.ontological_path)
				end

				debug("arch_dir")
					io.put_string(shifter + " (folder)%N")
				end
			end

			ara ?= a_node.item

			if ara /= Void then
				debug("arch_dir")
					io.put_string(shifter + ara.id.as_string + " (archetype)")
				end

				if ontology_index.has (ara.ontological_path) then
					-- this is an error: it means there are archetypes from two different
					-- file repositories claiming to be the same archetype
					post_error (Current, "merge_enter", "arch_dir_dup_archetype", <<ara.full_path>>)

					debug("arch_dir")
						io.put_string(shifter + "DUPLICATE!%N")
					end
				else
					if not ontology_index.has (ara.ontological_parent_path) and ara.is_specialised then
						post_error (Current, "merge_enter", "arch_dir_orphan_archetype", <<ara.ontological_parent_path, ara.full_path>>)
					else
						if ontology_index.has (ara.ontological_parent_path) then
							parent_node := ontology_index.item (ara.ontological_parent_path)
							if ara.is_specialised then
								parent_ara ?= parent_node.item
								ara.set_specialisation_parent (parent_ara)
							end
						else
							parent_node := directory
						end

						create arch_node.make (ara)
						parent_node.put_child_right (arch_node)
						parent_node.child_forth
						ontology_index.force (arch_node, ara.ontological_path)
						archetype_id_index.force (ara, ara.id.as_string)
					end
				end
			end

			debug("arch_dir")
				io.put_string(shifter + "<===%N")
			end
		end

	shifter: STRING
			-- debug indenter
		once
			create Result.make_empty
		end

invariant
	directory_attached: directory /= Void
	ontology_index_attached: ontology_index /= Void
	archetype_id_index_attached: archetype_id_index /= Void
	adhoc_source_repository_attached: adhoc_source_repository /= Void
	adhoc_source_repository_group_id: adhoc_source_repository.group_id = 1
	repositories_attached: source_repositories /= Void
	repositories_group_ids: source_repositories.for_all (agent (repository: ARCHETYPE_INDEXED_REPOSITORY_I): BOOLEAN
		do
			Result := repository.group_id > 1
		end)

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
--| The Original Code is adl_node_control.e.
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
