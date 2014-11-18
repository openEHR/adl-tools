note
	component:   "openEHR ADL Tools"
	description: "[
				 Descriptor of an archetype in a catalogue of archetypes. The class provides the 
				 compiler functionality on a per-artefact level. A formal compilation state machine model
				 is used here, so that any artefact is in a known state in the process.
				 
				 Some complications still exist due to the presence of a) ADL 1.4 'legacy' archetypes and
				 b) ADL 1.5 archetypes not yet converted to modern ADL 1.5.1 format. These should be 
				 progressively removed.
				 ]"
	keywords:    "ADL, archetype"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2006- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class ARCH_LIB_ARCHETYPE_ITEM

inherit
	ARCH_LIB_ITEM
		rename
			name as semantic_id
		redefine
			children
		end

	SHARED_ARCHETYPE_LIBRARIES
		undefine
			is_equal
		end

	SHARED_ARCHETYPE_RM_ACCESS
		export
			{NONE} all
		undefine
			is_equal
		end

	SHARED_ADL_APP_RESOURCES
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

create {APP_OBJECT_FACTORY}
	make, make_new_archetype, make_new_specialised_archetype, make_new_template

feature {NONE} -- Initialisation

	make (a_path: STRING; a_repository: ARCHETYPE_LIBRARY_SOURCE; arch_thumbnail: ARCHETYPE_THUMBNAIL)
			-- Create for the archetype described by `arch_thumbnail', stored at `a_full_path', belonging to `a_repository'.
		require
			Path_valid: not a_path.is_empty
			Valid_id: has_rm_schema_for_archetype_id (arch_thumbnail.archetype_id)
		do
			create status.make_empty
			create last_modify_timestamp.make_from_epoch (0)

			-- basic state
			id := arch_thumbnail.archetype_id
			if arch_thumbnail.is_specialised then
				parent_ref := arch_thumbnail.parent_archetype_id
			end
			create artefact_type.make (arch_thumbnail.artefact_type)
			compilation_state := Cs_unread

			-- create file workflow state
			if arch_thumbnail.is_legacy then
				create file_mgr.make_legacy (arch_thumbnail, a_path, a_repository)
			else
				create file_mgr.make (arch_thumbnail, a_path, a_repository)
			end
		ensure
			id_set: id = arch_thumbnail.archetype_id
			parent_id_set: arch_thumbnail.is_specialised implies parent_ref = arch_thumbnail.parent_archetype_id
			Compilation_state: compilation_state = Cs_unread
		end

	make_new_archetype (an_id: ARCHETYPE_HRID; a_repository: ARCHETYPE_LIBRARY_SOURCE; a_directory: STRING)
			-- Create a new archetype with `an_id', belonging to `a_repository'.
		require
			Valid_directory: file_system.directory_exists (a_directory)
			Valid_id: has_rm_schema_for_archetype_id (an_id)
		local
			a_diff_arch: DIFFERENTIAL_ARCHETYPE
		do
			make_new_any (an_id, create {ARTEFACT_TYPE}.make_archetype)
			create file_mgr.make_new_archetype (an_id, a_repository, a_directory)

			create a_diff_arch.make_minimal (artefact_type, an_id, locale_language_short)
			set_archetype_default_details (a_diff_arch)
			differential_archetype := a_diff_arch

			initialise
			save_differential_text
		ensure
			id_set: id = an_id
			validated: is_valid
		end

	make_new_specialised_archetype (an_id: ARCHETYPE_HRID; a_parent: DIFFERENTIAL_ARCHETYPE; a_repository: ARCHETYPE_LIBRARY_SOURCE; a_directory: STRING)
			-- Create a new archetype with `an_id' as a child of the archetype with id `a_parent_id', belonging to `a_repository'.
		require
			Valid_directory: file_system.directory_exists (a_directory)
			Valid_id: has_rm_schema_for_archetype_id (an_id)
		local
			a_diff_arch: DIFFERENTIAL_ARCHETYPE
		do
			make_new_any (an_id, create {ARTEFACT_TYPE}.make_archetype)
			create file_mgr.make_new_archetype (an_id, a_repository, a_directory)

			create a_diff_arch.make_minimal_child (artefact_type, an_id, locale_language_short, a_parent)
			set_archetype_default_details (a_diff_arch)
			differential_archetype := a_diff_arch
			parent_ref := a_parent.archetype_id.semantic_id

			initialise
			save_differential_text
		ensure
			Is_specialised: is_specialised
		end

	make_new_template (an_id: ARCHETYPE_HRID; a_parent: DIFFERENTIAL_ARCHETYPE; a_repository: ARCHETYPE_LIBRARY_SOURCE; a_directory: STRING)
			-- Create a new template with `an_id' as a child of the archetype with id `a_parent_id', belonging to `a_repository'.
		require
			Valid_directory: file_system.directory_exists (a_directory)
			Valid_id: has_rm_schema_for_archetype_id (an_id)
		local
			a_diff_arch: DIFFERENTIAL_ARCHETYPE
		do
			make_new_any (an_id, create {ARTEFACT_TYPE}.make_template)
			create file_mgr.make_new_archetype (an_id, a_repository, a_directory)

			create a_diff_arch.make_minimal_child (artefact_type, an_id, locale_language_short, a_parent)
			set_archetype_default_details (a_diff_arch)
			differential_archetype := a_diff_arch
			parent_ref := a_parent.archetype_id.semantic_id

			initialise
			save_differential_text
		ensure
			Is_specialised: is_specialised
		end

	make_new_any (an_id: ARCHETYPE_HRID; an_artefact_type: ARTEFACT_TYPE)
			-- Create a new archetype with `an_id', belonging to `a_repository'.
		do
			id := an_id
			create status.make_empty
			create last_modify_timestamp.make_from_epoch (0)
			create last_compile_attempt_timestamp.make_now
			artefact_type := an_artefact_type
		end

