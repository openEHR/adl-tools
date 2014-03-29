note
	component:   "openEHR ADL Tools"
	description: "Descriptor of an archetype in a catalogue of archetypes"
	keywords:    "ADL, archetype"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2006- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class ARCH_CAT_ARCHETYPE

inherit
	ARCH_CAT_ITEM
		rename
			name as semantic_id
		redefine
			children
		end

	SHARED_ARCHETYPE_CATALOGUES
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
	make, make_new_archetype, make_new_specialised_archetype

feature {NONE} -- Initialisation

	make (a_path: STRING; a_repository: ARCHETYPE_REPOSITORY_I; arch_thumbnail: ARCHETYPE_THUMBNAIL)
			-- Create for the archetype described by `arch_thumbnail', stored at `a_full_path', belonging to `a_repository'.
		require
			Path_valid: not a_path.is_empty
			Valid_id: has_rm_schema_for_archetype_id (arch_thumbnail.archetype_id)
		do
			create status.make_empty
			create last_modify_timestamp.make_from_epoch (0)

			-- basic state
			id := arch_thumbnail.archetype_id
			source_file_adl_version := arch_thumbnail.adl_version
			if arch_thumbnail.is_specialised then
				parent_id := arch_thumbnail.parent_archetype_id
			end
			create artefact_type.make (arch_thumbnail.artefact_type)
			compilation_state := Cs_unread

			-- create file workflow state
			file_repository := a_repository
			differential_path := a_path
			if arch_thumbnail.is_legacy then
				legacy_flat_path := extension_replaced (a_path, File_ext_archetype_adl14)
				legacy_flat_text_timestamp := legacy_flat_file_timestamp

				-- if we are being called with legacy archetype, there is no differential file yet, so
				-- by definition it is generated
				is_differential_generated := True
			else
				differential_text_timestamp := differential_file_timestamp
				is_differential_generated := arch_thumbnail.is_generated
			end
		ensure
			id_set: id = arch_thumbnail.archetype_id
			parent_id_set: arch_thumbnail.is_specialised implies parent_id = arch_thumbnail.parent_archetype_id
			Compilation_state: compilation_state = Cs_unread
		end

	make_new_archetype (an_id: ARCHETYPE_HRID; a_repository: ARCHETYPE_REPOSITORY_I; a_directory: STRING)
			-- Create a new archetype with `an_id', belonging to `a_repository'.
		require
			Valid_directory: file_system.directory_exists (a_directory)
			Valid_id: has_rm_schema_for_archetype_id (an_id)
		local
			a_diff_arch: DIFFERENTIAL_ARCHETYPE
		do
			make_new_any (an_id, a_repository, a_directory)

			create a_diff_arch.make_minimal (artefact_type, an_id, locale_language_short)
			set_archetype_default_details (a_diff_arch)
			differential_archetype := a_diff_arch

			initialise
			save_differential_validated
		ensure
			file_repository_set: file_repository = a_repository
			id_set: id = an_id
			validated: is_valid
		end

	make_new_specialised_archetype (an_id: ARCHETYPE_HRID; a_parent: DIFFERENTIAL_ARCHETYPE; a_repository: ARCHETYPE_REPOSITORY_I; a_directory: STRING)
			-- Create a new archetype with `an_id' as a child of the archetype with id `a_parent_id', belonging to `a_repository'.
		require
			Valid_directory: file_system.directory_exists (a_directory)
			Valid_id: has_rm_schema_for_archetype_id (an_id)
		local
			a_diff_arch: DIFFERENTIAL_ARCHETYPE
		do
			make_new_any (an_id, a_repository, a_directory)

			create a_diff_arch.make_minimal_child (artefact_type, an_id, locale_language_short, a_parent)
			set_archetype_default_details (a_diff_arch)
			differential_archetype := a_diff_arch
			parent_id := a_parent.archetype_id

			initialise
			save_differential_validated
		ensure
			Is_specialised: is_specialised
		end

	make_new_any (an_id: ARCHETYPE_HRID; a_repository: ARCHETYPE_REPOSITORY_I; a_directory: STRING)
			-- Create a new archetype with `an_id', belonging to `a_repository'.
		do
			create status.make_empty
			create last_modify_timestamp.make_from_epoch (0)
			create last_compile_attempt_timestamp.make_now
			file_repository := a_repository
			id := an_id
			source_file_adl_version := latest_adl_version

			check attached file_system.pathname (a_directory, id.as_string + File_ext_archetype_source) as pn then
				differential_path := pn
			end

			create artefact_type.make_archetype
		end

