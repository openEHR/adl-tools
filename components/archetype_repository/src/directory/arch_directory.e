note
	component:   "openEHR Archetype Project"
	description: "[
				 Archteype directory - a data structure containing archetypes found in one or more
				 physical repositories, each of which is on some medium, such as the file system or
				 a web-accessible repository. 
				 
				 The structure of the directory is a list of top-level packages, each containing
				 an inheritance tree of first degree descendants of the LOCATABLE class.
				 The contents of the structure consist of archetypes found in the reference and
				 working repositories, and are subsequently attached into the structure.
				 Archetypes opened adhoc are also grafted here.
				 
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
	support:     "Ocean Informatics <support@OceanInformatics.com>"
	copyright:   "Copyright (c) 2006-2010 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL: http://www.openehr.org/svn/ref_impl_eiffel/TRUNK/components/archetype_repository/src/directory/arch_directory.e $"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate: 2008-04-07 06:22:44 +0100 (Mon, 07 Apr 2008) $"


class ARCH_DIRECTORY

inherit
	SHARED_RESOURCES
		export
			{NONE} all
		end

	SHARED_REFERENCE_MODEL_ACCESS
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

feature -- Definitions

	Max_passes: INTEGER = 6
			-- maxium number of passes for processing archetypes from source repositories to directory

feature -- Initialisation

	make
		do
			create source_repositories.make (0)
			create adhoc_source_repository.make (1)
			clear
		end

feature -- Access

	source_repositories: attached DS_HASH_TABLE [attached ARCHETYPE_INDEXED_REPOSITORY_I, INTEGER]
			-- Physical repositories of archetypes, keyed by logical id.
			-- Each such repository consists of archetypes arranged in a directory structure
			-- mimicking an ontological structure, e.g. ehr/entry/observation, etc.

	adhoc_source_repository: attached ARCHETYPE_ADHOC_FILE_REPOSITORY
			-- An additional 'repository' where archetypes may be found, but not necessarily classified
			-- under any structure - used e.g. to represent the file local system where isolated archetypes
			-- may be found, e.g. in c:\temp, /tmp or wherever. This repository is just a list of
			-- archetypes keyed by path on the file system. They are not merged onto the directory
			-- but 'grafted' - a simpler operation.

	directory: TWO_WAY_TREE [ARCH_REP_ITEM]
			-- The logical directory of archetypes, whose structure is derived directly from the
			-- reference model. The structure is a list of top-level packages, each containing
			-- an inheritance tree of first degree descendants of the LOCATABLE class.
			-- The contents of the structure consist of archetypes found in the reference and
			-- working repositories, and are subsequently attached into the structure.
			-- Archetypes opened adhoc are also grafted here.

	archetype_index: attached HASH_TABLE [ARCH_REP_ARCHETYPE, STRING]
			-- index of archetype descriptors. Used in rest of application

	selected_item: ARCH_REP_ITEM
			-- The folder or archetype at `selected_node'.
		do
			if not selection_history.off then
				Result := selection_history.item
			end
		ensure
			consistent_with_history: Result /= Void implies Result = selection_history.item
		end

	selected_archetype: ARCH_REP_ARCHETYPE
			-- The archetype at `selected_node'.
		do
			Result ?= selected_item
		ensure
			consistent_with_history: Result /= Void implies Result = selected_item
		end

	selected_node: like directory
			-- The selected node in `directory'.
		do
			Result ?= node_from_item (selected_item)
		ensure
			consistent_with_history: Result /= Void implies Result.item = selected_item
		end

--	archetype_descriptor_at_path (full_path: STRING): ARCH_REP_ARCHETYPE
--			-- The archetype descriptor in the directory that is designated by `full_path'; else Void.
--		require
--			path_valid: adhoc_source_repository.is_valid_path (full_path)
--		do
--			from
--				directory_index.start
--			until
--				directory_index.off or Result /= Void
--			loop
--				Result ?= directory_index.item_for_iteration
--				if Result /= Void and then not Result.is_at_path (full_path) then
--					Result := Void
--				end
--				directory_index.forth
--			end
--		ensure
--			has_path_if_attached: Result /= Void implies Result.is_at_path (full_path)
--		end

	node_from_item (item: ARCH_REP_ITEM): like directory
			-- The node in `directory', if any, containing the archetype or folder `item'.
		do
			if item /= Void and then directory_index.has (item.ontological_name) then
				Result := directory_index.item (item.ontological_name)
			end
		end

	matching_ids (a_regex, an_rm_type: STRING): ARRAYED_LIST[STRING]
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
				slot_rm_type := an_rm_type.as_lower
			end
			create regex_matcher.compile_case_insensitive (a_regex)
			if regex_matcher.is_compiled then
				from
					archetype_index.start
				until
					archetype_index.off
				loop
					if regex_matcher.matches (archetype_index.key_for_iteration) then
						if slot_rm_type /= Void then
							arch_rm_type := (create {ARCHETYPE_ID}.make_from_string (archetype_index.key_for_iteration)).rm_entity
							arch_rm_type.to_lower
							if slot_rm_type.is_equal (arch_rm_type) then
								Result.extend(archetype_index.key_for_iteration)
							end
						else
							Result.extend(archetype_index.key_for_iteration)
						end
					end
					archetype_index.forth
				end
			else
				Result.extend(create_message("regex_e1", <<a_regex>>))
			end
		end

	recently_selected_archetypes (n: INTEGER): attached ARRAYED_LIST [attached ARCH_REP_ARCHETYPE]
			-- The `n' most recently used archetypes from `selection_history', excluding duplicates.
		require
			positive: n > 0
		local
			cursor: LINKED_LIST_CURSOR [attached ARCH_REP_ITEM]
		do
			create Result.make (n)

			from
				cursor := selection_history.cursor
				selection_history.finish
			until
				selection_history.off or Result.full
			loop
				if attached {ARCH_REP_ARCHETYPE} selection_history.item as ara then
					if not Result.has (ara) then
						Result.extend (ara)
					end
				end
				selection_history.back
			end

			selection_history.go_to (cursor)
		ensure
			not_too_long: Result.count <= n
		end