feature -- Identification

	rm_schema: BMM_SCHEMA
			-- set if this archetype has a valid package-class_name
		do
			Result := rm_schema_for_archetype_id (id)
		end

	id: ARCHETYPE_HRID
			-- Archetype identifier.

	old_id: detachable like id
			-- previous Archetype identifier, due to change by editing
		do
			Result := file_mgr.old_id
		end

	parent_id: like id
			-- Archetype identifier of specialisation parent archtype matched in this repository that has
			-- an id matching the interface id reference (i.e. archetype id down to major version) in
			-- the 'parent_archetype_id' property of the target.
		require
			is_specialised
		do
			check attached specialisation_ancestor as att_sp then
				Result := att_sp.id
			end
		end

	parent_ref: detachable STRING
			-- Archetype id ref from original archetype; this won't usually include on its own the
			-- full versioning information; the matching process in ARCHETYPE_CATALOG population
			-- phase has to occur first, and then `parent_id' can be populated.

	artefact_type: ARTEFACT_TYPE
			-- type of artefact i.e. archetype, template, template_component, operational_template
			-- see ARTEFACT_TYPE class

	relative_path: STRING
			-- a path derived from the ontological path of the nearest folder node + archetype_id
		local
			csr: detachable ARCH_LIB_ITEM
		do
			create Result.make(0)
			from csr := parent until attached {ARCH_LIB_MODEL_ITEM} csr or csr = Void loop
				csr := csr.parent
			end
			if attached {ARCH_LIB_MODEL_ITEM} csr as acmn then
				Result := acmn.path + Semantic_path_separator + id.physical_id
			end
		end

	qualified_name: IMMUTABLE_STRING_8
		do
			Result := id.physical_id
		end

	semantic_parent_key: STRING
			-- semantic key to find parent node in semantic id tree
			-- For top-level archetypes e.g. openEHR-EHR-OBSERVATION.thing.v1, it will be the name of the folder, e.g. openEHR-EHR-OBSERVATION
			-- for specialised archetypes, e.g. openEHR-EHR-OBSERVATION.specialised_thing.v1.2.4, it will be an id ref like openEHR-EHR-OBSERVATION.thing.v1
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
			-- For top-level archetypes e.g. openEHR-EHR-OBSERVATION.thing.v1, it will be the name of the folder, e.g. openEHR-EHR-OBSERVATION
			-- for specialised archetypes, e.g. openEHR-EHR-OBSERVATION.specialised_thing.v1.2.4, it will be a resolved id like openEHR-EHR-OBSERVATION.thing.v1.0.4
		do
			if is_specialised then
				check attached specialisation_ancestor as att_spec_anc then
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

	ontology_location_changed: BOOLEAN
			-- True if changed due to external editing require a move of this archetype in ontology
			-- cleared by calling `clear_old_ontological_parent_name'
		do
			Result := attached old_ontological_parent_name
		end

	group_name: STRING
			-- Name distinguishing the type of item and the group to which its `repository' belongs.
			-- Useful as a logical key to pixmap icons, etc.
			-- Typical examples: 'archetype_valid_2'
		do
			create Result.make_empty
			Result.append (artefact_type.type_name)

			inspect compilation_state
			when Cs_validated then
				if not errors.has_warnings then
					Result.append("_valid_" + file_mgr.group_id)
				else
					Result.append("_warning_" + file_mgr.group_id)
				end
			when Cs_validate_failed, cs_suppliers_invalid then
				Result.append("_parsed_" + file_mgr.group_id)
			when Cs_parse_failed, cs_convert_legacy_failed, cs_lineage_invalid then
				Result.append("_parse_failed_" + file_mgr.group_id)
			else
				Result.append("_" + file_mgr.group_id)
			end
		end

feature {ARCHETYPE_LIBRARY} -- Identification

	clear_old_ontological_parent_name
		do
			old_ontological_parent_name := Void
		end

feature {NONE} -- Identification

	old_ontological_parent_name: detachable STRING
			-- old vaue of `old_ontological_parent_name', to facilitate handling changes due to external editing of archetypes

