note
	component:   "openEHR Archetype Project"
	description: "[
				 Archetype catalogue - a data structure containing archetypes (of any kind) found
				 in one or more physical locations, each of which is on some medium, such as the 
				 file system or a web-accessible repository. 
				 
				 The structure of the catalogue is a list of top-level packages, each containing
				 an inheritance tree of first degree descendants of a class that provides 
				 archetyping capability, such as the openEHR class LOCATABLE or the 13606 class
				 RECORD_COMPONENT (which class it is is marked in the .bmm schema for the relevant
				 reference model).
				 
				 The contents of the structure consist of archetypes found in the reference and
				 working repositories, and are subsequently attached into the structure.
				 Archetypes opened adhoc are also grafted here.
				 
				 The catalogue is populated at startup, using the source repository paths stored in a
				 configuration file or elsewhere.
				 
				 Archetypes can also be explicitly loaded by the user at runtime, outside of the 
				 repositories, e.g. the user wants to look at an archetype sent to him in email and
				 stored in /tmp. These archetypes are remembered on the 'adhoc_repository', and this 
				 is also merged into the directory by 'grafting'.
				 
				 In the resulting catalogue, the archetype descriptors from each repository are marked
				 so that calling routines can distinguish them, e.g. to use different coloured icons on 
				 the screen.
				 ]"
	keywords:    "ADL"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2006-2012 Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "See notice at bottom of class"
	void_safety: "initial"

class ARCHETYPE_CATALOGUE

inherit
	SHARED_REFERENCE_MODEL_ACCESS
		export
			{NONE} all;
			{ANY} has_rm_schema_for_id
		end

	SHARED_MESSAGE_BILLBOARD
		export
			{NONE} all
		end

	BMM_DEFINITIONS
		export
			{NONE} all;
			{ANY} deep_copy, deep_twin, is_deep_equal, standard_is_equal
		end

	ARCHETYPE_STATISTICAL_DEFINITIONS
		export
			{NONE} all
		end

	KL_SHARED_FILE_SYSTEM
		export
			{NONE} all
		end

create
	make

feature -- Definitions

	Archetype_category: STRING = "archetypes"

	Template_category: STRING = "templates"

	time_epoch: DATE_TIME
		once
			create Result.make_from_epoch (0)
		end

feature {NONE} -- Initialisation

	make (a_profile_repo_access: PROFILE_REPOSITORY_ACCESS)
		do
			clear
			profile_repo_access := a_profile_repo_access
			if not semantic_item_tree_prototype.has_children then
				initialise_semantic_item_tree_prototype
				clone_semantic_item_tree_prototype
				schema_load_counter := rm_schemas_access.load_count
			end
		end

