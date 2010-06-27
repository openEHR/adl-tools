note
	component:   "openEHR Archetype Project"
	description: "Descriptor of an archetype in a directory of archetypes"
	keywords:    "ADL, archetype"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.com>"
	copyright:   "Copyright (c) 2006-2010 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL: http://www.openehr.org/svn/ref_impl_eiffel/TRUNK/components/archetype_repository/src/directory/arch_rep_archetype.e $"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate: 2008-05-17 15:32:35 +0100 (Sat, 17 May 2008) $"


class ARCH_REP_ARCHETYPE

inherit
	SHARED_KNOWLEDGE_REPOSITORY
		undefine
			is_equal
		end

	SHARED_REFERENCE_MODEL_ACCESS
		export
			{NONE} all
		undefine
			is_equal
		end

	SHARED_MESSAGE_DB
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
			{ANY} has_archetype_serialiser_format, archetype_serialiser_formats
		undefine
			is_equal
		end

	ARCH_REP_ITEM
		rename
			make as make_item
		redefine
			child_type
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

	EXCEPTIONS
		export
			{NONE} all
		undefine
			is_equal
		end

create
	make, make_specialised

feature {NONE} -- Initialisation

	make (a_full_path: STRING; an_id: attached ARCHETYPE_ID; a_repository: ARCHETYPE_REPOSITORY_I; an_artefact_type: INTEGER)
			-- Create for the archetype with `an_id', stored at `a_full_path', belonging to `a_repository'.
			-- Can be created with a .adl or .adls file name extension
		require
			repository_attached: a_repository /= Void
			full_path_attached: a_full_path /= Void
			valid_artefact_type: (create {ARTEFACT_TYPE}.default_create).valid_type(an_artefact_type)
		do
			make_item
			create status.make_empty
			create compilation_result.make_empty

			id := an_id
			full_path := a_full_path
			file_repository := a_repository
			artefact_type := an_artefact_type
			artefact_name := (create {ARTEFACT_TYPE}).simplified_type_names.item(artefact_type)

			-- FIXME: the following should be changed one day so that legacy archetypes are
			-- kept completely separate from source archetypes
			if file_system.has_extension (full_path, archetype_source_file_extension) then
				differential_path := full_path
				flat_path := extension_replaced (full_path, archetype_flat_file_extension)
				legacy_flat_path := extension_replaced (full_path, archetype_legacy_file_extension)
				compilation_state := Cs_ready_to_parse
			else
				differential_path := extension_replaced (full_path, archetype_source_file_extension)
				flat_path := extension_replaced (full_path, archetype_flat_file_extension)
				legacy_flat_path := full_path
				if has_differential_file then
					compilation_state := Cs_ready_to_parse
				else
					compilation_state := cs_ready_to_parse_legacy
				end
			end

			-- set reference to RM schema
			if has_rm_schema_for_package (id.qualified_package_name) then
				rm_schema := rm_schema_for_package (id.qualified_package_name)
			else
				compilation_state := Cs_rm_class_unknown
				post_error (Current, "make", "model_access_e7", <<id.qualified_rm_name>>)
			end
		ensure
			full_path_set: full_path = a_full_path
			file_repository_set: file_repository = a_repository
			id_set: id = an_id
			compilation_result_empty: compilation_result.is_empty
			compilation_state_set: compilation_state = Cs_ready_to_parse or compilation_state = cs_ready_to_parse_legacy or compilation_state = Cs_rm_class_unknown
		end

	make_specialised (a_full_path: STRING; an_id, a_parent_id: attached ARCHETYPE_ID; a_repository: ARCHETYPE_REPOSITORY_I; an_artefact_type: INTEGER)
			-- Create for the archetype with `an_id', stored at `a_full_path', belonging to `a_repository' at `a_root_path'.
			-- Can be created with a .adl or .adls file name extension
		require
			repository_attached: a_repository /= Void
			full_path_attached: a_full_path /= Void
			valid_artefact_type: (create {ARTEFACT_TYPE}.default_create).valid_type(an_artefact_type)
		do
			make (a_full_path, an_id, a_repository, an_artefact_type)
			is_specialised := True
			parent_id := a_parent_id
			if compilation_state = Cs_ready_to_parse then
				compilation_state := Cs_lineage_known
			end
		ensure
			full_path_set: full_path = a_full_path
			file_repository_set: file_repository = a_repository
			id_set: id = an_id
			compilation_result_empty: compilation_result.is_empty
			Specialised: is_specialised
			parent_id_set: parent_id = a_parent_id
			compilation_state_set: compilation_state = Cs_lineage_known or compilation_state = cs_ready_to_parse_legacy or compilation_state = Cs_rm_class_unknown
		end

feature -- Access

	compilation_state: INTEGER
			-- current compilation state, obeying the state machine described above

	compilation_result: STRING
			-- errors from last compile attempt; allows redisplay if this archetype is reselected

	status: STRING
			-- status of last operation

	full_path: STRING
			-- Full path to the item on the storage medium.

	relative_path: STRING
			-- a path derived from the ontological path of the nearest folder node + archetype_id
		local
			csr: ARCH_REP_ITEM
			arf: ARCH_REP_MODEL_NODE
		do
			create Result.make(0)
			from csr := parent until csr = Void or arf /= Void loop
				arf ?= csr
				csr := csr.parent
			end
			Result := arf.ontological_path + Ontological_path_separator + id.as_string
		ensure
			Result_exists: Result /= Void
		end

	file_repository: ARCHETYPE_REPOSITORY_I
			-- The repository on which this item is found.

	differential_path: STRING
			-- Path of differential source file of archetype.

	flat_path: STRING
			-- Path of generated flat file of archetype.

	legacy_flat_path: STRING
			-- Path of legacy flat file of archetype.

	rm_schema: SCHEMA_ACCESS
			-- set if this archetype has a valid package-class_name

	artefact_type: INTEGER
			-- type of artefact i.e. archetype, template, template_component, operational_template
			-- see ARTEFACT_TYPE class

	id: attached ARCHETYPE_ID
			-- Archetype identifier.

	old_id: ARCHETYPE_ID
			-- previous archetype identifier of this archetype, if changes occurred due to editing.

	parent_id: attached ARCHETYPE_ID
			-- Archetype identifier of specialisation parent

	suppliers_index: HASH_TABLE [ARCH_REP_ARCHETYPE, STRING]
			-- list of descriptors of slot fillers or other external references, keyed by archetype id
			-- currently generated only from C_ARCHETYPE_ROOT index in archetype

	clients_index: ARRAYED_LIST [STRING]
			-- list of archetype_ids of archetypes that use this archetype

	ontological_name: STRING
		do
			Result := id.as_string
		end

	ontological_parent_name: STRING
			-- semantic name of parent node in ontology tree
			-- For top-level archetypes e.g. openEHR-EHR-OBSERVATION.thing.v1, it will be the name of teh folder, e.g. EHR-OBSERVATION
			-- for specialised archetypes, e.g. openEHR-EHR-OBSERVATION.specialised_thing.v1, it will be the id of the parent, e.g. openEHR-EHR-OBSERVATION.thing.v1
		do
			if is_specialised then
				Result := parent_id.as_string
			else
				Result := id.package_class_name
			end
		end

	display_name: STRING
		do
			Result := id.domain_concept
		end

	differential_text: STRING
			-- The text of the archetype source file, i.e. the differential form.

	flat_text: STRING
			-- The text of the flat form of the archetype
		do
			if is_valid then
				if flat_archetype = Void then
					flatten
				end
				if flat_text_cache = Void then
					flat_text_cache := adl_engine.serialise(flat_archetype, Archetype_native_syntax)
				end
			end
			Result := flat_text_cache
		end

	legacy_flat_text: STRING
			-- The text of the legacy archetype, if it exists

	legacy_flat_text_timestamp: INTEGER
			-- Date and time at which the archetype flat file was last modified.

	differential_text_timestamp: INTEGER
			-- Date and time at which the archetype differential file was last modified.

	last_compile_attempt_timestamp: DATE_TIME
			-- time last compile attempt made, set by set_parse_attempted

	specialisation_parent: ARCH_REP_ARCHETYPE
		do
			Result ?= parent
		end

	archetype_lineage: attached ARRAYED_LIST [ARCH_REP_ARCHETYPE]
			-- lineage of archetypes from parent to this one, inclusive of the current one.
			-- For non-specialised archetypes, contains just the top-level archetype.
			-- FIXME: in theory this could be precomputed from ARCH_DIRECTORY, but modifications to
			-- the directory structure would mean always recomputing parts of it. This computation
			-- is not particularly expensive anyway...however, the result could be cached on a per-
			-- instance basis to be more efficient
		local
			csr: ARCH_REP_ARCHETYPE
		do
			create Result.make (1)
			from csr := Current until csr = Void loop
				Result.put_front (csr)
				csr := csr.specialisation_parent
			end
		ensure
			not_empty: not Result.is_empty
			current_last: Result.last = Current
		end

	ontology_lineage: HASH_TABLE [DIFFERENTIAL_ARCHETYPE_ONTOLOGY, INTEGER]
			-- lineage of ontologies of archetypes from top to this one

	differential_archetype: DIFFERENTIAL_ARCHETYPE
			-- archetype representing differential structure with respect to parent archetype;
			-- if this is a non-specialised archetype, then it is the same as the flat form, else
			-- it is just the differences (like an object-oriented source file for a subclass)

	flat_archetype: FLAT_ARCHETYPE
			-- inheritance-flattened form of archetype
		do
			if flat_archetype_cache = Void and is_valid then
				flatten
			end
			Result := flat_archetype_cache
		end

	slot_id_index: DS_HASH_TABLE [ARRAYED_SET[STRING], STRING]
			-- list of Archetype ids matching slot, keyed by slot path

	group_name: STRING
			-- Name distinguishing the type of item and the group to which its `repository' belongs.
			-- Useful as a logical key to pixmap icons, etc.
		do
			create Result.make_empty
			Result.append(artefact_name)

			inspect compilation_state
			when Cs_validated then
				if compilation_result.is_empty then
					Result.append("_valid_" + file_repository.group_id.out)
				else
					Result.append("_warning_" + file_repository.group_id.out)
				end
			when Cs_validate_failed then
				Result.append("_parsed_" + file_repository.group_id.out)
			when Cs_parse_failed, cs_convert_legacy_failed then
				Result.append("_parse_failed_" + file_repository.group_id.out)
			else
				Result.append("_" + file_repository.group_id.out)
			end
		end

	compiler_error_type: INTEGER
			-- generate value from COMPILER_ERROR_TYPES as index for error classification elsewhere
		do
			inspect compilation_state
			when Cs_validated then
				if compilation_result.is_empty then
					Result := Err_type_valid
				else
					Result := Err_type_warning
				end
			when Cs_validate_failed then
				Result := Err_type_validity_error
			else
				Result := Err_type_parse_error
			end
		ensure
			valid: valid_err_type (Result)
		end