feature -- Relationships

	suppliers_index: HASH_TABLE [ARCH_LIB_ARCHETYPE_ITEM, STRING]
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
		do
			if not attached slot_id_index_cache then
				compute_slot_id_index
			end
			check attached slot_id_index_cache as sic then
				Result := sic
			end
		end

	specialisation_ancestor: detachable ARCH_LIB_ARCHETYPE_ITEM
		do
			if attached {ARCH_LIB_ARCHETYPE_ITEM} parent as aca then
				Result := aca
			end
		end

	has_ancestor_descriptor (an_anc: ARCH_LIB_ARCHETYPE_ITEM): BOOLEAN
			-- True if this archetype has `an_anc' as an ancestor
		do
			Result := attached specialisation_ancestor as att_ala and then (att_ala = an_anc or else
				att_ala.has_ancestor_descriptor (an_anc))
		end

	has_ancestor (an_arch_id: STRING): BOOLEAN
			-- True if this archetype has `an_arch_id' among its an ancestors
		do
			Result := attached specialisation_ancestor as att_ala and then (att_ala.id.physical_id.is_equal (an_arch_id) or else
				att_ala.has_ancestor (an_arch_id))
		end

	is_specialised: BOOLEAN
			-- True if this archetype is a specialisation of another archetype
		do
			Result := attached parent_ref
		end

	has_slots: BOOLEAN
			-- Does this archetype have any slots?
		do
			Result := compilation_state >= Cs_validated_phase_1 and then not slot_fillers_index.is_empty
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
			Result := suppliers_index.has (an_arch_id) or else attached specialisation_ancestor as att_anc and then att_anc.has_flat_supplier (an_arch_id)
		end

