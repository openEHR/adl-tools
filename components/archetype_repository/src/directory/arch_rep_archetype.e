indexing
	component:   "openEHR Archetype Project"
	description: "Descriptor of an archetype in a directory of archetypes"
	keywords:    "ADL, archetype"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.com>"
	copyright:   "Copyright (c) 2006 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL: http://www.openehr.org/svn/ref_impl_eiffel/TRUNK/components/archetype_repository/src/directory/arch_rep_archetype.e $"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate: 2008-05-17 15:32:35 +0100 (Sat, 17 May 2008) $"


class ARCH_REP_ARCHETYPE

inherit
	SHARED_ARCHETYPE_DIRECTORY
		undefine
			is_equal
		end

	SHARED_REFERENCE_MODEL_ACCESS
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

	SHARED_APPLICATION_CONTEXT
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
			make as make_adi
		undefine
			is_equal
		end

	MESSAGE_BILLBOARD
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

	EXCEPTIONS
		export
			{NONE} all
		undefine
			is_equal
		end

	COMPARABLE

create
	make

feature {NONE} -- Initialisation

	make (a_root_path, a_full_path: STRING; an_id: !ARCHETYPE_ID; a_repository: ARCHETYPE_REPOSITORY_I)
			-- Create for the archetype with `an_id', stored at `a_full_path', belonging to `a_repository' at `a_root_path'.
			-- Can be created with a .adl or .adls file name extension
		require
			repository_attached: a_repository /= Void
			root_path_valid: a_repository.is_valid_directory (a_root_path)
			full_path_attached: a_full_path /= Void
			full_path_under_root_path: a_full_path.starts_with (a_root_path)
		do
			create status.make_empty
			create compiler_status.make_empty

			id := an_id
			make_adi (a_root_path, a_full_path, a_repository)

			if file_system.has_extension (full_path, archetype_source_file_extension) then
				differential_path := full_path
				flat_path := extension_replaced (full_path, archetype_flat_file_extension)
			else
				differential_path := extension_replaced (full_path, archetype_source_file_extension)
				flat_path := full_path
			end

			-- set status of flat archetype by reading its file for now; can't do this with .adls files
			-- yet because there are versions of the AWB out there that have created .adls files, but
			-- don't put the 'generated' marker in
			if file_repository.is_valid_path (flat_path) then
				flat_generated := has_adl_generated_status(file_repository.first_line (flat_path))
			else
				flat_generated := True
			end
		ensure
			root_path_set: root_path = a_root_path
			full_path_set: full_path = a_full_path
			file_repository_set: file_repository = a_repository
			id_set: id = an_id
			no_compiler_status: compiler_status.is_empty
		end

feature -- Access

	id: !ARCHETYPE_ID
			-- Archetype identifier.

	differential_path: STRING
			-- Path of differential source file of archetype.

	flat_path: STRING
			-- Path of flat file of archetype.

	differential_text: STRING
			-- The text of the archetype source file, i.e. the differential form.

	flat_text: STRING is
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

	flat_text_timestamp: INTEGER
			-- Date and time at which the archetype flat file was last modified.

	differential_text_timestamp: INTEGER
			-- Date and time at which the archetype differential file was last modified.

	last_compile_attempt_timestamp: DATE_TIME
			-- time last compile attempt made, set by set_parse_attempted

	specialisation_parent: ARCH_REP_ARCHETYPE
			-- parent descriptor, for specialised archetypes only

	archetype_lineage: !ARRAYED_LIST [ARCH_REP_ARCHETYPE] is
			-- lineage of archetypes from parent to this one, inclusive of the current one.
			-- For non-specialised archetypes, contains just the top-level archetype.
			-- NOTE: in theory this could be precomputed from ARCH_DIRECTORY, but modifications to
			-- the directory structure would mean always recomputing parts of it. This computation
			-- is not particularly expensive anyway...however, the result could be cached on a per-
			-- instance basis to be more efficient
		local
			csr: ARCH_REP_ARCHETYPE
		do
			create Result.make (1)

			from
				csr := Current
			until
				csr = Void
			loop
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

	flat_archetype: FLAT_ARCHETYPE is
			-- inheritance-flattened form of archetype
		do
			if flat_archetype_cache = Void and is_valid then
				flatten
			end
			Result := flat_archetype_cache
		end

	slot_id_index: HASH_TABLE [ARRAYED_LIST[STRING], STRING]
			-- list of Archetype ids matching slot, keyed by slot path

	used_by_index: ARRAYED_LIST [STRING]
			-- list of archetype_ids corresponding to archetypes that use this archetype

	compiler_status: STRING
			-- errors from last compile attempt; allows redisplay if this archetype is reselected

	status: STRING
			-- status of last operation

	compiler_error_type: INTEGER is
			-- generate value from COMPILER_ERROR_TYPES as index for error classification elsewhere
		do
			if is_valid then
				if compiler_status.is_empty then
					Result := Err_type_valid
				else
					Result := Err_type_warning
				end
			elseif is_parsed then
				Result := Err_type_validity_error
			else
				Result := Err_type_parse_error
			end
		ensure
			valid: valid_err_type (Result)
		end

	group_name: STRING
			-- Name distinguishing the type of item and the group to which its `repository' belongs.
			-- Useful as a logical key to pixmap icons, etc.
		do
			if is_valid then
				if compiler_status.is_empty then
					Result := "archetype_valid_" + file_repository.group_id.out
				else
					Result := "archetype_warning_" + file_repository.group_id.out
				end
			elseif is_parsed then
				Result := "archetype_parsed_" + file_repository.group_id.out
			elseif parse_attempted then
				Result := "archetype_parse_failed_" + file_repository.group_id.out
			else
				Result := "archetype_" + file_repository.group_id.out
			end
		end

