note
	component:   "openEHR ADL Tools"
	description: "Shared application resources for any ADL application, GUI or non-GUI"
	keywords:    "test, ADL"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2010- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class SHARED_ADL_APP_RESOURCES

inherit
	SHARED_BMM_APP_RESOURCES
		redefine
			app_cfg_initialise, Application_developer_name, Fallback_application_name
		end

	ARCHETYPE_DEFINITIONS
		export
			{NONE} all
		end

	SHARED_TERMINOLOGY_SERVICE
		export
			{NONE} all
		end

	SHARED_MESSAGE_DB
		export
			{NONE} all
		end

	ADL_MESSAGES_IDS
		export
			{NONE} all
		end

	GENERAL_MESSAGES_IDS
		export
			{NONE} all
		end

	ODIN_MESSAGES_IDS
		export
			{NONE} all
		end

	BMM_MESSAGES_IDS
		export
			{NONE} all
		end

	ADL_2_TERM_CODE_TOOLS
		export
			{NONE} all
		end

	SHARED_REFERENCE_MODEL_ACCESS
		export
			{NONE} all
		end

	SHARED_AOM_PROFILES_ACCESS
		export
			{NONE} all
		end

feature -- Definitions

	Application_developer_name: STRING
			-- usually the company or organisation name of the application vendor.
		once ("PROCESS")
			Result := "openEHR"
		end

	Fallback_application_name: STRING
		once ("PROCESS")
			Result := "adl_workbench"
		end

	ADL_help_page_url: STRING = "http://www.openehr.org/downloads/ADLworkbench/home"
			-- The URL to ADL Workbench's online help.

	Bug_reporter_url: STRING = "https://openehr.atlassian.net/browse/AWBPR"
			-- The URL to ADL Workbench's problem reporter.

	Source_url: STRING = "https://github.com/openEHR/adl-tools.git"
			-- URL for source project

	Release_notes_file_path: STRING = "http://www.openehr.org/downloads/ADLworkbench/release_notes"
			-- The path to ADL Workbench's release notes.

	clinical_knowledge_manager_url: STRING = "http://www.openehr.org/ckm/"
			-- The URL to CKM.

	external_tools_help_page_url: STRING = "http://www.openehr.org/downloads/ADLworkbench/external_tools"
			-- URL of external tools help page in AWB documentation

	Library_report_filename: STRING = "ArchetypeRepositoryReport.xml"

	Default_aom_profile_directory: STRING
			-- default directory of AOM profile files (*.arp files, in dadl format)
		once ("PROCESS")
			Result := file_system.pathname (application_startup_directory, "aom_profiles")
		end

	Default_terminology_directory: STRING
			-- default directory of Reference Model terminology files; same as full path to app + "/terminology";
			-- directory of openEHR terminology files; structure is
			-- $terminology_directory/lang/openehr_terminology.xml
		once ("PROCESS")
			Result := file_system.pathname (application_startup_directory, "terminology")
		end

	Terminology_filename: STRING = "openehr_terminology.xml"
			-- name of a terminology file in a given language

	Report_css_template_filename: STRING = "ArchetypeRepositoryReport.css"

	Report_css_template_path: STRING
			-- path to .css template file to copy when generating HTML report files
		once ("PROCESS")
			Result := file_system.pathname (application_startup_directory, Report_css_template_filename)
		end

	Default_author_name: STRING = "My Name <my_email_id@my_org.org>"

	Default_author_org: STRING = "Org name <http://www.my_org.org>"

	Default_author_copyright: STRING_32
		once ("PROCESS")
		--	Result := "Copyright " + UTF8_copyright_char.out + (create {DATE}.make_now).year.out + " My Name OR Some Org"
			Result := "Copyright (c) " + (create {DATE}.make_now).year.out + " My Name OR Some Org"
		end

	Default_author_licence: STRING_32
		once ("PROCESS")
			Result := "Creative Commons CC-BY 4.0 unported <http://creativecommons.org/>"
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
			if Result.is_empty then
				Result := Default_language
			end
		end

	set_archetype_view_language (a_lang: STRING)
			-- set the language that should be used to display archetypes in the UI.
		require
			a_lang_attached: not a_lang.is_empty
		do
			app_cfg.put_string_value ("/general/archetype_view_language", a_lang)
		end

	repository_resources_path: STRING
			-- path of the REPOSITORY_CONFIG_TABLE within the parent object representing the whole .cfg file
		once ("PROCESS")
			Result := "/" + {REPOSITORIES_TABLE}.root_attribute_name
		end

	repository_resources: REPOSITORIES_TABLE
			-- hash of repo configs each of which is a list of {ref_repo_path, working_repo_path} configs or maybe just
			-- {ref_repo_path}, keyed by config name. The data are stored in the following way:
			--
			--	locations = <
			--		["CKM"] = <"C:\\project\\openehr\\knowledge\\archetypes\\CKM">
			--		["abc"] = <"C:\\some\\other\\ref\\dir">
			--	>
			--
		do
			if attached repository_resources_cache.item as pci then
				Result := pci
			else
				if attached {REPOSITORIES_TABLE} app_cfg.object_value (repository_resources_path, ({REPOSITORIES_TABLE}).name) as p then
					Result := p
				else
					create Result.default_create
				end
				repository_resources_cache.put (Result)
			end
		end

	add_repository_resource (a_repo_dir: STRING)
			-- add a new repository to repository path
		do
			repository_resources.put_repository (a_repo_dir)
			save_repository_resources
		end

	forget_repository_resource (a_path: STRING)
			-- remove repository with key `a_path'
		do
			repository_resources.remove_repository (a_path)
			save_repository_resources
		end

	save_repository_resources
			-- hash of repository paths
		do
			app_cfg.put_object (repository_resources_path, repository_resources)

			-- FIXME: temporary - retain for a few releases until all users
			-- have installed the beta 11 release or later
			if app_cfg.has_resource ("/repository_config_table") then
				app_cfg.remove_resource ("/repository_config_table")
			end
		end

	current_library_name: STRING
			-- name of current library
		do
			Result := app_cfg.string_value_env_var_sub ("/repositories/current_library_name")
		end

	forget_current_library_name
			-- Set name of current library
		do
			if app_cfg.has_resource ("/repositories/current_library_name") then
				app_cfg.remove_resource ("/repositories/current_library_name")
			end
		end

	set_current_library_name (a_path: STRING)
			-- Set name of current library
		require
			path_not_empty: not a_path.is_empty
		do
			app_cfg.put_string_value ("/repositories/current_library_name", a_path)
		end

	default_namespaces: HASH_TABLE [STRING, STRING]
		once ("PROCESS")
			create Result.make(0)
			Result.put ("org.openehr", "oe")
		end

	namespace_table_path: STRING
			-- path of the NAMESPACE_TABLE within the parent object representing the whole .cfg file
		once ("PROCESS")
			Result := "/" + {NAMESPACE_TABLE}.root_attribute_name
		end

	namespace_table: NAMESPACE_TABLE
			-- hash of namespaces and references. The data are stored in the following way:
			--
			--	namespace_table = <
			--		 namespaces = <
			--			 ["oe"] = <"org.openehr">
			--			 ["nhs"] = <"uk.gov.nhs">
			--		 >
			--	>
			--
		do
			if attached namespace_table_cache.item as nsi then
				Result := nsi
			else
				if attached {NAMESPACE_TABLE} app_cfg.object_value (namespace_table_path, ({NAMESPACE_TABLE}).name) as p then
					Result := p
				else
					create Result.make (default_namespaces)
				end
				namespace_table_cache.put (Result)
			end
		end

	set_namespace_table (a_namespace_table: NAMESPACE_TABLE)
			-- set namespace table.
		do
			namespace_table_cache.put (a_namespace_table)
			app_cfg.put_object (namespace_table_path, a_namespace_table)
		end

	default_terminology_uri_templates: HASH_TABLE [STRING, STRING]
		once ("PROCESS")
			create Result.make(0)
			Result.put ("http://snomed.info/id/$code_string", "snomedct")
			Result.put ("http://snomed.info/id/$code_string", "snomed-ct")
			Result.put ("http://snomed.info/id/$code_string", "snomed")
			Result.put ("http://openehr.org/id/$code_string", "openehr")
			Result.put ("http://loinc.org/id/$code_string", "loinc")
		end

	terminology_settings_path: STRING
			-- path of the TERMINOLOGY_SETTINGS within the parent object representing the whole .cfg file
		once ("PROCESS")
			Result := "/" + {TERMINOLOGY_SETTINGS}.root_attribute_name
		end

	terminology_settings: TERMINOLOGY_SETTINGS
			-- hash of terminology template URIs keyed by terminology name. The data are stored in the following way:
			--
			--		 uri_templates = <
			--			 ["snomedct"] = <"http://snomed.info/id/$code_string">
			--			 ["loinc"] = <"http://loinc.org/id/$code_string">
			--			 ["openehr"] = <"http://openehr.org/id/$code_string">
			--		 >
			--
		do
			if attached terminology_settings_cache.item as nsi then
				Result := nsi
			else
				if attached {TERMINOLOGY_SETTINGS} app_cfg.object_value (terminology_settings_path, ({TERMINOLOGY_SETTINGS}).name) as p then
					Result := p
				else
					create Result.make (default_terminology_uri_templates)
				end
				terminology_settings_cache.put (Result)
			end
		end

	set_terminology_settings (a_terminology_settings: TERMINOLOGY_SETTINGS)
			-- set terminology settings.
		do
			terminology_settings_cache.put (a_terminology_settings)
			app_cfg.put_object (terminology_settings_path, a_terminology_settings)
		end

	uri_for_terminology_code (a_term_code: TERMINOLOGY_CODE): STRING
			-- convert to a URI string
		do
			Result := uri_for_terminology_code_string (a_term_code.terminology_id, a_term_code.code_string)
		end

	uri_for_terminology_code_string (a_terminology_id, a_code: STRING): STRING
			-- convert to a URI string
		do
			if terminology_settings.uri_templates.has (a_terminology_id.as_lower) then
				create Result.make_from_string (terminology_settings.uri (a_terminology_id.as_lower))
			else
				create Result.make_from_string (Default_uri_template)
				Result.replace_substring_all ("$terminology_id", a_terminology_id)
			end
			Result.replace_substring_all ("$code_string", a_code)
		end

	init_gen_dirs_from_current_library
			-- create compiler source and flat generated file areas for current library
		require
			not current_library_name.is_empty
		do
			compiler_gen_source_directory.copy (file_system.pathname (file_system.pathname (compiler_gen_directory, current_library_name), "source"))
			if not file_system.directory_exists (compiler_gen_source_directory) then
				file_system.recursive_create_directory (compiler_gen_source_directory)
			end

			compiler_gen_flat_directory.copy (file_system.pathname (file_system.pathname (compiler_gen_directory, current_library_name), "flat"))
			if not file_system.directory_exists (compiler_gen_flat_directory) then
				file_system.recursive_create_directory (compiler_gen_flat_directory)
			end
		end

	validation_strict: BOOLEAN
			-- Set strict validation on?
		do
			Result := app_cfg.boolean_value ("/compiler/validation_strict")
		end

	set_validation_strict (flag: BOOLEAN)
			-- Set flag for strict parser validation
		do
			app_cfg.put_boolean_value ("/compiler/validation_strict", flag)
		end

	compiler_quiet: BOOLEAN
			-- Is quiet reporting mode on?
		do
			Result := app_cfg.boolean_value ("/compiler/compiler_quiet")
		end

	set_compiler_quiet (flag: BOOLEAN)
			-- Set flag for quiet mode
		do
			app_cfg.put_boolean_value ("/compiler/compiler_quiet", flag)
		end

	rm_flattening_on: BOOLEAN
			-- Set RM flattening on?
		do
			Result := app_cfg.boolean_value ("/compiler/rm_flattening")
		end

	set_rm_flattening_on (flag: BOOLEAN)
			-- Set flag for RM flattening
		do
			app_cfg.put_boolean_value ("/compiler/rm_flattening", flag)
		end

	aom_profile_directory: STRING
			-- Path of directory where AOM profiles are found - note: this should be writable.
		do
			Result := app_cfg.string_value_env_var_sub ("/file_system/aom_profile_directory")
		end

	set_aom_profile_directory (a_path: STRING)
			-- Set the path of directory where AOM profiles are found
		require
			path_not_empty: not a_path.is_empty
		do
			app_cfg.put_string_value ("/file_system/aom_profile_directory", a_path)
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
			app_cfg.put_string_value ("/file_system/terminology_directory", a_path)
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
			app_cfg.put_string_value ("/file_system/export_directory", a_path)
		end

	export_generation_directory (an_export_format: STRING; export_flat_flag: BOOLEAN): STRING
			-- generate an export path of the form
			-- 	export_dir_root/format/diff_or_flat
			--	e.g.
			--	
		do
			Result := file_system.pathname (
				file_system.pathname (file_system.pathname (export_directory, current_library_name), an_export_format),
				if export_flat_flag then "flat" else "differential" end)
		end

	html_export_directory: STRING
			-- Path of directory to which HTML is exported.
		do
			Result := app_cfg.string_value_env_var_sub ("/file_system/html_export_directory")
			if Result.is_empty then
				Result := file_system.pathname (export_directory, Syntax_type_adl_html)
			end
		end

	set_html_export_directory (a_path: STRING)
			-- Set the path of directory to which HTML is exported.
		require
			path_not_empty: not a_path.is_empty
		do
			app_cfg.put_string_value ("/file_system/html_export_directory", a_path)
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
			app_cfg.put_string_value ("/file_system/test_diff_directory", a_path)
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
			app_cfg.put_string_value("/file_system/compiler_gen_directory", a_path)
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
			app_cfg.put_string_value ("/authoring/author_name", a_value)
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
			app_cfg.put_string_value ("/authoring/author_org", a_value)
		end

	author_copyright: STRING
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
			app_cfg.put_string_value ("/authoring/author_copyright", a_value)
		end

	author_licence: STRING
			-- default licence string to insert into newly created archetype description section
		do
			Result := app_cfg.string_value ("/authoring/author_licence")
			if Result.is_empty then
				Result := Default_author_licence.twin
			end
		ensure
			not Result.is_empty
		end

	set_author_licence (a_value: STRING)
			-- Set `author_licence'
		require
			value_not_empty: not a_value.is_empty
		do
			app_cfg.put_string_value ("/authoring/author_licence", a_value)
		end

	adl_roundtripping: BOOLEAN
			-- Set adl_15_roundtripping on
		do
			Result := app_cfg.boolean_value ("/compiler/adl_roundtripping")
		end

	set_adl_roundtripping (flag: BOOLEAN)
			-- Set flag for adl_15_roundtripping
		do
			app_cfg.put_boolean_value ("/compiler/adl_roundtripping", flag)
		end

feature {NONE} -- Cached Settings

	compiler_gen_source_directory: STRING
			-- Path of directory where compiled source files go in ODIN serialisation form
		once ("PROCESS")
			create Result.make_empty
		end

	compiler_gen_flat_directory: STRING
			-- Path of directory where compiled flat files go in ODIN serialisation form
		once ("PROCESS")
			create Result.make_empty
		end

	repository_resources_cache: CELL [detachable REPOSITORIES_TABLE]
		once ("PROCESS")
			create Result.put (Void)
		end

	namespace_table_cache: CELL [detachable NAMESPACE_TABLE]
		once ("PROCESS")
			create Result.put (Void)
		end

	terminology_settings_cache: CELL [detachable TERMINOLOGY_SETTINGS]
		once ("PROCESS")
			create Result.put (Void)
		end

	resources_refresh_from_file
			-- actions to clear any cached content from config file, due to file being re-loaded
		do
			repository_resources_cache.put (Void)
			init_gen_dirs_from_current_library
		end

end