feature -- Statistics

	total_archetype_count: INTEGER
			-- Count of all archetype descriptors in directory.

	specialised_archetype_count: INTEGER
			-- Count of specialised archetype descriptors in directory.

	slotted_archetype_count: INTEGER
			-- Count of slot-containing archetype descriptors in directory.

	used_by_archetype_count: INTEGER
			-- Count of archetype descriptors for archetypes used in slots in directory.

	bad_archetype_count: INTEGER
			-- Count of invalid archetype files found in repositories.

	parse_attempted_archetype_count: INTEGER
			-- Count of archetypes for which parsing has been attempted.

feature -- Status Report

	has_selected_archetype: BOOLEAN
			-- Has an archetype been selected?
		do
			Result := selected_archetype /= Void
		end

	has_valid_selected_archetype: BOOLEAN
			-- Has a valid archetype been selected?
		do
			Result := selected_archetype /= Void and then selected_archetype.is_valid
		end

	selection_history_has_previous: BOOLEAN
			-- Can `selection_history' go back?
		do
			Result := not selection_history.off and not selection_history.isfirst
		end

	selection_history_has_next: BOOLEAN
			-- Can `selection_history' go forth?
		do
			Result := not selection_history.off and not selection_history.islast
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

				from source_repositories.start until source_repositories.off or not Result loop
					s2 := source_repositories.item_for_iteration.root_path.twin

					if s2.item (s2.count) /= os_directory_separator then
						s2.append_character (os_directory_separator)
					end

					Result := not s1.starts_with (s2) and not s2.starts_with (s1)
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
			create selection_history.make
			create directory_index.make (0)
			create archetype_index.make(0)
			reset_statistics
		end

	put_repository (dir_name: STRING; group_id: INTEGER)
			-- Put the repository logically identified by `group_id' at path `dir_name'.
		require
			dir_name_valid: valid_repository_path (dir_name)
			group_id_valid: group_id > 0
		local
			repository: attached ARCHETYPE_INDEXED_FILE_REPOSITORY_IMP
		do
			create repository.make (file_system.canonical_pathname (dir_name), group_id)
			source_repositories.force (repository, group_id)
		ensure
			has_group_id: source_repositories.has (group_id)
		end

	populate_directory
			-- Rebuild `directory' from source repositories.
		local
			archs: ARRAYED_LIST [ARCH_REP_ARCHETYPE]
			parent_key, child_key: STRING
			tree_node: like directory
			i: INTEGER
			added_during_pass: INTEGER
			status_list: ARRAY[INTEGER]
		do
			clear
			create_directory_structure

			from
				source_repositories.start
			until
				source_repositories.off
			loop
				source_repositories.item_for_iteration.repopulate
				archs := source_repositories.item_for_iteration.archetypes_index

				-- maintain a status list indicatig status of each attempted archetype; values:
				-- -1 = succeeded
				-- -2 = failed (duplicate)
				-- 0 not yet tried
				-- +ve number: number of passes attempted with no success
				create status_list.make (1, archs.count)

				from
					i := 0
				until
					i > 0 and added_during_pass = 0
				loop
					added_during_pass := 0
					from archs.start until archs.off loop
						if status_list[archs.index] >= 0 then
							parent_key := archs.item.ontological_parent_name
							if directory_index.has (parent_key) then
								child_key := archs.item.ontological_name
								if not directory_index.has (child_key) then
									create tree_node.make (archs.item)
									tree_node.item.set_parent(directory_index.item (parent_key).item)
-- TODO - accumulative counters for archetypes and model nodes
--									if attached {ARCH_REP_MODEL_NODE} directory_index.item (parent_key).item as arm then
--										arm.increment_child_archetype_count
--									end
									directory_index.item (parent_key).put_child_left (tree_node)
									directory_index.put (tree_node, child_key)
									archetype_index.put(archs.item, child_key)
									if archs.item.is_specialised then
										archs.item.set_specialisation_parent (archetype_index.item (parent_key))
									end
									update_statistics(archs.item)
									added_during_pass := added_during_pass + 1
									status_list[archs.index] := -1
								else
									post_error (Current, "populate_directory", "arch_dir_dup_archetype", <<archs.item.full_path>>)
									status_list[archs.index] := -2
								end
							else
								status_list[archs.index] := status_list[archs.index] + 1
							end
						end
						archs.forth
					end
					i := i + 1
				end

				-- now report on all the archetypes which could not be atazched into the hierarchy
				from archs.start until archs.off loop
					if status_list[archs.index] > 0 then
						if archs.item.is_specialised then
							post_error (Current, "populate_directory", "arch_dir_orphan_archetype", <<archs.item.ontological_parent_name, archs.item.ontological_name>>)
						else
							post_error (Current, "populate_directory", "arch_dir_orphan_archetype_e2", <<archs.item.ontological_parent_name, archs.item.ontological_name>>)
						end
					end
					archs.forth
				end

				source_repositories.forth
			end
		end

	update_statistics (ara: ARCH_REP_ARCHETYPE)
			-- Update statistics counters.
		do
			total_archetype_count := total_archetype_count + 1

			if ara.is_specialised then
				specialised_archetype_count := specialised_archetype_count + 1
			end
		end

	update_slot_statistics (ara: ARCH_REP_ARCHETYPE)
			-- Update slot-related statistics counters.
		do
			if ara.has_slots then
				slotted_archetype_count := slotted_archetype_count + 1
			end

			if ara.is_used then
				used_by_archetype_count := used_by_archetype_count + 1
			end
		end

	increment_parse_attempted_archetype_count
			-- Increment the count of archetypes for which parsing has been attempted.
		require
			can_increment: parse_attempted_archetype_count < total_archetype_count
		do
			parse_attempted_archetype_count := parse_attempted_archetype_count + 1
		ensure
			incremented: parse_attempted_archetype_count = old parse_attempted_archetype_count + 1
		end

	reset_statistics
			-- Reset counters to zero.
		do
			total_archetype_count := 0
			specialised_archetype_count := 0
			slotted_archetype_count := 0
			used_by_archetype_count := 0
			bad_archetype_count := 0
			parse_attempted_archetype_count := 0
		end

feature -- Modification

	set_selected_item (value: attached ARCH_REP_ITEM)
			-- Append `value' to `selection_history' and select it.
		do
			if selected_item /= value then
				if selection_history.is_empty or else selection_history.last /= value then
					selection_history.extend (value)
				end
				selection_history.finish
			end
		ensure
			selected_item_set: selected_item = value
			history_is_last_if_value_different: old selected_item /= value implies selection_history.islast
			history_extended_if_value_different_and_wasnt_last: selection_history.count = old
				(selection_history.count + (selected_item /= value and (selection_history.is_empty or else selection_history.last /= value)).to_integer)
		end

	selection_history_back
			-- Select the previous archetype or folder in `selection_history'.
		require
			history_can_go_back: selection_history_has_previous
		do
			selection_history.back
		ensure
			history_isnt_last: selection_history_has_next
		end

	selection_history_forth
			-- Select the next archetype or folder in `selection_history'.
		require
			history_can_go_forth: selection_history_has_next
		do
			selection_history.forth
		ensure
			history_isnt_first: selection_history_has_previous
		end

	add_adhoc_item (full_path: STRING)
			-- Add the archetype designated by `full_path' to the ad hoc repository, and graft it into `directory'.
		require
			path_valid: adhoc_source_repository.is_valid_path (full_path)
		local
			parent_key, child_key: STRING
			tree_node: like directory
			ara: ARCH_REP_ARCHETYPE
		do
			adhoc_source_repository.add_item (full_path)
			ara := adhoc_source_repository.item(full_path)
			if adhoc_source_repository.has (full_path) then
				parent_key := ara.ontological_parent_name
				if directory_index.has (parent_key) then
					child_key := ara.id.as_string
					if not directory_index.has(child_key) then
						create tree_node.make (ara)
						tree_node.item.set_parent(directory_index.item (parent_key).item)