feature -- Access

	profile_repo_access: PROFILE_REPOSITORY_ACCESS
			-- the repository profile accessor from which this catalogue gets its contents

	archetype_index: HASH_TABLE [ARCH_CAT_ARCHETYPE, STRING]
			-- index of archetype descriptors keyed by mixed-case archetype id. Used in rest of application
		attribute
			create Result.make (0)
		end

	semantic_item_index: HASH_TABLE [ARCH_CAT_ITEM, STRING]
			-- Index of archetype & class nodes, keyed by lower-case ontology concept. Used during construction of `directory'
			-- For class nodes, this will be model_publisher-closure_name-class_name, e.g. openehr-demographic-party.
			-- For archetype nodes, this will be the archetype id.
		attribute
			create Result.make (0)
		end

	filesys_item_index: HASH_TABLE [ARCH_CAT_ITEM, STRING]
			-- Index of archetype & file-system nodes, keyed by relative path of node under repository root path for directory nodes
			-- and for archetype nodes, the archetype id.
		attribute
			create Result.make (0)
		end

	matching_ids (a_regex: STRING; an_rm_type, an_rm_closure: detachable STRING): ARRAYED_SET [STRING]
			-- generate list of archetype ids that match the regex pattern and optional rm_type. If rm_type is supplied,
			-- we assume that the regex itself does not contain an rm type. Matching using `an_tm_type' and
			-- `an_rm_closure' is done in lower case. Any case may be supplied for these two
		require
			Regex_valid: not a_regex.is_empty
			Rm_type_valid: an_rm_type /= Void implies not an_rm_type.is_empty
			Rm_closure_valid: an_rm_closure /= Void implies not an_rm_closure.is_empty
		local
			regex_matcher: LX_DFA_REGULAR_EXPRESSION
			arch_id: ARCHETYPE_ID
			is_candidate: BOOLEAN
			rm_type, rm_closure: detachable STRING
		do
			create Result.make (0)
			Result.compare_objects
			create regex_matcher.compile_case_insensitive (a_regex)
			if attached an_rm_type as rm_t then
				rm_type := rm_t.as_lower
			end
			if attached an_rm_closure as rm_cl then
				rm_closure := rm_cl.as_lower
			end
			if regex_matcher.is_compiled then
				across archetype_index as archs_csr loop
					if regex_matcher.matches (archs_csr.key) then
						if attached rm_type as rmt then
							create arch_id.make_from_string (archs_csr.key)
							is_candidate := rmt.is_equal (arch_id.rm_entity.as_lower)
							if is_candidate and attached rm_closure as rmc then
								is_candidate := rmc.is_equal (arch_id.rm_name.as_lower)
							end
						else
							is_candidate := True
						end
						if is_candidate then
							Result.extend (archs_csr.key)
						end
					end
				end
			else
				Result.extend (get_msg_line("regex_e1", <<a_regex>>))
			end
		ensure
			across Result as ids_csr all has_item_with_id (ids_csr.item.as_lower) end
		end

	last_stats_build_timestamp: DATE_TIME
			-- timestamp of stats build

	last_populate_timestamp: DATE_TIME
			-- timestamp of last populate or repopulate

feature -- Status Report

	adhoc_path_valid (a_full_path: STRING): BOOLEAN
			-- True if path is valid in adhoc repository
		do
			Result := profile_repo_access.adhoc_source_repository.is_valid_path (a_full_path)
		end

	has_item (an_item: ARCH_CAT_ITEM): BOOLEAN
			-- True if `an_item' in catalogue
		do
			Result := semantic_item_index.has_item (an_item)
		end

	has_item_with_id (an_id: STRING): BOOLEAN
			-- True if `an_id' exists in catalogue
		do
			Result := semantic_item_index.has (an_id.as_lower)
		end

	valid_candidate (aca: ARCH_CAT_ARCHETYPE): BOOLEAN
			-- True if `aca' does not exist in the catalogue, but has a viable parent under
			-- which it can be attached
		do
			Result := has_item_with_id (aca.ontological_parent_name) and
				not has_item_with_id (aca.qualified_key)
		end

feature -- Commands

	clear
			-- reduce to initial state
		do
			archetype_index.wipe_out
			semantic_item_index.wipe_out
			filesys_item_index.wipe_out
			semantic_item_tree.wipe_out
			filesys_item_tree.wipe_out
			compile_attempt_count := 0
			create last_populate_timestamp.make_from_epoch (0)
			reset_statistics
		end

	populate
			-- populate all indexes from repository source
		do
			-- populate source repos from physical medium
			across profile_repo_access.repositories as profile_repos_csr loop
				profile_repos_csr.item.populate
			end

			populate_semantic_indexes
			populate_filesys_indexes
		end

