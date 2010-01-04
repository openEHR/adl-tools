note
	component:   "openEHR Archetype Project"
	description: "Common parent of Archetype an Template descriptors"
	keywords:    "ADL, archetype"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.com>"
	copyright:   "Copyright (c) 2009 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"


deferred class ARCH_REP_COMMON

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

feature -- Access

	id: attached RM_CONCEPT_ID
			-- Archetype identifier.
		deferred
		end

	differential_path: STRING
			-- Path of differential source file of archetype.

	flat_path: STRING
			-- Path of generated flat file of archetype.

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

	differential_text_timestamp: INTEGER
			-- Date and time at which the archetype differential file was last modified.

	last_compile_attempt_timestamp: DATE_TIME
			-- time last compile attempt made, set by set_parse_attempted

	differential_archetype: ARCHETYPE
			-- archetype representing differential structure with respect to parent archetype;
		deferred
		end

	flat_archetype: like flat_archetype_cache
			-- inheritance-flattened form of archetype
		do
			if flat_archetype_cache = Void and is_valid then
				flatten
			end
			Result := flat_archetype_cache
		end

	compiler_status: STRING
			-- errors from last compile attempt; allows redisplay if this archetype is reselected

	status: STRING
			-- status of last operation

	compiler_error_type: INTEGER
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

	has_differential_file: BOOLEAN
			-- Does the repository have a source-form file for this archetype?
		do
			Result := file_repository.is_valid_path (differential_path)
		end

	is_out_of_date: BOOLEAN
			-- Should this archetype be reparsed due to changes on the file system?
		deferred
		end

	is_differential_out_of_date: BOOLEAN
			-- Is differential_archetype out of date with respect to changes on the file system?
		do
			Result := differential_text_timestamp > 0 and file_repository.has_file_changed_on_disk (full_path, differential_text_timestamp)
		end

	parse_attempted: BOOLEAN
			-- True if a parse has been attempted on the currently available copy of this archetype
			-- (should be cleared if file is touched in any way)

	validate_attempted: BOOLEAN
			-- True if semantic validation has been attempted using ARCHETYPE_VALIDATOR

	is_parsed: BOOLEAN
			-- True if archetype has been parsed and loaded in at least differential form
		do
			Result := differential_archetype /= Void
		end

	save_succeeded: BOOLEAN
			-- True if last save operation was successful

	exception_encountered: BOOLEAN
			-- True if last operation caused an exception

feature -- Status Report - Semantic

	is_valid: BOOLEAN
			-- True if archetype object created and 'is_valid' True. This can be used to check if the archetype has
			-- actually been compiled and is available in memory. This is useful for specialised archetypes because
			-- you want to know if the parent has been compiled (up the lineage) before you can compile the current one

	has_compiler_status: BOOLEAN
			-- Does this archetype have any compiler errors or warnings?
		do
			Result := not compiler_status.is_empty
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

	reset
			-- reset after exception encountered
		do
			exception_encountered := False
			status.wipe_out
			compiler_status.wipe_out
		ensure
			Exception_cleared: not exception_encountered
			Status_cleared: status.is_empty
			Compiler_status_cleared: compiler_status.is_empty
		end

feature -- Commands

	parse_differential
			-- Parse and validate `target', in differential form if available, else in flat form.
		deferred
		end

	clean_generated
			-- delete generated file and compiler products; forces next compilation to start from primary expression
		deferred
		end

feature -- Comparison

	is_less alias "<" (other: like Current): BOOLEAN
			-- Is current object less than `other'?
		do
			if id.is_equal (other.id) then
				Result := full_path < other.full_path
			else
				Result := id < other.id
			end
		end

feature -- Factory

	create_new_differential(a_im_originator, a_im_name, a_im_entity, a_primary_language: STRING)
			-- create a new top-level differential archetype and install it into the directory according to its id
		require
			Info_model_originator_valid: a_im_originator /= void and then not a_im_originator.is_empty
			Info_model_name_valid: a_im_name /= void and then not a_im_name.is_empty
			Info_model_entity_valid: a_im_entity /= void and then not a_im_entity.is_empty
			Primary_language_valid: a_primary_language /= void and then not a_primary_language.is_empty
		deferred
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

feature {NONE} -- Implementation

	create_validator: ARCHETYPE_VALIDATOR is
			-- create the right kind of validator
		deferred
		end

	validate
			-- Perform various levels of validation on `differential_archetype'.
		require
			differential_attached: differential_archetype /= Void
		local
			validator: ARCHETYPE_VALIDATOR
		do
			is_valid := False
			validator := create_validator
			if validator.passed then
				validator.validate
				if validator.passed then
					post_info (Current, "validate (differential)", "parse_archetype_i2", <<id.as_string>>)
				else
					post_error (Current, "validate (differential)", "parse_archetype_e2", <<id.as_string, validator.errors>>)
				end

				if validator.has_warnings then
					post_warning (Current, "validate (differential)", "parse_archetype_w2", <<id.as_string, validator.warnings>>)
				end
			else
				post_error (Current, "set_archetype_differential", "parse_archetype_e2", <<id.as_string, validator.errors>>)
			end

			validate_attempted := True
			is_valid := validator.passed
			differential_archetype.set_is_valid (is_valid)
			archetype_directory.update_slot_statistics (Current)

			-- now perform validation which requires flat form
			if is_valid then
				validator.validate_flat
				if validator.passed then
					post_info (Current, "validate (flat)", "parse_archetype_i2", <<id.as_string>>)
				else
					post_error (Current, "validate (flat)", "parse_archetype_e2", <<id.as_string, validator.errors>>)
				end

				if validator.has_warnings then
					post_warning (Current, "validate (flat)", "parse_archetype_w2", <<id.as_string, validator.warnings>>)
				end

				is_valid := validator.passed
			end
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
			ontological_path.append (ontological_path_separator + arch_ont_path)

			-- generate parent ontological path if appropriate
			arch_ont_path := id.domain_concept_base

			if not arch_ont_path.is_empty then
				arch_ont_path.replace_substring_all (id.section_separator.out, ontological_path_separator)
				ontological_parent_path.append (ontological_path_separator + arch_ont_path)
			end

			base_name := id.domain_concept_tail + "(" + id.version_id + ")"
		end

	has_adl_generated_status (str: STRING): BOOLEAN
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

	flatten
			-- (re)generate flat-form of this archetype
		require
			is_valid
		deferred
		end

	flat_text_cache: STRING
			-- generated output from flattening process

	flat_archetype_cache: FLAT_ARCHETYPE
			-- archetype generated by flattening process

invariant
	compiler_status_attached: compiler_status /= Void
	differential_text_timestamp_natural: differential_text_timestamp >= 0
	differential_path_attached: differential_path /= Void
	differential_attached_if_valid: is_valid implies differential_archetype /= Void

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