feature {ARCH_LIB_ARCHETYPE_ITEM} -- Relationships

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

	source_file_path: STRING
			-- Path of differential source file of archetype.
		do
			Result := file_mgr.source_file_path
		end

	has_source_file: BOOLEAN
		do
			Result := file_mgr.has_source_file
		end

	differential_archetype: detachable DIFFERENTIAL_ARCHETYPE
			-- archetype representing differential structure with respect to parent archetype;
			-- if this is a non-specialised archetype, then it is the same as the flat form, else
			-- it is just the differences (like an object-oriented source file for a subclass)

	display_language: STRING
			-- generate a valid language to display this archetype in, either the current_language
			-- or the primary language of this archetype, if it doesn't support the current language
		do
			if is_valid then
				if differential_archetype.has_language (archetype_view_language) then
					Result := archetype_view_language
				else
					Result := differential_archetype.original_language.code_string
				end
			else
				Result := Default_language
			end
		end

	differential_serialised: detachable STRING
			-- serialise differential archetype to its file in its source form, even if not compiling
			-- this might fail because the serialiser might try to do something that an invalid archetype
			-- can't support
		local
			exception_occurred: BOOLEAN
		do
			if not exception_occurred then
				if attached differential_archetype as da then
					Result := adl_2_engine.serialise (da, Syntax_type_adl, current_archetype_language)
				end
			end
		rescue
			exception_occurred := True
		end

	flat_archetype: FLAT_ARCHETYPE
			-- inheritance-flattened form of archetype
		require
			compilation_state = Cs_validated_phase_2 or compilation_state = Cs_validated
		do
			if flat_archetype_cache = Void or last_include_rm then
				flatten (False)
			end
			check attached flat_archetype_cache as fac then
				Result := fac
			end
		end

	flat_archetype_with_rm: FLAT_ARCHETYPE
			-- inheritance-flattened form of archetype
		require
			compilation_state = Cs_validated_phase_2 or compilation_state = Cs_validated
		do
			if flat_archetype_cache = Void or not last_include_rm then
				flatten (True)
			end
			check attached flat_archetype_cache as fac then
				Result := fac
			end
		end

	flat_serialised (include_rm: BOOLEAN): STRING
			-- The serialised text of the flat form of the archetype
		require
			compilation_state = Cs_validated_phase_2 or compilation_state = Cs_validated
		do
			if include_rm then
				Result := adl_2_engine.serialise (flat_archetype_with_rm, Syntax_type_adl, current_archetype_language)
			else
				Result := adl_2_engine.serialise (flat_archetype, Syntax_type_adl, current_archetype_language)
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
			when Cs_validated then
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

	is_out_of_date: BOOLEAN
			-- It this archetype out of date with respect to parents or suppliers?
		do
			-- see if parents were recompiled more recently
			Result := is_specialised and then specialisation_ancestor.last_compile_attempt_timestamp > last_compile_attempt_timestamp

			-- see if any supplier was recompiled more recently
			if not Result then
				Result := across suppliers_index as supp_idx_csr some supp_idx_csr.item.last_compile_attempt_timestamp > last_compile_attempt_timestamp end
			end
		end

	is_in_terminal_compilation_state: BOOLEAN
		do
			Result := Cs_terminal_states.has (compilation_state)
		end

	is_valid: BOOLEAN
			-- True if archetype object created and 'is_valid' True. This can be used to check if the archetype has
			-- actually been compiled and is available in memory. This is useful for specialised archetypes because
			-- you want to know if the parent has been compiled (up the lineage) before you can compile the current one
		do
			Result := compilation_state = Cs_validated
		end

	is_valid_differential: BOOLEAN
			-- True if at least we got to the state of the differential being created / available
		do
			Result := compilation_state >= Cs_validated_phase_2
		end

	compile
			-- perform as many steps of the compilation process as possible; may be called repeatedly by ARCHETYPE_COMPILER as it
			-- does initial parsing here, finds dependencies, compiles them, comes back here, etc etc
			-- For the moment just a simplistic implementation; we might do a proper generic state machine one later
		local
			finished: BOOLEAN
			exception_encountered: BOOLEAN
		do
			if not exception_encountered then
				from until finished loop
					inspect compilation_state
					when Cs_unread then
						initialise
					when Cs_lineage_known then
						if specialisation_ancestor.is_valid then
							compilation_state := Cs_ready_to_parse
						else
							compilation_state := cs_lineage_invalid
							add_error (ec_compile_e1, <<parent_id.physical_id>>)
						end
					when cs_ready_to_parse_legacy then
						if is_specialised and not specialisation_ancestor.is_valid then
							compilation_state := cs_lineage_invalid
							add_error (ec_compile_e1, <<parent_id.physical_id>>)
						else
							parse_legacy
						end
					when Cs_ready_to_parse then
						parse
					when Cs_parsed then
						evaluate_suppliers
					when Cs_ready_to_validate then
						validate
					when Cs_validated_phase_2 then
						if adl_roundtripping or (file_mgr.has_legacy_flat_file and not has_source_file) then
							save_differential_text
						end
						validate_flat
					when Cs_validated then
						post_compile_actions
						finished := True
					else
						finished := True
					end
				end
				set_compile_attempt_timestamp
			else
				signal_exception
				if attached meaning (exception) as att_meaning and attached exception_trace as att_exc_trace then
					add_error (ec_compile_exception, <<id.physical_id, att_meaning, att_exc_trace>>)
				end
			end
		rescue
			if file_mgr.has_legacy_flat_file and compilation_state = Cs_ready_to_parse then
				clean_generated
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
			-- signal rebuild from scratch; this rebuilds from existing differential; it only uses legacy if no
			-- differential yet available. This is because changes in legacy will be detected independently
		do
			if compile_attempted then
				current_library.decrement_compile_attempt_count
			end
			differential_archetype := Void
			clear_cache
			last_compile_attempt_timestamp := Time_epoch
			compilation_state := Cs_unread
			status.wipe_out
		ensure
			Differential_archetype_cleared: differential_archetype = Void
			Compiler_state_set: compilation_state = Cs_unread
		end

	signal_source_edited
			-- signal source file changed on disk
		local
			old_ont_parent: STRING
		do
			old_ont_parent := semantic_parent_key
			file_mgr.refresh_from_source

			-- see if ontological parent has changed
			if not old_ont_parent.is_equal (semantic_parent_key) then
				old_ontological_parent_name := old_ont_parent
			end
			signal_from_scratch
		ensure
			Compiler_state_set: (<<Cs_unread, Cs_invalid>>).has (compilation_state)
		end

	signal_suppliers_compiled
		require
			compilation_state = Cs_suppliers_known
		do
			from suppliers_index.start until suppliers_index.off or not suppliers_index.item_for_iteration.is_valid loop
				suppliers_index.forth
			end
			if suppliers_index.off then
				compilation_state := Cs_ready_to_validate
			else
				compilation_state := cs_suppliers_invalid
				add_error (ec_compile_e2, <<suppliers_index.item_for_iteration.id.physical_id>>)
			end
		ensure
			Compilation_state_set: (<<Cs_ready_to_validate, cs_suppliers_invalid>>).has (compilation_state)
		end

--	signal_differential_edited
--			-- signal event of differential in-memory being changed by editing at UI
--		do
--			compilation_state := cs_ready_to_validate
--			clear_cache
--		ensure
--			Compilation_state_set: compilation_state = Cs_ready_to_validate
--		end

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

