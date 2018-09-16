note
	component:   "openEHR ADL Tools"
	description: "[
				 Archetype library - a data structure containing archetypes (of any kind) found
				 in one or more physical locations, each of which is on some medium, such as the 
				 file system or a web-accessible repository. 
				 
				 The structure of the library is a list of top-level packages, each containing
				 an inheritance tree of first degree descendants of a class that provides 
				 archetyping capability, such as the openEHR class LOCATABLE or the 13606 class
				 RECORD_COMPONENT (which class it is is marked in the .bmm schema for the relevant
				 reference model).
				 				 
				 The library is populated at startup, using the source repository paths stored in a
				 configuration file or elsewhere.
				 
				 Archetypes can also be explicitly loaded by the user at runtime, outside of the 
				 repositories, e.g. the user wants to look at an archetype sent to him in email and
				 stored in /tmp. These archetypes are remembered on the 'adhoc_repository', and this 
				 is also merged into the directory by 'grafting'.
				 
				 In the resulting library, the archetype descriptors from each repository are marked
				 so that calling routines can distinguish them, e.g. to use different coloured icons on 
				 the screen.
				 ]"
	keywords:    "ADL"
	author:      "Thomas Beale <thomas.beale@openehr.org>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2006- The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class ARCHETYPE_LIBRARY

inherit
	SHARED_ARCHETYPE_RM_ACCESS
		export
			{NONE} all;
			{ANY} has_model_for_archetype_id
		end

	ANY_VALIDATOR
		rename
			validate as populate
		end

	BMM_DEFINITIONS
		export
			{NONE} all;
			{ANY} deep_copy, deep_twin, is_deep_equal, standard_is_equal
		end

	ARCHETYPE_DEFINITIONS
		export
			{NONE} all
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

feature {NONE} -- Initialisation

	make (a_lib_access: ARCHETYPE_LIBRARY_INTERFACE)
		do
			library_access := a_lib_access
			clear
			initialise_item_tree
		end