feature -- Status Report - Compilation

	is_at_path (path: STRING): BOOLEAN
			-- Is `path' the same as either `differential_path' or `flat_path'?
		do
			Result := differential_path.same_string (path) or flat_path.same_string (path)
		end

	has_differential_file: BOOLEAN
			-- Does the repository have a source-form file for this archetype?
		do
			Result := file_repository.is_valid_path (differential_path)
		end

	has_flat_file: BOOLEAN
			-- Does the repository have a flat-form file for this archetype?
		do
			Result := file_repository.is_valid_path (flat_path)
		end

	is_out_of_date: BOOLEAN
			-- Should this archetype be reparsed due to changes on the file system?
		do
			Result := not parse_attempted or
				is_differential_out_of_date or is_flat_out_of_date or
				(is_specialised and specialisation_parent.last_compile_attempt_timestamp > last_compile_attempt_timestamp)
		end

	is_differential_out_of_date: BOOLEAN
			-- Is differential_archetype out of date with respect to changes on the file system?
		do
			Result := differential_text_timestamp > 0 and file_repository.has_file_changed_on_disk (full_path, differential_text_timestamp)
		end

	is_flat_out_of_date: BOOLEAN
			-- Is flat_archetype out of date with respect to changes on the file system?
		do
			Result := flat_text_timestamp > 0 and then file_repository.has_file_changed_on_disk (full_path, flat_text_timestamp)
		end

	parse_attempted: BOOLEAN
			-- True if a parse has been attempted on the currently available copy of this archetype
			-- (should be cleared if file is touched in any way)

	validate_attempted: BOOLEAN
			-- True if semantic validation has been attempted using ARCHETYPE_VALIDATOR

	is_parsed: BOOLEAN is
			-- True if archetype has been parsed and loaded in at least differential form
		do
			Result := differential_archetype /= Void
		end

	save_succeeded: BOOLEAN
			-- True if last save operation was successful

	exception_encountered: BOOLEAN
			-- True if last operation caused an exception

