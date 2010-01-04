note
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

	make (a_root_path, a_full_path: STRING; an_id: attached ARCHETYPE_ID; a_repository: ARCHETYPE_REPOSITORY_I)
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
				flat_path := extension_replaced (full_path, archetype_flat_file_extension)
			end
		ensure
			root_path_set: root_path = a_root_path
			full_path_set: full_path = a_full_path
			file_repository_set: file_repository = a_repository
			id_set: id = an_id
			no_compiler_status: compiler_status.is_empty
		end

feature -- Access

	id: attached ARCHETYPE_ID
			-- Archetype identifier.

	differential_archetype: TEMPLATE
			-- archetype representing differential structure with respect to parent archetype;
			-- if this is a non-specialised archetype, then it is the same as the flat form, else
			-- it is just the differences (like an object-oriented source file for a subclass)

feature -- Status Report - Compilation

	is_out_of_date: BOOLEAN
			-- Should this archetype be reparsed due to changes on the file system?
		do
			Result := not parse_attempted or is_differential_out_of_date
		end

feature -- Status Report - Semantic

	is_specialised: BOOLEAN
			-- True if this archetype is a specialisation of another archetype
		do
			Result := id.is_specialised
		end

feature -- Commands

	parse_differential
			-- Parse and validate `target'
		local
			legacy_flat_archetype: FLAT_ARCHETYPE
		do
			if not exception_encountered then
				reset
				clear_billboard
				set_parse_attempted

				if has_rm_checker (id.qualified_rm_name) then
					post_info (Current, "parse_archetype", "parse_archetype_i3", Void)
					read_differential
					differential_archetype := adl_engine.parse_differential (differential_text)
					if differential_archetype = Void then
						post_error (Current, "parse_archetype", "parse_archetype_e1", <<adl_engine.parse_error_text>>)
						is_valid := False
					else
						post_info (Current, "parse_archetype", "parse_archetype_i1", <<id.as_string>>)
						validate
					end

					if is_valid then
						-- Make sure that the language is set, and that it is one of the languages in the archetype.
						if (current_language = Void or not differential_archetype.has_language (current_language)) then
							set_current_language (differential_archetype.original_language.code_string)
						end
					end
				else
					post_error (Current, "parse_archetype", "model_access_e7", <<id.qualified_rm_name>>)
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

	clean_generated
			-- delete generated file and compiler products; forces next compilation to start from primary expression
		do
			if file_repository.is_valid_path (flat_path) then
				file_system.delete_file (flat_path)
			end
			flat_text_cache := Void
		end

feature {NONE} -- Implementation

	validate
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

	flatten
			-- (re)generate flat-form of this archetype
		require
			is_valid
		local
			arch_flattener: TEMPLATE_FLATTENER
		do
			if not differential_archetype.is_specialised then
				create arch_flattener.make_non_specialised (differential_archetype)
			else
				create arch_flattener.make_specialised (specialisation_parent.flat_archetype, differential_archetype)
			end
			arch_flattener.flatten
			flat_archetype_cache := arch_flattener.arch_output_flat
			flat_text_cache := Void
		end

	flat_archetype_cache: OPERATIONAL_TEMPLATE
			-- archetype generated by flattening process

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
