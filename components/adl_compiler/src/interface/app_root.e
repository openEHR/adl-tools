note
	component:   "openEHR Archetype Project"
	description: "[
				 Root application class for any ADL application; performs all application-wide initialisation.
				 ]"
	keywords:    "ADL"
	author:      "Thomas Beale"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2010 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class APP_ROOT

inherit
	SHARED_KNOWLEDGE_REPOSITORY

	SHARED_ARCHETYPE_COMPILER

	SHARED_REFERENCE_MODEL_ACCESS

	SHARED_ARCHETYPE_SERIALISERS
		export
			{NONE} all
		end

	-- FIXME: this is a hack to allow add_custom_dt_dynamic_type_from_string to be called, adding in some
	-- type correspondences that otherwise the runtime gets wrong if just INTERNAL.type_fromtype_name() is used
	DT_TYPES
		export
			{NONE} all
		end

feature -- Initialisation

	set_application_developer_name (a_name: attached STRING)
			-- override the default of "openEHR" for the developer (i.e. vendor) name; this
			-- name is what gets used in the user's app config path, install directory and so on
		do
			application_developer_name.make_from_string (a_name)
		end

	initialise
		local
			dummy_error_accumulator: ERROR_ACCUMULATOR
			strx: STRING
		once
			-- see DT_TYPES note above; a hack needed to make string name -> type_id work for class names
			-- that clash with Eiffel type names
			add_custom_dt_dynamic_type_from_string ("C_STRING", ({C_STRING}).type_id)
			add_custom_dt_dynamic_type_from_string ("C_DATE", ({C_DATE}).type_id)

			message_db.populate (Error_db_directory, locale_language_short)
			if message_db.database_loaded then

				-- set error reporting level in billboard and all error accumulator objects
				billboard.set_error_reporting_level(error_reporting_level)
				create dummy_error_accumulator.make
				dummy_error_accumulator.set_error_reporting_level (error_reporting_level)

				-- set a reasonable default for HTML output directory
				if html_export_directory.is_empty then
					set_html_export_directory (file_system.pathname (user_config_file_directory, "html"))
				end

				-- set a reasonable default for compiler generated artefacts directory
				if compiler_gen_directory.is_empty then
					set_compiler_gen_directory (file_system.pathname (user_config_file_directory, "gen"))
				end

				-- set a reasonable default for diff test file directory (where files are written from test page for comparison with a diff tool)
				if test_diff_directory.is_empty then
					set_test_diff_directory (file_system.pathname (user_config_file_directory, "diff_test"))
				end

				-- tell the user a few useful things
				post_warning (Current, "initialise", "adl_version_warning", <<adl_version_for_flat_output>>)

				if validation_strict then
					post_warning (Current, "initialise", "validation_strict", Void)
				else
					post_warning (Current, "initialise", "validation_non_strict", Void)
				end

				-- initialise serialisers
				initialise_serialisers

				-- set up the RM schemas
				if rm_schema_directory.is_empty then
					set_rm_schema_directory (default_rm_schema_directory)
				end
				if directory_exists (rm_schema_directory) then
					rm_schemas_access.initialise_with_load_list(rm_schema_directory, rm_schemas_load_list)
					rm_schemas_access.load_schemas
					if not rm_schemas_access.found_valid_schemas then
						create strx.make_empty
						rm_schemas_load_list.do_all (agent (s: STRING; err_str: STRING) do err_str.append(s + ", ") end (?, strx))
						strx.remove_tail (2) -- remove final ", "
						post_warning (Current, "initialise", "model_access_e0", <<strx, rm_schema_directory>>)
					end
				else
					post_error (Current, "initialise", "model_access_e5", <<rm_schema_directory>>)
				end

				-- adjust for repository profiles being out of sync with current profile setting (e.g. due to
				-- manual editing of .cfg file)
				if not repository_profiles.is_empty and not repository_profiles.has_current_profile then
					repository_profiles.start
					set_current_profile (repository_profiles.key_for_iteration)
				end
			end
		end

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
--| The Original Code is app_root.e.
--|
--| The Initial Developer of the Original Code is Thomas Beale.
--| Portions created by the Initial Developer are Copyright (C) 2010
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