feature -- Status Report - Compilation

	has_differential_file: BOOLEAN
			-- Does the repository have a source-form file for this archetype?
		do
			Result := file_repository.is_valid_path (differential_path)
		end

	has_legacy_flat_file: BOOLEAN
			-- Does the repository have a legacy flat-form file for this archetype?
		do
			Result := file_repository.is_valid_path (legacy_flat_path)
		end

	is_out_of_date: BOOLEAN
			-- Should this archetype be reparsed due to changes on the file system?
		do
			Result := last_compile_attempt_timestamp = Void or
				is_differential_out_of_date or is_legacy_flat_out_of_date or
				(specialisation_parent /= Void and then specialisation_parent.last_compile_attempt_timestamp > last_compile_attempt_timestamp)
		end

	is_differential_out_of_date: BOOLEAN
			-- Is differential_archetype out of date with respect to changes on the file system?
		do
			Result := differential_text_timestamp > 0 and file_repository.has_file_changed_on_disk (full_path, differential_text_timestamp)
		end

	is_legacy_flat_out_of_date: BOOLEAN
			-- Is flat_archetype out of date with respect to changes on the file system?
		do
			Result := legacy_flat_text_timestamp > 0 and then file_repository.has_file_changed_on_disk (full_path, legacy_flat_text_timestamp)
		end

	save_succeeded: BOOLEAN
			-- True if last save operation was successful

	exception_encountered: BOOLEAN
			-- True if last operation caused an exception

	is_in_terminal_compilation_state: BOOLEAN
		do
			Result := Cs_terminal_states.has(compilation_state)
		end