-- TODO - accumulative counters for archetypes and model nodes
--						if attached {ARCH_REP_MODEL_NODE} directory_index.item (parent_key).item as arm then
--							arm.increment_child_archetype_count
--						end
						directory_index.item (parent_key).put_child_right (tree_node)
						directory_index.put (tree_node, child_key)
						archetype_index.put(ara, child_key)
						if ara.is_specialised then
							ara.set_specialisation_parent (archetype_index.item (parent_key))
						end
						update_statistics(ara)
					else
						post_error (Current, "add_adhoc_item", "arch_dir_dup_archetype", <<full_path>>)
					end
				elseif ara.is_specialised then
					post_error (Current, "add_adhoc_item", "arch_dir_orphan_archetype", <<parent_key, child_key>>)
				else
					post_error (Current, "add_adhoc_item", "arch_dir_orphan_archetype2", <<parent_key, child_key>>)
				end
			else
				post_error (Current, "add_adhoc_item", "invalid_filename_e1", <<full_path>>)
			end
			set_selected_item (adhoc_source_repository.item (full_path))
		end

feature -- Traversal

	do_subtree (node: like directory; enter_action, exit_action: PROCEDURE [ANY, TUPLE [ARCH_REP_ITEM]])
			-- On `node', execute `enter_action', then recurse into its subnodes, then execute `exit_action'.
		require
			enter_action_attached: enter_action /= Void
		local
			ari: attached ARCH_REP_ITEM
		do
			if node /= Void then
	 			debug("arch_dir")
					shifter.extend ('%T')
				end

				ari := node.item

				if ari /= Void then
					enter_action.call ([ari])
				end

				from node.child_start until node.child_off loop
					do_subtree (node.child, enter_action, exit_action)
					node.child_forth
				end

				if ari /= Void and exit_action /= Void then
					exit_action.call ([ari])
				end

				debug("arch_dir")
					shifter.remove_tail (1)
				end
			end
		end