feature -- Initialisation

	add_legacy_archetype (a_path: STRING)
			-- add legacy details to a descriptor already created for a differential archteype for which
			-- a legacy archetype has been found
		require
			Path_valid: not a_path.is_empty
		do
			legacy_flat_path := a_path
			legacy_flat_text_timestamp := legacy_flat_file_timestamp
		ensure
			is_legacy: is_legacy
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

	parent_id: detachable like id
			-- Archetype identifier of specialisation parent

	artefact_type: ARTEFACT_TYPE
			-- type of artefact i.e. archetype, template, template_component, operational_template
			-- see ARTEFACT_TYPE class

	relative_path: STRING
			-- a path derived from the ontological path of the nearest folder node + archetype_id
		local
			csr: detachable ARCH_CAT_ITEM
		do
			create Result.make(0)
			from csr := parent until attached {ARCH_CAT_MODEL_NODE} csr or csr = Void loop
				csr := csr.parent
			end
			if attached {ARCH_CAT_MODEL_NODE} csr as acmn then
				Result := acmn.path + Ontological_path_separator + id.as_string
			end
		end

	qualified_name: STRING
		do
			Result := id.as_string
		end

	ontological_parent_name: STRING
			-- semantic name of parent node in ontology tree
			-- For top-level archetypes e.g. openEHR-EHR-OBSERVATION.thing.v1, it will be the name of teh folder, e.g. openEHR-EHR-OBSERVATION
			-- for specialised archetypes, e.g. openEHR-EHR-OBSERVATION.specialised_thing.v1, it will be the id of the parent, e.g. openEHR-EHR-OBSERVATION.thing.v1
		do
			if is_specialised then
				Result := parent_id.as_string
			else
				Result := id.qualified_rm_class
			end
		end

	semantic_id: STRING
			-- namespace + domain concept part of archetype id; if there are any '-' characters due to ADL 1.4 style ids,
			-- return only the final section
		local
			str: STRING
		do
			str := id.semantic_id
			if is_specialised and is_legacy and str.has ({ARCHETYPE_HRID}.section_separator) then
				Result := str.substring (str.last_index_of ({ARCHETYPE_HRID}.section_separator, str.count) + 1, str.count)
			else
				Result := str
			end
		end

	global_artefact_identifier: STRING
			-- tool-wide unique id for this artefact
		do
			Result := qualified_name
		end

	is_reference_archetype: BOOLEAN
			-- True if archetype has path description/other_details["model_level"] = "reference"

feature {ARCHETYPE_CATALOGUE} -- Identification

	clear_old_ontological_parent_name
		do
			old_ontological_parent_name := Void
		end