feature {NONE} -- Compilation

	reset
			-- reset after exception encountered
		do
			status.wipe_out
			validator_reset
		ensure
			Status_cleared: status.is_empty
		end

	initialise
			-- set compilation state at creation, or if editing occurs
			-- also sets rm_schema reference
		require
			compilation_state = Cs_unread
		do
			reset
			if file_mgr.is_legacy_out_of_date then
				compilation_state := Cs_ready_to_parse_legacy
			elseif has_source_file then -- either authored in ADL 1.5, or compiled successfully from legacy .adl file
				if is_specialised then
					compilation_state := Cs_lineage_known
				else
					compilation_state := Cs_ready_to_parse
				end
			elseif attached differential_archetype then -- must have been newly created
				compilation_state := Cs_validated
			end
		ensure
			compilation_state_set: Cs_initial_states.has (compilation_state)
		end

	parse_legacy
			-- Parse and validate `target', legacy flat form; save differential file if there was none.
			-- Assume that legacy archetypes have no suppliers, i.e. don't include slot-fillers.
			-- This is safe, since this is an ADL 1.5 only construct
		require
			Compilation_state_valid: compilation_state = cs_ready_to_parse_legacy
			Legacy_file_available: file_mgr.has_legacy_flat_file
		local
			legacy_flat_archetype: detachable FLAT_ARCHETYPE
			archetype_comparator: ARCHETYPE_COMPARATOR
		do
			clear_cache

			-- perform the parse; this can fail, i.e. no result generated
			check attached file_mgr.legacy_flat_text as lft then
				legacy_flat_archetype := adl_14_engine.parse (lft, Current)
			end
		 	compilation_state := Cs_parsed
			if attached legacy_flat_archetype as flat_arch then
				add_info (ec_compile_legacy_i1, <<id.physical_id>>)

				-- perform post-parse processing and then diff conversion
				if is_specialised then
					-- run the comparator over the legacy flat archetype if specialised; it will mark all
					-- nodes with a local and also rolled up inheritance status
					if specialisation_ancestor.is_valid and attached specialisation_ancestor as att_sp then

						-- perform post-parse object structure finalisation
						adl_14_engine.post_parse_151_convert (flat_arch, Current)

						-- perform standard post-parse processing
						adl_14_engine.post_parse_process (flat_arch, Current)

						create archetype_comparator.make (att_sp, flat_arch)
						archetype_comparator.compare
						archetype_comparator.generate_diff
						archetype_comparator.compress_differential_child
						differential_archetype := archetype_comparator.differential_output

						-- save text to diff file
						if attached differential_serialised as txt then
							save_text_to_differential_file (txt)
						end
					else
						compilation_state := cs_lineage_invalid
						add_error (ec_compile_e1, <<parent_id.physical_id>>)
					end
				else
					-- perform post-parse object structure finalisation
					adl_14_engine.post_parse_151_convert (flat_arch, Current)

					-- perform standard post-parse processing
					adl_14_engine.post_parse_process (flat_arch, Current)
					create differential_archetype.make_from_flat (flat_arch)

					-- save text to diff file
					if attached differential_serialised as txt then
						save_text_to_differential_file (txt)
					end
				end
			else
			 	compilation_state := Cs_convert_legacy_failed
			end

			-- pick up all errors & warnings
			merge_errors (adl_14_engine.errors)
			status.prepend (errors.as_string_filtered (True, True, False))
		ensure
			Compilation_state: (<<Cs_parsed, Cs_convert_legacy_failed, Cs_lineage_invalid>>).has (compilation_state)
		end

	parse
			-- Parse archetype, in differential form if available, else in legacy flat form.
			-- Comilation state changes:
			-- parse succeeded: Cs_ready_to_parse --> Cs_parsed
			-- parse failed: Cs_ready_to_parse --> Cs_parse_failed
		require
			Initial_state: compilation_state = Cs_ready_to_parse
			has_source_file: has_source_file
		do
			add_info (ec_parse_i2, Void)
			clear_cache
			differential_archetype := adl_2_engine.parse (source_text, Current)
		 	compilation_state := Cs_parsed
			if attached differential_archetype as diff_arch then
				-- determine what language to view archetype in
				if archetype_view_language.is_empty or not diff_arch.has_language (archetype_view_language) then
					set_archetype_view_language (diff_arch.original_language.code_string)
				end

				if is_specialised and then attached diff_arch.parent_archetype_id as da_parent_ref and then not parent_id.physical_id.starts_with (da_parent_ref) then
					add_warning (ec_parse_w1, <<id.physical_id, parent_id.physical_id, da_parent_ref>>)
				else
					add_info (ec_parse_i1, <<id.physical_id>>)
				end

				-- perform post-parse object structure finalisation
				if version_less_than (diff_arch.adl_version, Adl_id_code_version) then
					adl_2_engine.post_parse_151_convert (diff_arch, Current)
				end

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

	evaluate_suppliers
			-- Comilation state changes:
			-- has suppliers: Cs_parsed --> Cs_suppliers_known
			-- no suppliers: Cs_parsed --> Cs_ready_to_validate
		require
			Initial_state: compilation_state = Cs_parsed
		local
			diff_arch: DIFFERENTIAL_ARCHETYPE
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
			if not suppliers_index.is_empty then
				-- the following check determines if any of the current archetype's suppliers has the current
				-- archetype as an ancestor
				across suppliers_index as supp_idx_csr loop
					if supp_idx_csr.item.has_ancestor_descriptor (Current) then
						compilation_state := Cs_supplier_loop
						add_error (ec_VINH, <<supp_idx_csr.item.id.physical_id>>)
					end
				end
				if not has_errors then
					compilation_state := Cs_suppliers_known
				end
			else
				compilation_state := Cs_ready_to_validate
			end
		ensure
			Compilation_state: (<<Cs_suppliers_known, Cs_supplier_loop, Cs_ready_to_validate>>).has (compilation_state)
		end

	validate
			-- Perform validation on `differential_archetype'.
			-- Compilation state change:
			--	validated succeeded: Cs_ready_to_validate --> Cs_validated_phase_2
			--	validate failed: Cs_ready_to_validate --> Cs_validate_failed
		do
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
					differential_archetype.set_adl_version (latest_adl_version)
				else
					compilation_state := Cs_validate_failed
				end
			else
				compilation_state := Cs_validate_failed
			end
			status.prepend (errors.as_string_filtered (True, True, False))
		ensure then
			Compilation_state: (<<Cs_validated_phase_1, Cs_validated_phase_2, Cs_validate_failed>>).has (compilation_state)
		end

	validate_flat
			-- Perform validation on `flat_archetype'.
			-- Compilation state change:
			--	validated succeeded: Cs_validated_phase_2 --> Cs_validated
			--	validate failed: Cs_validated_phase_2 --> Cs_validate_failed
		require
			compilation_state = Cs_validated_phase_2
		do
			-- phase 3: validate flattened archetype
			adl_2_engine.phase_3_validate (Current)
			merge_errors (adl_2_engine.errors)
			if adl_2_engine.validation_passed then
				add_info (ec_parse_archetype_i2, <<id.physical_id>>)
				compilation_state := Cs_validated
				-- not yet in use
				--	adl_2_engine.post_compile_process (Current)
			else
				compilation_state := Cs_validate_failed
			end
			status.prepend (errors.as_string_filtered (True, True, False))
		ensure
			Compilation_state: (<<Cs_validated, Cs_validate_failed>>).has (compilation_state)
		end

	post_compile_actions
		require
			compilation_state = Cs_validated
		do
		end

	set_compile_attempt_timestamp
			-- Set `compile_attempt_timestamp'
		do
			if not compile_attempted then
				current_library.update_compile_attempt_count
			end
			create last_compile_attempt_timestamp.make_now
		end