feature {NONE} -- Implementation

	directory_index: attached HASH_TABLE [like directory, STRING]
			-- Index of archetype & class nodes, keyed by ontology concept. Used during
			-- construction of `directory'
			-- For class nodes, this will be package_name-class_name, e.g. DEMOGRAPHIC-PARTY.
			-- For archetype nodes, this will be the archetype id.

	selection_history: attached LINKED_LIST [attached ARCH_REP_ITEM]
			-- The history in which archetypes and folders have been selected, from earliest to most recent.

	create_directory_structure
			-- create empty directory structure based on reference model
		local
			pkgs: HASH_TABLE [BMM_PACKAGE_DEFINITION, STRING]
			parent_node, tree_node: like directory
			pkg_name: STRING
			supp_list, supp_list_copy: ARRAYED_SET[STRING]
			supp_class_list: ARRAYED_LIST [BMM_CLASS_DEFINITION]
			removed: BOOLEAN
		do
			create directory.make (Void)
			directory_index.force (directory, ontological_path_separator.twin)
			parent_node := directory
			from rm_schemas.start until rm_schemas.off loop
				if rm_schemas.item_for_iteration.has_class_definition ("LOCATABLE") then
					pkgs := rm_schemas.item_for_iteration.schema.packages
					from pkgs.start until pkgs.off loop
						pkg_name := pkgs.item_for_iteration.name.as_upper
						create tree_node.make (create {ARCH_REP_MODEL_NODE}.make_package(pkg_name))
						parent_node.put_child_right (tree_node)
						directory_index.put (tree_node, pkg_name)

						-- now create a list of classes inheriting from LOCATABLE that are among the suppliers of
						-- the top-level class of the package; this gives the classes that could be archetyped in
						-- that package
						create supp_list.make (0)
						supp_list.compare_objects
						from pkgs.item_for_iteration.classes.start until pkgs.item_for_iteration.classes.off loop
							supp_list.merge (rm_schemas.item_for_iteration.class_definition (pkgs.item_for_iteration.classes.item).all_suppliers)
							supp_list.extend (pkgs.item_for_iteration.classes.item)
							pkgs.item_for_iteration.classes.forth
						end

						-- clean suppliers list so that only LOCATABLEs remain
						from supp_list.start until supp_list.off loop
							if not rm_schemas.item_for_iteration.is_descendant_of (supp_list.item, "LOCATABLE") then
								supp_list.remove
							else
								supp_list.forth
							end
						end

						-- clean suppliers list so that only highest class in any inheritance subtree remains
						supp_list.start
						supp_list_copy := supp_list.duplicate (supp_list.count)
						from supp_list.start until supp_list.off loop
							removed := False
							from supp_list_copy.start until supp_list_copy.off or removed loop
								if rm_schemas.item_for_iteration.is_descendant_of (supp_list.item, supp_list_copy.item) then
									supp_list.remove
									removed := True
								end
								supp_list_copy.forth
							end

							if not removed then
								supp_list.forth
							end
						end

						-- convert to BMM_CLASS_DESCRIPTORs
						create supp_class_list.make(0)
						from supp_list.start until supp_list.off loop
							supp_class_list.extend (rm_schemas.item_for_iteration.class_definition (supp_list.item))
							supp_list.forth
						end
						add_child_nodes (pkg_name, supp_class_list, tree_node)
						pkgs.forth
					end
				end
				rm_schemas.forth
			end
		end

	add_child_nodes (a_package: STRING; class_list: ARRAYED_LIST [BMM_CLASS_DEFINITION]; a_parent_node: like directory)
			-- populate child nodes of a node in directory with immediate descendants of `a_class'
			-- put each node into `ontology_index', keyed by a_package + '-' + `a_class',
			-- which will match with corresponding part of archetype identifier
		local
			children: ARRAYED_LIST [BMM_CLASS_DEFINITION]
			tree_node: like directory
			arm: ARCH_REP_MODEL_NODE
		do
			from class_list.start until class_list.off loop
				create arm.make_class(a_package, class_list.item)
				create tree_node.make (arm)
				tree_node.item.set_parent(a_parent_node.item)

				-- store it with a key like 'DEMOGRAPHIC-CLUSTER'
				directory_index.put (tree_node, arm.ontological_name)
				a_parent_node.put_child_right (tree_node)

				-- get children and process
				children := class_list.item.immediate_descendants
				add_child_nodes(a_package, children, tree_node)
				class_list.forth
			end
