note
	component:   "openEHR ADL Tools"
	description: "[
				 Descriptor of an archetype in a library of archetypes. The class provides the 
				 compiler functionality on a per-artefact level. A formal compilation state machine model
				 is used here, so that any artefact is in a known state in the process.
				 
				 Some complications still exist due to the presence of ADL 1.4 'legacy' archetypes. 
				 These should be progressively removed.
				 ]"
	keywords:    "ADL, archetype"
	author:      "Thomas Beale <thomas.beale@openehr.org>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2006- The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

deferred class ARCH_LIB_ARCHETYPE

inherit
	ARCH_LIB_ITEM
		rename
			name as semantic_id
		redefine
			children
		end

	SHARED_ARCHETYPE_LIBRARIES
		export
			{NONE} all
		undefine
			is_equal
		end

	SHARED_ARCHETYPE_RM_ACCESS
		export
			{NONE} all
		undefine
			is_equal
		end

	SHARED_ARCHETYPE_FLATTENER
		export
			{NONE} all
		undefine
			is_equal
		end

	SHARED_ADL_ENGINE
		export
			{NONE} all
		undefine
			is_equal
		end

	SHARED_ARCHETYPE_SERIALISERS
		export
			{NONE} all
			{ANY} has_serialiser_format, has_archetype_native_serialiser_format, archetype_native_serialiser_formats, archetype_all_serialiser_formats, has_dt_serialiser_format
		undefine
			is_equal
		end

	SHARED_DT_OBJECT_CONVERTER
		export
			{NONE} all
		undefine
			is_equal
		end

	COMPILER_ERROR_TYPES
		export
			{NONE} all
		undefine
			is_equal
		end

	COMPILATION_STATES
		undefine
			is_equal
		end

	ANY_VALIDATOR
		rename
			reset as validator_reset
		undefine
			is_equal
		redefine
			ready_to_validate
		end

	EXCEPTIONS
		rename
			signal_exception as exc_signal_exception
		export
			{NONE} all
		undefine
			is_equal
		end

feature -- Identification

	artefact_type: IMMUTABLE_STRING_8
			-- generate a string form of the relevant typename, i.e. 'ARCHETYPE', 'TEMPLATE' etc
		do
			Result := artefact_type_from_class (bare_type_name(({like differential_archetype}).name))
		ensure
			Is_lower_case: Result.same_string (Result.as_lower) and valid_artefact_type (Result)
		end

	ref_model: BMM_MODEL
			-- set if this archetype has a valid package-class_name
		do
			Result := model_for_archetype_id (id)
		end

	id: ARCHETYPE_HRID
			-- Archetype identifier; initially set from thumbnail parsing; when successful full
			-- parse occurs, set as a reference to the id in the differential archetype

	old_id: detachable like id
			-- previous Archetype identifier, due to change by editing
		do
			Result := file_mgr.old_id
		end

	id_changed: BOOLEAN
			-- return True if id was changed by any recent action
		do
			Result := attached old_id as att_old_id and then not att_old_id.physical_id.same_string (id.physical_id)
		end

	parent_id: like id
			-- Archetype identifier of specialisation parent archtype matched in this repository that has
			-- an id matching the interface id reference (i.e. archetype id down to major version) in
			-- the 'parent_archetype_id' property of the target.
		require
			is_specialised
		do
			check attached specialisation_parent as att_sp then
				Result := att_sp.id
			end
		end

	parent_ref: detachable STRING
			-- Archetype id ref from original archetype; this won't usually include on its own the
			-- full versioning information; the matching process in ARCHETYPE_CATALOG population
			-- phase has to occur first, and then `parent_id' can be populated.

--	relative_path: STRING
--			-- a path derived from the semantic path of the nearest folder node + archetype_id
--		local
--			csr: detachable ARCH_LIB_ITEM
--		do
--			create Result.make(0)
--			from csr := parent until attached {ARCH_LIB_MODEL_ITEM} csr or csr = Void loop
--				csr := csr.parent
--			end
--			if attached {ARCH_LIB_MODEL_ITEM} csr as acmn then
--				Result := acmn.path + Semantic_path_separator + id.physical_id
--			end
--		end

	qualified_name: IMMUTABLE_STRING_8
		do
			Result := id.physical_id
		end

	semantic_parent_key: STRING
			-- semantic key to find parent node in semantic id tree
			-- For top-level archetypes e.g. openEHR-EHR-OBSERVATION.thing.v1,
			-- it will be the name of the folder, e.g. openEHR-EHR-OBSERVATION
			-- for specialised archetypes, e.g. openEHR-EHR-OBSERVATION.specialised_thing.v1.2.4,
			-- it will be an id ref like openEHR-EHR-OBSERVATION.thing.v1
		require
			is_specialised implies attached parent_ref
		do
			if is_specialised then
				check attached parent_ref as att_pref then
					Result := att_pref
				end
			else
				Result := id.qualified_rm_class
			end
		end

	semantic_parent_id: STRING
			-- semantic id of parent node in semantic id tree
			-- For top-level archetypes e.g. openEHR-EHR-OBSERVATION.thing.v1,
			-- it will be the name of the folder, e.g. openEHR-EHR-OBSERVATION
			-- for specialised archetypes, e.g. openEHR-EHR-OBSERVATION.specialised_thing.v1.2.4,
			-- it will be a resolved id like openEHR-EHR-OBSERVATION.thing.v1.0.4
		do
			if is_specialised then
				check attached specialisation_parent as att_spec_anc then
					Result := att_spec_anc.id.as_string
				end
			else
				Result := id.qualified_rm_class
			end
		end

	semantic_id: STRING
			-- namespace + domain concept part of archetype id; if there are any '-' characters due to ADL 1.4 style ids,
			-- return only the final section
		do
			Result := id.display_semantic_id
		end

	global_artefact_identifier: STRING
			-- tool-wide unique id for this artefact
		do
			Result := qualified_name
		end

	semantic_parent_changed: BOOLEAN
			-- True if changed due to external editing require a move of this archetype in ontology
			-- cleared by calling `clear_old_semantic_parent_name'
		do
			Result := attached old_semantic_parent_name
		end

	group_name: STRING
			-- Name distinguishing the type of item and the group to which its `repository' belongs.
			-- Useful as a logical key to pixmap icons, etc.
			-- Typical examples: 'archetype_valid_2'
		do
			create Result.make_empty
			Result.append (artefact_type)

			inspect compilation_state
			when cs_validated then
				if not errors.has_warnings then
					Result.append("_valid")
				else
					Result.append("_warning")
				end
			when Cs_validate_failed, cs_suppliers_invalid then
				Result.append("_parsed")
			when Cs_parse_failed, cs_convert_legacy_failed, cs_lineage_invalid then
				Result.append("_parse_failed")
			else
				-- nothing needed
			end

			if is_adhoc then
				Result.append("_adhoc")
			end
		end

	source_id: STRING
			-- a reliable identifier for the source
		do
			Result := file_mgr.source_id
		end

feature {ARCHETYPE_LIBRARY} -- Identification

	clear_old_semantic_parent_name
		do
			old_semantic_parent_name := Void
		end

feature {NONE} -- Identification

	old_semantic_parent_name: detachable STRING
			-- old vaue of `semantic_parent_name', to facilitate handling changes due to external editing of archetypes

