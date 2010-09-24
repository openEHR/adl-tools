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

	SHARED_APP_RESOURCES
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
	make, make_specialised, make_new

feature {NONE} -- Initialisation

	make (a_full_path: attached STRING; an_id: attached ARCHETYPE_ID; a_repository: attached ARCHETYPE_REPOSITORY_I; an_artefact_type: INTEGER)
			-- Create for the archetype with `an_id', stored at `a_full_path', belonging to `a_repository'.
			-- Can be created with a .adl or .adls file name extension
		require
			full_path_not_empty: not a_full_path.is_empty
			valid_artefact_type: (create {ARTEFACT_TYPE}).valid_type(an_artefact_type)
		do
			make_item
			create status.make_empty
			create errors.make

			id := an_id
			full_path := a_full_path
			file_repository := a_repository
			artefact_type := an_artefact_type
			artefact_name := (create {ARTEFACT_TYPE}).type_names.item(artefact_type)

			-- FIXME: the following should be changed one day so that legacy archetypes are
			-- kept completely separate from source archetypes
			if file_system.has_extension (full_path, archetype_source_file_extension) then
				differential_path := full_path
				flat_path := extension_replaced (full_path, archetype_flat_file_extension)
				legacy_flat_path := extension_replaced (full_path, archetype_legacy_file_extension)
			else
				differential_path := extension_replaced (full_path, archetype_source_file_extension)
				flat_path := extension_replaced (full_path, archetype_flat_file_extension)
				legacy_flat_path := full_path
			end

			compilation_state := Cs_unread
		ensure
			full_path_set: full_path = a_full_path
			file_repository_set: file_repository = a_repository
			id_set: id = an_id
		end

	make_specialised (a_full_path: attached STRING; an_id, a_parent_id: attached ARCHETYPE_ID; a_repository: attached ARCHETYPE_REPOSITORY_I; an_artefact_type: INTEGER)
			-- Create for the archetype with `an_id', stored at `a_full_path', belonging to `a_repository' at `a_root_path'.
			-- Can be created with a .adl or .adls file name extension
		require
			full_path_not_empty: not a_full_path.is_empty
			valid_artefact_type: (create {ARTEFACT_TYPE}).valid_type(an_artefact_type)
		do
			is_specialised := True
			parent_id := a_parent_id
			make (a_full_path, an_id, a_repository, an_artefact_type)
		ensure
			full_path_set: full_path = a_full_path
			file_repository_set: file_repository = a_repository
			id_set: id = an_id
			Specialised: is_specialised
			parent_id_set: parent_id = a_parent_id
		end

	make_new (an_id: attached ARCHETYPE_ID; a_repository: attached ARCHETYPE_REPOSITORY_I; an_artefact_type: INTEGER; a_primary_language: attached STRING; a_spec_depth: INTEGER)
			-- Create a new archetype with `an_id', belonging to `a_repository'.
		require
			valid_artefact_type: (create {ARTEFACT_TYPE}).valid_type (an_artefact_type)
			primary_language_not_empty: not a_primary_language.is_empty
			Specialisation_depth_valid: a_spec_depth >= 0
		local
			at: ARTEFACT_TYPE
		do
			make_item
			create status.make_empty
			create errors.make

			id := an_id
			full_path := id.as_string + archetype_source_file_extension
			file_repository := a_repository

			create at.make (an_artefact_type)
			artefact_type := an_artefact_type
			artefact_name := at.simplified_type_names.item (artefact_type)

			create differential_archetype.make_minimal (at, an_id, a_primary_language, a_spec_depth)
			differential_path := full_path
			flat_path := extension_replaced (full_path, archetype_flat_file_extension)
			legacy_flat_path := extension_replaced (full_path, archetype_legacy_file_extension)

			compilation_state := Cs_unread
			initialise
		ensure
			full_path_set: full_path.has_substring (id.as_string)
			file_repository_set: file_repository = a_repository
			id_set: id = an_id
			validated: is_valid
		end