feature -- Conversion

	generate_differential: DIFFERENTIAL_ARCHETYPE
			-- generate differential from compiled flat; if is_specialised, then
			-- result will be path-compressed differential form archetype
		require
			is_valid
		local
			archetype_comparator: ARCHETYPE_COMPARATOR
		do
			if is_specialised then
				check attached specialisation_ancestor as parent_aca then
					create archetype_comparator.make_create_differential (parent_aca, flat_archetype)
				end
				check attached archetype_comparator.differential_output as da then
					Result := da
				end
			else
				create Result.make_from_flat (flat_archetype)
			end
		end

feature -- File Access

	file_mgr: ARCH_PERSISTENCE_MGR

	save_differential_text
			-- Save converted differential archetype to its file in its source form, even if not compiling
		local
			ftext: STRING
		do
			if attached differential_serialised as txt then
				ftext := txt
			else
				ftext := source_text
			end
			file_mgr.save_source_text (ftext)
		end

	save_differential_as (a_full_path, a_format: STRING)
			-- Save current source archetype to `a_full_path' in `a_format'.
		require
			Archetype_valid: is_valid
			path_valid: not a_full_path.is_empty
			Serialise_format_valid: has_serialiser_format (a_format)
		do
			if has_archetype_native_serialiser_format (a_format) and attached differential_archetype as da then
				file_mgr.save_as (a_full_path, adl_2_engine.serialise (da, a_format, current_archetype_language))
			else -- must be a DT serialisation format
				file_mgr.save_as (a_full_path, serialise_object (False, a_format))
			end
			status := get_msg_line (ec_file_saved_as_in_format, <<a_full_path, a_format>>)
		end

	save_flat_as (a_full_path, a_format: STRING)
			-- Save current flat archetype to `a_full_path' in `a_format'.
		require
			Archetype_valid: is_valid
			path_valid: not a_full_path.is_empty
			Serialise_format_valid: has_serialiser_format (a_format)
		do
			if a_format.same_string (Syntax_type_adl) then
				file_mgr.save_as (a_full_path, flat_serialised (False))
			elseif has_archetype_native_serialiser_format (a_format) then
				file_mgr.save_as (a_full_path, adl_2_engine.serialise (flat_archetype, a_format, current_archetype_language))
			else -- must be a DT serialisation format
				file_mgr.save_as (a_full_path, serialise_object (True, a_format))
			end
			status := get_msg_line (ec_file_saved_as_in_format, <<a_full_path, a_format>>)
		end

	save_text_to_legacy_file (a_text: STRING)
			-- save `a_text' to the legacy file if it exists
		do
			file_mgr.save_text_to_legacy_file (a_text)
			signal_source_edited
		end

	save_text_to_differential_file (a_text: STRING)
			-- save `a_text' to the differential file
		do
			file_mgr.save_text_to_differential_file (a_text)
		end

	remove_file
			-- remove the source file from the file system
		do
			file_mgr.remove_source_file
		end