feature -- Relationships

	suppliers_index: HASH_TABLE [ARCH_LIB_ARCHETYPE, STRING]
			-- list of descriptors of slot fillers or other external references, keyed by archetype id
			-- currently generated only from C_ARCHETYPE_ROOT index in differential archetype
		attribute
			create Result.make (0)
		end

	clients_index: detachable ARRAYED_LIST [STRING]
			-- list of ids of archetypes that reference this archetype

	slot_owners_index: detachable ARRAYED_LIST [STRING]
			-- list of ids of archetypes that have slots that could be filled by this archetype

	slot_fillers_index: HASH_TABLE [ARRAYED_SET[STRING], STRING]
			-- list of Archetype ids matching slot definitions of `differential_archetype', keyed by slot path
			-- Current slot logic of include/exclude lists:
			-- 	IF includes not empty and /= 'any' THEN
			-- 		IF not excludes empty THEN -- excludes must = any; means not a recommendation
			--			create match list = includes constraint
			--		ELSE -- it is just a recommendation;formally it means match all
			--			create match list = all archetypes of compatible RM type
			--		END
			--	ELSEIF excludes not empty and /= 'any' THEN
			-- 		IF not includes empty THEN -- includes must = any; means not a recommendation
			--			create match list = all achetypes - excludes constraint matchlist
			--		ELSE -- just a recommendation; formally it means match all
			--			create match list = all archetypes of compatible RM type
			--		END
			--  ELSE
			--		create match list = all archetypes of compatible RM type
			--	END
		require
			compilation_state >= Cs_validated_phase_1
		local
			diff_arch: ARCHETYPE
		do
			if attached slot_id_index_cache as att_cache then
				Result := att_cache
			else
				check attached differential_archetype as da then
					diff_arch := da
				end
				Result := compute_slot_id_index (diff_arch)

				slot_id_index_cache := Result
			end
		end

	flat_slot_fillers_index: HASH_TABLE [ARRAYED_SET[STRING], STRING]
			-- same as `slot_fillers_index' but for flat form
		require
			compilation_state >= Cs_validated_phase_1
		do
			if attached flat_slot_id_index_cache as att_cache then
				Result := att_cache
			else
				Result := compute_slot_id_index (flat_archetype)
				flat_slot_id_index_cache := Result
			end
		end

	specialisation_parent: detachable ARCH_LIB_ARCHETYPE
		do
			if attached {ARCH_LIB_ARCHETYPE} parent as ala then
				Result := ala
			end
		end

	has_ancestor_descriptor (an_anc: ARCH_LIB_ARCHETYPE): BOOLEAN
			-- True if this archetype has `an_anc' as an ancestor
		do
			Result := attached specialisation_parent as att_ala and then (att_ala = an_anc or else
				att_ala.has_ancestor_descriptor (an_anc))
		end

	has_ancestor (an_arch_id: STRING): BOOLEAN
			-- True if this archetype has `an_arch_id' among its an ancestors
		do
			Result := attached specialisation_parent as att_ala and then (att_ala.id.physical_id.is_equal (an_arch_id) or else
				att_ala.has_ancestor (an_arch_id))
		end

	is_specialised: BOOLEAN
			-- True if this archetype is a specialisation of another archetype
		do
			Result := attached parent_ref
		end

	differential_has_slots: BOOLEAN
			-- Does this archetype have any slots?
		do
			Result := compilation_state >= Cs_validated_phase_1 and then -- slot_fillers_index.is_empty
						not safe_differential_archetype.slot_index.is_empty
		end

	is_supplier: BOOLEAN
			-- Is this archetype used by any other archetypes (i.e. matches any of their slots)?
		do
			Result := attached slot_owners_index
		end

	has_artefacts: BOOLEAN = True
			-- True if there are any archetypes at or below this point

	has_flat_supplier (an_arch_id: STRING): BOOLEAN
			-- True if this archetype or any ancestor has `an_arch_id' in its suppliers list
		do
			Result := suppliers_index.has (an_arch_id) or else attached specialisation_parent as att_anc and then att_anc.has_flat_supplier (an_arch_id)
		end

feature {ARCH_LIB_ARCHETYPE} -- Relationships

	add_slot_owner (an_archetype_id: STRING)
			-- add the id of an archetype that has a slot that matches this archetype, i.e. that 'uses' this archetype
		do
			if not attached slot_owners_index then
				create slot_owners_index.make (0)
				slot_owners_index.compare_objects
			end
			slot_owners_index.extend (an_archetype_id)
		end

	add_client (an_archetype_id: STRING)
			-- add the id of an archetype that references this archetype
		do
			if not attached clients_index then
				create clients_index.make (0)
				clients_index.compare_objects
			end
			clients_index.extend (an_archetype_id)
		end

feature -- Artefacts

	source_text: STRING
			-- Read `differential_text_converted' and `text_timestamp' from `source_file_path', returning
			-- the text of the archetype source file, i.e. the differential form.
		do
			Result := file_mgr.source_text
		end

	differential_archetype: detachable ARCHETYPE
			-- archetype representing differential structure with respect to parent archetype;
			-- if this is a non-specialised archetype, then it is the same as the flat form, else
			-- it is just the differences (like an object-oriented source file for a subclass)

	safe_differential_archetype: attached like differential_archetype
			-- attached form of `differential_archetype' after parsing
		do
			check attached differential_archetype as da then
				Result := da
			end
		end

	display_language: STRING
			-- generate a valid language to display this archetype in, either the current_language
			-- or the primary language of this archetype, if it doesn't support the current language
		do
			if is_valid then
				if safe_differential_archetype.has_language (archetype_view_language) then
					Result := archetype_view_language
				else
					Result := safe_differential_archetype.original_language.code_string
				end
			else
				Result := archetype_view_language
			end
		end

	differential_serialised_native: STRING
			-- serialise differential archetype to its file in its source form, even if not compiling
			-- this might fail because the serialiser might try to do something that an invalid archetype
			-- can't support
		local
			exception_occurred: BOOLEAN
		do
			create Result.make_empty
			if not exception_occurred then
				if attached differential_archetype as da then
					Result := adl_2_engine.serialise_native (da, Syntax_type_adl, current_archetype_language)
				end
			end
		rescue
			exception_occurred := True
		end

	flat_archetype: AUTHORED_ARCHETYPE
			-- inheritance-flattened form of archetype
		require
			compilation_state >= Cs_validated_phase_2
		do
			if flat_archetype_cache = Void then
				flatten
			end
			check attached flat_archetype_cache as fac then
				Result := fac
			end
		ensure
			Result.is_flat
		end

	flat_archetype_with_rm: like flat_archetype
			-- overlay RM multiplicities on flat form.
		require
			compilation_state >= Cs_validated_phase_2
		do
			Result := flat_archetype.deep_twin

			-- if requested, do RM flattening		
			if rm_flattening_on then
				rm_flattener.execute (Result, ref_model)
			end
		end

	flat_serialised_native (include_rm: BOOLEAN): STRING
			-- The serialised text of the flat form of the archetype
		require
			compilation_state >= Cs_validated_phase_2
		do
			if include_rm then
				Result := adl_2_engine.serialise_native (flat_archetype_with_rm, Syntax_type_adl, current_archetype_language)
			else
				Result := adl_2_engine.serialise_native (flat_archetype, Syntax_type_adl, current_archetype_language)
			end
		end