feature -- Access

	compilation_state: INTEGER
			-- current compilation state, obeying the state machine described above

	errors: ERROR_ACCUMULATOR
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
			-- previous Archetype identifier, due to change by editing

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

	old_ontological_parent_name: STRING
			-- old vaue of `old_ontological_parent_name', to facilitate handling changes due to external editing of archetypes

	display_name: STRING
			-- domain concept part of archetype id; if there are any '-' characters due to ADL 1.4 style ids,
			-- return only the final section
		local
			str: STRING
		do
			str := id.domain_concept
			if is_specialised and str.has ({ARCHETYPE_ID}.section_separator) then
				Result := str.substring (str.last_index_of ({ARCHETYPE_ID}.section_separator, str.count)+1, str.count)
			else
				Result := str
			end
		end

	differential_text: STRING
			-- The text of the archetype source file, i.e. the differential form.

	flat_text: STRING
			-- The text of the flat form of the archetype
		do
			if flat_archetype /= Void and flat_text_cache = Void then
				flat_text_cache := adl_engine.serialise(flat_archetype, Archetype_native_syntax, current_archetype_language)
			end
			Result := flat_text_cache
		end

	legacy_flat_text: STRING
			-- The text of the legacy archetype, if it exists
		do
			if legacy_flat_text_cache = Void or is_legacy_out_of_date then
				read_legacy_flat
			end
			Result := legacy_flat_text_cache
		end

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
			-- Typical examples: 'archetype_valid_2'
		do
			create Result.make_empty
			Result.append(artefact_name)

			inspect compilation_state
			when Cs_validated then
				if errors.is_empty then
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

	display_language: STRING
			-- generate a valid language to display this archetype in, either the current_language
			-- or the primary language of this archetype, if it doesn't support the current language
		do
			if differential_archetype.has_language (current_language) then
				Result := current_language
			else
				Result := differential_archetype.original_language.code_string
			end
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

	compile_attempted: BOOLEAN
			-- has a compile been attempted in this session?
		do
			Result := last_compile_attempt_timestamp /= Void
		end

	is_out_of_date: BOOLEAN
			-- Should this archetype be reparsed due to changes on the file system?
		do
			Result := last_compile_attempt_timestamp = Void or
				is_differential_out_of_date or is_legacy_out_of_date or
				(specialisation_parent /= Void and then specialisation_parent.last_compile_attempt_timestamp > last_compile_attempt_timestamp)

			if not Result and suppliers_index /= Void then
				from suppliers_index.start until suppliers_index.off or suppliers_index.item_for_iteration.is_out_of_date loop
					suppliers_index.forth
				end
				Result := not suppliers_index.off
			end
		end

	is_differential_out_of_date: BOOLEAN
			-- Is differential_archetype out of date with respect to changes on the file system?
		do
			Result := differential_text_timestamp > 0 and file_repository.has_file_changed_on_disk (full_path, differential_text_timestamp)
		end

	is_legacy_out_of_date: BOOLEAN
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

	ontology_location_changed: BOOLEAN
			-- True if changed due to external editing require a move of this archetype in ontology
			-- cleared by calling `clear_old_ontological_parent_name'
		do
			Result := old_ontological_parent_name /= Void
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
			errors.wipe_out
			billboard.clear
		ensure
			Exception_cleared: not exception_encountered
			Status_cleared: status.is_empty
			Errors_cleared: errors.is_empty
		end

