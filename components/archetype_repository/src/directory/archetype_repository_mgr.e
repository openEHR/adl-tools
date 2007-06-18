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

	make is
		do
			create source_repositories.make(0)
			create adhoc_source_repository.make
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

	ontology_index: DS_HASH_TABLE [TWO_WAY_TREE [ARCHETYPE_REPOSITORY_ITEM], STRING]
			-- index of archetypes, keyed by ontology path
			-- relative ontology path of item with respect to root; for folder nodes,
			-- this will look like the relative directory path; for archetype nodes, this will be
			-- the concatenation of the directory path and archetype specialisation parent path

	archetype_id_index: DS_HASH_TABLE [ARCHETYPE_REPOSITORY_ITEM, STRING]
			-- index of archetype nodes keyed by archetype id

	selected_archetype_descriptor: ARCHETYPE_REPOSITORY_ARCHETYPE
			-- selected archetype node

	selected_archetype: ARCHETYPE is
			-- currently selected archetype descriptor
		do
			Result := selected_archetype_descriptor.archetype
		end

feature -- Comparison

	valid_repository_path(a_dir_name: STRING): BOOLEAN is
			-- True if a_dir_name corresponds to a real directory, is readable, and is not the same as,
			-- or a parent or child directory of any directory already used to populate the tree
		require
			a_dir_name /= Void
		do
			if (create {DIRECTORY}.make(a_dir_name)).exists then
				from
					source_repositories.start
				until
					source_repositories.off or
						a_dir_name.is_equal(source_repositories.key_for_iteration) or
						a_dir_name.has_substring (source_repositories.key_for_iteration) or
						source_repositories.key_for_iteration.has_substring(a_dir_name)
				loop
					source_repositories.forth
				end
				Result := source_repositories.off
			end
		end

feature -- Commands

	clear is
		do
			create ontology_index.make(0)
			create archetype_id_index.make(0)
			create directory.make(Void)
		end

	build_directory is
			-- rebuild directory from source repositories
		do
			clear
			from
				source_repositories.start
			until
				source_repositories.off
			loop
				source_repositories.item_for_iteration.repopulate
				tree_do_all(source_repositories.item_for_iteration, agent merge_enter, agent merge_exit)
				source_repositories.forth
			end
		end

	graft_adhoc_items is
			-- Graft the contents of `adhoc_source_repository' into `directory'.
		do

			-- TODO: to be implemented
			-- iterate over the archetypes in the adhoc repository and graft them into
			-- the directory in the appropriate places. To do this, use the archetype ids
			-- to find archetypes in the same semantic category, i.e. to figure out the
			-- ontological path; then figure out if the adhoc archetypes are specialisations of
			-- archetypes found in the directory already; in which case graft them below existing
			-- archetypes
			-- NOTE: THIS FUNCTION HAS TO BE CALLABLE REPEATEDLY, SO IT NEEDS TO CHECK IF IT
			-- HAS ALREADY GRAFTED SOMETHING IN AND ONLY GRAFT NEW ARCHETYPES!
		end

	put_repository(a_dir_name, an_id: STRING) is
			-- put repository logically identified an_id, at directory path a_dir_name
		require
			Dir_name_valid: a_dir_name /= Void and then valid_repository_path(a_dir_name)
			Id_valid: an_id /= Void and then not an_id.is_empty
		do
			source_repositories.force(create {ARCHETYPE_INDEXED_FILE_REPOSITORY_IMP}.make(a_dir_name, source_repositories.count+1), an_id)
		end

feature -- Traversal

	do_all (node_enter_action, node_exit_action: PROCEDURE [ANY, TUPLE[ARCHETYPE_REPOSITORY_ITEM]]) is
			-- execute node_enter_action when entering a node, then recurse into subnodes, then execute
			-- node_exit_action when leaving node
		do
			do_all_nodes(directory, node_enter_action, node_exit_action)
		end

	tree_do_all (a_rep: ARCHETYPE_INDEXED_FILE_REPOSITORY_IMP; node_enter_action, node_exit_action: PROCEDURE [ANY, TUPLE[TWO_WAY_TREE[ARCHETYPE_REPOSITORY_ITEM]]]) is
			-- execute node_enter_action when entering a node, then recurse into subnodes, then execute
			-- node_exit_action when leaving node
		do
			tree_do_all_nodes(a_rep.directory, node_enter_action, node_exit_action)
		end

