note
	component:   "openEHR Archetype Project"
	description: "[
				 Archetype repository - a data structure containing archetypes (of any kind) found
				 in one or more physical locations, each of which is on some medium, such as the 
				 file system or a web-accessible repository. 
				 
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

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"


class ARCHETYPE_DIRECTORY

inherit
	SHARED_RESOURCES
		export
			{NONE} all
		end

	SHARED_REFERENCE_MODEL_ACCESS
		export
			{NONE} all
		end

	SHARED_MESSAGE_DB
		export
			{NONE} all
		end

	SHARED_MESSAGE_BILLBOARD
		export
			{NONE} all
		end

	SHARED_SOURCE_REPOSITORIES
		export
			{NONE} all
		end

	BMM_DEFINITIONS
		export
			{NONE} all
		end

create
	make

feature -- Definitions

	Archetype_category: STRING = "archetypes"

	Template_category: STRING = "templates"

feature -- Initialisation

	make
		do
			clear
			if ontology_prototype.item = Void then
				initialise_ontology_prototype
				schema_load_counter := rm_schemas_access.load_count
			end
		end

feature -- Access

	archetype_index: attached DS_HASH_TABLE [ARCH_REP_ARCHETYPE, STRING]
			-- index of archetype descriptors. Used in rest of application

	ontology_index: attached DS_HASH_TABLE [ARCH_REP_ITEM, STRING]
			-- Index of archetype & class nodes, keyed by ontology concept. Used during construction of `directory'
			-- For class nodes, this will be package_name-class_name, e.g. DEMOGRAPHIC-PARTY.
			-- For archetype nodes, this will be the archetype id.

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

	selected_class: ARCH_REP_MODEL_NODE
			-- The model node at `selected_node'.
		do
			Result ?= selected_item
			if attached Result and not Result.is_class then
				Result := Void
			end
		ensure
			consistent_with_history: Result /= Void implies Result = selected_item
		end

	matching_ids (a_regex, an_rm_type, an_rm_package: STRING): attached ARRAYED_SET[STRING]
			-- generate list of archetype ids that match the pattern and optional rm_type. If rm_type is supplied,
			-- we assume that the regex itself does not contain an rm type
		require
			Regex_valid: a_regex /= Void and then not a_regex.is_empty
			Rm_type_valid: an_rm_type /= Void implies not an_rm_type.is_empty
			Rm_package_valid: an_rm_package /= Void implies not an_rm_package.is_empty
		local
			regex_matcher: LX_DFA_REGULAR_EXPRESSION
			arch_id: ARCHETYPE_ID
			is_candidate: BOOLEAN
		do
			create Result.make (0)
			Result.compare_objects
			create regex_matcher.compile_case_insensitive (a_regex)
			if regex_matcher.is_compiled then
				from archetype_index.start until archetype_index.off loop
					if regex_matcher.matches (archetype_index.key_for_iteration) then
						if an_rm_type /= Void then
							create arch_id.make_from_string (archetype_index.key_for_iteration)
							is_candidate := an_rm_type.as_lower.is_equal (arch_id.rm_entity.as_lower)
							if is_candidate and an_rm_package /= Void then
								is_candidate := an_rm_package.as_lower.is_equal (arch_id.rm_name.as_lower)
							end
						else
							is_candidate := True
						end
						if is_candidate then
							Result.extend(archetype_index.key_for_iteration)
						end
					end
					archetype_index.forth
				end
			else
				Result.extend(create_message_line("regex_e1", <<a_regex>>))
			end
		end

	recently_selected_archetypes (n: INTEGER): attached ARRAYED_LIST [ARCH_REP_ARCHETYPE]
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

	client_archetype_count: INTEGER
			-- Count of slot-containing archetype descriptors in directory.

	supplier_archetype_count: INTEGER
			-- Count of archetype descriptors for archetypes used in slots in directory.

	bad_archetype_count: INTEGER
			-- Count of invalid archetype files found in repositories.

	compile_attempt_count: INTEGER
			-- Count of archetypes for which parsing has been attempted.

	terminology_bindings_info: HASH_TABLE [ARRAYED_LIST[STRING], STRING]
			-- table of archetypes containing terminology bindings, keyed by terminology;
			-- some archetypes have more than one binding, so could appear in more than one list