feature {NONE} -- Identification

	old_ontological_parent_name: detachable STRING
			-- old vaue of `old_ontological_parent_name', to facilitate handling changes due to external editing of archetypes

feature -- Relationships

	suppliers_index: detachable HASH_TABLE [ARCH_CAT_ARCHETYPE, STRING]
			-- list of descriptors of slot fillers or other external references, keyed by archetype id
			-- currently generated only from C_ARCHETYPE_ROOT index in archetype

	clients_index: detachable ARRAYED_LIST [STRING]
			-- list of archetype_ids of archetypes that use this archetype

	specialisation_ancestor: detachable ARCH_CAT_ARCHETYPE
		do
			if attached {ARCH_CAT_ARCHETYPE} parent as aca then
				Result := aca
			end
		end

	is_specialised: BOOLEAN
			-- True if this archetype is a specialisation of another archetype
		do
			Result := attached parent_id
		end

	has_slots: BOOLEAN
			-- Does this archetype have any slots?
		do
			Result := compilation_state >= Cs_validated_phase_1 and then not slot_id_index.is_empty
		end

	is_supplier: BOOLEAN
			-- Is this archetype used by any other archetypes (i.e. matches any of their slots)?
		do
			Result := attached clients_index
		end

	has_artefacts: BOOLEAN = True
			-- True if there are any archetypes at or below this point

feature {ARCH_CAT_ARCHETYPE} -- Relationships

	add_client (an_archetype_id: STRING)
			-- add the id of an archetype that has a slot that matches this archetype, i.e. that 'uses' this archetype
		do
			if not attached clients_index then
				create clients_index.make (0)
				clients_index.compare_objects
			end
			clients_index.extend (an_archetype_id)
		end

feature -- File Management

	is_differential_file_modified: BOOLEAN
			-- Is differential_archetype out of date with respect to changes on the file system?
		require
			has_differential_file
		do
			Result := differential_file_timestamp /= differential_text_timestamp
		end

	is_legacy_file_modified: BOOLEAN
			-- Is flat_archetype out of date with respect to changes on the file system?
		require
			has_legacy_flat_file
		do
			Result := legacy_flat_file_timestamp /= legacy_flat_text_timestamp
		end

	is_legacy_newer_than_differential: BOOLEAN
		require
			has_legacy_flat_file
		do
			Result := not has_differential_file or else legacy_flat_file_timestamp > differential_file_timestamp
		end

	source_file_adl_version: STRING
			-- ADL version of the most recently read differential text file
			-- if this version = 1.5.1, it means the file is already 1.5.1
		attribute
			create Result.make_empty
		end

	differential_text_adl_version: STRING
			-- ADL version of the most recently converted text file (legacy or differential)
		attribute
			create Result.make_empty
		end

	differential_text_original: STRING
			-- original form of differential file text, with no conversions
		require
			differential_file_available: has_differential_file
		do
			file_repository.read_text_from_file (differential_path)
			check attached file_repository.text as t then
				Result := t
			end
		end

	differential_text: STRING
			-- Read `differential_text_converted' and `text_timestamp' from `differential_path', returning
			-- the text of the archetype source file, i.e. the differential form.
		require
			differential_file_available: has_differential_file
		local
			arch_text, line_1, adl_var_ver_text: STRING
			i: INTEGER
		do
			file_repository.read_text_from_file (differential_path)
			check attached file_repository.text as t then
				arch_text := t
			end

			-- obtain the first line of text
			create line_1.make_empty
			from i := 1 until arch_text.item (i) = '%N' or i > arch_text.count loop
				line_1.append_character (arch_text.item (i))
				i := i + 1
			end

			-- extract the adl_version
			Adl_version_regex_matcher.match (line_1)
			adl_var_ver_text := Adl_version_regex_matcher.captured_substring (0)
			differential_text_adl_version := adl_var_ver_text.substring (adl_var_ver_text.index_of ('=', 1) + 1, adl_var_ver_text.count)
			differential_text_adl_version.left_adjust

			if differential_text_adl_version < Id_conversion_version then
				adl_14_15_rewriter.execute (arch_text)
				Result := adl_14_15_rewriter.out_buffer
				is_text_converted := True
			else
				is_text_converted := False
				Result := arch_text
			end
			differential_text_timestamp := differential_file_timestamp
		end

	differential_path: STRING
			-- Path of differential source file of archetype.

	differential_compiled_path: STRING
			-- path to persisted compiled source form of archetype
		do
			Result := file_system.pathname (compiler_gen_source_directory, id.as_filename + File_ext_odin)
		end

	differential_text_timestamp: INTEGER
			-- Modification timestamp of source file at last read

	differential_file_timestamp: INTEGER
			-- Date and time at which the archetype differential file was last modified.
		require
			Has_differential_file: has_differential_file
		do
			Result := file_system.file_time_stamp (differential_path)
		ensure
			Result > 0
		end

	flat_compiled_path: STRING
			-- path to persisted compiled flat form of archetype
		do
			 Result := file_system.pathname (compiler_gen_flat_directory, id.as_filename + File_ext_odin)
		end

	has_differential_file: BOOLEAN
			-- Does the repository have a source-form file for this archetype?
		do
			Result := file_repository.is_valid_path (differential_path)
		end

	has_differential_compiled_file: BOOLEAN
			-- Does the compile generated area have a differential file for this archetype from a previous compile?
			-- If it is newer than the source file, it can be read instead
		do
			Result := file_system.file_exists (differential_compiled_path)
		end

	has_flat_compiled_file: BOOLEAN
			-- Does the compile generated area have a flat file for this archetype from a previous compile?
			-- If it is newer than the source file, it can be read instead
		do
			Result := file_repository.is_valid_path (flat_compiled_path)
		end

feature -- File Management (Legacy)

	legacy_flat_path: detachable STRING
			-- Path of legacy flat file of archetype.

	legacy_flat_text_original: detachable STRING
			-- Original unprocessed text of the legacy archetype, if it exists
		require
			flat_file_available: has_legacy_flat_file
		do
			check attached legacy_flat_path as lfp then
				file_repository.read_text_from_file (lfp)
			end
			Result := file_repository.text
		end

	legacy_flat_text: detachable STRING
			-- Read `legacy_flat_text_converted' and `text_timestamp' from `legacy_flat_path'.
			-- The text of the legacy archetype, if it exists
		require
			flat_file_available: has_legacy_flat_file
		local
			arch_text: STRING
		do
			check attached legacy_flat_path as lfp then
				file_repository.read_text_from_file (lfp)
			end
			check attached file_repository.text as t then
				arch_text := t
			end
			adl_14_15_rewriter.execute (arch_text)
			Result := adl_14_15_rewriter.out_buffer
			legacy_flat_text_timestamp := legacy_flat_file_timestamp
		end

	legacy_flat_file_timestamp: INTEGER
			-- Date and time at which the legacy archetype file was last modified, as reported by file-system
		require
			Has_legacy_file: has_legacy_flat_file
		do
			check attached legacy_flat_path as lfp then
				Result := file_system.file_time_stamp (lfp)
			end
		ensure
			Result > 0
		end

	legacy_flat_text_timestamp: INTEGER
			-- File modification date/time when legacy flat file was last read

	has_legacy_flat_file: BOOLEAN
			-- Does the repository have a legacy flat-form file for this archetype?
		do
			Result := attached legacy_flat_path as lfp and then file_repository.is_valid_path (lfp)
		end

	is_legacy: BOOLEAN
		do
			Result := attached legacy_flat_path
		end

	is_text_converted: BOOLEAN
			-- was last text converted from original form?

feature -- Artefacts

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

	serialised_differential_archetype: detachable STRING
		do
			if attached differential_archetype as da then
				Result := adl_15_engine.serialise (da, Syntax_type_adl, current_archetype_language)
			end
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
				Result := adl_15_engine.serialise (flat_archetype_with_rm, Syntax_type_adl, current_archetype_language)
			else
				Result := adl_15_engine.serialise (flat_archetype, Syntax_type_adl, current_archetype_language)
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
					Result.append("_valid_" + file_repository.group_id.out)
				else
					Result.append("_warning_" + file_repository.group_id.out)
				end
			when Cs_validate_failed, cs_suppliers_invalid then
				Result.append("_parsed_" + file_repository.group_id.out)
			when Cs_parse_failed, cs_convert_legacy_failed, cs_lineage_invalid then
				Result.append("_parse_failed_" + file_repository.group_id.out)
			else
				Result.append("_" + file_repository.group_id.out)
			end
		end

	slot_id_index: HASH_TABLE [ARRAYED_SET[STRING], STRING]
			-- list of Archetype ids matching slots, keyed by slot path
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
			if not Result and attached suppliers_index as supp_idx then
				Result := across supp_idx as supp_idx_csr some supp_idx_csr.item.last_compile_attempt_timestamp > last_compile_attempt_timestamp end
			end
		end

	is_source_modified: BOOLEAN
			-- Should this archetype be recompiled due to changes on the file system?
		do
			Result := has_differential_file and is_differential_file_modified or
				 has_legacy_flat_file and is_legacy_file_modified
		end

	is_in_terminal_compilation_state: BOOLEAN
		do
			Result := Cs_terminal_states.has (compilation_state)
		end

	ontology_location_changed: BOOLEAN
			-- True if changed due to external editing require a move of this archetype in ontology
			-- cleared by calling `clear_old_ontological_parent_name'
		do
			Result := attached old_ontological_parent_name
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

	is_differential_generated: BOOLEAN
			-- True if the differential form was generated from the flat form