feature {MAIN_WINDOW} -- File Access

	clean_generated
			-- delete generated file and compiler products; forces next compilation to start from primary expression
		do
			file_mgr.clean_generated
			signal_from_scratch
			status.append (file_mgr.status)
		ensure
			Reset_if_source_generated: file_mgr.is_source_generated implies (differential_archetype = Void and compilation_state = Cs_unread)
		end

feature {GUI_TEST_TOOL} -- File Access

	save_differential_compiled
			-- save validated differential archetype in fast-retrieve form (ODIN)
		require
			Archetype_valid: is_valid
		do
			file_mgr.save_differential_compiled (serialise_object (False, Syntax_type_odin))
		end

	compiled_differential: STRING
		do
			create Result.make_empty
			if attached file_mgr.compiled_differential as odin_text then
				-- parse the ODIN to DT then materialise to AOM
				archetype_serialise_engine.set_source (odin_text, 1)
				archetype_serialise_engine.parse
				if archetype_serialise_engine.parse_succeeded then
					if attached {P_ARCHETYPE} archetype_serialise_engine.tree.as_object (({P_ARCHETYPE}).type_id, <<>>) as p_archetype then
						if attached {DIFFERENTIAL_ARCHETYPE} p_archetype.create_archetype as an_arch then
							-- serialise into normal ADL format
							Result := adl_2_engine.serialise (an_arch, Syntax_type_adl, current_archetype_language)
						end
					end
				end
			end
		end

feature -- Output

	serialise_object (flat_flag: BOOLEAN; a_format: STRING): STRING
			-- serialise internal structure in a brute-force object way, using
			-- format like ODIN, XML, JSON etc
		require
			Archetype_valid: is_valid
			Format_valid: has_dt_serialiser_format (a_format)
		local
			dt_arch: DT_CONVERTIBLE
		do
			if flat_flag then
				check attached flat_archetype as fa then
					create {P_ARCHETYPE} dt_arch.make (fa)
				end
			else
				check attached differential_archetype as da then
					create {P_ARCHETYPE} dt_arch.make (da)
				end
			end

			dt_arch.synchronise_to_tree
			archetype_serialise_engine.set_tree (dt_arch.dt_representation)
			archetype_serialise_engine.serialise (a_format, False, True)
			Result := archetype_serialise_engine.serialised
		end

feature -- Statistics

	generate_statistics (in_differential_mode: BOOLEAN)
			-- generate statistics in differential or flat mode
		require
			is_valid
		do
			create statistical_analyser.make (Current, in_differential_mode)
			statistical_analyser.analyse
		end

	statistical_analyser: detachable ARCHETYPE_STATISTICAL_ANALYSER

feature {ARCH_LIB_ITEM, ARCHETYPE_LIBRARY} -- Implementation

	children: detachable SORTED_TWO_WAY_LIST [ARCH_LIB_ARCHETYPE_ITEM]
			-- list of child nodes

