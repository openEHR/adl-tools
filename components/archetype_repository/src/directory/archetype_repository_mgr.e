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


class ARCHETYPE_DIRECTORY

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

	source_repositories: DS_HASH_TABLE [ARCHETYPE_INDEXED_FILE_REPOSITORY_IMP, STRING]
			-- physical repositories of archetypes, keyed by logical id
			-- Each such repository consists of archetypes arranged in a directory structure
			-- mimicking an ontological structure, e.g. ehr/entry/observation etc
			-- FIXME: this should be declared as
			-- source_repositories: DS_HASH_TABLE [ARCHETYPE_INDEXED_REPOSITORY_I, STRING]
			-- with the concrete types being instantiated at runtime, based on settings in
			-- the .cfg file - i.e. have to determine from those settings what type of
			-- repository it is - web, file system etc

	adhoc_source_repository: ARCHETYPE_ADHOC_FILE_REPOSITORY
			-- an additional 'repository' where archetypes may be found, but not necessarily classified
			-- under any structure - used e.g. to represent the file local system where isolated archetypes
			-- may be found, e.g. in c:\temp, /tmp or wherever. This repository is just a list of
			-- archetypes keyed by path on the file system. They are not merged onto the directory
			-- but 'grafted' - a simpler operation

	directory: TWO_WAY_TREE [ARCHETYPE_REPOSITORY_ITEM]
			-- result of merging all source repositories in ontology structure (where specialised
			-- archetypes now appear as child nodes, rather than sibling nodes, as they do
			-- in the file system), as well as grafting on adhoc archetypes

	ontology_index: DS_HASH_TABLE [like directory, STRING]
			-- index of archetypes, keyed by ontology path
			-- relative ontology path of item with respect to root; for folder nodes,
			-- this will look like the relative directory path; for archetype nodes, this will be
			-- the concatenation of the directory path and archetype specialisation parent path

	archetype_id_index: DS_HASH_TABLE [ARCHETYPE_REPOSITORY_ARCHETYPE, STRING]
			-- index of archetype nodes keyed by archetype id

	selected_archetype_descriptor: ARCHETYPE_REPOSITORY_ARCHETYPE
			-- selected archetype node

	selected_archetype: ARCHETYPE is
			-- currently selected archetype descriptor
		do
			Result := selected_archetype_descriptor.archetype
		end

feature -- Comparison

	valid_repository_path (dir_name: STRING): BOOLEAN
			-- Does `dir_name' correspond to a real directory, which is not the same as, or a
			-- parent or child of, any directory already used to populate the tree?
		local
			s: STRING
		do
			if dir_name /= Void and then not dir_name.is_empty then
				if directory_at (dir_name).exists then
					from
						source_repositories.start
					until
						source_repositories.off or Result
					loop
						s := source_repositories.key_for_iteration
						Result := dir_name.is_equal (s) or dir_name.has_substring (s) or s.has_substring (dir_name)
						-- FIXME: The above test would say yes to "C:\x" and "C:\xx"!
						source_repositories.forth
					end

					Result := not Result
				end
			end
		ensure
			false_if_void: Result implies dir_name /= Void
		end

feature -- Commands

	clear
			-- Clear `directory' and its index tables.
		do
			clear_selected_archetype_descriptor
			create ontology_index.make (0)
			create archetype_id_index.make (0)
			create directory.make (Void)
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
				tree_do_all (source_repositories.item_for_iteration, agent merge_enter, agent merge_exit)
				source_repositories.forth
			end
		end

	graft_adhoc_item (ara: ARCHETYPE_REPOSITORY_ARCHETYPE)
			-- Graft ad hoc archetype `ara' into `directory'. Use its archetype id to figure out
			-- its ontological path, by finding archetypes in the same semantic category.
			-- If `ara' specialises an archetype already in `directory', graft it there.
		require
			ara_attached: ara /= Void
		local
			semantic_category: STRING
			archetype_in_same_semantic_category: ARCHETYPE_REPOSITORY_ARCHETYPE
			node, parent_node: like directory
		do
			from
				semantic_category := ara.id.qualified_rm_entity
				semantic_category.append_character ({ARCHETYPE_ID}.axis_separator)
				archetype_id_index.start
			until
				archetype_id_index.off or archetype_in_same_semantic_category /= Void
			loop
				if archetype_id_index.key_for_iteration.substring_index (semantic_category, 1) = 1 then
					archetype_in_same_semantic_category := archetype_id_index.item_for_iteration
					-- FIXME: Keep looking for an archetype that `ara' specialises.
				end

				archetype_id_index.forth
			end

			create node.make (ara)

			if archetype_in_same_semantic_category /= Void and then ontology_index.has (archetype_in_same_semantic_category.ontological_path) then
				parent_node := ontology_index.item (archetype_in_same_semantic_category.ontological_path).parent
			else
				parent_node := directory
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

	put_repository (dir_name, repository_id: STRING)
			-- Put the repository logically identified by `repository_id' at path `dir_name'.
		require
			dir_name_valid: valid_repository_path (dir_name)
			repository_id_attached: repository_id /= Void
			repository_id_not_empty: not repository_id.is_empty
		local
			repository: ARCHETYPE_INDEXED_FILE_REPOSITORY_IMP
		do
			create repository.make (dir_name, source_repositories.count + 2)
			source_repositories.force (repository, repository_id)
		end