feature -- Status Report - Semantic

	is_specialised: BOOLEAN
			-- True if this archetype is a specialisation of another archetype

	is_valid: BOOLEAN
			-- True if archetype object created and 'is_valid' True. This can be used to check if the archetype has
			-- actually been compiled and is available in memory. This is useful for specialised archetypes because
			-- you want to know if the parent has been compiled (up the lineage) before you can compile the current one
		do
			Result := compilation_state = Cs_validated
		end

	has_compiler_status: BOOLEAN
			-- Does this archetype have any compiler errors or warnings?
		do
			Result := not compilation_result.is_empty
		end

	has_slots: BOOLEAN
			-- Does this archetype have any slots?
		do
			Result := slot_id_index /= Void
		end

	is_supplier: BOOLEAN
			-- Is this archetype used by any other archetypes (i.e. matches any of their slots)?
		do
			Result := clients_index /= Void
		end

	differential_generated: BOOLEAN
			-- True if the differential form was generated from the flat form
		do
			Result := differential_archetype /= Void and then differential_archetype.is_generated
		end

	legacy_is_primary: BOOLEAN
			-- True if the flat legacy file is the primary source
		do
			Result := differential_generated
		end

	has_artefacts: BOOLEAN = True
			-- True if there are any archetypes at or below this point