feature -- Compilation

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
							add_error (ec_compile_e1, <<parent_id.as_string>>)
						end
					when cs_ready_to_parse_legacy then
						if is_specialised and not specialisation_ancestor.is_valid then
							compilation_state := cs_lineage_invalid
							add_error (ec_compile_e1, <<parent_id.as_string>>)
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
						if adl_15_roundtripping or (has_legacy_flat_file and not has_differential_file) then
							save_differential_validated
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
					add_error (ec_compile_exception, <<id.as_string, att_meaning, att_exc_trace>>)
				end
			end
		ensure
			Compilation_timestamped: last_compile_attempt_timestamp /= Time_epoch
		rescue
			if has_legacy_flat_file and compilation_state = Cs_ready_to_parse then
				clean_generated
				retry
			else
				exception_encountered := True
			end
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
				current_arch_cat.decrement_compile_attempt_count
			end

			differential_archetype := Void
			flat_archetype_cache := Void
			last_compile_attempt_timestamp := Time_epoch
			compilation_state := Cs_unread
		ensure
			Differential_archetype_cleared: differential_archetype = Void
			Compiler_state_set: compilation_state = Cs_unread
		end

	signal_source_edited
			-- signal source file changed on disk
		local
			amp: ARCHETYPE_MINI_PARSER
			old_ont_parent: STRING
		do
			-- TODO: first check that there is not a more recent modification to the in-memory structure.

			-- now deal with changes from file
			create amp
			if is_legacy_file_modified and attached legacy_flat_path as lfp then
				amp.parse (lfp)
			elseif is_differential_file_modified then
				amp.parse (differential_path)
			end
			if amp.passed then
				if artefact_type.value /= amp.last_archetype.artefact_type then
					create artefact_type.make (amp.last_archetype.artefact_type)
				end

				-- check for changes in id or parent id that might mean this node has to be moved in ARCHETYPE_DIRECTORY
				-- possible changes:
				-- 	* parent_id changed
				-- 	* changed from specialised to non-specialised
				old_ont_parent := ontological_parent_name
				if not amp.last_archetype.archetype_id.is_equal (id) then
					old_id := id
					id := amp.last_archetype.archetype_id
				end
				if amp.last_archetype.is_specialised then
					check attached parent_id as pid then
						if not amp.last_archetype.parent_archetype_id.is_equal (pid) then
							old_ontological_parent_name := old_ont_parent
							parent_id := amp.last_archetype.parent_archetype_id
						end
					end
				end
				signal_from_scratch
			else
				add_error (ec_general, <<amp.error_strings>>)
				compilation_state := Cs_invalid
			end
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
				add_error (ec_compile_e2, <<suppliers_index.item_for_iteration.id.as_string>>)
			end
		ensure
			Compilation_state_set: (<<Cs_ready_to_validate, cs_suppliers_invalid>>).has (compilation_state)
		end

	signal_differential_edited
			-- signal event of differential in-memory being changed by editing at UI
		do
			compilation_state := cs_ready_to_validate
			clear_cache
		ensure
			Compilation_state_set: compilation_state = Cs_ready_to_validate
		end

	clean_generated
			-- delete generated file and compiler products; forces next compilation to start from primary expression
		local
			flat_path: STRING
		do
			status.wipe_out
			if is_differential_generated then
				if has_differential_file then
					file_repository.delete_file (differential_path)
					status.append (get_msg_line ("clean_generated_file", <<differential_path>>))
				end
				signal_from_scratch
			end

			-- FIXME: The following code is only needed for a period of time during which legacy users
			-- may have generated .adlf files into their source repositories; in the future, this will
			-- never happen, so the code below can be removed (e.g. at release following ADL 1.5 release)
			flat_path := extension_replaced (differential_path, File_ext_archetype_flat)
			if file_repository.is_valid_path (flat_path) then
				file_repository.delete_file (flat_path)
			end
		ensure
			Reset_if_differential_generated: is_differential_generated implies (differential_archetype = Void and compilation_state = Cs_unread)
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
			if compilation_state /= Cs_rm_class_unknown then
				if has_legacy_flat_file and then (is_legacy_file_modified or
					is_legacy_newer_than_differential or
					has_differential_file and differential_file_timestamp < application_file_time_stamp)
				then
					compilation_state := Cs_ready_to_parse_legacy
				elseif has_differential_file then -- either authored in ADL 1.5, or compiled successfully from legacy .adl file
					if is_specialised then
						compilation_state := Cs_lineage_known
					else
						compilation_state := Cs_ready_to_parse
					end
				elseif attached differential_archetype then -- must have been newly created
					compilation_state := Cs_validated
				end
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
			Legacy_file_available: has_legacy_flat_file
		local
			legacy_flat_archetype: detachable FLAT_ARCHETYPE
			archetype_comparator: ARCHETYPE_COMPARATOR
		do
			flat_archetype_cache := Void

			-- perform the parse; this can fail, i.e. no result generated
			check attached legacy_flat_text as lft then
				legacy_flat_archetype := adl_14_engine.parse (lft, Current)
			end
		 	compilation_state := Cs_parsed
			if attached legacy_flat_archetype as flat_arch then
				add_info (ec_compile_legacy_i1, <<id.as_string>>)

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
					else
						compilation_state := cs_lineage_invalid
						add_error (ec_compile_e1, <<parent_id.as_string>>)
					end
				else
					-- perform post-parse object structure finalisation
					adl_14_engine.post_parse_151_convert (flat_arch, Current)

					-- perform standard post-parse processing
					adl_14_engine.post_parse_process (flat_arch, Current)
					create differential_archetype.make_from_flat (flat_arch)
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
			Has_differential_file: has_differential_file
		do
			add_info (ec_parse_i2, Void)
			flat_archetype_cache := Void
			differential_archetype := adl_15_engine.parse (differential_text, Current)
		 	compilation_state := Cs_parsed
			if attached differential_archetype as diff_arch then
				if is_specialised and then attached parent_id as pid and then attached diff_arch.parent_archetype_id as da_pid and then not pid.is_equal (da_pid) then
					add_warning (ec_parse_w1, <<id.as_string, pid.as_string, da_pid.as_string>>)
				else
					add_info (ec_parse_i1, <<id.as_string>>)
				end

				-- perform post-parse object structure finalisation
				if not diff_arch.adl_version.is_equal (latest_adl_version) then
					adl_15_engine.post_parse_151_convert (diff_arch, Current)
				end

				-- perform post-parse object structure finalisation
				adl_15_engine.post_parse_process (diff_arch, Current)
			else
				compilation_state := Cs_parse_failed
			end

			-- pick up all errors & warnings
			merge_errors (adl_15_engine.errors)
			status.prepend (errors.as_string_filtered (True, True, False))
		ensure
			Compilation_state: compilation_state = Cs_parsed or compilation_state = Cs_parse_failed
			Archetype_state: compilation_state = Cs_parsed implies attached differential_archetype
		end

	evaluate_suppliers
			-- Parse archetype, in differential form if available, else in legacy flat form.
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

			-- determine the suppliers list for ongoing compilation; exclude the current archetype to avoid an infinite recursion
			create suppliers_index.make (0)
			across diff_arch.suppliers_index as supp_idx_csr loop
				if current_arch_cat.has_archetype_id_for_ref (supp_idx_csr.key) and then
					attached current_arch_cat.matching_archetype (supp_idx_csr.key) as supp_arch and then
					not supp_arch.id.as_string.is_case_insensitive_equal (id.as_string)
				then
					suppliers_index.put (supp_arch, supp_arch.id.as_string)
				end
			end
			if not suppliers_index.is_empty then
				compilation_state := Cs_suppliers_known
			else
				compilation_state := Cs_ready_to_validate
			end

			-- determine what language to view archetype in
			if archetype_view_language.is_empty or not diff_arch.has_language (archetype_view_language) then
				set_archetype_view_language (diff_arch.original_language.code_string)
			end
		ensure
			Compilation_state: compilation_state = Cs_suppliers_known or compilation_state = Cs_ready_to_validate
		end

	validate
			-- Perform validation on `differential_archetype'.
			-- Compilation state change:
			--	validated succeeded: Cs_ready_to_validate --> Cs_validated_phase_2
			--	validate failed: Cs_ready_to_validate --> Cs_validate_failed
		do
			-- phase 1: validate archetype stand-alone
			adl_15_engine.phase_1_validate (Current)
			merge_errors (adl_15_engine.errors)

			if adl_15_engine.validation_passed then
				compilation_state := Cs_validated_phase_1

	 			-- phase 2: validate archetype against flat parent
				adl_15_engine.phase_2_validate (Current)
				merge_errors (adl_15_engine.errors)

				if adl_15_engine.validation_passed then
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
			flat_archetype_cache := Void

			-- phase 3: validate flattened archetype
			adl_15_engine.phase_3_validate (Current)
			merge_errors (adl_15_engine.errors)
			if adl_15_engine.validation_passed then
				add_info (ec_parse_archetype_i2, <<id.as_string>>)
				compilation_state := Cs_validated
				-- not yet in use
				--	adl_15_engine.post_compile_process (Current)
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
			-- extract reference archetype marker, if it exists
			if attached differential_archetype.description as desc and then attached desc.other_details as dets and then dets.has ("model_level") then
				is_reference_archetype := dets.item ("model_level").is_equal ("reference")
			end
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
				create archetype_comparator.make_create_differential (Current)
				check attached archetype_comparator.differential_output as da then
					Result := da
				end
			else
				create Result.make_from_flat (flat_archetype)
			end
		end

feature -- File Operations (1.5.1 format upgrade)

	differential_serialised: detachable STRING
			-- serialise differential archetype to its file in its source form, even if not compiling
			-- this might fail because the serialiser might try to do something that an invalid archetype
			-- can't support
		local
			exception_occurred: BOOLEAN
		do
			if not exception_occurred then
				if attached differential_archetype as da then
					Result := adl_15_engine.serialise (da, Syntax_type_adl, da.original_language.code_string)
				end
			end
		rescue
			exception_occurred := True
		end

	save_differential_text
			-- Save converted differential archetype to its file in its source form, even if not compiling
		local
			ftext: STRING
		do
			if attached differential_serialised as txt then
				ftext := txt
				source_file_adl_version := differential_archetype.adl_version
			else
				ftext := differential_text
			end
			file_repository.save_text_to_file (differential_path, ftext)
			differential_text_timestamp := differential_file_timestamp
			status := get_msg_line ("file_saved_as_in_format", <<differential_path, Syntax_type_adl>>)
		ensure
			differential_text_timestamp = differential_file_timestamp
		end

feature -- File Operations

	save_differential_validated
			-- Save archetype to its file in its source form
		require
			is_valid_differential
		local
			serialised_diff: STRING
		do
			check attached differential_archetype as da then
				serialised_diff := adl_15_engine.serialise (da, Syntax_type_adl, current_archetype_language)
				file_repository.save_text_to_file (differential_path, serialised_diff)
				source_file_adl_version := da.adl_version
			end
			differential_text_timestamp := differential_file_timestamp
			status := get_msg_line ("file_saved_as_in_format", <<differential_path, Syntax_type_adl>>)
		ensure
			differential_text_timestamp = differential_file_timestamp
		end

	save_differential_as (a_full_path, a_format: STRING)
			-- Save current source archetype to `a_full_path' in `a_format'.
		require
			Archetype_valid: is_valid
			path_valid: not a_full_path.is_empty
			Serialise_format_valid: has_serialiser_format (a_format)
		do
			if has_archetype_native_serialiser_format (a_format) and attached differential_archetype as da then
				file_repository.save_text_to_file (a_full_path, adl_15_engine.serialise (da, a_format, current_archetype_language))
			else -- must be a DT serialisation format
				file_repository.save_text_to_file (a_full_path, serialise_object (False, a_format))
			end
			status := get_msg_line ("file_saved_as_in_format", <<a_full_path, a_format>>)
		end

	save_flat_as (a_full_path, a_format: STRING)
			-- Save current flat archetype to `a_full_path' in `a_format'.
		require
			Archetype_valid: is_valid
			path_valid: not a_full_path.is_empty
			Serialise_format_valid: has_serialiser_format (a_format)
		do
			if a_format.same_string (Syntax_type_adl) then
				file_repository.save_text_to_file (a_full_path, flat_serialised (False))
			elseif has_archetype_native_serialiser_format (a_format) then
				file_repository.save_text_to_file (a_full_path, adl_15_engine.serialise (flat_archetype, a_format, current_archetype_language))
			else -- must be a DT serialisation format
				file_repository.save_text_to_file (a_full_path, serialise_object (True, a_format))
			end
			status := get_msg_line ("file_saved_as_in_format", <<a_full_path, a_format>>)
		end

	save_legacy_to (a_full_path: STRING)
			-- Save current legacy archetype, if it exists to `a_full_path' in `serialise_format'.
		require
			Archetype_valid: is_valid
			Archetype_has_legacy: has_legacy_flat_file
			path_valid: not a_full_path.is_empty
		do
			check attached legacy_flat_text as lft then
				file_repository.save_text_to_file (a_full_path, lft)
			end
			status := get_msg_line ("file_saved_as_in_format", <<a_full_path, file_ext_archetype_adl14>>)
		end

	save_compiled_differential
			-- save validated differential archetype in fast-retrieve form (ODIN)
		require
			Archetype_valid: is_valid
		local
			fd: PLAIN_TEXT_FILE
		do
			create fd.make_create_read_write (differential_compiled_path)
			fd.put_string (serialise_object (False, Syntax_type_odin))
			fd.close
		end

	save_compiled_flat
		require
			Archetype_valid: is_valid
		local
			fd: PLAIN_TEXT_FILE
		do
			create fd.make_create_read_write (flat_compiled_path)
			fd.put_string (serialise_object (True, Syntax_type_odin))
			fd.close
		end

	read_compiled_differential: STRING
		require
			has_differential_compiled_file
		local
			fd: PLAIN_TEXT_FILE
			odin_text: STRING
		do
			create Result.make_empty
			if file_system.file_exists (differential_compiled_path) then
				-- read the serialised P_ARCHETYPE (ODIN format) file
				create fd.make_open_read (differential_compiled_path)
				fd.read_stream (fd.count)
				odin_text := fd.last_string
				fd.close

				-- parse the ODIN to DT then materialise to AOM
				archetype_serialise_engine.set_source (odin_text, 1)
				archetype_serialise_engine.parse
				if archetype_serialise_engine.parse_succeeded then
					if attached {P_ARCHETYPE} archetype_serialise_engine.tree.as_object (({P_ARCHETYPE}).type_id, <<>>) as p_archetype then
						if attached {DIFFERENTIAL_ARCHETYPE} p_archetype.create_archetype as an_arch then
							-- serialise into normal ADL format
							Result := adl_15_engine.serialise (an_arch, Syntax_type_adl, current_archetype_language)
						end
					end
				end
			end
		end