-- TODO - accumulative counters for archetypes and model nodes
--			if attached {ARCH_REP_MODEL_NODE} a_parent_node.item as arm then
--				arm.set_child_model_node_count(class_list.count)
--			end
		end

	shifter: STRING
			-- debug indenter
		once
			create Result.make_empty
		end

invariant
	directory_attached: directory /= Void
	adhoc_source_repository_group_id: adhoc_source_repository.group_id = 1
	repositories_group_ids: source_repositories.for_all (agent (repository: attached ARCHETYPE_INDEXED_REPOSITORY_I): BOOLEAN
		do
			Result := repository.group_id > 1
		end)
	total_archetype_count_non_negative: total_archetype_count >= 0
	specialised_archetype_count_valid: specialised_archetype_count >= 0 and specialised_archetype_count <= total_archetype_count
	slotted_archetype_count_valid: slotted_archetype_count >= 0 and slotted_archetype_count <= total_archetype_count
	used_by_archetype_count_valid: used_by_archetype_count >= 0 and used_by_archetype_count <= total_archetype_count
	bad_archetype_count_count_valid: bad_archetype_count >= 0 and bad_archetype_count <= total_archetype_count
	parse_attempted_archetype_count_valid: parse_attempted_archetype_count >= 0 and parse_attempted_archetype_count <= total_archetype_count

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
--| The Original Code is archetype_directory.e.
--|
--| The Initial Developer of the Original Code is Thomas Beale.
--| Portions created by the Initial Developer are Copyright (C) 2003-2008
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