feature -- Access

	library_access: ARCHETYPE_LIBRARY_INTERFACE
			-- the repository profile accessor from which this library gets its contents

	archetype_with_id (an_archetype_id: STRING): ARCH_LIB_ARCHETYPE
			-- get the archetype with physical id `an_archetype_id'
		require
			has_archetype_with_id (an_archetype_id)
		do
			check attached {ARCH_LIB_ARCHETYPE} item_index.item (an_archetype_id.as_lower) as att_ala then
				Result := att_ala
			end
		end

	archetype_matching_ref (an_archetype_ref: STRING): detachable ARCH_LIB_ARCHETYPE
			-- Return archetype whose id matches `an_archetype_ref'
		local
			key_lc: STRING
		do
			key_lc := an_archetype_ref.as_lower

			-- assume `an_archetype_ref' is of major version reference form
			if attached archetype_ref_index.item (key_lc) as att_aca then
				Result := att_aca
			-- else try for direct match, or else filler id is compatible with available actual ids
			-- e.g. filler id is 'openEHR-EHR-COMPOSITION.discharge.v1' and list contains things
			-- like 'openEHR-EHR-COMPOSITION.discharge.v1.3.28'
			elseif attached {ARCH_LIB_ARCHETYPE} item_index.item (key_lc) as att_aca then
				Result := att_aca
			-- else expensive brute force search
			else
				from item_index.start until item_index.off or attached Result loop
					if item_index.key_for_iteration.starts_with (key_lc) and then
						attached {ARCH_LIB_ARCHETYPE} item_index.item_for_iteration as att_aca
					then
						Result := att_aca
					end
					item_index.forth
				end
			end
		end

	subsumption_set (an_rm_type: STRING; an_archetype_id: ARCHETYPE_HRID): ARRAYED_SET [STRING]
			-- generate list of archetype ids that are in the archetype subsumption hierarchy under `an_rm_type'
			-- from the RM schema to which `an_archetype_id' belongs.
			-- The strategy is to find the node corresponding to the class name and get all archetypes
			-- below it.
		require
			Rm_type_valid: not an_rm_type.is_empty
		local
			rm: BMM_MODEL
			class_nodes: ARRAYED_LIST[ARCH_LIB_CLASS]
		do
			create Result.make (0)
			Result.compare_objects
			create class_nodes.make (0)

			-- get the RM schema for the archetype_id
			rm := model_for_archetype_id (an_archetype_id)

			-- find matching class nodes
			across item_index as item_index_csr loop
				if attached {ARCH_LIB_CLASS} item_index_csr.item as alc and then
					alc.bmm_model = rm and then alc.class_definition.name.is_case_insensitive_equal (an_rm_type)
				then
					class_nodes.extend (alc)
				end
			end

			across class_nodes as class_nodes_csr loop
				do_archetypes (class_nodes_csr.item,
					agent (ala: ARCH_LIB_ARCHETYPE; ids: ARRAYED_SET [STRING])
						do
							ids.extend (ala.id.physical_id)
						end (?, Result)
				)
			end
		end

	class_for_definition (a_class_def: BMM_CLASS): detachable ARCH_LIB_CLASS
			-- find the class node for `a_class_def'.
		do
			from item_index.start until item_index.off or attached Result loop
				if attached {ARCH_LIB_CLASS} item_index.item_for_iteration as alc and then
					alc.class_definition = a_class_def
				then
					Result := alc
				end
				item_index.forth
			end
		end

	matching_ids (a_regex: STRING; an_rm_type, an_rm_package: detachable STRING): ARRAYED_SET [STRING]
			-- generate list of archetype ids that lexically match the regex pattern and optional rm_type. If rm_type is supplied,
			-- we assume that the regex itself does not contain an rm type. Matching using `an_rm_type' and
			-- `an_rm_package' is done in lower case. Any case may be supplied for these two
		require
			Regex_valid: not a_regex.is_empty
			Rm_type_valid: attached an_rm_type as att_rm_type implies not att_rm_type.is_empty
			Rm_closure_valid: attached an_rm_package as att_rm_closure implies not att_rm_closure.is_empty
		local
			arch_id: ARCHETYPE_HRID
			is_candidate: BOOLEAN
			rm_type, rm_closure: detachable STRING
		do
			create Result.make (0)
			Result.compare_objects

			if attached an_rm_type as rm_t then
				rm_type := rm_t.as_lower
			end
			if attached an_rm_package as rm_cl then
				rm_closure := rm_cl.as_lower
			end

			regex_matcher.compile (a_regex)
			if regex_matcher.is_compiled then
				across item_index as archs_csr loop
					if attached {ARCH_LIB_ARCHETYPE} archs_csr.item as ala and then regex_matcher.matches (archs_csr.key) then
						arch_id := ala.id
						if attached rm_type as rmt then
							is_candidate := rmt.is_equal (arch_id.rm_class.as_lower)
							if is_candidate and attached rm_closure as rmc then
								is_candidate := rmc.is_equal (arch_id.rm_package.as_lower)
							end
						else
							is_candidate := True
						end
						if is_candidate then
							Result.extend (arch_id.physical_id)
						end
					end
				end
			else
				Result.extend (get_msg_line (ec_regex_e1, <<a_regex>>))
			end
		end

	slot_fillers (a_slot: ARCHETYPE_SLOT; owner_id: ARCHETYPE_HRID): ARRAYED_SET [STRING]
			-- generate a list of slot filler archetype ids for one slot
		local
			includes, excludes: ARRAYED_LIST[ASSERTION]
		do
			create Result.make (0)
			Result.compare_objects

			includes := a_slot.includes
			excludes := a_slot.excludes
			if not includes.is_empty and not includes.first.matches_any then
				if not excludes.is_empty then -- create specific match list from includes constraint
					across includes as includes_csr loop
						if attached includes_csr.item.regex_constraint as att_c_str and then attached {STRING} att_c_str.constraint_regex as att_regex then
							Result.merge (matching_ids (att_regex, a_slot.rm_type_name, Void))
						end
					end
				-- excludes = empty ==> includes is just a recommendation => match all archetype ids of RM type
				else
					Result.merge (matching_ids (Regex_any_pattern, a_slot.rm_type_name, owner_id.rm_package))
				end
			elseif not excludes.is_empty and not excludes.first.matches_any then
				Result.merge (matching_ids (Regex_any_pattern, a_slot.rm_type_name, Void))
				-- means excludes is not a recommendation; need to actually process it
				if not includes.is_empty then
					across excludes as excludes_csr loop
						if attached excludes_csr.item.regex_constraint as att_c_str and then attached {STRING} att_c_str.constraint_regex as att_regex then
							across matching_ids (att_regex, a_slot.rm_type_name, owner_id.rm_package) as ids_csr loop
								Result.prune (ids_csr.item)
							end
						end
					end
				end
			else
				-- everything matches, of the right RM type
				Result.merge (matching_ids (Regex_any_pattern, a_slot.rm_type_name, owner_id.rm_package))
			end

		end

	archetype_parent_item (ala: ARCH_LIB_ARCHETYPE): detachable ARCH_LIB_ITEM
		do
			if not ala.is_specialised then
				Result := item_index.item (ala.semantic_parent_key.as_lower)
			else
				Result := archetype_matching_ref (ala.semantic_parent_key)
			end
		end

	last_populate_timestamp: DATE_TIME
			-- timestamp of last populate or repopulate

