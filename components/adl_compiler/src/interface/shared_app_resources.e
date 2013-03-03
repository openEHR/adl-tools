note
	component:   "openEHR Archetype Project"
	description: "Shared application resources for any ADL application, GUI or non-GUI"
	keywords:    "test, ADL"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2010- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "See notice at bottom of class"

class SHARED_APP_RESOURCES

inherit
	SHARED_APP_CONFIG_FILE_ACCESS
		redefine
			app_cfg_initialise
		end

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

	SHARED_TERMINOLOGY_SERVICE
		export
			{NONE} all
		end

feature -- Definitions

	ADL_help_page_url: STRING = "http://www.openehr.org/downloads/ADLworkbench/home"
			-- The URL to ADL Workbench's online help.

	Release_notes_file_path: STRING = "http://www.openehr.org/downloads/ADLworkbench/releasenotes"
			-- The path to ADL Workbench's release notes.

	clinical_knowledge_manager_url: STRING = "http://www.openehr.org/knowledge/"
			-- The URL to CKM.

	Repository_report_filename: STRING = "ArchetypeRepositoryReport.xml"

	Default_rm_schema_directory: attached STRING
			-- default directory of Reference Model schema files; same as full path to app + "/rm_schemas";
			-- contains schema files in .dadl format e.g.
			-- .../rm_schemas/openehr_rm_102.bmm
		once
			Result := file_system.pathname (application_startup_directory, "rm_schemas")
		end

	Default_terminology_directory: STRING
			-- default directory of Reference Model terminology files; same as full path to app + "/terminology";
			-- directory of openEHR terminology files; structure is
			-- $terminology_directory/lang/openehr_terminology.xml
		once
			Result := file_system.pathname (application_startup_directory, "terminology")
		end

	Terminology_filename: STRING = "openehr_terminology.xml"
			-- name of a terminology file in a given language

	Error_db_directory: STRING
			-- directory of error database files in .dadl format e.g.
			-- .../error_db/dadl_errors.txt etc
		once
			Result := file_system.pathname (application_startup_directory, "error_db")
		end

	Default_xml_rules_file_path: STRING
			-- Default full path to XML rules file for all adl_workbench-derived apps - use the adl_workbench one
		once
			Result := file_system.pathname (Default_user_config_file_directory, extension_replaced ("xml_rules", User_config_file_extension))
		ensure
			not_empty: not Result.is_empty
		end

	xml_rules_file_path: STRING
			-- Full path to XML rules file.
		once
			Result := file_system.pathname (user_config_file_directory, extension_replaced ("xml_rules", User_config_file_extension))
		ensure
			not_empty: not Result.is_empty
		end

	xml_rules_sample_file_path: STRING
			-- Full path to XML rules file.
		once
			Result :=  file_system.pathname (application_startup_directory, extension_replaced ("sample_xml_rules", User_config_file_extension))
		ensure
			not_empty: not Result.is_empty
		end

	Report_css_template_filename: STRING = "ArchetypeRepositoryReport.css"

	Report_css_template_path: STRING
			-- path to .css template file to copy when generating HTML report files
		once
			Result := file_system.pathname (application_startup_directory, Report_css_template_filename)
		end

	Default_author_name: STRING = "My Name <my_email_id@my_org.org>"

	Default_author_org: STRING = "Org name <http://www.my_org.org>"

	Default_author_copyright: STRING_32
		once
		--	Result := "Copyright " + UTF8_copyright_char.out + (create {DATE}.make_now).year.out + " My Name OR Some Org"
			Result := "Copyright (c) " + (create {DATE}.make_now).year.out + " My Name OR Some Org"
		end

feature -- Initialisation

	app_cfg_initialise
			-- do some once-off initialisation - attach a listener to config file loaded
		do
			app_cfg.add_refresh_listener (agent resources_refresh_from_file)
		end

