note
	component:   "openEHR Archetype Project"
	description: "Shared application resources for any ADL application, GUI or non-GUI"
	keywords:    "test, ADL"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.com>"
	copyright:   "Copyright (c) 2010 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL"
	revision:    "$LastChangedRevision"
	last_change: "$LastChangedDate"

class SHARED_APP_RESOURCES

inherit
	SHARED_RESOURCES

	BASIC_DEFINITIONS
		export
			{NONE} all
		end

	ARCHETYPE_DEFINITIONS
		export
			{NONE} all
		end

	SHARED_MESSAGE_DB
		export
			{NONE} all
		end

	SHARED_MESSAGE_BILLBOARD
		export
			{NONE} all
		end

feature -- Definitions

	Default_rm_schema_directory: STRING
			-- directory of Reference Model schema files; same as full path to app + "/rm_schemas";
			-- contains schema files in .dadl format e.g.
			-- .../rm_schemas/openehr_rm_102.dadl
		once
			Result := application_startup_directory.twin
			Result.append(os_directory_separator.out + "rm_schemas")
		end

feature -- Access

	current_language: STRING
		do
			Result := resource_value ("default", "current_language")
		end

	repository_profiles: attached HASH_TABLE [ARRAYED_LIST[STRING], STRING]
			-- hash of profiles each of which is a list of {ref_repo_path, working_repo_path} or maybe just
			-- {ref_repo_path}, keyed by profile name. The data are stored for the moment in the old-style
			-- resource .cfg file, in the following way:
			--
			-- [repository]
			-- profile_1=a_ref_path,a_working_path
			-- profile_2=a_ref_path,a_working_path
			-- ..
			-- profile_n=a_ref_path,a_working_path
			--
		do
			Result := resource_category_lists("profiles")
		end

	current_repository_profile: attached STRING
		do
			Result := resource_value("default", "current_repository_profile")
		end

	reference_repository_path: attached STRING
			-- path of root of ADL file tree
		do
			if repository_profiles.has (current_repository_profile) then
				Result := repository_profiles.item (current_repository_profile).i_th (1)
			else
				create Result.make(0)
			end
		end

	work_repository_path: attached STRING
			-- path of root of ADL file tree
		do
			if repository_profiles.has (current_repository_profile) and repository_profiles.item (current_repository_profile).count > 1 then
				Result := repository_profiles.item (current_repository_profile).i_th (2)
			else
				create Result.make(0)
			end
		end

	validation_strict: BOOLEAN
			-- Set strict validation on?
		local
			str: STRING
		do
			str := resource_value ("default", "validation_strict")
			if str.is_boolean then
				Result := str.to_boolean
			end
		end

	html_export_directory: attached STRING
			-- Path of directory to which HTML is exported.
		do
			Result := substitute_env_vars (resource_value ("default", "html_export_directory"))
		end

	test_diff_directory: attached STRING
			-- Path of directory where .adls files are saved by GUI_TEST_ARCHETYPE_TREE_CONTROL for diff testing.
		do
			Result := substitute_env_vars (resource_value ("default", "test_diff_directory"))
		end

	adl_version_for_flat_output: attached STRING
			-- version of ADL syntax to use for outputting flat archetypes
		do
			Result := substitute_env_vars (resource_value ("default", "adl_version_for_flat_output"))
			if Result.is_empty then
				Result := Latest_adl_version.twin
			end
		ensure
			not Result.is_empty
		end

	adl_version_for_flat_output_numeric: INTEGER
			-- generate a 3-digit numeric equivalent of the ADL version in use for serialisation, e.g.
			-- '1.5' -> 150
			-- '1.4.1' -> 141
		local
			s: STRING
		once
			if Adl_versions.has (adl_version_for_flat_output) then
				s := adl_version_for_flat_output.twin
			else
				s := Latest_adl_version.twin
			end
			s.prune_all ('.')
			if s.count < 3 then
				s.append (create {STRING}.make_filled ('0', 3 - s.count))
			end
			if s.is_integer then
				Result := s.to_integer
			end
		ensure
			Result > 100 and Result <= 999
		end

	rm_schemas_load_list: LIST [STRING]
			-- list of RM schemas to use
		do
			Result := resource_value_list ("default", "rm_schemas_load_list")
		ensure
			result_attached: attached Result
			value_comparison: Result.object_comparison
			no_empty_items: Result.for_all (agent (s: STRING): BOOLEAN do Result := attached s and then not s.is_empty end)
		end

feature -- Application Switch Setting

	set_current_language (a_lang: attached STRING)
			-- set the language that should be used to display archetypes in the UI.
		require
			a_lang_attached: not a_lang.is_empty
		do
			set_resource_value ("default", "current_language", a_lang)
		end

	set_repository_profiles (profiles: attached HASH_TABLE [ARRAYED_LIST[STRING], STRING])
			-- hash of profiles each of which is a list of {ref_repo_path, working_repo_path} or maybe just
			-- {ref_repo_path}, keyed by profile name. The data are stored for the moment in the old-style
			-- resource .cfg file, in the following way:
			--
			-- [repository]
			-- profile_1=a_ref_path,a_working_path
			-- profile_2=a_ref_path,a_working_path
			-- ..
			-- profile_n=a_ref_path,a_working_path
			--
		do
			set_resource_category_lists("profiles", profiles)
		end

	set_current_repository_profile(a_profile_name: STRING)
		require
			profile_name_valid: not a_profile_name.is_empty
		do
			set_resource_value("default", "current_repository_profile", a_profile_name)
		end

	remove_current_repository_profile
		do
			remove_resource("default", "current_repository_profile")
		end

	set_rm_schemas_load_list (a_schema_list: attached LIST [STRING])
			-- set rm_schemas(s)
		require
			a_schema_list_valid: not a_schema_list.is_empty
		do
			set_resource_value_list("default", "rm_schemas_load_list", a_schema_list)
		end

	set_html_export_directory (value: attached STRING)
			-- Set the path of directory to which HTML is exported.
		require
			value_not_empty: not value.is_empty
		do
			set_resource_value("default", "html_export_directory", value)
		end

	set_test_diff_directory (value: attached STRING)
			-- Set the path of directory to which .adls source files are written for diffing
		require
			value_not_empty: not value.is_empty
		do
			set_resource_value("default", "test_diff_directory", value)
		end

	set_adl_version_for_flat_output (value: attached STRING)
			-- Set version of ADL syntax to use for outputting flat archetypes.
		require
			value_not_empty: not value.is_empty
		do
			set_resource_value("default", "adl_version_for_flat_output", value)
		end

	set_validation_strict (flag: BOOLEAN)
			-- Set flag for strict parser validation
		do
			set_resource_value ("default", "validation_strict", flag.out)
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
--| The Original Code is shared_ui_resources.e.
--|
--| The Initial Developer of the Original Code is Thomas Beale.
--| Portions created by the Initial Developer are Copyright (C) 2003-2004
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
