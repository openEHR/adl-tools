note
	component:   "openEHR ADL Tools"
	description: "[
				 Version of persistence manager that implements functions for authored archetypes including templates,
				 which are considered as standalone files.
				 ]"
	keywords:    "ADL, archetype"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2014- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class AUTH_ARCH_PERSISTENCE_MGR

inherit
	ARCH_PERSISTENCE_MGR

create {ARCH_LIB_AUTHORED_ARCHETYPE}
	make, make_legacy, make_new_archetype

feature {NONE} -- Initialisation

	make (arch_thumbnail: ARCHETYPE_THUMBNAIL; a_path: STRING; a_source: ARCHETYPE_LIBRARY_SOURCE)
		require
			Path_valid: not a_path.is_empty
		do
			make_base (arch_thumbnail.archetype_id, arch_thumbnail.adl_version, a_path, a_source, arch_thumbnail.is_generated)
			source_text_timestamp := source_file_timestamp
			last_artefact_type := arch_thumbnail.artefact_type
		ensure
			file_repository_set: file_repository = a_source
		end

	make_legacy (arch_thumbnail: ARCHETYPE_THUMBNAIL; a_path: STRING; a_source: ARCHETYPE_LIBRARY_SOURCE)
		require
			Path_valid: not a_path.is_empty
		do
			make_base (arch_thumbnail.archetype_id, arch_thumbnail.adl_version, a_path, a_source, True)
			legacy_flat_path := extension_replaced (a_path, File_ext_archetype_adl14)
			legacy_flat_text_timestamp := legacy_flat_file_timestamp
			last_artefact_type := arch_thumbnail.artefact_type
		ensure
			file_repository_set: file_repository = a_source
		end

	make_new_archetype (an_id: ARCHETYPE_HRID; a_source: ARCHETYPE_LIBRARY_SOURCE; a_directory: STRING)
			-- Create a new archetype with `an_id', belonging to `a_source'.
		require
			Valid_directory: file_system.directory_exists (a_directory)
		do
			make_base (an_id, latest_adl_version, file_system.pathname (a_directory, an_id.physical_id + File_ext_archetype_source), a_source, False)
		ensure
			file_repository_set: file_repository = a_source
		end

feature -- Access

	source_text: STRING
			-- Read `differential_text_converted' and `text_timestamp' from `source_file_path', returning
			-- the text of the archetype source file, i.e. the differential form.
		local
			arch_text, line_1, adl_var_ver_text: STRING
			i: INTEGER
			amp: ARCHETYPE_MINI_PARSER
		do
			file_repository.read_text_from_file (source_file_path)
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
			Adl_version_string_regex_matcher.match (line_1)
			if Adl_version_string_regex_matcher.has_matched then
				adl_var_ver_text := Adl_version_string_regex_matcher.captured_substring (0)
				adl_version := adl_var_ver_text.substring (adl_var_ver_text.index_of ('=', 1) + 1, adl_var_ver_text.count)
				adl_version.left_adjust
			end

			if adl_version < Adl_id_code_version then
				adl_14_2_rewriter.execute (arch_text)
				Result := adl_14_2_rewriter.out_buffer
				is_text_converted := True
			else
				is_text_converted := False
				Result := arch_text
			end
			source_text_timestamp := source_file_timestamp

			-- extract other details
			create amp
			other_details := amp.extract_other_details (Result)
		end

	source_id: STRING
			-- a reliable identifier for the source
		do
			Result := source_file_path
		end

	source_file_path: STRING
			-- Path of differential source file of archetype.

feature -- Thumbnail state

	last_artefact_type: detachable STRING
			-- type of artefact i.e. archetype, template, template_component, operational_template
			-- known in file on disk at least read

	is_source_generated: BOOLEAN
			-- True if the source file was generated from the legacy form

	other_details: HASH_TABLE [STRING, STRING]
			-- 'other_details' part of archetype description section, containing regression code, MD5 etc
		attribute
			create Result.make (0)
		end

	is_reference_archetype: BOOLEAN
			-- True if archetype has path description/other_details["model_level"] = "reference"
		do
			Result := attached other_details.item ("model_level") as mlmd and then mlmd.is_equal ("reference")
		end

	adl_version: STRING
			-- ADL version of the most recently read differential text file
			-- if this version = 1.5.1, it means the file is already 1.5.1

