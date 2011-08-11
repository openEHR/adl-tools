note
	component:   "openEHR Archetype Project"
	description: "[
				 Root application class for any ADL application; performs all application-wide initialisation.
				 ]"
	keywords:    "ADL"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.com>"
	copyright:   "Copyright (c) 2010 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class APP_ROOT

inherit
	BOSPHORUS_SHARED_APP_RESOURCES

	SHARED_KNOWLEDGE_REPOSITORY

	SHARED_ARCHETYPE_COMPILER

	SHARED_REFERENCE_MODEL_ACCESS

	SHARED_SOURCE_REPOSITORIES

	SHARED_ARCHETYPE_SERIALISERS
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
			rep_profiles: attached HASH_TABLE [ARRAYED_LIST[STRING], STRING]
			dummy_error_accumulator: ERROR_ACCUMULATOR
		once
			--message_db.populate(Error_db_directory, locale_language_short)
			message_db.populate(error_db_directory_location, locale_language_short)
			if message_db.database_loaded then

				-- set error reporting level in billboard and all error accumulator objects
				billboard.set_error_reporting_level(error_reporting_level)
				create dummy_error_accumulator.make
				dummy_error_accumulator.set_error_reporting_level (error_reporting_level)

				-- set a reasonable default for HTML output directory
				if html_export_directory.is_empty then
					set_html_export_directory (file_system.pathname (user_config_file_directory, "html"))
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
				--rm_schemas_access.initialise(default_rm_schema_directory, rm_schemas_load_list)
				rm_schemas_access.initialise (rm_schema_directory_location, rm_schemas_load_list)
				rm_schemas_access.load_schemas

				if not rm_schemas_access.found_valid_schemas then
					create strx.make_empty
					rm_schemas_load_list.do_all(agent (s: STRING) do strx.append(s + ", ") end)
					strx.remove_tail (2) -- remove final ", "
					post_warning (Current, "initialise", "model_access_e0", <<strx, default_rm_schema_directory>>)
				end

				-- adjust for repository profiles being out of sync with current profile setting (e.g. due to
				-- manual editing of .cfg file
				rep_profiles := repository_profiles
				if not rep_profiles.is_empty and not rep_profiles.has (current_repository_profile) then
					rep_profiles.start
					set_current_repository_profile(rep_profiles.key_for_iteration)
				end

				initialised := True
			end
		end

	switch_to_profile (a_profile: attached STRING)
			-- switch to `a_profile'
		require
			repository_profiles.has (a_profile)
		do
			if not a_profile.same_string (current_repository_profile) then
				set_current_repository_profile(a_profile)
				use_current_profile
			end
		end

	use_current_profile
			-- switch to current profile
		do
			if directory_exists (reference_repository_path) then
				source_repositories.set_reference_repository (reference_repository_path)
				if not work_repository_path.is_empty then
					if source_repositories.valid_working_repository_path (work_repository_path) then
						source_repositories.set_work_repository (work_repository_path)
					else
						post_error (Current, "switch_to_profile", "work_repo_not_found", <<work_repository_path>>)
					end
				else
					source_repositories.remove_work_repository
				end
				arch_dir.clear
				arch_dir.populate
			else
				post_error (Current, "switch_to_profile", "ref_repo_not_found", <<reference_repository_path>>)
			end
		end

feature -- Status Report

	initialised: BOOLEAN
			-- True after successful initialisation

feature {NONE} -- Implementation

	strx: STRING

feature --configuration

	error_db_directory_location:STRING

	rm_schema_directory_location:STRING

	set_error_db_directory_location (path_of_dir:STRING)
	do
		error_db_directory_location := path_of_dir
	end

	set_rm_schema_directory_location (path_of_dir:STRING)
	do
		rm_schema_directory_location := path_of_dir
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