feature -- Commands

	initialise
			-- set compilation state at creation, or if editing occurs
			-- also sets rm_schema reference
		require
			compilation_state = Cs_unread
		do
			if rm_schemas_access.has_schema_for_package (id.qualified_package_name) then
				rm_schema := rm_schemas_access.schema_for_package (id.qualified_package_name)
				if legacy_is_primary and is_legacy_out_of_date or else not has_differential_file then
					compilation_state := Cs_ready_to_parse_legacy
				elseif has_differential_file then -- either authored in ADL 1.5, or compiled successfully from legacy .adl file
					if is_specialised then
						compilation_state := Cs_lineage_known
					else
						compilation_state := Cs_ready_to_parse
					end
					read_differential
				elseif differential_archetype /= Void then -- must have been newly created
					compilation_state := Cs_validated
				end
			else
				compilation_state := Cs_rm_class_unknown
				errors.add_error("model_access_e7", <<id.qualified_rm_name>>, "")
			end
		ensure
			compilation_state_set: Cs_initial_states.has(compilation_state)
			no_rm_schema_compilation_state: rm_schema = Void implies compilation_state = Cs_rm_class_unknown
		end

	compile
			-- perform as many steps of the compilation process as possible; may be called repeatedly by ARCHETYPE_COMPILER as it
			-- does initial parsing here, finds dependencies, compiles them, comes back here, etc etc
			-- For the moment just a simplistic implementation; we might do a proper generic state machine one later
		require
			not is_in_terminal_compilation_state
		local
			finished: BOOLEAN
		do
			from until finished loop
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

	signal_source_edited
			-- signal source file changed on disk
		local
			amp: ARCHETYPE_MINI_PARSER
			arch_id, parent_arch_id: attached ARCHETYPE_ID
			old_ont_parent: STRING
		do
			-- TODO: first check that there is not a more recent modification to the in-memory structure.

			-- now deal with changes from file
			create amp
			amp.parse (full_path)
			if amp.last_parse_valid then
				if not artefact_type.is_equal (amp.last_archetype_artefact_type) then
					artefact_type := amp.last_archetype_artefact_type
				end

				-- check for changes in id or parent id that might mean this node has to be moved in ARCHETYPE_DIRECTORY
				-- possible changes:
				-- 	* parent_id changed
				-- 	* changed from specialised to non-specialised
				old_ont_parent := ontological_parent_name
				create arch_id.make_from_string(amp.last_archetype_id)
				if not arch_id.is_equal (id) then
					old_id := id
					id := arch_id
				end
				if amp.last_archetype_specialised then
					create parent_arch_id.make_from_string(amp.last_parent_archetype_id)
					if not parent_arch_id.is_equal (parent_id) then
						old_ontological_parent_name := old_ont_parent
						parent_id := parent_arch_id
					end
				end
				compilation_state := Cs_unread
			else
				post_error (Current, "signal_source_edited", "general", <<amp.last_parse_fail_reason>>)
				compilation_state := Cs_invalid
			end
		ensure
			compilation_state = Cs_unread or compilation_state = Cs_invalid
		end

	signal_lineage_compilation
		require
			compilation_state = Cs_lineage_known
		do
			if specialisation_parent.is_valid then
				compilation_state := Cs_ready_to_parse
			else
				compilation_state := cs_lineage_invalid
				errors.add_error("compile_e1", <<parent_id.as_string>>, "")
			end
		ensure
			Compilation_state: compilation_state = Cs_ready_to_parse or compilation_state = cs_lineage_invalid
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
				compilation_state := cs_suppliers_invalid
				errors.add_error("compile_e2", <<suppliers_index.item_for_iteration.id.as_string>>, "")
			end
		ensure
			Compilation_state: compilation_state = Cs_ready_to_validate or compilation_state = cs_suppliers_invalid
		end

	compile_legacy
			-- Parse and validate `target', legacy flat form; save differential file if there was none.
			-- Assume that legacy archetypes have no suppliers, i.e. don't include slot-fillers.
			-- This is safe, since this is an ADL 1.5 only construct
		require
			Compilation_state_valid: compilation_state = cs_ready_to_parse_legacy
			Legacy_file_available: has_legacy_flat_file
		local
			legacy_flat_archetype: FLAT_ARCHETYPE
		do
			if not exception_encountered then
				reset
				set_compile_attempt_timestamp
				legacy_flat_archetype := adl_engine.parse_flat (legacy_flat_text, rm_schema)
				flat_archetype_cache := Void
				if legacy_flat_archetype = Void then
					errors.append(adl_engine.errors)
				 	compilation_state := Cs_convert_legacy_failed
				else
					post_info (Current, "compile_legacy", "compile_legacy_i1", <<id.as_string>>)
					differential_archetype := legacy_flat_archetype.to_differential
					if is_specialised and not specialisation_parent.is_valid then
						compilation_state := cs_lineage_invalid
					else
					 	compilation_state := Cs_ready_to_validate
						if current_language.is_empty or not differential_archetype.has_language (current_language) then
							set_current_language (differential_archetype.original_language.code_string)
						end
						validate
						-- if differential archetype was generated from an old-style flat, perform path compression
						if differential_archetype.is_valid then
							if differential_archetype.is_specialised then
								differential_archetype.convert_to_differential_paths
							end
					 		save_differential
						end
					end
				end
			else
				errors.extend(create {ERROR_DESCRIPTOR}.make_error("compile_legacy_e2", Void, ""))
			end

			status.copy(billboard.content)
			billboard.clear
		ensure
			Compilation_state: compilation_state = Cs_validated or compilation_state = Cs_validate_failed or compilation_state = Cs_convert_legacy_failed or compilation_state = cs_lineage_invalid
			Differential_file: compilation_state = Cs_validated implies has_differential_file
		rescue
			post_error (Current, "compile_legacy", "report_exception", <<exception.out, exception_trace>>)
			exception_encountered := True
			retry
		end

	parse
			-- Parse archetype, in differential form if available, else in legacy flat form.
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
				differential_archetype := adl_engine.parse_differential (differential_text, rm_schema)
				flat_archetype_cache := Void
				if differential_archetype = Void then
					errors.append (adl_engine.errors)
					compilation_state := Cs_parse_failed
				else
					if is_specialised and not parent_id.is_equal(differential_archetype.parent_archetype_id) then
						errors.add_warning("parse_w1", <<id.as_string, parent_id.as_string, differential_archetype.parent_archetype_id.as_string>>, "")
					else
						post_info(Current, "parse", "parse_i1", <<id.as_string>>)
					end
					create suppliers_index.make (0)
					if differential_archetype.has_suppliers then
						supp_idx := differential_archetype.suppliers_index
						from supp_idx.start until supp_idx.off loop
							if arch_dir.archetype_index.has (supp_idx.key_for_iteration) then
								suppliers_index.put (arch_dir.archetype_index.item (supp_idx.key_for_iteration), supp_idx.key_for_iteration)
							end
							supp_idx.forth
						end
						compilation_state := Cs_suppliers_known
					else
						compilation_state := Cs_ready_to_validate
					end
					if current_language.is_empty or not differential_archetype.has_language (current_language) then
						set_current_language (differential_archetype.original_language.code_string)
					end
				end
			else
				errors.extend(create {ERROR_DESCRIPTOR}.make_error("parse_e3", Void, ""))
			end

			status.copy(billboard.content)
			billboard.clear
		ensure
			Compilation_state: compilation_state = Cs_suppliers_known or compilation_state = Cs_ready_to_validate or compilation_state = Cs_parse_failed
		rescue
			post_error (Current, "parse", "report_exception", <<exception.out, exception_trace>>)
			exception_encountered := True
			retry
		end

	signal_differential_edited
			-- signal event of differential in-memory being changed by editing at UI
		do
			-- TODO: differential_text will now be out of date

			-- flat is also out of date
			flat_archetype_cache := Void
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
					arch_dir.update_slot_statistics (Current)
					arch_dir.update_terminology_bindings_info (Current)
				else
					compilation_state := Cs_validate_failed
				end
				errors.append(validator.errors)
			else
				errors.append(validator.errors)
				compilation_state := Cs_validate_failed
			end
			differential_archetype.set_is_valid (validator.passed)

			status.copy(billboard.content)
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

	clear_old_ontological_parent_name
		do
			old_ontological_parent_name := Void
		end

	save_differential
			-- Save archetype to its file in its source form
		require
			is_valid
		do
			if not exception_encountered then
				if differential_text = Void then
					differential_text := adl_engine.serialise(differential_archetype, Archetype_native_syntax, current_archetype_language)
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
						differential_text := adl_engine.serialise(differential_archetype, serialise_format, current_archetype_language)
					end
					-- replace the extension because we want it to be clear that it is a source file; but maybe the caller should just
					-- be trusted?
					file_repository.save_text_to_file (extension_replaced (a_full_path, archetype_source_file_extension), differential_text)
				else
					file_repository.save_text_to_file (a_full_path, adl_engine.serialise(differential_archetype, serialise_format, current_archetype_language))
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
					file_repository.save_text_to_file (a_full_path, flat_text)
				else
					file_repository.save_text_to_file (a_full_path, adl_engine.serialise(flat_archetype, serialise_format, current_archetype_language))
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

	save_legacy_as(a_full_path: STRING; serialise_format: STRING)
			-- Save current legacy archetype to `a_full_path' in `serialise_format'.
		require
			Archetype_valid: is_valid
			Archetype_has_legacy: has_legacy_flat_file
			path_valid: a_full_path /= Void and then not a_full_path.is_empty
			Serialise_format_valid: serialise_format /= Void and then has_archetype_serialiser_format(serialise_format)
		do
			save_succeeded := False
			if not exception_encountered then
				file_repository.save_text_to_file (a_full_path, legacy_flat_text)
				save_succeeded := True
			else
				post_error (Current, "save_legacy_as", "save_archetype_e3", Void)
			end

			status.copy(billboard.content)
			billboard.clear
			exception_encountered := False
		ensure
			save_succeeded or else not status.is_empty
		rescue
			post_error(Current, "save_legacy_as", "report_exception_with_context", <<"Saving archetype " + id.as_string, exception.out, exception_trace>>)
			exception_encountered := True
			retry
		end

	read_legacy_flat
			-- Read `legacy_flat_text' and `text_timestamp' from `legacy_flat_path'.
		require
			flat_file_available: has_legacy_flat_file
		do
			file_repository.read_text_from_file (legacy_flat_path)
			legacy_flat_text_cache := file_repository.text
			full_path := legacy_flat_path
			legacy_flat_text_timestamp := file_repository.text_timestamp
		end