feature -- Status Report

	has_source_file: BOOLEAN
			-- Does the repository have a source-form file for this archetype?
		do
			Result := file_system.file_exists (source_file_path)
		end

	is_source_modified: BOOLEAN
			-- Should this archetype be recompiled due to changes on the file system?
		do
			Result := has_source_file and is_source_file_modified or
				 has_legacy_flat_file and is_legacy_file_modified
		end

	has_legacy_flat_file: BOOLEAN
			-- Does the repository have a legacy flat-form file for this archetype?
		do
			Result := attached legacy_flat_path as lfp and then file_repository.is_valid_path (lfp)
		end

	is_adhoc: BOOLEAN
			-- True if this is an adhoc archetype
		do
			Result := file_repository.is_adhoc
		end

	has_source: BOOLEAN
		do
			Result := has_source_file
		end

feature {ARCH_LIB_ARCHETYPE} -- Status Report

	is_legacy_out_of_date: BOOLEAN
		do
			Result := has_legacy_flat_file and then (is_legacy_file_modified or
				is_legacy_newer_than_differential or
				has_source_file and source_file_timestamp < application_file_time_stamp)
		end

feature -- Status Setting

	set_is_source_generated (v: BOOLEAN)
		do
			is_source_generated := v
		end

feature -- File Operations

	refresh_from_source
			-- refresh from disk files that have been modified externally
		local
			amp: ARCHETYPE_MINI_PARSER
		do
			create amp
			if has_legacy_flat_file and then is_legacy_file_modified and then attached legacy_flat_path as lfp then
				amp.parse (lfp)
			elseif is_source_file_modified then
				amp.parse (source_file_path)
			end
			if amp.passed then
				-- if this check fails for now; need to implement change of artefact type
				if attached last_artefact_type as att_lav then
					check att_lav.is_equal (amp.last_archetype.artefact_type) end
				else
					last_artefact_type := amp.last_archetype.artefact_type
				end

				-- check for changes in id or parent id that might mean this node has to be moved in ARCHETYPE_DIRECTORY
				-- possible changes:
				-- 	* parent_id changed
				-- 	* changed from specialised to non-specialised
				if not amp.last_archetype.archetype_id.is_equal (id) then
					old_id := id
					id := amp.last_archetype.archetype_id
				else
					old_id := Void
				end
				if amp.last_archetype.is_specialised and attached parent_id as pid and then
					not amp.last_archetype.parent_archetype_id.is_equal (pid)
				then
					parent_id := amp.last_archetype.parent_archetype_id
				end
			else
				status :=  get_msg_line (ec_general, <<amp.error_strings>>)
			end
		end

feature -- File Management (Legacy)

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

	legacy_flat_path: detachable STRING
			-- Path of legacy flat file of archetype.

	legacy_flat_text: detachable STRING
			-- Read `legacy_flat_text_converted' and `text_timestamp' from `legacy_flat_path'.
			-- The text of the legacy archetype, if it exists
		require
			flat_file_available: has_legacy_flat_file
		local
			arch_text: STRING
			amp: ARCHETYPE_MINI_PARSER
		do
			check attached legacy_flat_path as lfp then
				file_repository.read_text_from_file (lfp)
			end
			check attached file_repository.text as t then
				arch_text := t
			end
			adl_14_2_rewriter.execute (arch_text)
			Result := adl_14_2_rewriter.out_buffer
			legacy_flat_text_timestamp := legacy_flat_file_timestamp

			create amp
			other_details := amp.extract_other_details (Result)
		end

feature {ARCH_LIB_ARCHETYPE} -- File Management (Legacy)

	clean_generated
			-- delete generated file and compiler products; forces next compilation to start from primary expression
		local
			flat_path: STRING
		do
			status.wipe_out
			if is_source_generated then
				if has_source_file then
					file_system.delete_file (source_file_path)
					status.append (get_msg_line (ec_clean_generated_file, <<source_file_path>>))
				end
			end

			-- FIXME: The following code is only needed for a period of time during which legacy users
			-- may have generated .adlf files into their source repositories; in the future, this will
			-- never happen, so the code below can be removed (e.g. at release following ADL 1.5 release)
			flat_path := extension_replaced (source_file_path, File_ext_archetype_flat)
			if file_system.file_exists (flat_path) then
				file_system.delete_file (flat_path)
			end
		end