feature -- Status Report - Semantic

	is_specialised: BOOLEAN is
			-- True if this archetype is a specialisation of another archetype
		do
			Result := id.is_specialised
		end

	is_valid: BOOLEAN
			-- True if archetype object created and 'is_valid' True. This can be used to check if the archetype has
			-- actually been compiled and is available in memory. This is useful for specialised archetypes because
			-- you want to know if the parent has been compiled (up the lineage) before you can compile the current one

	has_compiler_status: BOOLEAN
			-- Does this archetype have any compiler errors or warnings?
		do
			Result := not compiler_status.is_empty
		end

	has_slots: BOOLEAN
			-- Does this archetype have any slots?
		do
			Result := slot_id_index /= Void
		end

	is_used: BOOLEAN
			-- Is this archetype used by any other archetypes (i.e. matches any of their slots)?
		do
			Result := used_by_index /= Void
		end

	differential_generated: BOOLEAN is
			-- True if the differential form was generated from the flat form
		do
			Result := differential_archetype /= Void and then differential_archetype.is_generated
		end

	flat_generated: BOOLEAN
			-- Set to True if ADL file contains 'is_generated' marker

	flat_is_primary: BOOLEAN is
			-- True if the flat legacy file is the primary source
		do
			Result := (differential_archetype /= Void and differential_generated) or not flat_generated
		end

feature -- Status Setting

	set_parse_attempted
			-- Set `parse_attempted' true.
		do
			if not parse_attempted then
				parse_attempted := True
				archetype_directory.increment_parse_attempted_archetype_count
			end
			create last_compile_attempt_timestamp.make_now
		end

	reset is
			-- reset after exception encountered
		do
			exception_encountered := False
			status.wipe_out
		ensure
			Exception_cleared: not exception_encountered
			Status_cleared: status.is_empty
		end

feature -- Commands

	parse_archetype is
			-- Parse and validate `target', in differential form if available, else in flat form.
		do
			reset
			if not exception_encountered then
				clear_billboard
				set_parse_attempted

				if has_differential_file and not is_flat_out_of_date then
					post_info (Current, "parse_archetype", "parse_archetype_i3", Void)
					read_differential
					differential_archetype := adl_engine.parse_differential (differential_text)
					if differential_archetype = Void then
						post_error (Current, "parse_archetype", "parse_archetype_e1", <<adl_engine.parse_error_text>>)
					else
						post_info (Current, "parse_archetype", "parse_archetype_i1", <<id.as_string>>)
						validate
					end
				else
					read_flat
					flat_archetype_cache := adl_engine.parse_flat (flat_text_cache)
					if flat_archetype_cache = Void then
						post_error (Current, "parse_archetype", "parse_archetype_e1", <<adl_engine.parse_error_text>>)
					else
						post_info (Current, "parse_archetype", "parse_archetype_i1", <<id.as_string>>)
						differential_archetype := flat_archetype.to_differential
						validate
						-- if differential archetype was generated from an old-style flat, perform path compression
						if is_valid then
							if differential_archetype.is_generated and differential_archetype.is_specialised then
								differential_archetype.convert_to_differential_paths
							end
						end
						flat_archetype.set_is_valid (is_valid)
					end
				end

				if is_valid then
					flat_archetype_cache := Void
					flat_text_cache := Void

					-- Make sure that the language is set, and that it is one of the languages in the archetype.
					if (current_language = Void or not differential_archetype.has_language (current_language)) then
						set_current_language (differential_archetype.original_language.code_string)
					end
				end
			else
				post_error (Current, "parse_archetype", "parse_archetype_e3", Void)
			end

			compiler_status := billboard_content
			clear_billboard
		rescue
			post_error (Current, "parse_archetype", "report_exception", <<exception.out, exception_trace>>)
			exception_encountered := True
			retry
		end

feature -- Comparison

	infix "<" (other: like Current): BOOLEAN
			-- Is current object less than `other'?
		do
			if id.is_equal (other.id) then
				Result := full_path < other.full_path
			else
				Result := id < other.id
			end
		end

feature {ARCH_DIRECTORY} -- Modification

	set_specialisation_parent (a_parent: ARCH_REP_ARCHETYPE) is
			-- set `parent'
		require
			Parent_exists: a_parent /= Void
		do
			specialisation_parent := a_parent
		end