feature -- Status Report

	has_selected_item: BOOLEAN
			-- Has an item been selected?
		do
			Result := selected_item /= Void
		end

	has_selected_archetype: BOOLEAN
			-- Has an archetype been selected?
		do
			Result := selected_archetype /= Void
		end

	has_validated_selected_archetype: BOOLEAN
			-- Has a valid archetype been selected?
		do
			Result := selected_archetype /= Void and then selected_archetype.is_valid
		end

	has_selected_class: BOOLEAN
			-- Has a class been selected?
		do
			Result := selected_class /= Void
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

	adhoc_path_valid (a_full_path: STRING): BOOLEAN
			-- True if path is valid in adhoc repository
		do
			Result := source_repositories.adhoc_source_repository.is_valid_path (a_full_path)
		end

feature -- Commands

	clear
			-- reduce to initial state
		do
			create selection_history.make
			create archetype_index.make (0)
			create ontology_index.make (0)
			ontology := Void
			reset_statistics
		end

	populate
			-- Rebuild `archetype_index' and `ontology_index' from source repositories.
		local
			archs: ARRAYED_LIST [ARCH_REP_ARCHETYPE]
			parent_key, child_key: STRING
			added_during_pass: INTEGER
			status_list: ARRAY[INTEGER]
			i: INTEGER
		do
			if schema_load_counter < rm_schemas_access.load_count then
				initialise_ontology_prototype
			end

			clone_ontology_prototype

			from source_repositories.repositories.start until source_repositories.repositories.off loop
				source_repositories.repositories.item_for_iteration.populate
				archs := source_repositories.repositories.item_for_iteration.fast_archetype_list

				-- maintain a list indicating status of each attempted archetype; values:
				-- -1 = succeeded
				-- -2 = failed (duplicate)
				--  0 = not yet tried
				-- +ve number = number of passes attempted with no success
				create status_list.make (1, archs.count)

				from i := 0 until i > 0 and added_during_pass = 0 loop
					added_during_pass := 0
					from archs.start until archs.off loop
						if status_list[archs.index] >= 0 then
							parent_key := archs.item.ontological_parent_name
							if ontology_index.has (parent_key) then
								child_key := archs.item.ontological_name
								if not ontology_index.has (child_key) then
									ontology_index.item (parent_key).put_child (archs.item)
									ontology_index.force (archs.item, child_key)
									archetype_index.force(archs.item, child_key)
									update_basic_statistics(archs.item)
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

				-- now report on all the archetypes which could not be attached into the hierarchy
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

				source_repositories.repositories.forth
			end
		end

	update_basic_statistics (ara: ARCH_REP_ARCHETYPE)
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
				client_archetype_count := client_archetype_count + 1
			end

			if ara.is_supplier then
				supplier_archetype_count := supplier_archetype_count + 1
			end
		end

	update_terminology_bindings_info (ara: ARCH_REP_ARCHETYPE)
			-- Update term binding info
		local
			terminologies: ARRAYED_LIST [STRING]
		do
			terminologies := ara.differential_archetype.ontology.terminologies_available
			from terminologies.start until terminologies.off loop
				if not terminology_bindings_info.has(terminologies.item) then
					terminology_bindings_info.put(create {ARRAYED_LIST[STRING]}.make(0), terminologies.item)
				end
				terminology_bindings_info.item(terminologies.item).extend(ara.ontological_name)
				terminologies.forth
			end
		end

	update_compile_attempt_count
			-- Increment the count of archetypes for which parsing has been attempted.
		require
			can_increment: compile_attempt_count < total_archetype_count
		do
			compile_attempt_count := compile_attempt_count + 1
		ensure
			incremented: compile_attempt_count = old compile_attempt_count + 1
		end

	reset_statistics
			-- Reset counters to zero.
		do
			total_archetype_count := 0
			specialised_archetype_count := 0
			client_archetype_count := 0
			supplier_archetype_count := 0
			bad_archetype_count := 0
			compile_attempt_count := 0
			create terminology_bindings_info.make(0)
		end