feature -- Compilation

	compilation_state: INTEGER
			-- current compilation state, obeying the state machine described above

	status: STRING
			-- status of last operation

	last_compile_attempt_timestamp: DATE_TIME
			-- time last compile attempt made, set by set_parse_attempted
		attribute
			Result := Time_epoch
		end

	last_modify_timestamp: DATE_TIME
			-- Modification timestamp of `differential_archetype' due to editing

	compiler_error_type: INTEGER
			-- generate value from COMPILER_ERROR_TYPES as index for error classification elsewhere
		do
			inspect compilation_state
			when cs_validated then
				if errors.is_empty then
					Result := Err_type_valid
				else
					Result := Err_type_warning
				end
			when Cs_validate_failed, cs_suppliers_invalid then
				Result := Err_type_validity_error
			when Cs_parse_failed, cs_convert_legacy_failed, cs_lineage_invalid then
				Result := Err_type_parse_error
			else
				-- unknown
			end
		ensure
			valid: valid_err_type (Result)
		end

	ready_to_validate: BOOLEAN
		do
			Result := compilation_state = Cs_ready_to_validate
		end

	compile_attempted: BOOLEAN
			-- has a compile been attempted in this session?
		do
			Result := last_compile_attempt_timestamp /= Time_epoch
		end

	is_valid: BOOLEAN
			-- True if archetype object created and 'is_valid' True. This can be used to check if the archetype has
			-- actually been compiled and is available in memory. This is useful for specialised archetypes because
			-- you want to know if the parent has been compiled (up the lineage) before you can compile the current one
		do
			Result := compilation_state = cs_validated
		end

	is_valid_differential: BOOLEAN
			-- True if at least we got to the state of the differential being created / available
		do
			Result := compilation_state >= Cs_validated_phase_2
		end

	is_out_of_date: BOOLEAN
			-- It this archetype out of date with respect to parents or suppliers?
		do
			-- see if parents were recompiled more recently
			Result := is_specialised and then specialisation_parent.last_compile_attempt_timestamp > last_compile_attempt_timestamp

			-- see if any supplier was recompiled more recently
			if not Result then
				Result := across suppliers_index as supp_idx_csr some supp_idx_csr.item.last_compile_attempt_timestamp > last_compile_attempt_timestamp end
			end
		end

	is_in_terminal_compilation_state: BOOLEAN
		do
			Result := Cs_terminal_states.has (compilation_state)
		end

	compile
			-- perform as many steps of the compilation process as possible; may be called repeatedly by ARCHETYPE_COMPILER as it
			-- does initial parsing here, finds dependencies, compiles them, comes back here, etc etc
			-- For the moment just a simplistic implementation; we might do a proper generic state machine one later
		local
			exception_encountered: BOOLEAN
		do
			compile_finished := False
			if not exception_encountered then
				from until compile_finished loop
					if attached compile_actions.item (compilation_state) as comp_action then
						comp_action.call ([Current])
					else
						compile_finished := True
					end
				end
			else
				signal_exception
				if attached meaning (exception) as att_meaning and attached exception_trace as att_exc_trace then
					add_error ({ADL_MESSAGES_IDS}.ec_compile_exception, <<id.physical_id, att_meaning, att_exc_trace>>)
				end
			end
			set_compile_attempt_timestamp
		rescue
			if not compile_trying_rescue then
				compile_rescue
				if not compile_trying_rescue then
					exception_encountered := True
				end
			else
				exception_encountered := True
			end
			retry
		end

	check_compilation_currency
			-- if archetype has gone out of date due to parents or suppliers being recompiled more recently,
			-- set state accordingly
		do
			if is_out_of_date then
				compilation_state := Cs_unread
				initialise
			end
		end

	signal_from_scratch
			-- signal rebuild from scratch; this rebuilds from existing differential
		do
			differential_archetype := Void
			clear_cache
			last_compile_attempt_timestamp := Time_epoch
			compilation_state := Cs_unread
			reset
		ensure
			Differential_archetype_cleared: differential_archetype = Void
			Compiler_state_set: compilation_state = Cs_unread
			Compile_time_reset: last_compile_attempt_timestamp = Time_epoch
		end

	signal_source_edited
			-- signal source file changed on disk
		local
			old_sem_parent: STRING
		do
			old_sem_parent := semantic_parent_key
			file_mgr.refresh_from_source

			-- see if ontological parent has changed
			if not old_sem_parent.is_equal (semantic_parent_key) then
				old_semantic_parent_name := old_sem_parent
			end
			signal_from_scratch
		ensure
			Compiler_state_set: compilation_state = Cs_unread
		end

	signal_suppliers_compiled
			-- Advance compilation state:
			-- All suppliers valid: --> Cs_validated_closure
			-- Any supplier failed: --> Cs_suppliers_invalid
		require
			compilation_state = Cs_validated_self
		do
			from suppliers_index.start until suppliers_index.off or suppliers_index.item_for_iteration.compilation_state < Cs_validated_self loop
				suppliers_index.forth
			end
			if suppliers_index.off then
				compilation_state := Cs_validated_closure
			else
				compilation_state := cs_suppliers_invalid
				add_error ({ADL_MESSAGES_IDS}.ec_compile_e2, <<suppliers_index.item_for_iteration.id.physical_id>>)
				merge_errors_from_other (suppliers_index.item_for_iteration.errors, suppliers_index.item_for_iteration.id.physical_id)
			end
		ensure
			Compilation_state_set: (<<Cs_validated_closure, Cs_suppliers_invalid>>).has (compilation_state)
		end

	signal_exception
			-- signal exception caught by compiler during call to some routine here;
			-- set archetype to invalid state.
		do
			compilation_state := cs_invalid
			differential_archetype := Void
			clear_cache
		ensure
			Compilation_state_set: compilation_state = Cs_invalid
		end

feature {ARCH_LIB_ARCHETYPE} -- Compilation

	compile_actions: HASH_TABLE [PROCEDURE [ARCH_LIB_ARCHETYPE, TUPLE], INTEGER]
			-- table of compilation actions, keyed by compiler state at which each action can be executed.
		deferred
		end

	create_compile_actions: HASH_TABLE [PROCEDURE [ARCH_LIB_ARCHETYPE, TUPLE], INTEGER]
		do
			create Result.make (0)

			------------ first phase up till validated flat ----------
			Result.put (agent {ARCH_LIB_ARCHETYPE}.initialise,           Cs_unread)
			Result.put (agent {ARCH_LIB_ARCHETYPE}.evaluate_lineage,     Cs_lineage_known)
			Result.put (agent {ARCH_LIB_ARCHETYPE}.evaluate_suppliers,   Cs_parsed)
			Result.put (agent {ARCH_LIB_ARCHETYPE}.parse,                Cs_ready_to_parse)
			Result.put (agent {ARCH_LIB_ARCHETYPE}.validate,             Cs_ready_to_validate)
			Result.put (agent {ARCH_LIB_ARCHETYPE}.validate_flat,        Cs_validated_phase_2)
			Result.put (agent {ARCH_LIB_ARCHETYPE}.end_compile_phase,    Cs_validated_self)

			------------ wait for signal_suppliers_compiler to be called ---------

			------------ second phase to completion ----------
			Result.put (agent {ARCH_LIB_ARCHETYPE}.validate_closure,     Cs_validated_closure)
			Result.put (agent {ARCH_LIB_ARCHETYPE}.end_compile_phase,    Cs_validated)
		end

	initialise
			-- set compilation state at creation, or if editing occurs
		require
			compilation_state = Cs_unread
		do
			reset
			if has_source then
				if is_specialised then
					compilation_state := Cs_lineage_known
				else
					compilation_state := Cs_ready_to_parse
				end
			-- newly created in memory
			elseif attached differential_archetype then
				compilation_state := cs_validated
			end
		ensure
			compilation_state_set: Cs_initial_states.has (compilation_state)
		end

	evaluate_lineage
			-- Set compilation_state according to inheritance lineage:
			-- parent valid: Cs_lineage_known --> Cs_ready_to_parse
			-- otherwise: Cs_lineage_known --> Cs_lineage_invalid
		require
			Initial_state: compilation_state = Cs_lineage_known
			Is_specialised: is_specialised
		do
			if specialisation_parent.is_valid then
				compilation_state := Cs_ready_to_parse
			else
				compilation_state := Cs_lineage_invalid
				add_error ({ADL_MESSAGES_IDS}.ec_compile_e1, <<parent_id.physical_id>>)
			end
		end

	evaluate_suppliers
			-- Comilation state changes:
			-- has suppliers: Cs_parsed --> Cs_suppliers_known
			-- no suppliers: Cs_parsed --> Cs_ready_to_validate
		require
			Initial_state: compilation_state = Cs_parsed
		local
			diff_arch: ARCHETYPE
		do
			check attached differential_archetype as da then
				diff_arch := da
			end

			-- determine the suppliers list for ongoing compilation; exclude the current archetype to avoid
			-- an infinite recursion
			suppliers_index.wipe_out
			across diff_arch.suppliers_index as supp_idx_csr loop
				if attached current_library.archetype_matching_ref (supp_idx_csr.key) as supp_arch and then
					not supp_arch.id.physical_id.is_case_insensitive_equal (id.physical_id)
				then
					suppliers_index.put (supp_arch, supp_arch.id.physical_id)
					supp_arch.add_client (id.physical_id)
				end
			end

			compilation_state := Cs_ready_to_validate

			-- the following check determines if any of the current archetype's suppliers has the current
			-- archetype as an ancestor
			if not suppliers_index.is_empty then
				across suppliers_index as supp_idx_csr loop
					if supp_idx_csr.item.has_ancestor_descriptor (Current) then
						compilation_state := Cs_supplier_loop
						add_error ({ADL_MESSAGES_IDS}.ec_VINH, <<supp_idx_csr.item.id.physical_id>>)
					end
				end
			end
		ensure
			Compilation_state: (<<Cs_supplier_loop, Cs_ready_to_validate>>).has (compilation_state)
		end

	parse
			-- Parse archetype, in differential form
			-- Comilation state changes:
			-- 	parse succeeded: Cs_ready_to_parse --> Cs_parsed
			-- 	parse failed: Cs_ready_to_parse --> Cs_parse_failed
		require
			Initial_state: compilation_state = Cs_ready_to_parse
			has_source: has_source
		do
			add_info ({ADL_MESSAGES_IDS}.ec_parse_i2, Void)
			clear_cache
		 	compilation_state := Cs_parsed
			if attached {like differential_archetype} adl_2_engine.parse (source_text, Current) as diff_arch then
				differential_archetype := diff_arch

				-- determine what language to view archetype in
				if archetype_view_language.is_empty or not diff_arch.has_language (archetype_view_language) then
					set_archetype_view_language (diff_arch.original_language.code_string)
				end

				if is_specialised and then attached diff_arch.parent_archetype_id as da_parent_ref and then not parent_id.physical_id.starts_with (da_parent_ref) then
					add_warning ({ADL_MESSAGES_IDS}.ec_parse_w1, <<id.physical_id, parent_id.physical_id, da_parent_ref>>)
				else
					add_info ({ADL_MESSAGES_IDS}.ec_parse_i1, <<id.physical_id>>)
				end

				-- perform version upgrading if applicable
				post_parse_151_convert (diff_arch)

				-- perform post-parse object structure finalisation
				adl_2_engine.post_parse_process (diff_arch, Current)
			else
				compilation_state := Cs_parse_failed
			end

			-- pick up all errors & warnings
			merge_errors (adl_2_engine.errors)
			status.prepend (errors.as_string_filtered (True, True, False))
		ensure
			Compilation_state: compilation_state = Cs_parsed or compilation_state = Cs_parse_failed
			Archetype_state: compilation_state = Cs_parsed implies attached differential_archetype
		end

	post_parse_151_convert (an_archetype: attached like differential_archetype)
		require
			Initial_state: compilation_state = Cs_parsed
		do
		end

	validate
			-- Perform validation on `differential_archetype'.
			-- Compilation state change:
			--	validated succeeded: Cs_ready_to_validate --> Cs_validated_phase_2
			--	validate failed: Cs_ready_to_validate --> Cs_validate_failed
		local
			diff_arch: ARCHETYPE
		do
			check attached differential_archetype as da then
				diff_arch := da
			end

			if not id.physical_id.is_equal (diff_arch.archetype_id.physical_id) then
				-- this is a serious error, because it means that the archteype and its descriptor are
				-- out of sync, due to some uncontrolled modification on the archetype
				add_error ({ADL_MESSAGES_IDS}.ec_validate_e3, <<id.physical_id, diff_arch.archetype_id.physical_id>>)
				compilation_state := Cs_validate_failed
			else
				-- phase 1: validate archetype stand-alone
				adl_2_engine.phase_1_validate (Current)
				merge_errors (adl_2_engine.errors)

				if adl_2_engine.validation_passed then
					compilation_state := Cs_validated_phase_1

		 			-- phase 2: validate archetype against flat parent
					adl_2_engine.phase_2_validate (Current)
					merge_errors (adl_2_engine.errors)

					if adl_2_engine.validation_passed then
						compilation_state := Cs_validated_phase_2
						diff_arch.set_is_valid
					else
						compilation_state := Cs_validate_failed
					end
				else
					compilation_state := Cs_validate_failed
				end
			end
			status.prepend (errors.as_string_filtered (True, True, False))
		ensure then
			Compilation_state: (<<Cs_validated_phase_1, Cs_validated_phase_2, Cs_validate_failed>>).has (compilation_state)
			Failure_implies_errors: compilation_state = Cs_validate_failed implies errors.has_errors
		end

	validate_flat
			-- Perform validation on `flat_archetype'.
			-- Compilation state change:
			--	validated succeeded: Cs_validated_phase_2 --> Cs_validated_self
			--	validate failed: Cs_validated_phase_2 --> Cs_validate_failed
		require
			compilation_state = Cs_validated_phase_2
		do
			-- phase 3: validate flattened archetype
			adl_2_engine.phase_3_validate (Current)
			merge_errors (adl_2_engine.errors)
			if adl_2_engine.validation_passed then
				add_info ({ADL_MESSAGES_IDS}.ec_parse_archetype_i2, <<id.physical_id>>)
				compilation_state := Cs_validated_self
			else
				compilation_state := Cs_validate_failed
			end
			status.prepend (errors.as_string_filtered (True, True, False))
		ensure
			Compilation_state: (<<Cs_validated_self, Cs_validate_failed>>).has (compilation_state)
			Failure_implies_errors: compilation_state = Cs_validate_failed implies errors.has_errors
		end

	validate_closure
			-- Perform validation on `flat_archetype' with closure
			-- Compilation state change:
			--	validated succeeded: Cs_validated_closure --> Cs_validated
			--	validate failed: Cs_validated_closure --> Cs_validate_failed
		require
			compilation_state = Cs_validated_closure
		do
			compilation_state := Cs_validated
		ensure
			Compilation_state: (<<Cs_validated, Cs_validate_failed>>).has (compilation_state)
			Failure_implies_errors: compilation_state = Cs_validate_failed implies errors.has_errors
		end

	end_compile_phase
			-- call this when a phase of compilation is completed, usually when some
			-- other external action has to be done, before the next phase can be entered
		do
			compile_finished := True
		end