feature -- Traversal

	do_all (node_enter_action, node_exit_action: PROCEDURE [ANY, TUPLE [ARCHETYPE_REPOSITORY_ITEM]])
			-- execute node_enter_action when entering a node, then recurse into subnodes, then execute
			-- node_exit_action when leaving node
		do
			do_all_nodes (directory, node_enter_action, node_exit_action)
		end

	tree_do_all (a_rep: ARCHETYPE_INDEXED_FILE_REPOSITORY_IMP; node_enter_action, node_exit_action: PROCEDURE [ANY, TUPLE [like directory]])
			-- execute node_enter_action when entering a node, then recurse into subnodes, then execute
			-- node_exit_action when leaving node
		do
			tree_do_all_nodes (a_rep.directory, node_enter_action, node_exit_action)
		end

feature -- Modification

	set_selected_archetype_descriptor (an_arch_repos_item: ARCHETYPE_REPOSITORY_ARCHETYPE)
			-- Set `selected_archetype_descriptor'.
		require
			an_arch_repos_item /= Void
		do
			selected_archetype_descriptor := an_arch_repos_item
		end

	set_selected_archetype_descriptor_from_ontological_path (a_path: STRING)
			-- Set `selected_archetype_descriptor' using an ontological path like "/ehr/entry/observation/lab-result".
		require
			Path_valid: has_ontological_archetype_path (a_path)
		do
			selected_archetype_descriptor ?= ontology_index.item (a_path).item
		end

	set_selected_archetype_descriptor_from_archetype_id (an_id: STRING)
			-- Set `selected_archetype_descriptor' using an id of archetype.
		require
			Path_valid: has_archetype_id (an_id)
		do
			selected_archetype_descriptor := archetype_id_index.item (an_id)
		ensure
			has_selected_archetype_descriptor: has_selected_archetype_descriptor
			set: selected_archetype_descriptor.id.value.is_equal (an_id)
		end

	clear_selected_archetype_descriptor
			-- Clear `selected_archetype_descriptor'.
		do
			selected_archetype_descriptor := Void
		end

	add_adhoc_item (full_path: STRING)
			-- Add the archetype designated by `full_path' to the ad hoc repository.
			-- Then merge it and make it the selected archetype.
		require
			path_valid: adhoc_source_repository.is_valid_path (full_path)
		local
			ara: ARCHETYPE_REPOSITORY_ARCHETYPE
		do
			adhoc_source_repository.add_item (full_path)

			if adhoc_source_repository.has (full_path) then
				ara := adhoc_source_repository [full_path]
				graft_adhoc_item (ara)
				set_selected_archetype_descriptor_from_archetype_id (ara.id.as_string)
			end
		ensure
			has_selected_archetype_descriptor: adhoc_source_repository.has (full_path) implies has_selected_archetype_descriptor
		end

feature -- Status Report

	has_selected_archetype_descriptor: BOOLEAN
			-- Has an archetype been selected?
		do
			Result := selected_archetype_descriptor /= Void
		end

	has_ontological_path (a_path: STRING): BOOLEAN
			-- check if 'a_path' exists in ontology; path will be something like
			-- "/ehr/entry/observation/lab-result/lipids"
		require
			Path_exists: a_path /= Void
		do
			Result := ontology_index.has (a_path)
		end

	has_archetype_id (an_archetype_id: STRING): BOOLEAN
			-- check if an_id known in archetype index of directory
		require
			Archetype_id_exists: an_archetype_id /= Void
		do
			Result := archetype_id_index.has (an_archetype_id)
		end

	has_ontological_archetype_path (a_path: STRING): BOOLEAN
			-- check if 'a_path' exists in ontology and refers to an archetype; path will be something like
			-- "/ehr/entry/observation/lab-result/lipids"
		require
			Path_exists: a_path /= Void
		local
			ara: ARCHETYPE_REPOSITORY_ARCHETYPE
		do
			if ontology_index.has (a_path) then
				ara ?= ontology_index.item (a_path).item
			end

			Result := ara /= Void
		end

feature {NONE} -- Implementation

	do_all_nodes (node: like directory; node_enter_action, node_exit_action: PROCEDURE [ANY, TUPLE [ARCHETYPE_REPOSITORY_ITEM]])
			-- recursive version of routine due to lack of useful recursive routines on Eiffel tree structures
			-- processes treats each node of the tree separately
		require
			Node_valid: node /= Void
			Node_enter_action_valid: node_enter_action /= Void
   		do
  			from
 				node.child_start
 			until
 				node.child_off
 			loop
  	 			debug("arch_dir")
   					shifter.extend ('%T')
   				end
				node_enter_action.call([node.child_item])
 				do_all_nodes(node.child, node_enter_action, node_exit_action)
				node_exit_action.call([node.child_item])
  	  			debug("arch_dir")
   					shifter.remove_tail (1)
    			end
 				node.child_forth
			end
   		end

	tree_do_all_nodes (node: like directory; node_enter_action, node_exit_action: PROCEDURE [ANY, TUPLE [like directory]])
			-- recursive version of routine due to lack of useful recursive routines on Eiffel tree structures
			-- processes the tree as sub-trees
		require
			Node_valid: node /= Void
			Node_enter_action_valid: node_enter_action /= Void
   		do
  			from
 				node.child_start
 			until
 				node.child_off
 			loop
  	 			debug("arch_dir")
   					shifter.extend ('%T')
   				end
				node_enter_action.call([node.child])
 				tree_do_all_nodes(node.child, node_enter_action, node_exit_action)
				node_exit_action.call([node.child])
 	  			debug("arch_dir")
   					shifter.remove_tail (1)
    			end
 				node.child_forth
 			end
   		end

	merge_enter (a_node: like directory)
			-- merge a_node into directory - node enter
		local
			arf: ARCHETYPE_REPOSITORY_FOLDER
			ara: ARCHETYPE_REPOSITORY_ARCHETYPE
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
				create arch_node.make (ara)

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
					if ontology_index.has (ara.ontological_parent_path) then
						parent_node := ontology_index.item (ara.ontological_parent_path)
						parent_node.put_child_right (arch_node)
						parent_node.child_forth
  	 					debug("arch_dir")
   							io.put_string("%N")
	   					end
					else
						post_warning (Current, "merge_enter", "arch_dir_no_arch_parent", <<ara.ontological_parent_path, ara.full_path>>)
  	 					debug("arch_dir")
   							io.put_string(shifter + "NO PARENT%N")
	   					end
					end

					ontology_index.force (arch_node, ara.ontological_path)
					archetype_id_index.force (ara, ara.id.as_string)
				end
			end

   			debug("arch_dir")
   				io.put_string(shifter + "<===%N")
   			end
		end

	merge_exit(a_node: like directory)
			-- merge a_node into directory - node exit
		do
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
	repositories_group_ids: source_repositories.for_all (agent (repository: ARCHETYPE_INDEXED_FILE_REPOSITORY_IMP): BOOLEAN
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