feature -- Modification

	add_new_non_specialised_archetype (accn: ARCH_CAT_CLASS_NODE; an_archetype_id: ARCHETYPE_ID; in_dir_path: STRING)
			-- create a new archetype of class represented by `accn' in path `in_dir_path'
		require
			Valid_id: has_rm_schema_for_id (an_archetype_id)
		local
			aof: APP_OBJECT_FACTORY
		do
			create aof
			check attached profile_repo_access.reference_repository as ref_repo then
				put_archetype (aof.create_arch_cat_archetype_make_new_archetype (an_archetype_id,
					ref_repo, in_dir_path), in_dir_path)
			end
		ensure
			has_item_with_id (an_archetype_id.as_string)
		end

	add_new_specialised_archetype (parent_aca: ARCH_CAT_ARCHETYPE; an_archetype_id: ARCHETYPE_ID; in_dir_path: STRING)
			-- create a new specialised archetype as child of archetype represented by `parent_aca' in path `in_dir_path'
		require
			Valid_id: has_rm_schema_for_id (an_archetype_id)
			Valid_parent: parent_aca.is_valid
		local
			aof: APP_OBJECT_FACTORY
		do
			create aof
			check attached parent_aca.differential_archetype as parent_diff_arch and attached
				profile_repo_access.reference_repository as ref_repo
			then
				put_archetype (aof.create_arch_cat_archetype_make_new_specialised_archetype (an_archetype_id, parent_diff_arch,
					ref_repo, in_dir_path), in_dir_path)
			end
		ensure
			has_item_with_id (an_archetype_id.as_string)
		end

	last_added_archetype: detachable ARCH_CAT_ARCHETYPE
			-- archetype added by last call to `add_new_archetype' or `add_new_specialised_archetype'

	add_adhoc_archetype (in_dir_path: STRING)
			-- Add the archetype designated by `in_dir_path' to the ad hoc repository, and graft it into `directory'.
		require
			path_valid: adhoc_path_valid (in_dir_path)
		local
			aca: ARCH_CAT_ARCHETYPE
		do
			if semantic_item_index.is_empty then
				clone_semantic_item_tree_prototype
			end

			profile_repo_access.adhoc_source_repository.add_item (in_dir_path)
			if profile_repo_access.adhoc_source_repository.has_path (in_dir_path) then
				aca := profile_repo_access.adhoc_source_repository.item (in_dir_path)
				if valid_candidate (aca) then
					put_archetype (aca, in_dir_path)
				elseif not has_item_with_id (aca.ontological_parent_name.as_lower) then
					if aca.is_specialised then
						post_error (generator, "add_adhoc_archetype", "arch_cat_orphan_archetype", <<aca.ontological_parent_name, aca.qualified_key>>)
					else
						post_error (generator, "add_adhoc_item", "arch_cat_orphan_archetype_e2", <<aca.ontological_parent_name, aca.qualified_key>>)
					end
				elseif has_item_with_id (aca.qualified_key) then
					post_error (generator, "add_adhoc_archetype", "arch_cat_dup_archetype", <<in_dir_path>>)
				end
			else
				post_error (generator, "add_adhoc_archetype", "invalid_filename_e1", <<in_dir_path>>)
			end
		end

	update_archetype_id (aca: ARCH_CAT_ARCHETYPE)
			-- move `ara' in tree according to its current and old ids
		require
			old_id_valid: attached aca.old_id and then archetype_index.has (aca.old_id.as_string) and then archetype_index.item (aca.old_id.as_string) = aca
			new_id_valid: not archetype_index.has (aca.id.as_string)
			ontological_parent_exists: semantic_item_index.has (aca.ontological_parent_name.as_lower)
		do
			archetype_index.remove (aca.old_id.as_string)
			archetype_index.force (aca, aca.id.as_string)
			semantic_item_index.remove (aca.old_id.as_string.as_lower)
			semantic_item_index.force (aca, aca.id.as_string.as_lower)
			filesys_item_index.remove (aca.old_id.as_string.as_lower)
			filesys_item_index.force (aca, aca.id.as_string.as_lower)
			aca.parent.remove_child (aca)
			semantic_item_index.item (aca.ontological_parent_name).put_child (aca)
			aca.clear_old_ontological_parent_name
		ensure
			Node_added_to_archetype_index: archetype_index.has (aca.id.as_string)
			Node_added_to_ontology_index: semantic_item_index.has (aca.id.as_string)
			Node_parent_set: aca.parent.qualified_name.is_equal (aca.ontological_parent_name)
		end

feature -- Traversal

	do_all_semantic (enter_action: PROCEDURE [ANY, TUPLE [ARCH_CAT_ITEM]]; exit_action: detachable PROCEDURE [ANY, TUPLE [ARCH_CAT_ITEM]])
			-- On all nodes in `semantic_item_tree', execute `enter_action', then recurse into its subnodes, then execute `exit_action'.
		do
			do_subtree (semantic_item_tree, enter_action, exit_action)
		end

	do_all_filesys (enter_action: PROCEDURE [ANY, TUPLE [ARCH_CAT_ITEM]]; exit_action: detachable PROCEDURE [ANY, TUPLE [ARCH_CAT_ITEM]])
			-- On all nodes in `filesys_item_tree', execute `enter_action', then recurse into its subnodes, then execute `exit_action'.
		do
			do_subtree (filesys_item_tree, enter_action, exit_action)
		end

	do_all_archetypes (action: PROCEDURE [ANY, TUPLE [ARCH_CAT_ARCHETYPE]])
			-- On all archetype nodes, execute `action'
		do
			do_subtree (semantic_item_tree, agent do_if_archetype (?, action), Void)
		end

	do_archetypes (aci: ARCH_CAT_ITEM; action: PROCEDURE [ANY, TUPLE [ARCH_CAT_ARCHETYPE]])
			-- Execute `action' on all archetypes found below `aci' in the tree
		do
			do_subtree (aci, agent do_if_archetype (?, action), Void)
		end

	do_if_archetype (aci: ARCH_CAT_ITEM; action: PROCEDURE [ANY, TUPLE [ARCH_CAT_ARCHETYPE]])
			-- If `aci' is an archetype, perform `action' on it.
		do
			if attached {ARCH_CAT_ARCHETYPE} aci as aca then
				action.call ([aca])
			end
		end

	do_archetype_lineage (aca: ARCH_CAT_ARCHETYPE; action: PROCEDURE [ANY, TUPLE [ARCH_CAT_ARCHETYPE]])
			-- On all archetype nodes from top to `aca', execute `action'
		local
			csr: detachable ARCH_CAT_ARCHETYPE
			lineage: attached ARRAYED_LIST [ARCH_CAT_ARCHETYPE]
		do
			create lineage.make (1)
			from csr := aca until csr = Void loop
				lineage.put_front (csr)
				csr := csr.specialisation_parent
			end
			lineage.do_all (action)
		end