feature -- Output

	serialise (flat_flag: BOOLEAN; a_format: STRING): STRING
			-- serialise current archetype in `a_format'.
		require
			Archetype_valid: is_valid
			Serialise_format_valid: has_serialiser_format (a_format)
		do
			if a_format.same_string (Syntax_type_adl) then
				if flat_flag then
					Result := flat_serialised (False)
				else
					Result := differential_text
				end
			elseif has_archetype_native_serialiser_format (a_format) then
				if flat_flag then
					check attached flat_archetype as fa then
						Result := adl_15_engine.serialise (fa, a_format, current_archetype_language)
					end
				else
					check attached differential_archetype as da then
						Result := adl_15_engine.serialise (da, a_format, current_archetype_language)
					end
				end
			else -- must be a DT serialisation format
				Result := serialise_object (flat_flag, a_format)
			end
		end

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

feature {ARCH_CAT_ITEM, ARCHETYPE_CATALOGUE} -- Implementation

	children: detachable SORTED_TWO_WAY_LIST [ARCH_CAT_ARCHETYPE]
			-- list of child nodes

feature {NONE} -- Implementation

	file_repository: ARCHETYPE_REPOSITORY_I
			-- The repository on which this item is found.

	current_archetype_language: STRING
			-- find a language from the current archetype that matches `archetype_view_language' either directly
			-- (e.g. "en" matches "en") or on a language group basis (e.g. "en-GB" matches "en"); if
			-- none found, return archetype original language
		require
			is_valid_differential
		do
			if differential_archetype.has_language (archetype_view_language) then
				Result := archetype_view_language
			elseif differential_archetype.has_matching_language_tag (archetype_view_language) then
				Result := differential_archetype.matching_language_tag (archetype_view_language)
			else
				Result := differential_archetype.original_language.code_string
			end
		end

	set_compile_attempt_timestamp
			-- Set `compile_attempt_timestamp'
		do
			if not compile_attempted then
				current_arch_cat.update_compile_attempt_count
			end
			create last_compile_attempt_timestamp.make_now
		end

	flatten (include_rm: BOOLEAN)
			-- (re)generate flat-form of this archetype
		require
			is_valid
		do
			arch_flattener.flatten (include_rm)
			flat_archetype_cache := arch_flattener.arch_output_flat
			last_include_rm := include_rm
		ensure
			flat_archetype_cache_attached: attached flat_archetype_cache
		end

	flat_archetype_cache: detachable FLAT_ARCHETYPE
			-- archetype generated by flattening process

	archetype_serialise_engine: ODIN_ENGINE
		once
			create Result.make
		end

	last_include_rm: BOOLEAN
			-- which kind of flattening was last used? Used to know whether to regenerate flat or not

	arch_flattener: ARCHETYPE_FLATTENER
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
--			flat_archetype_clone_cache := Void
--			if has_gui_context then
--				gui_context.clear
--			end
		end

	set_archetype_default_details (an_arch: DIFFERENTIAL_ARCHETYPE)
		do
			an_arch.description.put_original_author_item ("name", author_name)
			an_arch.description.put_original_author_item ("organisation", author_org)
			an_arch.description.set_lifecycle_state (Resource_lifecycle_states.first)
			an_arch.description.add_original_language_details
			an_arch.description.detail_for_original_language.set_copyright (author_copyright)
		end

	compute_slot_id_index
			-- generate `slot_id_index_cache' and `clients_index' of client archetype descriptors
		require
			compilation_state >= Cs_validated_phase_1
		local
			includes, excludes: ARRAYED_LIST[ASSERTION]
			slot_idx: like slot_id_index
		do
			if is_specialised then
				slot_idx := specialisation_ancestor.slot_id_index
			else
				create slot_idx.make (0)
			end
			slot_id_index_cache := slot_idx

			across differential_archetype.slot_index as slots_csr loop
				includes := slots_csr.item.includes
				excludes := slots_csr.item.excludes
				if not includes.is_empty and not includes.first.matches_any then
					if not excludes.is_empty then -- create specific match list from includes constraint
						across includes as includes_csr loop
							if attached {STRING} includes_csr.item.regex_constraint.constraint_regex as a_regex then
								add_slot_ids (slot_idx, current_arch_cat.matching_ids (a_regex, slots_csr.item.rm_type_name, Void), slots_csr.item.path)
							end
						end
					else -- excludes = empty ==> includes is just a recommendation => match all archetype ids of RM type
						add_slot_ids (slot_idx, current_arch_cat.matching_ids (Regex_any_pattern, slots_csr.item.rm_type_name, id.rm_closure), slots_csr.item.path)
					end
				elseif not excludes.is_empty and not excludes.first.matches_any then
					add_slot_ids (slot_idx, current_arch_cat.matching_ids (Regex_any_pattern, slots_csr.item.rm_type_name, Void), slots_csr.item.path)
					if not includes.is_empty then -- means excludes is not a recommendation; need to actually process it
						across excludes as excludes_csr loop
							if attached {STRING} excludes_csr.item.regex_constraint.constraint_regex as a_regex then
								across current_arch_cat.matching_ids (a_regex, slots_csr.item.rm_type_name, id.rm_closure) as ids_csr loop
									slot_idx.item (slots_csr.item.path).prune (ids_csr.item)
								end
							end
						end
					end
				else
					add_slot_ids (slot_idx, current_arch_cat.matching_ids (Regex_any_pattern, slots_csr.item.rm_type_name, id.rm_closure), slots_csr.item.path)
				end

				-- now post the results in the reverse indexes
				across slot_idx.item (slots_csr.item.path) as ids_csr loop
					check attached current_arch_cat.archetype_index.item (ids_csr.item) as ara then
						if not attached ara.clients_index or else not ara.clients_index.has (id.as_string) then
							ara.add_client (id.as_string)
						end
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

	legacy_text_timestamp_valid: has_legacy_flat_file implies legacy_flat_text_timestamp > 0
	differential_text_timestamp_valid: has_differential_file implies differential_text_timestamp > 0

	differential_archetype_attached_if_valid: is_valid implies attached differential_archetype
	flat_archetype_attached_if_valid: is_valid implies flat_archetype /= Void

	parent_existence: specialisation_ancestor /= Void implies is_specialised
	parent_validity: (specialisation_ancestor /= Void and not ontology_location_changed) implies parent_id.is_equal (specialisation_ancestor.id)
	clients_index_valid: clients_index /= Void implies not clients_index.is_empty

end