feature -- Status Setting

	reset
			-- reset after exception encountered
		do
			exception_encountered := False
			status.wipe_out
			compilation_result.wipe_out
			billboard.clear
		ensure
			Exception_cleared: not exception_encountered
			Status_cleared: status.is_empty
			Compiler_status_cleared: compilation_result.is_empty
		end

feature -- Commands

	compile
			-- perform as many steps of the compilation process as possible; may be called repeatedly by ARCHETYPE_COMPILER as it
			-- does initial parsing here, finds dependencies, compiles them, comes back here, etc etc
			-- For the moment just a simplistic implementation; we might do a proper state machine one later
		require
			not is_in_terminal_compilation_state
		local
			finished: BOOLEAN
		do
			from
			until
				finished
			loop
				inspect compilation_state
				when cs_ready_to_parse_legacy then
					compile_legacy
				when Cs_ready_to_parse then
					parse
				when Cs_ready_to_validate then
					validate
				else
					finished := True
				end
			end
		end

	signal_lineage_compilation
		require
			compilation_state = Cs_lineage_known
		do
			if specialisation_parent.is_valid then
				compilation_state := Cs_ready_to_parse
			else
				compilation_state := Cs_lineage_compile_failed
			end
		ensure
			Compilation_state: compilation_state = Cs_ready_to_parse or compilation_state = Cs_lineage_compile_failed
		end

	signal_suppliers_compilation
		require
			compilation_state = Cs_suppliers_known
		do
			from suppliers_index.start until suppliers_index.off or not suppliers_index.item_for_iteration.is_valid loop
				suppliers_index.forth
			end
			if suppliers_index.off then
				compilation_state := Cs_ready_to_validate
			else
				compilation_state := cs_suppliers_compile_failed
			end
		ensure
			Compilation_state: compilation_state = Cs_ready_to_validate or compilation_state = cs_suppliers_compile_failed
		end

	compile_legacy
			-- Parse and validate `target', legacy flat form; save differential file if there was none.
			-- Assume that legacy archetypes have no suppliers, i.e. don't include slot-fillers.
			-- This is safe, since this is an ADL 1.5 only construct
		require
			Compilation_state_valid: compilation_state = cs_ready_to_parse_legacy
			No_differential_file: not has_differential_file
		local
			legacy_flat_archetype: FLAT_ARCHETYPE
		do
			if not exception_encountered then
				reset
				set_compile_attempt_timestamp

				read_legacy_flat
				legacy_flat_archetype := adl_engine.parse_flat (legacy_flat_text, rm_schema)
				if legacy_flat_archetype = Void then
					post_error (Current, "compile_legacy", "compile_legacy_e1", <<adl_engine.parse_error_text>>)
				 	compilation_state := Cs_convert_legacy_failed
				else
					post_info (Current, "compile_legacy", "compile_legacy_i1", <<id.as_string>>)
					differential_archetype := legacy_flat_archetype.to_differential
				 	compilation_state := Cs_ready_to_validate
					validate
					-- if differential archetype was generated from an old-style flat, perform path compression
					if differential_archetype.is_valid then
						if differential_archetype.is_specialised then
							differential_archetype.convert_to_differential_paths
						end
				 		save_differential
					end
				end
			else
				post_error (Current, "compile_legacy", "compile_legacy_e2", Void)
			end

			compilation_result.append (billboard.content)
			billboard.clear
		ensure
			Compilation_state: compilation_state = Cs_validated or compilation_state = Cs_validate_failed or compilation_state = Cs_convert_legacy_failed
			Differential_file: compilation_state = Cs_validated implies has_differential_file
		rescue
			post_error (Current, "compile_legacy", "report_exception", <<exception.out, exception_trace>>)
			exception_encountered := True
			retry
		end

	parse
			-- Parse `target', in differential form if available, else in legacy flat form.
			-- Comilation state changes:
			-- parse succeeded: Cs_ready_to_parse --> Cs_suppliers_known
			-- parse failed: Cs_ready_to_parse --> Cs_parse_failed
		require
			Initial_state: compilation_state = Cs_ready_to_parse
			Has_differential_file: has_differential_file
		local
			supp_idx: HASH_TABLE[ARRAYED_LIST[C_ARCHETYPE_ROOT], STRING]
		do
			if not exception_encountered then
				reset
				set_compile_attempt_timestamp

				post_info (Current, "parse", "parse_i2", Void)
				read_differential
				differential_archetype := adl_engine.parse_differential (differential_text, rm_schema)
				flat_archetype_cache := Void
				if differential_archetype = Void then
					post_error (Current, "parse", "parse_e1", <<adl_engine.parse_error_text>>)
					compilation_state := Cs_parse_failed
				else
					if differential_archetype.is_specialised and not parent_id.is_equal(differential_archetype.parent_archetype_id) then
						post_warning (Current, "parse", "parse_w1", <<id.as_string, parent_id.as_string, differential_archetype.parent_archetype_id.as_string>>)
					else
						post_info (Current, "parse", "parse_i1", <<id.as_string>>)
						-- reset id, since this could have changed due to editing
						if not differential_archetype.archetype_id.as_string.is_equal(id.as_string) then
							old_id := id
							create id.make_from_string (differential_archetype.archetype_id.as_string)
							arch_dir.update_archetype_id(old_id.as_string, id.as_string)
						end
					end
					create suppliers_index.make (0)
					if differential_archetype.has_suppliers then
						supp_idx := differential_archetype.suppliers_index
						from supp_idx.start until supp_idx.off loop
							suppliers_index.put (arch_dir.archetype_index.item (supp_idx.key_for_iteration), supp_idx.key_for_iteration)
							supp_idx.forth
						end
						compilation_state := Cs_suppliers_known
					else
						compilation_state := Cs_ready_to_validate
					end
				end
			else
				post_error (Current, "parse", "parse_e3", Void)
			end

			compilation_result := billboard.content
			billboard.clear
		ensure
			Compilation_state: compilation_state = Cs_suppliers_known or compilation_state = Cs_ready_to_validate or compilation_state = Cs_parse_failed
		rescue
			post_error (Current, "parse", "report_exception", <<exception.out, exception_trace>>)
			exception_encountered := True
			retry
		end

	validate
			-- Perform validation on `differential_archetype'.
			-- Compilation state change:
			--	validated succeeded: Cs_ready_to_validate --> Cs_validated
			--	validate failed: Cs_ready_to_validate --> Cs_validate_failed
		require
			Initial_state: compilation_state = Cs_ready_to_validate
		local
			validator: ARCHETYPE_VALIDATOR
		do
			create validator.make (Current, rm_schema)
			if validator.passed then
				validator.validate
				if validator.passed then
					post_info (Current, "validate", "parse_archetype_i2", <<id.as_string>>)
					compilation_state := Cs_validated
				else
					post_error (Current, "validate", "parse_archetype_e2", <<id.as_string, validator.errors>>)
					compilation_state := Cs_validate_failed
				end

				if validator.has_warnings then
					post_warning (Current, "validate", "parse_archetype_w2", <<id.as_string, validator.warnings>>)
				end
			else
				post_error (Current, "validate", "parse_archetype_e2", <<id.as_string, validator.errors>>)
				compilation_state := Cs_validate_failed
			end
			differential_archetype.set_is_valid (validator.passed)

			compilation_result.append (billboard.content)
			billboard.clear
		ensure
			Compilation_state: compilation_state = Cs_validated or compilation_state = Cs_validate_failed
		end

	clean_generated
			-- delete generated file and compiler products; forces next compilation to start from primary expression
		do
			if differential_generated then
				if has_differential_file then
					file_system.delete_file (differential_path)
					status := create_message_line ("clean_generated_file", <<differential_path>>)
				end
				differential_text := Void
				differential_text_timestamp := 0
			end
			if file_repository.is_valid_path (flat_path) then
				file_system.delete_file (flat_path)
			end
			flat_text_cache := Void
		end

feature {ARCHETYPE_VALIDATOR} -- Modification

	add_slot_ids (a_list: ARRAYED_SET[STRING]; a_slot_path: STRING)
			-- add list of matching archetypes to ids recorded for slot at a_slot_path
		do
			if slot_id_index = Void then
				create slot_id_index.make (0)
			end
			if not slot_id_index.has (a_slot_path) then
				slot_id_index.force (a_list, a_slot_path)
				a_list.compare_objects
			else
				slot_id_index.item (a_slot_path).merge (a_list)
			end
		end

	add_client (an_archetype_id: STRING)
			-- add the id of an archetype that has a slot that matches this archetype, i.e. that 'uses' this archetype
		do
			if clients_index = Void then
				create clients_index.make (0)
				clients_index.compare_objects
			end
			clients_index.extend (an_archetype_id)
		end

feature -- Modification

	save_differential
			-- Save archetype to its file in its source form
		require
			is_valid
		do
			if not exception_encountered then
				if differential_text = Void then
					differential_text := adl_engine.serialise(differential_archetype, Archetype_native_syntax)
				end
				file_repository.save_text_to_file (differential_path, differential_text)
				full_path := differential_path
				differential_text_timestamp := file_repository.text_timestamp
				save_succeeded := True
			else
				post_error(Current, "save_differential", "save_archetype_e3", Void)
			end
			status.copy(billboard.content)
			billboard.clear
			exception_encountered := False
		ensure
			save_succeeded or else not status.is_empty
		rescue
			post_error(Current, "save_differential", "report_exception", <<exception.out, exception_trace>>)
			exception_encountered := True
			retry
		end

	save_flat
			-- Save current target archetype to a flat form (.adlf) file
		require
			is_valid
		do
			save_succeeded := False
			if not exception_encountered then
				file_repository.save_text_to_file (flat_path, flat_text)
				save_succeeded := True
			else
				post_error(Current, "save_archetype_flat", "save_archetype_e3", Void)
			end
			status.copy(billboard.content)
			billboard.clear
			exception_encountered := False
		ensure
			save_succeeded or else not status.is_empty
		rescue
			post_error(Current, "save_archetype_flat", "report_exception", <<exception.out, exception_trace>>)
			exception_encountered := True
			retry
		end

	save_differential_as(a_full_path: STRING; serialise_format: STRING)
			-- Save current source archetype to `a_full_path' in `serialise_format'.
		require
			Archetype_valid: is_valid
			path_valid: a_full_path /= Void and then not a_full_path.is_empty
			Serialise_format_valid: serialise_format /= Void and then has_archetype_serialiser_format(serialise_format)
		do
			save_succeeded := False
			if not exception_encountered then
				if serialise_format.same_string (Archetype_native_syntax) then
					if differential_text = Void then
						differential_text := adl_engine.serialise(differential_archetype, serialise_format)
					end
					file_repository.save_text_to_file (extension_replaced (a_full_path, archetype_source_file_extension), differential_text)
				else
					file_repository.save_text_to_file (a_full_path, adl_engine.serialise(differential_archetype, serialise_format))
				end
				save_succeeded := True
			else
				post_error (Current, "save_differential_as", "save_archetype_e3", Void)
			end

			status.copy(billboard.content)
			billboard.clear
			exception_encountered := False
		ensure
			save_succeeded or else not status.is_empty
		rescue
			post_error(Current, "save_differential_as", "report_exception", <<exception.out, exception_trace>>)
			exception_encountered := True
			retry
		end

	save_flat_as(a_full_path: STRING; serialise_format: STRING)
			-- Save current flat archetype to `a_full_path' in `serialise_format'.
		require
			Archetype_valid: is_valid
			path_valid: a_full_path /= Void and then not a_full_path.is_empty
			Serialise_format_valid: serialise_format /= Void and then has_archetype_serialiser_format(serialise_format)
		do
			save_succeeded := False
			if not exception_encountered then
				if serialise_format.same_string (Archetype_native_syntax) then
					file_repository.save_text_to_file (extension_replaced (a_full_path, archetype_legacy_file_extension), flat_text)
				else
					file_repository.save_text_to_file (a_full_path, adl_engine.serialise(flat_archetype, serialise_format))
				end
				save_succeeded := True
			else
				post_error (Current, "save_flat_as", "save_archetype_e3", Void)
			end

			status.copy(billboard.content)
			billboard.clear
			exception_encountered := False
		ensure
			save_succeeded or else not status.is_empty
		rescue
			post_error(Current, "save_flat_as", "report_exception_with_context", <<"Saving archetype " + id.as_string, exception.out, exception_trace>>)
			exception_encountered := True
			retry
		end

	serialise_differential
			-- Force serialisation of differential_archetype into differential_text
		require
			Is_valid: is_valid
		do
			if not exception_encountered then
				differential_text := adl_engine.serialise(differential_archetype, Archetype_native_syntax)
			else
				post_error(Current, "serialise_differential", "serialise_archetype_e2", Void)
			end
			status.copy(billboard.content)
			billboard.clear
			exception_encountered := False
		ensure
			(differential_text /= old differential_text) or else not status.is_empty
		rescue
			post_error(Current, "serialise_differential", "report_exception_with_context", <<"Saving archetype " + id.as_string, exception.out, exception_trace>>)
			exception_encountered := True
			retry
		end

	read_legacy_flat
			-- Read `legacy_flat_text' and `text_timestamp' from `legacy_flat_path'.
		require
			flat_file_available: has_legacy_flat_file
		do
			file_repository.read_text_from_file (legacy_flat_path)
			legacy_flat_text := file_repository.text
			full_path := legacy_flat_path
			legacy_flat_text_timestamp := file_repository.text_timestamp
		end