feature -- Metrics

	archetype_count: INTEGER
			-- Count of all archetype descriptors in directory.
		do
			Result := archetype_index.count
		end

	template_count: INTEGER
			-- count of artefacts designated as templates or template_components
		do
			across archetype_index as archs_csr loop
				if archs_csr.item.artefact_type /= {ARTEFACT_TYPE}.archetype then
					Result := Result + 1
				end
			end
		end

	compile_attempt_count: INTEGER
			-- Count of archetypes for which compiling has been attempted.

	update_compile_attempt_count
			-- Increment the count of archetypes for which parsing has been attempted.
		require
			can_increment: compile_attempt_count < archetype_count
		do
			compile_attempt_count := compile_attempt_count + 1
		ensure
			incremented: compile_attempt_count = old compile_attempt_count + 1
		end

	decrement_compile_attempt_count
			-- Decrement the count of archetypes for which parsing has been attempted.
		require
			can_decrement: compile_attempt_count > 0
		do
			compile_attempt_count := compile_attempt_count - 1
		ensure
			decremented: compile_attempt_count = old compile_attempt_count - 1
		end

feature -- Statistics

	has_statistics: BOOLEAN
			-- True if stats have been computed
		do
			Result := last_stats_build_timestamp > time_epoch
		end

	can_build_statistics: BOOLEAN
		do
			Result := compile_attempt_count = archetype_count
		end

	catalogue_metrics: HASH_TABLE [INTEGER, STRING]
		attribute
			create Result.make (0)
		end

	terminology_bindings_statistics: HASH_TABLE [ARRAYED_LIST [STRING], STRING]
			-- table of archetypes containing terminology bindings, keyed by terminology;
			-- some archetypes have more than one binding, so could appear in more than one list
		attribute
			create Result.make (0)
		end

	reset_statistics
			-- Reset counters to zero.
		do
			terminology_bindings_statistics.wipe_out
			stats.wipe_out
			create catalogue_metrics.make (catalogue_metric_names.count)
			Catalogue_metric_names.do_all (
				agent (metric_name: STRING)
					do
						catalogue_metrics.put (0, metric_name)
					end
			)
			create last_stats_build_timestamp.make_from_epoch (0)
		end

	build_detailed_statistics
		require
			can_build_statistics
		do
			if last_stats_build_timestamp < last_populate_timestamp then
				reset_statistics
				do_all_archetypes (agent gather_statistics)
				catalogue_metrics.put (archetype_count, Total_archetype_count)
				create last_stats_build_timestamp.make_now
			end
		end

	stats: HASH_TABLE [ARCHETYPE_STATISTICAL_REPORT, STRING]
			-- table of aggregated stats, keyed by BMM_SCHEMA id to which the contributing archetypes relate
			-- (a single logical archetpe repository can contain archetypes of multiple RMs)
		attribute
			create Result.make (0)
		end