feature {NONE} -- Implementation

	current_archetype_language: STRING
			-- find a language from the current archetype that matches `current_language' either directly
			-- (e.g. "en" matches "en") or on a language group basis (e.g. "en-GB" matches "en"); if
			-- none found, return archetype original language
		do
			if differential_archetype.has_language (current_language) then
				Result := current_language
			elseif differential_archetype.has_matching_language_tag (current_language) then
				Result := differential_archetype.matching_language_tag (current_language)
			else
				Result := differential_archetype.original_language.code_string
			end
		end

	set_compile_attempt_timestamp
			-- Set `compile_attempt_timestamp'
		do
			if last_compile_attempt_timestamp = Void then
				arch_dir.update_compile_attempt_count
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
			differential_text_set: differential_text /= Void
		end

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
		ensure
			flat_archetype_cache_attached: flat_archetype_cache /= Void
		end

	flat_text_cache: STRING
			-- generated output from flattening process

	legacy_flat_text_cache: STRING
			-- legacy file, if available

	flat_archetype_cache: FLAT_ARCHETYPE
			-- archetype generated by flattening process

	child_type: ARCH_REP_ARCHETYPE
			-- child node type

	artefact_name: STRING

invariant
	compilation_state_valid: valid_compilation_state (compilation_state)
	repository_attached: file_repository /= Void

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
	parent_validity: (specialisation_parent /= Void and not ontology_location_changed) implies parent_id.is_equal (specialisation_parent.id)
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