feature -- Application Switches

	archetype_view_language: STRING
		do
			Result := app_cfg.string_value ("/general/archetype_view_language")
		end

	set_archetype_view_language (a_lang: STRING)
			-- set the language that should be used to display archetypes in the UI.
		require
			a_lang_attached: not a_lang.is_empty
		do
			app_cfg.put_value ("/general/archetype_view_language", a_lang)
		end

	error_reporting_level: INTEGER
			-- Level of error reporting required; see BILLBOARD_MESSAGE_TYPES for levels
			-- all levels >= the one stored will be displayed; Info is the minimum.
		do
			Result := app_cfg.integer_value ("/general/error_reporting_level")
			if not is_valid_error_type (Result) then
				Result := Error_type_info
			end
		end

	set_error_reporting_level (v: INTEGER)
			-- Set `status_reporting_level'.
		do
			app_cfg.put_value ("/general/error_reporting_level", v)
		end

	rm_schemas_load_list: LIST [STRING]
			-- list of RM schemas to use
		do
			Result := app_cfg.string_list_value ("/rm_schemas/load_list")
			Result.compare_objects
		ensure
			result_attached: attached Result
			value_comparison: Result.object_comparison
			no_empty_items: Result.for_all (agent (s: STRING): BOOLEAN do Result := attached s and then not s.is_empty end)
		end

	set_rm_schemas_load_list (a_schema_list: LIST [STRING])
			-- set rm_schemas(s)
		require
			a_schema_list_valid: not a_schema_list.is_empty
		do
			app_cfg.put_value("/rm_schemas/load_list", a_schema_list)
		end

	repository_profiles: REPOSITORY_PROFILE_CONFIG
			-- hash of profiles each of which is a list of {ref_repo_path, working_repo_path} or maybe just
			-- {ref_repo_path}, keyed by profile name. The data are stored in the following way:
			--
			--	profile = <
			--		current_repository_profile = <"CKM">
			--		profiles = <
			--			["CKM"] = <
			--				reference_repository = <"C:\\project\\openehr\\knowledge\\archetypes\\CKM">
			--			>
			--			["abc"] = <
			--				reference_repository = <"C:\\some\\other\\ref\\dir">
			--				work_repository = <"C:\\some\\other\\work\\dir">
			--			>
			--		>
			--	>
			--
		do
			if attached repository_profiles_cache.item as pci then
				Result := pci
			else
				if attached {REPOSITORY_PROFILE_CONFIG} app_cfg.object_value ("/profile", "REPOSITORY_PROFILE_CONFIG") as p then
					Result := p
				else
					create Result.default_create
				end
				repository_profiles_cache.put (Result)
			end
		end

	set_repository_profiles (profiles: REPOSITORY_PROFILE_CONFIG)
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
			repository_profiles_cache.put (profiles)
			app_cfg.put_object ("/profile", profiles)
		end

	set_current_profile (a_profile_name: STRING)
		require
			profile_name_valid: not a_profile_name.is_empty
		do
			repository_profiles.set_current_profile_name (a_profile_name)
			app_cfg.put_object ("/profile", repository_profiles)
		ensure
			profile_set: repository_profiles.current_profile_name.same_string (a_profile_name)
		end

	init_gen_dirs_from_current_profile
			-- create compiler source and flat generated file areas for current profile
		require
			repository_profiles.has_current_profile
		local
			curr_prof: STRING
		do
			check attached repository_profiles.current_profile_name as cpn then
				curr_prof := cpn
			end
			compiler_gen_source_directory.copy (file_system.pathname (file_system.pathname (compiler_gen_directory, curr_prof), "source"))
			if not file_system.directory_exists (compiler_gen_source_directory) then
				file_system.recursive_create_directory (compiler_gen_source_directory)
			end

			compiler_gen_flat_directory.copy (file_system.pathname (file_system.pathname (compiler_gen_directory, curr_prof), "flat"))
			if not file_system.directory_exists (compiler_gen_flat_directory) then
				file_system.recursive_create_directory (compiler_gen_flat_directory)
			end
		end

	clear_current_repository_profile
		do
			repository_profiles.clear_current_profile
			app_cfg.put_object("/profile", repository_profiles)
		end

	adl_version_for_flat_output_numeric: INTEGER
			-- generate a 3-digit numeric equivalent of the ADL version in use for serialisation, e.g.
			-- '1.5' -> 150
			-- '1.4.1' -> 141
		local
			s: STRING
		do
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

	adl_version_for_flat_output: STRING
			-- version of ADL syntax to use for outputting flat archetypes
		do
			Result := app_cfg.string_value ("/compiler/adl_version_for_flat_output")
			if Result.is_empty then
				Result := Latest_adl_version.twin
			end
		ensure
			not Result.is_empty
		end

	set_adl_version_for_flat_output (a_value: STRING)
			-- Set version of ADL syntax to use for outputting flat archetypes.
		require
			value_not_empty: not a_value.is_empty
		do
			app_cfg.put_value ("/compiler/adl_version_for_flat_output", a_value)
		end

	validation_strict: BOOLEAN
			-- Set strict validation on?
		do
			Result := app_cfg.boolean_value ("/compiler/validation_strict")
		end

	set_validation_strict (flag: BOOLEAN)
			-- Set flag for strict parser validation
		do
			app_cfg.put_value ("/compiler/validation_strict", flag)
		end

	rm_flattening_on: BOOLEAN
			-- Set RM flattening on?
		do
			Result := app_cfg.boolean_value ("/compiler/rm_flattening")
		end

	set_rm_flattening_on (flag: BOOLEAN)
			-- Set flag for RM flattening
		do
			app_cfg.put_value ("/compiler/rm_flattening", flag)
		end

	rm_schema_directory: STRING
			-- Path of directory where RM schemas are found - note: this should be writable.
		do
			Result := app_cfg.string_value_env_var_sub ("/file_system/rm_schema_directory")
		end

	set_rm_schema_directory (a_path: STRING)
			-- Set the path of directory where RM schemas are found
		require
			path_not_empty: not a_path.is_empty
		do
			app_cfg.put_value ("/file_system/rm_schema_directory", a_path)
		end

	terminology_directory: STRING
			-- Path of directory where RM schemas are found - note: this should be writable.
		do
			Result := app_cfg.string_value_env_var_sub ("/file_system/terminology_directory")
		end

	set_terminology_directory (a_path: STRING)
			-- Set the path of directory where openEHR reference terminology is found
		require
			path_not_empty: not a_path.is_empty
		do
			app_cfg.put_value ("/file_system/terminology_directory", a_path)
		end

	export_directory: STRING
			-- Path of directory to which HTML is exported.
		do
			Result := app_cfg.string_value_env_var_sub ("/file_system/export_directory")
			if Result.is_empty then
				Result := file_system.pathname (user_config_file_directory, "export")
				set_export_directory (Result)
			end
		end

	set_export_directory (a_path: STRING)
			-- Set the root path of directories to which serialised files are exported.
		require
			path_not_empty: not a_path.is_empty
		do
			app_cfg.put_value ("/file_system/export_directory", a_path)
		end

	html_export_directory: STRING
			-- Path of directory to which HTML is exported.
		do
			Result := app_cfg.string_value_env_var_sub ("/file_system/html_export_directory")
			if Result.is_empty then
				Result := file_system.pathname (export_directory, Syntax_type_adl_html)
			end
		end

	set_html_export_directory (a_path: attached STRING)
			-- Set the path of directory to which HTML is exported.
		require
			path_not_empty: not a_path.is_empty
		do
			app_cfg.put_value ("/file_system/html_export_directory", a_path)
		end

	test_diff_directory: STRING
			-- Path of directory where .adls files are saved by GUI_TEST_ARCHETYPE_TREE_CONTROL for diff testing.
		do
			Result := app_cfg.string_value_env_var_sub ("/file_system/test_diff_directory")
			if Result.is_empty then
				Result := file_system.pathname (user_config_file_directory, "diff_test")
				set_test_diff_directory (Result)
			end
		end

	set_test_diff_directory (a_path: STRING)
			-- Set the path of directory where diffs are written
		require
			path_not_empty: not a_path.is_empty
		do
			app_cfg.put_value ("/file_system/test_diff_directory", a_path)
		end

	compiler_gen_directory: STRING
			-- Path of directory where compiler generated files go
		do
			Result := app_cfg.string_value_env_var_sub ("/file_system/compiler_gen_directory")
			if Result.is_empty and attached file_system.pathname (user_config_file_directory, "gen") as pn then
				Result := pn
				set_compiler_gen_directory (Result)
			end
		end

	set_compiler_gen_directory (a_path: STRING)
			-- Set the path of directory where compiler generated files go
		require
			path_not_empty: not a_path.is_empty
		do
			app_cfg.put_value("/file_system/compiler_gen_directory", a_path)
		end

	author_name: STRING
			-- default name string to insert into newly created archetype description section
		do
			Result := app_cfg.string_value ("/authoring/author_name")
			if Result.is_empty then
				Result := Default_author_name.twin
			end
		ensure
			not Result.is_empty
		end

	set_author_name (a_value: STRING)
			-- Set `author_name'
		require
			value_not_empty: not a_value.is_empty
		do
			app_cfg.put_value ("/authoring/author_name", a_value)
		end

	author_org: STRING
			-- default organisation name string to insert into newly created archetype description section
		do
			Result := app_cfg.string_value ("/authoring/author_org")
			if Result.is_empty then
				Result := Default_author_org.twin
			end
		ensure
			not Result.is_empty
		end

	set_author_org (a_value: STRING)
			-- Set `author_org'
		require
			value_not_empty: not a_value.is_empty
		do
			app_cfg.put_value ("/authoring/author_org", a_value)
		end

	author_copyright: attached STRING
			-- default copyright string to insert into newly created archetype description section
		do
			Result := app_cfg.string_value ("/authoring/author_copyright")
			if Result.is_empty then
				Result := Default_author_copyright.twin
			end
		ensure
			not Result.is_empty
		end

	set_author_copyright (a_value: STRING)
			-- Set `author_copyright'
		require
			value_not_empty: not a_value.is_empty
		do
			app_cfg.put_value ("/authoring/author_copyright", a_value)
		end

feature {NONE} -- Cached Settings

	compiler_gen_source_directory: STRING
			-- Path of directory where compiled source files go in dADL serialisation form
		once
			create Result.make_empty
		end

	compiler_gen_flat_directory: STRING
			-- Path of directory where compiled flat files go in dADL serialisation form
		once
			create Result.make_empty
		end

	repository_profiles_cache: CELL [detachable REPOSITORY_PROFILE_CONFIG]
		once
			create Result.put (Void)
		end

	resources_refresh_from_file
			-- actions to clear any cached content from config file, due to file being re-loaded
		do
			repository_profiles_cache.put (Void)
			init_gen_dirs_from_current_profile
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