feature -- Modification

	set_selected_item (an_item: attached ARCH_REP_ITEM)
			-- Append `an_item' to `selection_history' and select it.
		do
			if selected_item /= an_item then
				if selection_history.is_empty or else selection_history.last /= an_item then
					selection_history.extend (an_item)
				end
				selection_history.finish
			end
		ensure
			selected_item_set: selected_item = an_item
			history_is_last_if_value_different: old selected_item /= an_item implies selection_history.islast
			history_extended_if_value_different_and_wasnt_last: selection_history.count = old
				(selection_history.count + (selected_item /= an_item and (selection_history.is_empty or else selection_history.last /= an_item)).to_integer)
		end

	set_selected_item_from_id (an_item_id: STRING)
			-- Append `an_item' to `selection_history' and select it.
		require
			Id_valid: archetype_index.has (an_item_id)
		do
			set_selected_item(archetype_index.item (an_item_id))
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
			path_valid: adhoc_path_valid (full_path)
		local
			parent_key, child_key: STRING
			ara: ARCH_REP_ARCHETYPE
		do
			if ontology_index.is_empty then
				clone_ontology_prototype
			end

			source_repositories.adhoc_source_repository.add_item (full_path)
			ara := source_repositories.adhoc_source_repository.item(full_path)
			if source_repositories.adhoc_source_repository.has_path (full_path) then
				parent_key := ara.ontological_parent_name
				if ontology_index.has (parent_key) then
					child_key := ara.id.as_string
					if not ontology_index.has(child_key) then
						ontology_index.item (parent_key).put_child(ara)
						ontology_index.force (ara, child_key)
						archetype_index.force (ara, child_key)
						update_basic_statistics(ara)
						set_selected_item (source_repositories.adhoc_source_repository.item (full_path))
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
		end

	update_archetype_id(ara: ARCH_REP_ARCHETYPE)
			-- move `ara' in tree according to its current and old ids
		require
			ara_attached: ara /= Void
			old_id_valid: ara.old_id /= Void and then archetype_index.has (ara.old_id.as_string) and then archetype_index.item (ara.old_id.as_string) = ara
			new_id_valid: not archetype_index.has(ara.id.as_string)
			ontological_parent_exists: ontology_index.has(ara.ontological_parent_name)
		do
			archetype_index.remove (ara.old_id.as_string)
			archetype_index.force (ara, ara.id.as_string)
			ontology_index.remove (ara.old_id.as_string)
			ontology_index.force (ara, ara.id.as_string)
			ara.parent.remove_child(ara)
			ontology_index.item (ara.ontological_parent_name).put_child (ara)
			ara.clear_old_ontological_parent_name
		ensure
			Node_added_to_archetype_index: archetype_index.has (ara.id.as_string)
			Node_added_to_ontology_index: ontology_index.has (ara.id.as_string)
			Node_parent_set: ara.parent.ontological_name.is_equal (ara.ontological_parent_name)
		end

feature -- Traversal

	do_all (enter_action, exit_action: PROCEDURE [ANY, TUPLE [ARCH_REP_ITEM]])
			-- On all nodes in tree, execute `enter_action', then recurse into its subnodes, then execute `exit_action'.
		require
			enter_action_attached: enter_action /= Void
		do
			do_subtree (ontology, enter_action, exit_action)
		end

	do_archetypes (ari: ARCH_REP_ITEM; action: PROCEDURE [ANY, TUPLE [ARCH_REP_ARCHETYPE]])
			-- On all archetype nodes in tree, execute `enter_action', then recurse into its subnodes, then execute `exit_action'.
		do
			do_subtree (ari, agent do_if_archetype (?, action), Void)
		end

	do_all_archetypes (action: PROCEDURE [ANY, TUPLE [attached ARCH_REP_ARCHETYPE]])
			-- On all archetype nodes in tree, execute `enter_action', then recurse into its subnodes, then execute `exit_action'.
		do
			do_subtree (ontology, agent do_if_archetype (?, action), Void)
		end

	do_if_archetype (ari: ARCH_REP_ITEM; action: PROCEDURE [ANY, TUPLE [attached ARCH_REP_ARCHETYPE]])
			-- If `ari' is an archetype, perform `action' on it.
		do
			if attached {ARCH_REP_ARCHETYPE} ari as ara then
				action.call ([ara])
			end
		end

	do_archetype_lineage (ara: ARCH_REP_ARCHETYPE; action: PROCEDURE [ANY, TUPLE [attached ARCH_REP_ARCHETYPE]])
			-- On all archetype nodes from top to , execute `enter_action', then recurse into its subnodes, then execute `exit_action'.
		local
			csr: ARCH_REP_ARCHETYPE
			lineage: attached ARRAYED_LIST [ARCH_REP_ARCHETYPE]
		do
			create lineage.make (1)
			from csr := ara until csr = Void loop
				lineage.put_front (csr)
				csr := csr.specialisation_parent
			end
			lineage.do_all (action)
		end