feature {NONE} -- Compilation

	compile_rescue
		do
		end

	compile_finished: BOOLEAN

	compile_trying_rescue: BOOLEAN

	reset
			-- reset after exception encountered
		do
			status.wipe_out
			validator_reset
		ensure
			Status_cleared: status.is_empty
		end

	set_compile_attempt_timestamp
			-- Set `compile_attempt_timestamp'
		do
			create last_compile_attempt_timestamp.make_now
		end

feature -- Conversion

	extract_differential: ARCHETYPE
			-- generate differential from compiled flat; if is_specialised, then
			-- result will be path-compressed differential form archetype
		require
			is_valid
		local
			archetype_comparator: ARCHETYPE_COMPARATOR
		do
			if is_specialised then
				check attached specialisation_parent as parent_aca then
					create archetype_comparator.make_create_differential (parent_aca.flat_archetype, flat_archetype)
				end
				check attached archetype_comparator.differential_output as da then
					Result := da
				end
			else
				Result := flat_archetype
				Result.set_generated_differential
			end
		ensure
			Result.is_differential
		end

feature -- Visualisation

	select_archetype (differential_view, editing_enabled: BOOLEAN): ARCHETYPE
			-- return appropriate differential or flat version of archetype, depending on setting of `differential_view' and `editing_enabled'
		require
			is_valid
		do
			if not editing_enabled then
				if differential_view then
					Result := safe_differential_archetype
				else
					Result := flat_archetype
				end
			else
				Result := flat_archetype_editable
			end
		end

	select_native_serialised_archetype (differential_view, with_rm: BOOLEAN): STRING
			-- return appropriate differential or flat version of archetype, depending on setting of `differential_view' and `with_rm'
		require
			is_valid
		do
			if differential_view then
				Result := differential_serialised_native
			else
				Result := flat_serialised_native (with_rm)
			end
		end