feature -- Modification

	set_selected_archetype_descriptor(an_arch_repos_item: ARCHETYPE_REPOSITORY_ARCHETYPE) is
			-- set `selected_archetype'
		require
			an_arch_repos_item /= Void
		do
			selected_archetype_descriptor := an_arch_repos_item
		end

	set_selected_archetype_descriptor_from_ontological_path(a_path: STRING) is
			-- set `selected_archetype' using an ontological path like "/ehr/entry/observation/lab-result"
		require
			Path_valid: has_ontological_archetype_path(a_path)
		do
			selected_archetype_descriptor ?= ontology_index.item(a_path).item
		end

	set_selected_archetype_descriptor_from_archetype_id(an_id: STRING) is
			-- set `selected_archetype' using an id of archetype
		require
			Path_valid: has_archetype_id(an_id)
		do
			selected_archetype_descriptor ?= archetype_id_index.item(an_id)
		end

	clear_selected_archetype_descriptor is
			-- clear `selected_archetype'
		do
			selected_archetype_descriptor := Void
		end

	add_adhoc_item (full_path: STRING) is
			-- Add the archetype designated by `full_path' to the ad hoc repository.
			-- Then merge it and make it the selected archetype.
		require
			path_valid: adhoc_source_repository.is_valid_path (full_path)
		do
			adhoc_source_repository.add_item (full_path)
			graft_adhoc_items
			set_selected_archetype_descriptor_from_archetype_id (adhoc_source_repository.directory.last.id.as_string)
		ensure
			has_selected_archetype_descriptor
		end

feature -- Status Report

	has_selected_archetype_descriptor: BOOLEAN is
			-- True if an archetype has been selected
		do
			Result := selected_archetype_descriptor /= Void
		end

	has_ontological_path (a_path: STRING):BOOLEAN is
			-- check if 'a_path' exists in ontology; path will be something like
			-- "/ehr/entry/observation/lab-result/lipids"
		require
			Path_exists: a_path /= Void
		do
			Result := ontology_index.has(a_path)
		end

	has_archetype_id (an_archetype_id: STRING):BOOLEAN is
			-- check if an_id known in archetype index of directory
		require
			Archetype_id_exists: an_archetype_id /= Void
		do
			Result := archetype_id_index.has(an_archetype_id)
		end

	has_ontological_archetype_path (a_path: STRING):BOOLEAN is
			-- check if 'a_path' exists in ontology and refers to an archetype; path will be something like
			-- "/ehr/entry/observation/lab-result/lipids"
		require
			Path_exists: a_path /= Void
		local
			ara: ARCHETYPE_REPOSITORY_ARCHETYPE
		do
			if ontology_index.has(a_path) then
				ara ?= ontology_index.item(a_path).item
			end
			Result := ara /= Void
		end

feature {NONE} -- Implementation

	do_all_nodes(node: like directory; node_enter_action, node_exit_action: PROCEDURE [ANY, TUPLE[ARCHETYPE_REPOSITORY_ITEM]])  is
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

	tree_do_all_nodes(node: like directory; node_enter_action, node_exit_action: PROCEDURE [ANY, TUPLE[TWO_WAY_TREE[ARCHETYPE_REPOSITORY_ITEM]]])  is
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

	merge_enter(a_node: TWO_WAY_TREE [ARCHETYPE_REPOSITORY_ITEM]) is
			-- merge a_node into directory - node enter
		local
			adf: ARCHETYPE_REPOSITORY_FOLDER
			ada: ARCHETYPE_REPOSITORY_ARCHETYPE
			arch_node, parent_node: TWO_WAY_TREE [ARCHETYPE_REPOSITORY_ITEM]
		do
   			debug("arch_dir")
   				io.put_string(shifter + "===> " + a_node.item.ontological_path)
   			end
			adf ?= a_node.item
			if adf /= Void then
				if not ontology_index.has(adf.ontological_path) then
					create arch_node.make (adf)
					if ontology_index.has(adf.ontological_parent_path) then
						parent_node := ontology_index.item(adf.ontological_parent_path)
						parent_node.put_child_right (arch_node)
						parent_node.child_forth
					elseif directory /= Void then
						parent_node := directory
						parent_node.put_child_right (arch_node)
						parent_node.child_forth
					end
					ontology_index.force(arch_node, adf.ontological_path)
				end
   				debug("arch_dir")
   					io.put_string(shifter + " (folder)%N")
	   			end
			else
				ada ?= a_node.item
				create arch_node.make (ada)
   				debug("arch_dir")
   					io.put_string(shifter + ada.id.as_string + " (archetype)")
	   			end
				if ontology_index.has(ada.ontological_path) then
					-- this is an error: it means there are archetypes from two different
					-- file repositories claiming to be the same archetype
					post_error(Current, "repopulate", "arch_dir_dup_archetype", <<ada.full_path>>)
  	 				debug("arch_dir")
   						io.put_string(shifter + "DUPLICATE!%N")
	   				end
				else
					if ontology_index.has(ada.ontological_parent_path) then
						parent_node := ontology_index.item(ada.ontological_parent_path)
						parent_node.put_child_right (arch_node)
						parent_node.child_forth
  	 					debug("arch_dir")
   							io.put_string("%N")
	   					end
					else
						post_warning(Current, "repopulate", "arch_dir_no_arch_parent", <<ada.ontological_parent_path, ada.full_path>>)
  	 					debug("arch_dir")
   							io.put_string(shifter + "NO PARENT%N")
	   					end
					end
					ontology_index.force(arch_node, ada.ontological_path)
					archetype_id_index.force(ada, ada.id.as_string)
				end
			end
   			debug("arch_dir")
   				io.put_string(shifter + "<===%N")
   			end
		end

	merge_exit(a_node: TWO_WAY_TREE [ARCHETYPE_REPOSITORY_ITEM]) is
			-- merge a_node into directory - node exit
		do
		end

	shifter: STRING is
			-- debug indenter
		once
			create Result.make(0)
		end

invariant
	Repositories_valid: source_repositories /= Void
	adhoc_source_repository_valid: adhoc_source_repository /= Void

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