feature -- Status Report

	valid_adhoc_path (a_full_path: STRING): BOOLEAN
			-- True if path is valid in adhoc repository
		do
			Result := library_access.adhoc_source.is_valid_path (a_full_path)
		end

	has_archetype_with_id (an_archetype_id: STRING): BOOLEAN
			-- True if the physical id `an_archetype_id' exists in library
		do
			Result := item_index.has (an_archetype_id.as_lower)
		end

	has_item_with_id (an_id: STRING): BOOLEAN
			-- True if `an_id', which may be for a class, archetype or other tree artefact
			-- exists in semantic index
		do
			Result := item_index.has (an_id.as_lower)
		end

	valid_candidate (ala: ARCH_LIB_ARCHETYPE): BOOLEAN
			-- True if `ala' does not exist in the library, but has a viable parent under
			-- which it can be attached
		do
			Result := has_parent_item (ala) and
				not has_item_with_id (ala.qualified_key)
		end

	has_archetype_matching_ref (an_archetype_ref: STRING): BOOLEAN
			-- Return true if there is an archetype whose semantic_id (major version only form) matches `an_archetype_ref'
		do
			Result := attached archetype_matching_ref (an_archetype_ref)
		end

	has_parent_item (ala: ARCH_LIB_ARCHETYPE): BOOLEAN
			-- Return true if a parent item can be found for `ala'
		do
			Result := attached archetype_parent_item (ala)
		end

feature -- Commands

	clear
			-- reduce to initial state
		do
			reset
			item_index.wipe_out
			archetype_ref_index.wipe_out
			item_tree.wipe_out

			archetype_count := 0
			template_count := 0

			create last_populate_timestamp.make_from_epoch (0)
			reset_statistics
		end

	populate
			-- populate all indexes from library source
		do
			library_access.source.populate
			errors.append (library_access.source.errors)
			library_access.adhoc_source.populate
			populate_item_index
		end

feature -- Modification

	add_new_non_specialised_archetype (an_archetype_id: ARCHETYPE_HRID; in_dir_path: STRING)
			-- create a new archetype of class represented by `accn' in path `in_dir_path'
		require
			Valid_id: has_model_for_archetype_id (an_archetype_id)
		do
			put_new_archetype (create {ARCH_LIB_AUTHORED_ARCHETYPE}.make_new (an_archetype_id,
				library_access.source, in_dir_path))
		ensure
			has_item_with_id (an_archetype_id.physical_id)
		end

	add_new_specialised_archetype (parent_aca: ARCH_LIB_AUTHORED_ARCHETYPE; an_archetype_id: ARCHETYPE_HRID; in_dir_path: STRING)
			-- create a new specialised archetype as child of archetype represented by `parent_aca' in path `in_dir_path'
		require
			Valid_id: has_model_for_archetype_id (an_archetype_id)
			Valid_parent: parent_aca.is_valid
		do
			put_new_archetype (create {ARCH_LIB_AUTHORED_ARCHETYPE}.make_new_specialised (an_archetype_id, parent_aca.safe_differential_archetype,
					library_access.source, in_dir_path))
		ensure
			has_item_with_id (an_archetype_id.physical_id)
		end

	add_new_template (parent_aca: ARCH_LIB_AUTHORED_ARCHETYPE; an_archetype_id: ARCHETYPE_HRID; in_dir_path: STRING)
			-- create a new specialised archetype as child of archetype represented by `parent_aca' in path `in_dir_path'
		require
			Valid_id: has_model_for_archetype_id (an_archetype_id)
			Valid_parent: parent_aca.is_valid
		do
			put_new_archetype (create {ARCH_LIB_TEMPLATE}.make_new_specialised (an_archetype_id, parent_aca.safe_differential_archetype,
					library_access.source, in_dir_path))
		ensure
			has_item_with_id (an_archetype_id.physical_id)
		end

	put_new_archetype (aca: ARCH_LIB_ARCHETYPE)
			-- put `aca' into the structure and into the library source structure
		require
			valid_candidate (aca)
		do
			check attached archetype_parent_item (aca) as att_ala then
				att_ala.put_child (aca)
			end
			item_index_put (aca)

			-- add to file system index
			if attached {ARCH_LIB_AUTHORED_ARCHETYPE} aca as auth_aca then
				library_access.source.put_archetype (auth_aca)
			end

			last_added_archetype := aca
		ensure
			Last_added_archetype_set: last_added_archetype = aca
			Archetype_in_index: item_index.item (aca.qualified_key) = aca
			Archetype_in_archetype_index: attached {ARCH_LIB_AUTHORED_ARCHETYPE} aca as auth_aca implies has_archetype_with_id (auth_aca.id.physical_id)
		end

	last_added_archetype: detachable ARCH_LIB_ARCHETYPE
			-- archetype added by last call to `add_new_archetype' or `add_new_specialised_archetype'

	add_adhoc_archetype (a_path: STRING)
			-- Add the archetype designated by `a_path' to the ad hoc repository, and graft it into `directory'.
		require
			path_valid: valid_adhoc_path (a_path)
		do
			errors.wipe_out
			library_access.adhoc_source.put_archetype_from_file (a_path)
			errors.append (library_access.adhoc_source.errors)

			remove_list.wipe_out
			if attached library_access.adhoc_source.last_added_archetype as aca then
				try_put_archetype (aca)
				if not has_errors then
					last_added_archetype := aca
				end
			else
				add_error (ec_invalid_filename_e1, <<a_path>>)
			end
		end

	rename_archetype (aca: ARCH_LIB_ARCHETYPE)
			-- rename `ara' in tree and other indexes according to its current and old ids. There must be nothing at its new id.
		require
			old_id_valid: attached aca.old_id as old_id and then has_archetype_with_id (old_id.physical_id) and then archetype_with_id (old_id.physical_id) = aca
			new_id_valid: not has_archetype_with_id (aca.id.physical_id)
			semantic_parent_exists: has_item_with_id (aca.semantic_parent_id)
		do
			if attached aca.old_id as att_old_id then
				-- move it in this library
				item_index_remove (att_old_id)
				item_index_put (aca)

				-- move it in the file_system index
				if attached {ARCH_LIB_AUTHORED_ARCHETYPE} aca as auth_aca then
					if library_access.adhoc_source.has_archetype_with_id (att_old_id.physical_id) then
						library_access.adhoc_source.remove_archetype (att_old_id.physical_id)
						library_access.adhoc_source.put_archetype (auth_aca)
					else
						library_access.source.remove_archetype (att_old_id.physical_id)
						library_access.source.put_archetype (auth_aca)
					end
				end
			end

			-- fix parent child connections
			if attached aca.parent as old_aca_parent and then attached archetype_parent_item (aca) as new_aca_parent and then
				old_aca_parent /= new_aca_parent
			then
				old_aca_parent.remove_child (aca)
				new_aca_parent.put_child (aca)
				aca.clear_old_semantic_parent_name
			end
		ensure
			Node_added_to_archetype_index: has_archetype_with_id (aca.id.physical_id)
			Node_added_to_semantic_index: has_item_with_id (aca.id.physical_id)
			Node_parent_set: attached aca.parent as aca_parent implies aca_parent.qualified_name.is_case_insensitive_equal (aca.semantic_parent_id)
		end

	move_archetype (aca: ARCH_LIB_ARCHETYPE)
			-- move `ara' in tree and other indexes according to its current and old ids. Anything at the target id will be replaced
		require
			old_id_valid: attached aca.old_id as old_id and then has_archetype_with_id (old_id.physical_id) and then archetype_with_id (old_id.physical_id) = aca
			semantic_parent_exists: has_item_with_id (aca.semantic_parent_id)
		do
			-- if there is something there at the new id, remove it
			if has_archetype_with_id (aca.id.physical_id) then
				remove_archetype (archetype_with_id (aca.id.physical_id))
			end

			rename_archetype (aca)
		end

	remove_archetype (aca: ARCH_LIB_ARCHETYPE)
			-- remove `aca' from indexes
		require
			Id_valid: has_archetype_with_id (aca.id.physical_id)
			Semantic_parent_exists: has_item_with_id (aca.semantic_parent_id)
		do
			if attached aca.parent as att_parent then
				att_parent.remove_child (aca)
			end
			item_index_remove (aca.id)

			if aca.is_adhoc then
				library_access.adhoc_source.remove_archetype (aca.id.physical_id)
			else
				library_access.source.remove_archetype (aca.id.physical_id)
			end
		ensure
			Node_removed_from_archetype_index: not has_archetype_with_id (aca.id.physical_id)
			Node_removed_from_semantic_index: not has_item_with_id (aca.id.physical_id)
			If_specialised_removed_from_parent: aca.is_specialised implies (attached aca.parent as att_parent and then not att_parent.has_child (aca))
		end

feature -- Traversal

	do_all_semantic (enter_action: PROCEDURE [ANY, TUPLE [ARCH_LIB_ITEM]]; exit_action: detachable PROCEDURE [ANY, TUPLE [ARCH_LIB_ITEM]])
			-- On all nodes in `item_tree', execute `enter_action', then recurse into its subnodes, then execute `exit_action'.
		do
			do_subtree (item_tree, enter_action, exit_action)
		end

	do_all_source (enter_action: PROCEDURE [ANY, TUPLE [ARCH_LIB_ITEM]]; exit_action: detachable PROCEDURE [ANY, TUPLE [ARCH_LIB_ITEM]])
			-- On all nodes in `item_tree', execute `enter_action', then recurse into its subnodes, then execute `exit_action'.
		do
			do_subtree (library_access.source.item_tree, enter_action, exit_action)
		end

	do_all_archetypes (action: PROCEDURE [ANY, TUPLE [ARCH_LIB_ARCHETYPE]])
			-- On all archetype nodes, execute `action'
		do
			do_subtree (item_tree, agent do_if_archetype (?, action), Void)
		end

	do_archetypes (aci: ARCH_LIB_ITEM; action: PROCEDURE [ANY, TUPLE [ARCH_LIB_ARCHETYPE]])
			-- Execute `action' on all archetypes found below `aci' in the tree
		do
			do_subtree (aci, agent do_if_archetype (?, action), Void)
		end

	do_if_archetype (aci: ARCH_LIB_ITEM; action: PROCEDURE [ANY, TUPLE [ARCH_LIB_ARCHETYPE]])
			-- If `aci' is an archetype, perform `action' on it.
		do
			if attached {ARCH_LIB_ARCHETYPE} aci as aca then
				action.call ([aca])
			end
		end

	do_archetype_lineage (aca: ARCH_LIB_ARCHETYPE; action: PROCEDURE [ANY, TUPLE [ARCH_LIB_ARCHETYPE]])
			-- On all archetype nodes from top to `aca', execute `action'
		local
			csr: detachable ARCH_LIB_ARCHETYPE
			lineage: ARRAYED_LIST [ARCH_LIB_ARCHETYPE]
		do
			create lineage.make (1)
			from csr := aca until csr = Void loop
				lineage.put_front (csr)
				csr := csr.specialisation_parent
			end
			lineage.do_all (action)
		end