feature -- File Access

	file_mgr: ARCH_PERSISTENCE_MGR

	is_adhoc: BOOLEAN
			-- True if this is an adhoc archetype
		do
			Result := file_mgr.is_adhoc
		end

	has_source: BOOLEAN
		do
			Result := file_mgr.has_source
		end

feature -- Output

	serialise_object (flat_flag: BOOLEAN; type_marking_flag: BOOLEAN; a_format: STRING): STRING
			-- serialise internal structure in a brute-force object way, using
			-- format like ODIN, XML, JSON etc
		require
			Archetype_valid: is_valid
			Format_valid: has_dt_serialiser_format (a_format)
		local
			dt_arch: DT_CONVERTIBLE
		do
			dt_arch := flat_for_serialisation (flat_flag)

			dt_object_converter.set_false_booleans_off_option
			archetype_serialise_engine.set_tree (dt_arch.dt_representation)
			archetype_serialise_engine.serialise (a_format, type_marking_flag, True)
			Result := archetype_serialise_engine.serialised
		end

	serialise_object_ejson (flat_flag: BOOLEAN; type_marking_flag: BOOLEAN; a_format: STRING): STRING
			-- serialise internal structure in a brute-force object way, using
			-- format like ODIN, XML, JSON etc
		require
			Archetype_valid: is_valid
			Format_valid: has_dt_serialiser_format (a_format)
		local
			dt_arch: DT_CONVERTIBLE
			fac: JSON_SERIALIZATION_FACTORY
			conv: JSON_SERIALIZATION
		do
			dt_arch := flat_for_serialisation (flat_flag)

			conv := fac.smart_serialization
			conv.set_pretty_printing

			if attached conv.to_json_string (dt_arch) as s then
				Result := s
			else
				Result := "Conversion failed"
			end
		end

	generate_instance (a_format: STRING): STRING
			-- The serialised text of the flat form of the archetype
		require
			Archetype_valid: is_valid
			Format_valid: has_dt_serialiser_format (a_format)
		local
			dt_arch: DT_COMPLEX_OBJECT
		do
			dt_arch := adl_2_engine.generate_instance (select_archetype (False, False), current_archetype_language)
			archetype_serialise_engine.set_tree (dt_arch)
			archetype_serialise_engine.serialise (a_format, True, True)
			Result := archetype_serialise_engine.serialised
		end