feature {ARCH_LIB_ARCHETYPE} -- Commands

	has_differential_compiled_file: BOOLEAN
			-- Does the compile generated area have a differential file for this archetype from a previous compile?
			-- If it is newer than the source file, it can be read instead
		do
			Result := file_system.file_exists (differential_compiled_path)
		end

	save_differential_compiled (a_text: STRING)
			-- save validated differential archetype in fast-retrieve form (ODIN)
		local
			fd: PLAIN_TEXT_FILE
		do
			create fd.make_create_read_write (differential_compiled_path)
			fd.put_string (a_text)
			fd.close
		end

	compiled_differential: detachable STRING
		require
			has_differential_compiled_file
		local
			fd: PLAIN_TEXT_FILE
		do
			if file_system.file_exists (differential_compiled_path) then
				-- read the serialised P_ARCHETYPE (ODIN format) file
				create fd.make_open_read (differential_compiled_path)
				fd.read_stream (fd.count)
				Result := fd.last_string
				fd.close
			end
		end

	save_text_to_differential_file (a_text: STRING)
			-- save `a_text' to the differential file
		local
			fp: PLAIN_TEXT_FILE
		do
			create fp.make_open_write (source_file_path)
			fp.put_string (a_text)
			fp.close
		end

	save_text_to_legacy_file (a_text: STRING)
			-- save `a_text' to the legacy file
		local
			fp: PLAIN_TEXT_FILE
		do
			if attached legacy_flat_path as att_lfp then
				create fp.make_open_write (att_lfp)
				fp.put_string (a_text)
				fp.close
			end
		end

	save_as (a_full_path, a_text: STRING)
			-- Save `a_text' to `a_full_path'
		do
			file_repository.save_text_to_file (a_full_path, a_text)
		end

	remove_source_file
			-- remove the differential source file
		require
			has_source_file
		do
			file_system.delete_file (source_file_path)
		end

feature {GUI_SOURCE_CONTROL, ARCH_LIB_ARCHETYPE} -- File Management

	is_text_converted: BOOLEAN
			-- was last text converted from original form?

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

	save_source_text (a_text: STRING)
			-- Save `a_text' to source_file
		do
			file_repository.save_text_to_file (source_file_path, a_text)
			source_text_timestamp := source_file_timestamp
			status := get_msg_line (ec_file_saved_as_in_format, <<source_file_path, Syntax_type_adl>>)
		ensure
			source_text_timestamp = source_file_timestamp
		end

	source_text_original: STRING
			-- original form of differential file text, with no conversions
		obsolete
			"Remove when all at-coded 1.5 archetypes converted to 1.5.1"
		require
			source_file_available: has_source_file
		do
			file_repository.read_text_from_file (source_file_path)
			check attached file_repository.text as t then
				Result := t
			end
		end

feature {GUI_TEST_TOOL} -- File Operations

	differential_compiled_path: STRING
			-- path to persisted compiled source form of archetype
		do
			Result := file_system.pathname (compiler_gen_source_directory, id.as_filename + File_ext_odin)
		end

	save_legacy_to (a_full_path: STRING)
			-- Save current legacy archetype, if it exists to `a_full_path' in `serialise_format'.
		require
			path_valid: not a_full_path.is_empty
		do
			if attached legacy_flat_text as lft then
				file_repository.save_text_to_file (a_full_path, lft)
				status := get_msg_line (ec_file_saved_as_in_format, <<a_full_path, file_ext_archetype_adl14>>)
			end
		end

feature {NONE} -- Implementation

	file_repository: ARCHETYPE_LIBRARY_SOURCE
			-- The repository on which this item is found.

	is_legacy: BOOLEAN
		do
			Result := attached legacy_flat_path
		end

	is_source_file_modified: BOOLEAN
			-- Is differential_archetype out of date with respect to changes on the file system?
		require
			has_source_file
		do
			Result := source_file_timestamp /= source_text_timestamp
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
			Result := not has_source_file or else legacy_flat_file_timestamp > source_file_timestamp
		end

	source_file_timestamp: INTEGER
			-- Date and time at which the archetype differential file was last modified.
		require
			has_source_file: has_source_file
		do
			Result := file_system.file_time_stamp (source_file_path)
		ensure
			Result > 0
		end

	flat_compiled_path: STRING
			-- path to persisted compiled flat form of archetype
		do
			 Result := file_system.pathname (compiler_gen_flat_directory, id.as_filename + File_ext_odin)
		end

	legacy_flat_text_timestamp: INTEGER
			-- File modification date/time when legacy flat file was last read

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

	make_base (an_id: ARCHETYPE_HRID; an_adl_version: STRING; a_path: STRING; a_source: ARCHETYPE_LIBRARY_SOURCE; is_generated: BOOLEAN)
		do
			file_repository := a_source
			source_file_path := a_path
			is_source_generated := is_generated
			id := an_id
			adl_version := an_adl_version
		end

invariant
	legacy_text_timestamp_valid: has_legacy_flat_file implies legacy_flat_text_timestamp > 0
	source_text_timestamp_valid: has_source_file implies source_text_timestamp > 0

end