feature {NONE} -- Implementation

	current_archetype_language: STRING
			-- find a language from the current archetype that matches `archetype_view_language' either directly
			-- (e.g. "en" matches "en") or on a language group basis (e.g. "en-GB" matches "en"); if
			-- none found, return archetype original language
		require
			attached differential_archetype
		do
			check attached differential_archetype end
			if differential_archetype.has_language (archetype_view_language) then
				Result := archetype_view_language
			elseif differential_archetype.has_matching_language_tag (archetype_view_language) then
				Result := differential_archetype.matching_language_tag (archetype_view_language)
			else
				Result := differential_archetype.original_language.code_string
			end
		end

	flatten (include_rm: BOOLEAN)
			-- (re)generate flat-form of this archetype
		require
			is_valid
		do
			arch_flattener.flatten (include_rm)
			flat_archetype_cache := arch_flattener.arch_flat_out
			last_include_rm := include_rm
		ensure
			flat_archetype_cache_attached: attached flat_archetype_cache
		end

	flat_archetype_cache: detachable FLAT_ARCHETYPE
			-- archetype generated by flattening process

	last_include_rm: BOOLEAN
			-- which kind of flattening was last used? Used to know whether to regenerate flat or not

	arch_flattener: ARCHETYPE_FLATTENER
			-- use a cache and lazy create since in many archetype libraries, the vast majority of archetypes
			-- are top-level, i.e. need no flattener
		do
			if attached arch_flattener_cache as af then
				Result := af
			else
				create Result.make (Current, rm_schema)
				arch_flattener_cache := Result
			end
		end

	arch_flattener_cache: detachable ARCHETYPE_FLATTENER
		note
			option: stable
		attribute
		end

	clear_cache
		do
			flat_archetype_cache := Void
			slot_id_index_cache := Void
		end

	set_archetype_default_details (an_arch: DIFFERENTIAL_ARCHETYPE)
		do
			an_arch.description.put_original_author_item ("name", author_name)
			an_arch.description.put_original_author_item ("organisation", author_org)
			an_arch.description.set_lifecycle_state (Resource_lifecycle_states.first)
			an_arch.description.add_original_language_details
			an_arch.description.set_copyright (author_copyright)
		end

	archetype_serialise_engine: ODIN_ENGINE
		once
			create Result.make
		end

	compute_slot_id_index
			-- generate `slot_id_index_cache' and `slot_owners_index' of client archetype descriptors
		require
			compilation_state >= Cs_validated_phase_1
		local
			includes, excludes: ARRAYED_LIST[ASSERTION]
			slot_idx: like slot_fillers_index
			ala: ARCH_LIB_ARCHETYPE_ITEM
		do
			create slot_idx.make (0)
			slot_id_index_cache := slot_idx

			across differential_archetype.slot_index as slots_csr loop
				includes := slots_csr.item.includes
				excludes := slots_csr.item.excludes
				if not includes.is_empty and not includes.first.matches_any then
					if not excludes.is_empty then -- create specific match list from includes constraint
						across includes as includes_csr loop
							if attached {STRING} includes_csr.item.regex_constraint.constraint_regex as a_regex then
								add_slot_ids (slot_idx, current_library.matching_ids (a_regex, slots_csr.item.rm_type_name, Void), slots_csr.item.path)
							end
						end
					else -- excludes = empty ==> includes is just a recommendation => match all archetype ids of RM type
						add_slot_ids (slot_idx, current_library.matching_ids (Regex_any_pattern, slots_csr.item.rm_type_name, id.rm_closure), slots_csr.item.path)
					end
				elseif not excludes.is_empty and not excludes.first.matches_any then
					add_slot_ids (slot_idx, current_library.matching_ids (Regex_any_pattern, slots_csr.item.rm_type_name, Void), slots_csr.item.path)
					if not includes.is_empty then -- means excludes is not a recommendation; need to actually process it
						across excludes as excludes_csr loop
							if attached {STRING} excludes_csr.item.regex_constraint.constraint_regex as a_regex then
								across current_library.matching_ids (a_regex, slots_csr.item.rm_type_name, id.rm_closure) as ids_csr loop
									slot_idx.item (slots_csr.item.path).prune (ids_csr.item)
								end
							end
						end
					end
				else
					add_slot_ids (slot_idx, current_library.matching_ids (Regex_any_pattern, slots_csr.item.rm_type_name, id.rm_closure), slots_csr.item.path)
				end

				-- now post the results in the reverse indexes
				across slot_idx.item (slots_csr.item.path) as ids_csr loop
					ala := current_library.archetype_with_id (ids_csr.item)
					if not attached ala.slot_owners_index or else not ala.slot_owners_index.has (id.physical_id) then
						ala.add_slot_owner (id.physical_id)
					end
				end
			end
		end

	add_slot_ids (idx: HASH_TABLE [ARRAYED_SET[STRING], STRING]; a_list: ARRAYED_SET [STRING]; a_slot_path: STRING)
			-- add list of matching archetypes to ids recorded for slot at a_slot_path
		do
			if not idx.has (a_slot_path) then
				idx.force (a_list, a_slot_path)
			else
				idx.item (a_slot_path).merge (a_list)
			end
		end

	slot_id_index_cache: detachable HASH_TABLE [ARRAYED_SET[STRING], STRING]

invariant
	compilation_state_valid: valid_compilation_state (compilation_state)

	differential_archetype_attached_if_valid: is_valid implies attached differential_archetype
	flat_archetype_attached_if_valid: is_valid implies flat_archetype /= Void

	parent_existence: specialisation_ancestor /= Void implies is_specialised
	clients_index_valid: slot_owners_index /= Void implies not slot_owners_index.is_empty

end