feature {NONE}-- Output

	persistent_compact_type: P_ARCHETYPE
		do
			create Result.make_dt (Void)
		end

	flat_for_serialisation (flat_flag: BOOLEAN): P_ARCHETYPE
		do
			if flat_flag then
				create Result.make (flat_archetype)
			else
				create Result.make (safe_differential_archetype)
			end
		end

feature -- Statistics

	generate_statistics (in_differential_mode: BOOLEAN)
			-- generate statistics in differential or flat mode
		require
			is_valid
		local
			tgt_arch: ARCHETYPE
		do
			if in_differential_mode then
				tgt_arch := safe_differential_archetype
			else
				tgt_arch := flat_archetype
			end

			if attached specialisation_parent as att_sp then
				create statistical_analyser.make_specialised (tgt_arch, att_sp.flat_archetype, ref_model)
			else
				create statistical_analyser.make (tgt_arch, ref_model)
			end
			statistical_analyser.analyse
		end

	statistical_analyser: detachable ARCHETYPE_STATISTICAL_ANALYSER

feature -- Editing

	flat_archetype_editable: like flat_archetype
			-- produce a clone of the current `flat_archetype'
		do
			if attached flat_archetype_editable_cache as facc then
				Result := facc
			else
				Result := flat_archetype.deep_twin
				flat_archetype_editable_cache := Result
			end
		ensure
			Result.is_flat
		end

	editor_state: ALA_EDITOR_STATE
		do
			if attached editor_state_cache as att_esc then
				Result := att_esc
			else
				create Result.make (Current)
				editor_state_cache := Result
			end
		end

	commit
			-- commit modified flat clone to archetype as new differential
		deferred
		end

feature {NONE} -- Editing

	flat_archetype_editable_cache: detachable like flat_archetype

	editor_state_cache: detachable ALA_EDITOR_STATE

	clear_cache
		do
			flat_archetype_cache := Void
			flat_archetype_editable_cache := Void
			slot_id_index_cache := Void
			flat_slot_id_index_cache := Void
			if attached editor_state_cache as att_esc then
				att_esc.on_commit
			end
			editor_state_cache := Void
		end

feature {ARCH_LIB_ITEM, ARCHETYPE_LIBRARY} -- Implementation

	children: detachable FAST_SORTED_TWO_WAY_LIST [ARCH_LIB_ARCHETYPE]
			-- list of child nodes

feature {NONE} -- Flattening

	flatten
			-- (re)generate flat-form of this archetype
		require
			compilation_state >= Cs_validated_phase_2
		local
			flattened_arch: like flat_archetype
		do
			-- archetype flattening step
			if attached specialisation_parent as spec_anc then
				arch_flattener.execute (spec_anc.flat_archetype, safe_differential_archetype, ref_model)
				check attached {like flat_archetype} arch_flattener.arch_flat_out as att_flat then
					flattened_arch := att_flat
				end
			else
				check attached {like flat_archetype} safe_differential_archetype as auth_diff_arch then
					flattened_arch := auth_diff_arch.deep_twin
				end
				flattened_arch.set_generated_flat
				flattened_arch.set_is_valid
			end

			flat_archetype_cache := flattened_arch
		ensure
			Flat_archetype_cache_attached: attached flat_archetype_cache
			Flat_is_flat: flat_archetype.is_flat
			Flat_is_generated: flat_archetype.is_generated
			Flat_is_valid: flat_archetype.is_valid
		end

	flat_archetype_cache: detachable like flat_archetype
			-- archetype generated by flattening process

feature {NONE} -- Implementation

	current_archetype_language: STRING
			-- find a language from the current archetype that matches `archetype_view_language' either directly
			-- (e.g. "en" matches "en") or on a language group basis (e.g. "en-GB" matches "en"); if
			-- none found, return archetype original language
		require
			attached differential_archetype
		do
			if safe_differential_archetype.has_language (archetype_view_language) then
				Result := archetype_view_language
			elseif safe_differential_archetype.has_matching_language_tag (archetype_view_language) then
				Result := safe_differential_archetype.matching_language_tag (archetype_view_language)
			else
				Result := safe_differential_archetype.original_language.code_string
			end
		end

	archetype_serialise_engine: ODIN_ENGINE
		once
			create Result.make
		end

	compute_slot_id_index (an_archetype: ARCHETYPE): like slot_fillers_index
			-- generate a table of slot fillers and if `an_archteype' is the differential,
			-- add to `slot_owners_index' of filler archetype descriptors
		require
			compilation_state >= Cs_validated_phase_1
		local
			ala: ARCH_LIB_ARCHETYPE
			slot_filler_ids: ARRAYED_SET [STRING]
		do
			create Result.make (0)
			across an_archetype.slot_index as slots_csr loop
				slot_filler_ids := current_library.slot_fillers (slots_csr.item, id)

				if attached Result.item (slots_csr.item.path) as att_set then
					att_set.merge (slot_filler_ids)
				else
					Result.force (slot_filler_ids, slots_csr.item.path)
				end

				-- if it's the differential, post the results in the reverse indexes
				if an_archetype.is_differential then
					across slot_filler_ids as filler_ids_csr loop
						ala := current_library.archetype_with_id (filler_ids_csr.item)
						if not attached ala.slot_owners_index as att_soi or else not att_soi.has (id.physical_id) then
							ala.add_slot_owner (id.physical_id)
						end
					end
				end
			end
		end

	slot_id_index_cache: detachable HASH_TABLE [ARRAYED_SET[STRING], STRING]

	flat_slot_id_index_cache: detachable HASH_TABLE [ARRAYED_SET[STRING], STRING]

invariant
	compilation_state_valid: valid_compilation_state (compilation_state)

	Differential_archetype_is_differential: attached differential_archetype as da implies da.is_differential
	differential_archetype_attached_if_valid: is_valid implies attached differential_archetype
	Flat_archetype_attached_if_valid: is_valid implies attached flat_archetype
	Flat_archetype_cache_is_flat: attached flat_archetype_cache as fac implies fac.is_flat

	parent_existence: attached specialisation_parent implies is_specialised
	clients_index_valid: attached slot_owners_index as soi implies not soi.is_empty

end