feature -- Factory

	create_new_archetype(an_artefact_type: ARTEFACT_TYPE; a_im_originator, a_im_name, a_im_entity, a_primary_language: STRING)
			-- create a new top-level differential archetype and install it into the directory according to its id
		require
			Artefact_type_attached: an_artefact_type /= Void
			Info_model_originator_valid: a_im_originator /= void and then not a_im_originator.is_empty
			Info_model_name_valid: a_im_name /= void and then not a_im_name.is_empty
			Info_model_entity_valid: a_im_entity /= void and then not a_im_entity.is_empty
			Primary_language_valid: a_primary_language /= void and then not a_primary_language.is_empty
		local
			arch_id: attached ARCHETYPE_ID
		do
			if not exception_encountered then
				create arch_id.make (a_im_originator, a_im_name, a_im_entity, "UNKNOWN", "v0")
				create differential_archetype.make_minimal (an_artefact_type, arch_id, a_primary_language, 0)
				-- set_current_language (a_primary_language)

				-- FIXME: now add this archetype into the ARCHETYPE_DIRECTORY

				-- set it as the target
			else
				post_error(Current, "create_new_archetype", "create_new_archetype_e1", Void)
			end

			status.copy(billboard.content)
			billboard.clear
			exception_encountered := False
		ensure
			-- FIXME: make the new archetype the target??
		rescue
			post_error(Current, "create_new_archetype", "report_exception_with_context", <<"attempted to create new archteype " + arch_id.as_string, exception.out, exception_trace>>)
			exception_encountered := True
			retry
		end

	create_new_specialised_archetype(an_artefact_type: ARTEFACT_TYPE; specialised_domain_concept: STRING)
			-- create a new specialised archetype as a child of the target archetype and install it in
			-- the directory
		require
			Artefact_type_attached: an_artefact_type /= Void
			Concept_valid: specialised_domain_concept /= Void and then not specialised_domain_concept.is_empty
		do
			if not exception_encountered then
				create differential_archetype.make_specialised_child(an_artefact_type, differential_archetype, specialised_domain_concept)
				-- FIXME: now add this archetype into the ARCHETYPE_DIRECTORY
			else
				post_error(Current, "create_new_specialised_archetype", "create_new_specialised_archetype_e1", Void)
			end
			status.copy(billboard.content)
			billboard.clear
			exception_encountered := False
		rescue
			post_error(Current, "create_new_specialised_archetype", "report_exception", <<exception.out, exception_trace>>)
			exception_encountered := True
			retry
		end