feature -- Basic Metrics

	archetype_count: INTEGER
			-- Count of all archetype descriptors in directory.

	template_count: INTEGER
			-- count of artefacts designated as templates or template_components

	compile_attempt_count: INTEGER
			-- Count of archetypes for which compiling has been attempted.
		do
			if compile_activity_timestamp > basic_statistics_timestamp then
				recompute_basic_statistics
			end
			Result := compile_attempt_counter
		end

	compile_valid_count: INTEGER
			-- Count of archetypes which successfully compile
		do
			if compile_activity_timestamp > basic_statistics_timestamp then
				recompute_basic_statistics
			end
			Result := compile_valid_counter
		end

	compile_warnings_count: INTEGER
			-- Count of archetypes for which compiling has been attempted.
		do
			if compile_activity_timestamp > basic_statistics_timestamp then
				recompute_basic_statistics
			end
			Result := compile_warnings_counter
		end

	compile_errors_count: INTEGER
			-- Count of archetypes for which compiling has been attempted.
		do
			if compile_activity_timestamp > basic_statistics_timestamp then
				recompute_basic_statistics
			end
			Result := compile_errors_counter
		end

	notify_compile_activity
			-- routine to update `compile_activity_timestamp' due to compilation activity
		do
			create compile_activity_timestamp.make_now
		end

feature {NONE} -- Basic Metrics

	recompute_basic_statistics
			-- recompute `compile_attempt_counter', `compile_valid_counter', `compile_warnings_counter', `compile_errors_counter'
			-- called by `compile_attempt_count' etc if any compilation activity is more recent than last compute time
		do
			compile_attempt_counter := 0
			compile_valid_counter := 0
			compile_warnings_counter := 0
			compile_errors_counter := 0

			do_all_archetypes (
				agent (ala: ARCH_LIB_ARCHETYPE)
					do
						if ala.compile_attempted then
							compile_attempt_counter := compile_attempt_counter + 1
						end
						if ala.is_valid then
							compile_valid_counter := compile_valid_counter + 1
							if ala.has_warnings then
								compile_warnings_counter := compile_warnings_counter + 1
							end
						else
							compile_errors_counter := compile_errors_counter + 1
						end
					end
			)

			basic_statistics_timestamp.make_now
		end

	compile_attempt_counter: INTEGER
			-- Count of archetypes for which compiling has been attempted.

	compile_valid_counter: INTEGER
			-- Count of archetypes which successfully compile

	compile_warnings_counter: INTEGER
			-- Count of archetypes for which compiling has been attempted.

	compile_errors_counter: INTEGER
			-- Count of archetypes for which compiling has been attempted.

	basic_statistics_timestamp: DATE_TIME
			-- timestamp of last call to `recompute_basic_statistics'
		attribute
			create Result.make_from_epoch (0)
		end

	compile_activity_timestamp: DATE_TIME
			-- timestamp of last call to `recompute_basic_statistics'
		attribute
			create Result.make_from_epoch (0)
		end

feature -- Statistical Report

	last_statistics_build_timestamp: DATE_TIME
			-- timestamp of stats build
		attribute
			Result := time_epoch
		end

	has_statistics: BOOLEAN
			-- True if stats have been computed
		do
			Result := last_statistics_build_timestamp > time_epoch
		end

	can_build_statistics: BOOLEAN
			-- True if a build attempt has been made on all archetypes
		do
			Result := compile_attempt_count = archetype_count
		end

	statistics: HASH_TABLE [ARCHETYPE_STATISTICAL_REPORT, STRING]
			-- table of aggregated stats, keyed by BMM_SCHEMA id to which the contributing archetypes relate
			-- (a single archetype library can contain archetypes of multiple RMs)
		require
			can_build_statistics
		do
			if compile_activity_timestamp > last_statistics_build_timestamp then
				build_statistics
			end
			Result := statistics_cache
		end

	metrics: HASH_TABLE [INTEGER, STRING]
			-- set of key/value pairs, with keys from `Library_metric_names'
			-- populated by call to `build_statistics'
		require
			can_build_statistics
		do
			if compile_activity_timestamp > last_statistics_build_timestamp then
				build_statistics
			end
			Result := metrics_cache
		end

	terminology_bindings_statistics: HASH_TABLE [ARRAYED_LIST [STRING], STRING]
			-- table of archetypes containing terminology bindings, keyed by terminology;
			-- some archetypes have more than one binding, so could appear in more than one list
		require
			can_build_statistics
		do
			if compile_activity_timestamp > last_statistics_build_timestamp then
				build_statistics
			end
			Result := terminology_bindings_statistics_cache
		end

feature {NONE} -- Statistical Report

	statistics_cache: HASH_TABLE [ARCHETYPE_STATISTICAL_REPORT, STRING]
			-- statistics reports keyed by RM schema id
		attribute
			create Result.make (0)
		end

	metrics_cache: HASH_TABLE [INTEGER, STRING]
			-- overall metrics, keyed by metric category
		attribute
			create Result.make (0)
		end

	terminology_bindings_statistics_cache: HASH_TABLE [ARRAYED_LIST [STRING], STRING]
			-- table of terminology stats of archetypes in this library, keyed by
			-- terminology id
		attribute
			create Result.make (0)
		end

	build_statistics
			-- perform new build of `statistics' and `metrics'
		require
			can_build_statistics
		do
			reset_statistics
			do_all_archetypes (agent gather_statistics)
			metrics_cache.put (archetype_count, Total_archetype_count)
			create last_statistics_build_timestamp.make_now
		end

	reset_statistics
			-- Reset counters to zero.
		do
			create terminology_bindings_statistics_cache.make (0)
			create statistics_cache.make (0)
			create metrics_cache.make (Library_metric_names.count)
			Library_metric_names.do_all (
				agent (metric_name: READABLE_STRING_8)
					do
						metrics_cache.put (0, metric_name)
					end
			)
			create last_statistics_build_timestamp.make_from_epoch (0)
		end

	gather_statistics (aca: ARCH_LIB_ARCHETYPE)
			-- Update statistics counters from `aca'
		local
			stats: ARRAYED_LIST[STRING]
		do
			if aca.is_specialised then
				metrics_cache.force (metrics_cache.item (specialised_archetype_count) + 1, specialised_archetype_count)
			end
			if aca.has_slots then
				metrics_cache.force (metrics_cache.item (client_archetype_count) + 1, client_archetype_count)
			end
			if aca.is_supplier then
				metrics_cache.force (metrics_cache.item (supplier_archetype_count) + 1, supplier_archetype_count)
			end

			-- RM stats
			if aca.is_valid then
				metrics_cache.force (metrics_cache.item (valid_archetype_count) + 1, valid_archetype_count)
				across aca.safe_differential_archetype.terminology.terminologies_available as terminologies_csr loop
					if attached terminology_bindings_statistics_cache.item (terminologies_csr.item) as att_stats then
						stats := att_stats
					else
						create stats.make(0)
						terminology_bindings_statistics_cache.put (stats, terminologies_csr.item)
					end
					stats.extend (aca.qualified_name)
				end

				aca.generate_statistics (True)
				if attached aca.statistical_analyser as att_sa then
					if attached statistics_cache.item (aca.ref_model.model_id) as att_item then
						att_item.merge (att_sa.stats)
					else
						statistics_cache.put (att_sa.stats.duplicate, aca.ref_model.model_id)
					end
				end
			end
		end

feature {NONE} -- Implementation

	item_index: HASH_TABLE [ARCH_LIB_ITEM, STRING]
			-- Index of archetype & class nodes, keyed by lower-case id.
			-- For class nodes, this will be model_publisher-closure_name-class_name, e.g. openehr-demographic-party.
			-- For archetypes, this will be the physical archetype id (with 3-part version)
		attribute
			create Result.make (0)
		end

	archetype_ref_index: HASH_TABLE [ARCH_LIB_ARCHETYPE, STRING]
			-- index of archetype descriptors keyed by LOWER-CASE archetype ref (i.e. id with with .vN),
			-- derived from physical archetype id (i.e. id with full vN.N.N version)
		attribute
			create Result.make (0)
		end

	item_index_put (ala: ARCH_LIB_ARCHETYPE)
		do
			item_index.force (ala, ala.qualified_key)
			archetype_ref_index.force (ala, ala.id.semantic_id.as_lower)
			archetype_count := archetype_count + 1
			if attached {ARCH_LIB_TEMPLATE} ala then
				template_count := template_count + 1
			end
		end

	item_index_remove (arch_id: ARCHETYPE_HRID)
		do
			if attached {ARCH_LIB_TEMPLATE} item_index.item (arch_id.physical_id.as_lower) then
				template_count := template_count - 1
			end
			item_index.remove (arch_id.physical_id.as_lower)
			archetype_ref_index.remove (arch_id.semantic_id.as_lower)
			archetype_count := archetype_count - 1
		end

	populate_item_index
			-- Rebuild `archetype_index' and `item_index' from source repositories.
		do
			initialise_item_tree

			-- initially, we put all the archetypes from the file source into the library
			-- this will have the effect of creating the parent_ref index
			across library_access.source as arch_csr loop
				item_index_put (arch_csr.item)
			end

			-- now we try to connect all archetypes under their parent descriptors
			remove_list.wipe_out
			across item_index as item_csr loop
				if attached {ARCH_LIB_AUTHORED_ARCHETYPE} item_csr.item as ala then
					if attached archetype_parent_item (ala) as att_parent_ala then
						att_parent_ala.put_child (ala)
					else
						if ala.is_specialised then
							add_error (ec_arch_cat_orphan_archetype, <<ala.semantic_parent_key, ala.file_mgr.file_paths_string>>)
						else
							add_error (ec_arch_cat_orphan_archetype_e2, <<ala.semantic_parent_key, ala.file_mgr.file_paths_string>>)
						end
						remove_list.extend (ala.id)
					end
				end
			end

			-- process remove_list
			across remove_list as rem_item_csr loop
				item_index_remove (rem_item_csr.item)
			end

			create last_populate_timestamp.make_now
		end

	remove_list: ARRAYED_LIST [ARCHETYPE_HRID]
			-- list of archetypes to remove from the system because they don't have a valid parent
			-- class or parent archetype
		attribute
			create Result.make (20)
		end

	try_put_archetype (aca: ARCH_LIB_AUTHORED_ARCHETYPE)
		do
			if attached archetype_parent_item (aca) as att_parent_ala then
				if not has_item_with_id (aca.qualified_key) then
					att_parent_ala.put_child (aca)
					item_index_put (aca)
				else
					add_error (ec_arch_cat_dup_archetype, <<aca.file_mgr.file_paths_string>>)
					remove_list.extend (aca.id)
				end
			else
				if aca.is_specialised then
					add_error (ec_arch_cat_orphan_archetype, <<aca.semantic_parent_key, aca.file_mgr.file_paths_string>>)
				else
					add_error (ec_arch_cat_orphan_archetype_e2, <<aca.semantic_parent_key, aca.file_mgr.file_paths_string>>)
				end
				remove_list.extend (aca.id)
			end
		end

	item_tree: ARCH_LIB_ARTEFACT_TYPE_ITEM
			-- The logical directory of archetypes, whose structure is derived directly from the
			-- reference model. The structure is a list of top-level packages, each containing
			-- an inheritance tree of first degree descendants of the LOCATABLE class.
			-- Archetypes opened adhoc are also grafted here.
		attribute
			create Result.make (Archetype_category)
		end

	initialise_item_tree
			-- rebuild `item_tree'
		local
			model_node: ARCH_LIB_MODEL
			namespace_node: ARCH_LIB_PACKAGE
			top_classes_list: ARRAYED_LIST [BMM_CLASS]
			bm: BMM_MODEL
			aom_profile: AOM_PROFILE
			archetype_parent_class: STRING
		do
			item_tree.wipe_out

			-- process each top-level model
			across bmm_models_access.bmm_models as models_csr loop
				bm := models_csr.item
				if aom_profiles_access.has_profile_for_rm_schema (bm.model_id) then
					aom_profile := aom_profiles_access.profile_for_rm_schema (bm.model_id)
					archetype_parent_class := aom_profile.archetype_parent_class
				else
					archetype_parent_class := any_type
				end

				-- create new top-level model node
				create model_node.make (bm)
				item_tree.put_child (model_node)

				-- create namespace node
				create namespace_node.make (bm)
				model_node.put_child (namespace_node)

				-- obtain the top-most classes from the package structure
				check attached archetype_parent_class then
					top_classes_list := bm.class_definition (archetype_parent_class).immediate_descendants
				end
				add_child_nodes (bm.model_name, top_classes_list, namespace_node)
			end

			-- write the ARCH_LIB_CLASS nodes from the tree into the index
			item_index.wipe_out
			do_all_semantic (agent (ari: attached ARCH_LIB_ITEM) do item_index.force (ari, ari.qualified_key) end, Void)
		end

	add_child_nodes (a_bmm_model_name: STRING; class_list: ARRAYED_LIST [BMM_CLASS]; a_parent_node: ARCH_LIB_MODEL_ITEM)
			-- populate child nodes of a node in library with immediate descendants of classes in `class_list'
			-- put each node into `item_index', keyed by `a_bmm_model_name' + '-' + `class_list.item.name',
			-- which will match with corresponding part of archetype identifier
		local
			class_node: ARCH_LIB_CLASS
		do
			across class_list as class_list_csr loop
				create class_node.make (a_bmm_model_name, class_list_csr.item)
				a_parent_node.put_child (class_node)
				add_child_nodes (a_bmm_model_name, class_list_csr.item.immediate_descendants, class_node)
			end
		end

	shifter: STRING
			-- debug indenter
		once
			create Result.make_empty
		end

	do_subtree (node: ARCH_LIB_ITEM; enter_action: PROCEDURE [ANY, TUPLE [ARCH_LIB_ITEM]]; exit_action: detachable PROCEDURE [ANY, TUPLE [ARCH_LIB_ITEM]])
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

	regex_matcher: RX_PCRE_REGULAR_EXPRESSION
		attribute
			create Result.make
			Result.set_case_insensitive (True)
		end

invariant
	parse_attempted_archetype_count_valid: compile_attempt_count >= 0 and compile_attempt_count <= archetype_count

end