feature {ARCHETYPE_VALIDATOR} -- Modification

	add_slot_ids (a_list: ARRAYED_LIST[STRING]; a_slot_path: STRING) is
			-- add list of matching archetypes to ids recorded for slot at a_slot_path
		do
			if slot_id_index = Void then
				create slot_id_index.make (0)
			end

			if not slot_id_index.has (a_slot_path) then
				slot_id_index.put (a_list, a_slot_path)
				a_list.compare_objects
			else
				from
					a_list.start
				until
					a_list.off
				loop
					if not slot_id_index.item (a_slot_path).has (a_list.item) then
						slot_id_index.item (a_slot_path).extend (a_list.item)
					end

					a_list.forth
				end
			end
		end

	add_used_by_item (an_archetype_id: STRING) is
			-- add the id of an archetype that has a slot that matches this archetype, i.e. that 'uses' this archetype
		do
			if used_by_index = Void then
				create used_by_index.make (0)
				used_by_index.compare_objects
			end

			used_by_index.extend (an_archetype_id)
		end

feature -- Modification

	save_differential is
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
			status.wipe_out
			status.append(billboard_content)
			clear_billboard
			exception_encountered := False
		ensure
			save_succeeded or else not status.is_empty
		rescue
			post_error(Current, "save_differential", "report_exception", <<exception.out, exception_trace>>)
			exception_encountered := True
			retry
		end

	save_flat is
			-- Save current target archetype to its file in its flat form
		require
			is_valid
		do
			save_succeeded := False
			if not exception_encountered then
				file_repository.save_text_to_file (flat_path, flat_text)
				full_path := flat_path
				flat_text_timestamp := file_repository.text_timestamp
				save_succeeded := True
			else
				post_error(Current, "save_archetype_flat", "save_archetype_e3", Void)
			end
			status.wipe_out
			status.append(billboard_content)
			clear_billboard
			exception_encountered := False
		ensure
			save_succeeded or else not status.is_empty
		rescue
			post_error(Current, "save_archetype_flat", "report_exception", <<exception.out, exception_trace>>)
			exception_encountered := True
			retry
		end

	save_differential_as(a_full_path: STRING; serialise_format: STRING) is
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

			status.wipe_out
			status.append(billboard_content)
			clear_billboard
			exception_encountered := False
		ensure
			save_succeeded or else not status.is_empty
		rescue
			post_error(Current, "save_differential_as", "report_exception", <<exception.out, exception_trace>>)
			exception_encountered := True
			retry
		end

	save_flat_as(a_full_path: STRING; serialise_format: STRING) is
			-- Save current flat archetype to `a_full_path' in `serialise_format'.
		require
			Archetype_valid: is_valid
			path_valid: a_full_path /= Void and then not a_full_path.is_empty
			Serialise_format_valid: serialise_format /= Void and then has_archetype_serialiser_format(serialise_format)
		do
			save_succeeded := False
			if not exception_encountered then
				if serialise_format.same_string (Archetype_native_syntax) then
					file_repository.save_text_to_file (extension_replaced (a_full_path, archetype_flat_file_extension), flat_text)
				else
					file_repository.save_text_to_file (a_full_path, adl_engine.serialise(flat_archetype, serialise_format))
				end
				save_succeeded := True
			else
				post_error (Current, "save_flat_as", "save_archetype_e3", Void)
			end

			status.wipe_out
			status.append(billboard_content)
			clear_billboard
			exception_encountered := False
		ensure
			save_succeeded or else not status.is_empty
		rescue
			post_error(Current, "save_flat_as", "report_exception", <<exception.out, exception_trace>>)
			exception_encountered := True
			retry
		end

	serialise_differential is
			-- Force serialisation of differential_archetype into differential_text
		require
			Is_valid: is_valid
		do
			if not exception_encountered then
				differential_text := adl_engine.serialise(differential_archetype, Archetype_native_syntax)
			else
				post_error(Current, "serialise_differential", "serialise_archetype_e2", Void)
			end
			status.wipe_out
			status.append(billboard_content)
			clear_billboard
			exception_encountered := False
		ensure
			(differential_text /= old differential_text) or else not status.is_empty
		rescue
			post_error(Current, "serialise_differential", "report_exception", <<exception.out, exception_trace>>)
			exception_encountered := True
			retry
		end

	create_new_archetype(a_im_originator, a_im_name, a_im_entity, a_primary_language: STRING) is
			-- create a new top-level differential archetype and install it into the directory according to its id
		require
			Info_model_originator_valid: a_im_originator /= void and then not a_im_originator.is_empty
			Info_model_name_valid: a_im_name /= void and then not a_im_name.is_empty
			Info_model_entity_valid: a_im_entity /= void and then not a_im_entity.is_empty
			Primary_language_valid: a_primary_language /= void and then not a_primary_language.is_empty
		do
			if not exception_encountered then
				create differential_archetype.make_minimal (create {!ARCHETYPE_ID}.make (a_im_originator, a_im_name, a_im_entity, "UNKNOWN", "draft"), a_primary_language, 0)
				set_current_language (a_primary_language)

				-- FIXME: now add this archetype into the ARCHETYPE_DIRECTORY

				-- set it as the target
			else
				post_error(Current, "create_new_archetype", "create_new_archetype_e1", Void)
			end

			status.wipe_out
			status.append(billboard_content)
			clear_billboard
			exception_encountered := False
		ensure
			-- FIXME: make the new archetype the target??
		rescue
			post_error(Current, "create_new_archetype", "report_exception", <<exception.out, exception_trace>>)
			exception_encountered := True
			retry
		end

	create_new_specialised_archetype(specialised_domain_concept: STRING) is
			-- create a new specialised archetype as a child of the target archetype and install it in
			-- the directory
		require
			Concept_valid: specialised_domain_concept /= Void and then not specialised_domain_concept.is_empty
		do
			if not exception_encountered then
				create differential_archetype.make_specialised_child(differential_archetype, specialised_domain_concept)
				-- FIXME: now add this archetype into the ARCHETYPE_DIRECTORY
			else
				post_error(Current, "create_new_specialised_archetype", "create_new_specialised_archetype_e1", Void)
			end
			status.wipe_out
			status.append(billboard_content)
			clear_billboard
			exception_encountered := False
		rescue
			post_error(Current, "create_new_specialised_archetype", "report_exception", <<exception.out, exception_trace>>)
			exception_encountered := True
			retry
		end