feature {NONE} -- Implementation

	set_compile_attempt_timestamp
			-- Set `compile_attempt_timestamp'
		do
			if last_compile_attempt_timestamp = Void then
				arch_dir.increment_compile_attempted_archetype_count
			end
			create last_compile_attempt_timestamp.make_now
		end

	read_differential
			-- Read `differential_text' and `text_timestamp' from `differential_path'.
		require
			differential_file_available: has_differential_file
		do
			file_repository.read_text_from_file (differential_path)
			differential_text := file_repository.text
			full_path := differential_path
			differential_text_timestamp := file_repository.text_timestamp
		ensure
			differential_text_set: differential_text /= old differential_text
		end

	build_ontology_lineage
		local
			arch_lin: ARRAYED_LIST [ARCH_REP_ARCHETYPE]
		do
			create ontology_lineage.make(1)
			arch_lin := archetype_lineage

			from
				arch_lin.start
			until
				arch_lin.off
			loop
				ontology_lineage.put (arch_lin.item.differential_archetype.ontology, arch_lin.item.differential_archetype.specialisation_depth)
				arch_lin.forth
			end
		end

--	has_adl_generated_status (str: STRING): BOOLEAN
--			-- True if str is in ADL syntax of the first line of an archetype file and contains the
--			-- 'generated' flag in the meta-data part. The form of this string should be:
--			-- archetype_id (flag; flag; flag...)
--			-- FIXME: WARNING this is a hack because we are hard-coding for the 'generated' keyword here,
--			-- but currently it is too complicated to extract it from the serialisation objects.
--			-- This will be resolved in a few releases when all .adl archetypes are generated from.adls
--		require
--			str_exists: str /= Void
--		local
--			lpos, rpos: INTEGER
--		do
--			lpos := str.index_of('(', 1)
--			rpos := str.index_of(')', 1)
--			if lpos > 0 and rpos > lpos+1 then
--				Result := str.substring (lpos+1, rpos-1).has_substring("generated")
--			end
--		end

	flatten
			-- (re)generate flat-form of this archetype
		require
			is_valid
		local
			arch_flattener: ARCHETYPE_FLATTENER
		do
			if not differential_archetype.is_specialised then
				create arch_flattener.make_non_specialised (Current, rm_schema)
			else
				create arch_flattener.make_specialised (specialisation_parent, Current, rm_schema)
			end
			arch_flattener.flatten
			flat_archetype_cache := arch_flattener.arch_output_flat
			flat_text_cache := Void
		end

	flat_text_cache: STRING
			-- generated output from flattening process

	flat_archetype_cache: FLAT_ARCHETYPE
			-- archetype generated by flattening process

	child_type: ARCH_REP_ARCHETYPE
			-- child node type

	artefact_name: STRING

invariant
	compilation_state_valid: valid_compilation_state (compilation_state)
	repository_attached: file_repository /= Void
	compiler_status_attached: compilation_result /= Void

	full_path_attached: full_path /= Void and not full_path.is_empty
	flat_text_timestamp_natural: legacy_flat_text_timestamp >= 0
	differential_text_timestamp_natural: differential_text_timestamp >= 0
	differential_path_attached: differential_path /= Void
	flat_path_attached: legacy_flat_path /= Void
	full_is_flat_or_differential: full_path = legacy_flat_path xor full_path = differential_path

	differential_text_attached_if_valid: is_valid implies differential_text /= Void
	differential_archetype_attached_if_valid: is_valid implies differential_archetype /= Void
	flat_text_attached_if_valid: is_valid implies flat_text /= Void
	flat_archetype_attached_if_valid: is_valid implies flat_archetype /= Void

	parent_existence: specialisation_parent /= Void implies is_specialised
	parent_validity: specialisation_parent /= Void implies specialisation_parent.id.semantic_id.is_equal (id.semantic_parent_id)
	slot_id_index_valid: slot_id_index /= Void implies not slot_id_index.is_empty
	clients_index_valid: clients_index /= Void implies not clients_index.is_empty

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
--| The Original Code is archetype_directory_item.e.
--|
--| The Initial Developer of the Original Code is Thomas Beale.
--| Portions created by the Initial Developer are Copyright (C) 2006
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