feature {NONE} -- Implementation

	do_subtree (node: ARCH_REP_ITEM; enter_action, exit_action: PROCEDURE [ANY, TUPLE [ARCH_REP_ITEM]])
			-- On `node', execute `enter_action', then recurse into its subnodes, then execute `exit_action'.
		require
			enter_action_attached: enter_action /= Void
		do
			if node /= Void then
	 			debug("arch_dir")
					shifter.extend ('%T')
				end
				enter_action.call ([node])
				if node.has_children then
					from node.child_start until node.child_off loop
						do_subtree (node.child_item, enter_action, exit_action)
						node.child_forth
					end
				end
				if exit_action /= Void then
					exit_action.call ([node])
				end
				debug("arch_dir")
					shifter.remove_tail (1)
				end
			end
		end

	selection_history: attached LINKED_LIST [attached ARCH_REP_ITEM]
			-- The history in which archetypes and folders have been selected, from earliest to most recent.

	ontology: ARCH_REP_MODEL_NODE
			-- The logical directory of archetypes, whose structure is derived directly from the
			-- reference model. The structure is a list of top-level packages, each containing
			-- an inheritance tree of first degree descendants of the LOCATABLE class.
			-- The contents of the structure consist of archetypes found in the reference and
			-- working repositories, and are subsequently attached into the structure.
			-- Archetypes opened adhoc are also grafted here.

	ontology_prototype: CELL [ARCH_REP_MODEL_NODE]
			-- pure ontology structure created from RM schemas; to be used to create a copy for each refresh of the repository
			-- We use a CELL here because we only want one of these shared between all instances
		once
			create Result.put (Void)
		end

	initialise_ontology_prototype
			-- rebuild `initialise_ontology_prototype'
		local
			pkgs: HASH_TABLE [BMM_PACKAGE_DEFINITION, STRING]
			parent_node, arm: ARCH_REP_MODEL_NODE
			pkg_name: STRING
			supp_list, supp_list_copy: ARRAYED_SET[STRING]
			supp_class_list: ARRAYED_LIST [BMM_CLASS_DEFINITION]
			removed: BOOLEAN
		do
			create parent_node.make_category (Archetype_category.twin)
			ontology_prototype.put (parent_node)
			from rm_schemas_access.top_level_schemas.start until rm_schemas_access.top_level_schemas.off loop
				pkgs := rm_schemas_access.top_level_schemas.item_for_iteration.schema.packages
				from pkgs.start until pkgs.off loop
					if pkgs.item_for_iteration.has_classes then
						-- package name might be of form xxx.yyy.zzz ; we only want 'zzz'
						pkg_name := terminal_package_name(pkgs.item_for_iteration.name).as_upper

					create arm.make_package(pkg_name)
					parent_node.put_child (arm)

					create supp_list.make (0)
					supp_list.compare_objects
					from pkgs.item_for_iteration.classes.start until pkgs.item_for_iteration.classes.off loop
							supp_list.merge (rm_schemas_access.top_level_schemas.item_for_iteration.class_definition (pkgs.item_for_iteration.classes.item).all_suppliers)
						supp_list.extend (pkgs.item_for_iteration.classes.item)
						pkgs.item_for_iteration.classes.forth
					end

					-- now create a list of classes inheriting from LOCATABLE that are among the suppliers of
					-- the top-level class of the package; this gives the classes that could be archetyped in
					-- that package
						if rm_schemas_access.top_level_schemas.item_for_iteration.has_class_definition ("LOCATABLE") then
						from supp_list.start until supp_list.off loop
								if not rm_schemas_access.top_level_schemas.item_for_iteration.is_descendant_of (supp_list.item, "LOCATABLE") then
								supp_list.remove
							else
								supp_list.forth
							end
						end
					end

					-- clean suppliers list so that only highest class in any inheritance subtree remains
					supp_list.start
					supp_list_copy := supp_list.duplicate (supp_list.count)
					from supp_list.start until supp_list.off loop
						removed := False
						from supp_list_copy.start until supp_list_copy.off or removed loop
								if rm_schemas_access.top_level_schemas.item_for_iteration.is_descendant_of (supp_list.item, supp_list_copy.item) then
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
							supp_class_list.extend (rm_schemas_access.top_level_schemas.item_for_iteration.class_definition (supp_list.item))
						supp_list.forth
					end
					add_child_nodes (pkg_name, supp_class_list, arm)
					end
					pkgs.forth
				end
				rm_schemas_access.top_level_schemas.forth
			end
		end

	add_child_nodes (a_package: STRING; class_list: ARRAYED_LIST [BMM_CLASS_DEFINITION]; a_parent_node: ARCH_REP_MODEL_NODE)
			-- populate child nodes of a node in directory with immediate descendants of `a_class'
			-- put each node into `ontology_index', keyed by a_package + '-' + `a_class',
			-- which will match with corresponding part of archetype identifier
		local
			children: ARRAYED_LIST [BMM_CLASS_DEFINITION]
			arm: ARCH_REP_MODEL_NODE
		do
			from class_list.start until class_list.off loop
				create arm.make_class(a_package, class_list.item)
				a_parent_node.put_child (arm)
				children := class_list.item.immediate_descendants
				add_child_nodes(a_package, children, arm)
				class_list.forth
			end
		end

	clone_ontology_prototype
			-- clone `ontology_prototype' and `ontology_index_prototype'
		do
			ontology := ontology_prototype.item.deep_twin
			create ontology_index.make (0)
			do_all (agent (ari: attached ARCH_REP_ITEM) do ontology_index.force (ari, ari.ontological_name) end, Void)
		end

	schema_load_counter: INTEGER
			-- track loading of schemas; when changed, re-intialise the ontology prototype

	shifter: STRING
			-- debug indenter
		once
			create Result.make_empty
		end

invariant
	total_archetype_count_non_negative: total_archetype_count >= 0
	specialised_archetype_count_valid: specialised_archetype_count >= 0 and specialised_archetype_count <= total_archetype_count
	slotted_archetype_count_valid: client_archetype_count >= 0 and client_archetype_count <= total_archetype_count
	used_by_archetype_count_valid: supplier_archetype_count >= 0 and supplier_archetype_count <= total_archetype_count
	bad_archetype_count_count_valid: bad_archetype_count >= 0 and bad_archetype_count <= total_archetype_count
	parse_attempted_archetype_count_valid: compile_attempt_count >= 0 and compile_attempt_count <= total_archetype_count

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