feature {NONE} -- Implementation

	Populate_status_not_attempted: INTEGER = 0

	Populate_status_succeeded: INTEGER = -1

	Populate_status_failed: INTEGER = -2

	populate_semantic_indexes
			-- Rebuild `archetype_index' and `item_index' from source repositories.
		local
			archs: ARRAYED_LIST [ARCH_CAT_ARCHETYPE]
			parent_key, child_key: STRING
			added_during_pass: INTEGER
			status_list: ARRAY[INTEGER]
			i: INTEGER
		do
			if schema_load_counter < rm_schemas_access.load_count then
				initialise_semantic_item_tree_prototype
			end

			clone_semantic_item_tree_prototype

			across profile_repo_access.repositories as profile_repos_csr loop
				archs := profile_repos_csr.item.fast_archetype_list

				-- maintain a list indicating status of each attempted archetype; values:
				-- -1 = succeeded
				-- -2 = failed (duplicate)
				--  0 = not yet tried
				-- +ve number = number of passes attempted with no success
				create status_list.make_filled (0, 1, archs.count)

				from i := 0 until i > 0 and added_during_pass = 0 loop
					added_during_pass := 0
					across archs as archs_csr loop
						if status_list [archs_csr.target_index] >= 0 then
							parent_key := archs_csr.item.ontological_parent_name.as_lower
							if semantic_item_index.has (parent_key) then
								child_key := archs_csr.item.qualified_key
								if not semantic_item_index.has (child_key) then
									semantic_item_index.item (parent_key).put_child (archs_csr.item)
									semantic_item_index.force (archs_csr.item, child_key)
									archetype_index.force (archs_csr.item, archs_csr.item.qualified_name)
									added_during_pass := added_during_pass + 1
									status_list [archs_csr.target_index] := Populate_status_succeeded
								else
									post_error (generator, "populate", "arch_cat_dup_archetype", <<archs_csr.item.full_path>>)
									status_list [archs_csr.target_index] := Populate_status_failed
								end
							else
								status_list [archs_csr.target_index] := status_list [archs_csr.target_index] + 1
							end
						end
					end
					i := i + 1
				end

				-- now report on all the archetypes which could not be attached into the hierarchy
				across archs as archs_csr loop
					if status_list [archs_csr.cursor_index] > 0 then
						if archs_csr.item.is_specialised then
							post_error (generator, "populate", "arch_cat_orphan_archetype", <<archs_csr.item.ontological_parent_name, archs_csr.item.qualified_name>>)
						else
							post_error (generator, "populate", "arch_cat_orphan_archetype_e2", <<archs_csr.item.ontological_parent_name, archs_csr.item.qualified_name>>)
						end
					end
				end
			end
			create last_populate_timestamp.make_now
		end

	populate_filesys_indexes
		local
			repo_path: STRING
			archs: ARRAYED_LIST [ARCH_CAT_ARCHETYPE]
			filesys_node: ARCH_CAT_FILESYS_NODE
		do
			-- create top node (never seen in GUI)
			create filesys_item_tree.make (Archetype_category.twin)

			-- create nodes for archetypes based on their paths in repository
			across profile_repo_access.repositories as profile_repos_csr loop
				-- add a node representing repository root path
				repo_path := profile_repos_csr.item.full_path
				create filesys_node.make (repo_path)
				filesys_item_tree.put_child (filesys_node)
				filesys_item_index.force (filesys_node, repo_path.as_lower)

				-- now go through archetypes and add them in to tree, adding intermediate
				-- filesystem nodes sa required
				archs := profile_repos_csr.item.fast_archetype_list
				across archs as archs_csr loop
					add_arch_to_filesys_tree (archs_csr.item)
				end
			end
		end

	add_arch_to_filesys_tree (aca: ARCH_CAT_ARCHETYPE)
		local
			parent_dir: STRING
		do
			if not aca.is_specialised then
				parent_dir := file_system.dirname (aca.differential_path).as_lower
				if not filesys_item_index.has (parent_dir) then
					add_filesys_nodes (parent_dir)
				end
				filesys_item_index.item (parent_dir).put_child (aca)
				filesys_item_index.force (aca, aca.qualified_key)
			end
		end

	add_filesys_nodes (a_dir_path: STRING)
			-- create intermediate file system nodes in `filesys_item_tree' based on `a_dir_path'
		local
			parent_dir: STRING
			filesys_node: ARCH_CAT_FILESYS_NODE
		do
			check attached file_system.dirname (a_dir_path) as dn then
				parent_dir := dn
			end
			if not filesys_item_index.has (parent_dir) then
				add_filesys_nodes (parent_dir)
			end

			-- now parent node must be there
			create filesys_node.make (a_dir_path)
			filesys_item_index.item (parent_dir).put_child (filesys_node)
			filesys_item_index.force (filesys_node, filesys_node.qualified_key)
		end

	do_subtree (node: ARCH_CAT_ITEM; enter_action: PROCEDURE [ANY, TUPLE [ARCH_CAT_ITEM]]; exit_action: detachable PROCEDURE [ANY, TUPLE [ARCH_CAT_ITEM]])
			-- On `node', execute `enter_action', then recurse into its subnodes, then execute `exit_action'.
		do
			if attached node then
				enter_action.call ([node])
				if node.has_children then
					across node as child_csr loop
						do_subtree (child_csr.item, enter_action, exit_action)
					end
				end
				if attached exit_action then
					exit_action.call ([node])
				end
			end
		end

	filesys_item_tree: ARCH_CAT_CATEGORY_NODE
			-- The directory of archetypes in the filesystem structure, with specialisation shown
		attribute
			create Result.make (Archetype_category)
		end

	semantic_item_tree: ARCH_CAT_CATEGORY_NODE
			-- The logical directory of archetypes, whose structure is derived directly from the
			-- reference model. The structure is a list of top-level packages, each containing
			-- an inheritance tree of first degree descendants of the LOCATABLE class.
			-- The contents of the structure consist of archetypes found in the reference and
			-- working repositories, and are subsequently attached into the structure.
			-- Archetypes opened adhoc are also grafted here.
		attribute
			create Result.make (Archetype_category)
		end

	semantic_item_tree_prototype: ARCH_CAT_CATEGORY_NODE
			-- pure ontology structure created from RM schemas; to be used to create a copy for each refresh of the repository
			-- We use a CELL here because we only want one of these shared between all instances
		once
			create Result.make (Archetype_category)
		end

	initialise_semantic_item_tree_prototype
			-- rebuild `semantic_item_tree_prototype'
		local
			closure_node: ARCH_CAT_CLOSURE_NODE
			rm_closure_name, qualified_rm_closure_key: STRING
			supp_list, supp_list_copy: ARRAYED_SET[STRING]
			supp_class_list: ARRAYED_LIST [BMM_CLASS_DEFINITION]
			root_classes: ARRAYED_SET [BMM_CLASS_DEFINITION]
			removed: BOOLEAN
			bmm_schema: BMM_SCHEMA
		do
			semantic_item_tree_prototype.wipe_out
			across rm_schemas_access.valid_top_level_schemas as top_level_schemas_csr loop
				bmm_schema := top_level_schemas_csr.item
				across bmm_schema.archetype_rm_closure_packages as rm_closure_packages_csr loop
					rm_closure_name := package_base_name (rm_closure_packages_csr.item)
					qualified_rm_closure_key := publisher_qualified_rm_closure_key (bmm_schema.rm_publisher, rm_closure_name)

					-- create new model node if not already in existence
					if semantic_item_tree_prototype.has_child_with_qualified_key (qualified_rm_closure_key) and then
						attached {ARCH_CAT_CLOSURE_NODE} semantic_item_tree_prototype.child_with_qualified_key (qualified_rm_closure_key) as mn
					then
						closure_node := mn
					else
						create closure_node.make (rm_closure_name, bmm_schema)
						semantic_item_tree_prototype.put_child (closure_node)
					end

					-- obtain the top-most classes from the package structure; they might not always be in the top-most package
					check attached bmm_schema.package_at_path (rm_closure_packages_csr.item) as rm_closure_root_pkg then
						root_classes := rm_closure_root_pkg.root_classes
						if not root_classes.is_empty then
							-- create the list of supplier classes for all the classes in the closure root package
							create supp_list.make (0)
							supp_list.compare_objects
							across root_classes as root_classes_csr loop
								supp_list.merge (root_classes_csr.item.supplier_closure)
								supp_list.extend (root_classes_csr.item.name)
							end

							-- now filter this list to keep only those classes inheriting from the archetype_parent_class
							-- that are among the suppliers of the top-level class of the package; this gives the classes
							-- that could be archetyped in that package
							if attached bmm_schema.archetype_parent_class as apc then
								from supp_list.start until supp_list.off loop
									if not bmm_schema.is_descendant_of (supp_list.item, apc) then
										supp_list.remove
									else
										supp_list.forth
									end
								end
							end

							-- filter list list again so that only highest class in any inheritance subtree remains
							supp_list_copy := supp_list.deep_twin
							from supp_list.start until supp_list.off loop
								removed := False
								from supp_list_copy.start until supp_list_copy.off or removed loop
									if bmm_schema.is_descendant_of (supp_list.item, supp_list_copy.item) then
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
							across supp_list as supp_list_csr loop
								supp_class_list.extend (bmm_schema.class_definition (supp_list_csr.item))
							end
							add_child_nodes (rm_closure_name, supp_class_list, closure_node)
						end
					end
				end
			end
		end

	add_child_nodes (an_rm_closure_name: STRING; class_list: ARRAYED_LIST [BMM_CLASS_DEFINITION]; a_parent_node: ARCH_CAT_MODEL_NODE)
			-- populate child nodes of a node in catalogue with immediate descendants of classes in `class_list'
			-- put each node into `item_index', keyed by `an_rm_closure_name' + '-' + `class_list.item.name',
			-- which will match with corresponding part of archetype identifier
		local
			children: ARRAYED_LIST [BMM_CLASS_DEFINITION]
			class_node: ARCH_CAT_CLASS_NODE
		do
			across class_list as class_list_csr loop
				create class_node.make (an_rm_closure_name, class_list_csr.item)
				a_parent_node.put_child (class_node)
				children := class_list_csr.item.immediate_descendants
				add_child_nodes (an_rm_closure_name, children, class_node)
			end
		end

	clone_semantic_item_tree_prototype
			-- clone `semantic_item_tree_prototype' for use in an `semantic_item_tree'
		do
			semantic_item_tree := semantic_item_tree_prototype.deep_twin
			create semantic_item_index.make (0)
			do_all_semantic (agent (ari: attached ARCH_CAT_ITEM) do semantic_item_index.force (ari, ari.qualified_key) end, Void)
		end

	put_archetype (aca: ARCH_CAT_ARCHETYPE; in_dir_path: STRING)
			-- put `aca' into the structure
		require
			valid_candidate (aca)
		local
			parent_key, child_key: STRING
		do
			parent_key := aca.ontological_parent_name.as_lower
			child_key := aca.qualified_key

			-- add to semantic index
			semantic_item_index.item (parent_key).put_child (aca)
			semantic_item_index.force (aca, child_key)
			archetype_index.force (aca, child_key)

			-- add to filesys index
			add_arch_to_filesys_tree (aca)

			last_added_archetype := aca
		ensure
			Last_added_archetype_set: last_added_archetype = aca
			Archetype_in_index: semantic_item_index.item (aca.qualified_key) = aca
		end

	schema_load_counter: INTEGER
			-- track loading of schemas; when changed, re-intialise the ontology prototype

	shifter: STRING
			-- debug indenter
		once
			create Result.make_empty
		end

	gather_statistics (aca: ARCH_CAT_ARCHETYPE)
			-- Update statistics counters from `aca'
		local
			terminologies: ARRAYED_LIST [STRING]
		do
			if aca.is_specialised then
				catalogue_metrics.force (catalogue_metrics.item (specialised_archetype_count) + 1, specialised_archetype_count)
			end
			if aca.has_slots then
				catalogue_metrics.force (catalogue_metrics.item (client_archetype_count) + 1, client_archetype_count)
			end
			if aca.is_supplier then
				catalogue_metrics.force (catalogue_metrics.item (supplier_archetype_count) + 1, supplier_archetype_count)
			end

			-- RM stats
			if aca.is_valid then
				catalogue_metrics.force (catalogue_metrics.item (valid_archetype_count) + 1, valid_archetype_count)

				terminologies := aca.differential_archetype.ontology.terminologies_available
				across terminologies as terminologies_csr loop
					if not terminology_bindings_statistics.has (terminologies_csr.item) then
						terminology_bindings_statistics.put (create {ARRAYED_LIST[STRING]}.make(0), terminologies_csr.item)
					end
					terminology_bindings_statistics.item (terminologies_csr.item).extend (aca.qualified_name)
				end

				aca.generate_statistics (True)
				if stats.has (aca.rm_schema.schema_id) then
					stats.item (aca.rm_schema.schema_id).merge (aca.statistical_analyser.stats)
				else
					stats.put (aca.statistical_analyser.stats.duplicate, aca.rm_schema.schema_id)
				end
			end
		end

invariant
	parse_attempted_archetype_count_valid: compile_attempt_count >= 0 and compile_attempt_count <= archetype_count

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