feature {NONE} -- Implementation

	validate is
			-- Perform various levels of validation on `differential_archetype'.
		require
			differential_attached: differential_archetype /= Void
		local
			validator: ARCHETYPE_VALIDATOR
		do
			is_valid := False
			create validator.make (Current)
			if validator.passed then
				validator.validate
				if validator.passed then
					post_info (Current, "set_archetype_differential", "parse_archetype_i2", <<id.as_string>>)
				else
					post_error (Current, "set_archetype_differential", "parse_archetype_e2", <<id.as_string, validator.errors>>)
				end

				if validator.has_warnings then
					post_warning (Current, "set_archetype_differential", "parse_archetype_w2", <<id.as_string, validator.warnings>>)
				end
			else
				post_error (Current, "set_archetype_differential", "parse_archetype_e2", <<id.as_string, validator.errors>>)
			end

			differential_archetype.set_is_valid (validator.passed)
			validate_attempted := True
			archetype_directory.update_slot_statistics (Current)
			is_valid := validator.passed
		ensure
			validate_attempted
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

	read_flat
			-- Read `flat_text' and `text_timestamp' from `flat_path'.
		require
			flat_file_available: has_flat_file
		do
			file_repository.read_text_from_file (flat_path)
			flat_text_cache := file_repository.text
			full_path := flat_path
			flat_text_timestamp := file_repository.text_timestamp
		end

	make_ontological_paths
			-- Make `base_name', `ontological_path' and `ontological_parent_path'.
		local
			pos: INTEGER
			arch_ont_path: STRING
		do
			pos := full_path.last_index_of (os_directory_separator, full_path.count)
			ontological_path := full_path.substring (root_path.count + 1, pos - 1)
			ontological_path.replace_substring_all (os_directory_separator.out, ontological_path_separator)
			ontological_parent_path := ontological_path.twin

			-- generate a semantic path that corresponds to this archetype:
			-- constructed from the relative folder path + the semantic part of the archetype id, with '-' separators
			-- changed to '/' so that the entire path is '/'-separated
			arch_ont_path := id.domain_concept
			arch_ont_path.replace_substring_all (id.section_separator.out, ontological_path_separator)
--		arch_ont_path.append_character (id.axis_separator)
--		arch_ont_path.append (id.version_id)
			ontological_path.append (ontological_path_separator + arch_ont_path)

			-- generate parent ontological path if appropriate
			arch_ont_path := id.domain_concept_base

			if not arch_ont_path.is_empty then
				arch_ont_path.replace_substring_all (id.section_separator.out, ontological_path_separator)
--		arch_ont_path.append_character (id.axis_separator)
--		arch_ont_path.append (id.version_id)
				ontological_parent_path.append (ontological_path_separator + arch_ont_path)
			end

			base_name := id.domain_concept_tail + "(" + id.version_id + ")"
		end

	build_ontology_lineage is
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

	has_adl_generated_status(str: STRING):BOOLEAN
			-- True if str is in ADL syntax of the first line of an archetype file and contains the
			-- 'generated' flag in the meta-data part. The form of this string should be:
			-- archetype_id (flag; flag; flag...)
			-- FIXME: WARNING this is a hack because we are hard-coding for the 'generated' keyword here,
			-- but currently it is too complicated to extract it from the serialisation objects.
			-- This will be resolved in a few releases when all .adl archetypes are generated from.adls
		require
			str_exists: str /= Void
		local
			lpos, rpos: INTEGER
		do
			lpos := str.index_of('(', 1)
			rpos := str.index_of(')', 1)
			if lpos > 0 and rpos > lpos+1 then
				Result := str.substring (lpos+1, rpos-1).has_substring("generated")
			end
		end

	flatten is
			-- (re)generate flat-form of this archetype
		require
			is_valid
		local
			arch_flattener: ARCHETYPE_FLATTENER
		do
			if not differential_archetype.is_specialised then
				create flat_archetype_cache.make_from_differential (differential_archetype)
				-- the following treats a 'flat' top-level archetype as something that is fully flattened to the
				-- reference model, which simply means incorporating existence and cardinality from the RM
--					if rm_checker.model_loaded then
--						create arch_flattener.make_non_specialised (differential_archetype)
--						arch_flattener.rm_flatten_archetype
--					end
			else
				create arch_flattener.make_specialised (specialisation_parent.flat_archetype, differential_archetype)
				arch_flattener.flatten_specialised_archetype
				flat_archetype_cache := arch_flattener.arch_output_flat
			end
			flat_text_cache := Void
		end

	flat_text_cache: STRING
			-- may contain either read in legacy .adl file, or generated output from flattening process

	flat_archetype_cache: FLAT_ARCHETYPE
			-- archetype generated by reading in legacy .adl file, or flattening process

invariant
	compiler_status_attached: compiler_status /= Void
	flat_text_timestamp_natural: flat_text_timestamp >= 0
	differential_text_timestamp_natural: differential_text_timestamp >= 0
	differential_path_attached: differential_path /= Void
	flat_path_attached: flat_path /= Void
	full_is_flat_or_differential: full_path = flat_path xor full_path = differential_path
	differential_attached_if_valid: is_valid implies differential_archetype /= Void
	parent_existence: specialisation_parent /= Void implies is_specialised
	parent_validity: specialisation_parent /= Void implies specialisation_parent.id.semantic_id.is_equal (id.semantic_parent_id)
	slot_id_index_valid: slot_id_index /= Void implies not slot_id_index.is_empty
	used_by_index_valid: used_by_index /= Void implies not used_by_index.is_empty

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
