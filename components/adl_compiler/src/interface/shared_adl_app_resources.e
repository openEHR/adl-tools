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
			app_cfg_initialise, Application_developer_name, app_cfg
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

	ADL_COMPILED_MESSAGE_IDS
		export
			{NONE} all
		end

	ADL_15_TERM_CODE_TOOLS
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
		once
			Result := "openEHR"
		end

	Fallback_application_name: STRING
		once
			Result := "adl_workbench"
		end

	Fallback_user_config_file_directory: STRING
			-- This default directory can be used as a fallback rather than forcing every related app to have its
			-- own .cfg file, with essentially the same information (configured directories etc).
			-- (On Unix/Linux/Macosx(?) systems, we would normally locate this in /etc/adl_workbench)
		do
			if attached execution_environment.home_directory_name as hd then
				Result := file_system.pathname (file_system.pathname (hd, application_developer_name), Fallback_application_name)
			else
				Result := file_system.current_working_directory
			end
		end

	Fallback_user_config_file_path: STRING
			-- Full path to alternate resource configuration file.
		do
			Result := file_system.pathname (Fallback_user_config_file_directory, Fallback_application_name + User_config_file_extension)
		end

	ADL_help_page_url: STRING = "http://www.openehr.org/downloads/ADLworkbench/home"
			-- The URL to ADL Workbench's online help.

	Release_notes_file_path: STRING = "http://www.openehr.org/downloads/ADLworkbench/release_notes"
			-- The path to ADL Workbench's release notes.

	clinical_knowledge_manager_url: STRING = "http://www.openehr.org/ckm/"
			-- The URL to CKM.

	Repository_report_filename: STRING = "ArchetypeRepositoryReport.xml"

	Default_aom_profile_directory: STRING
			-- default directory of AOM profile files (*.arp files, in dadl format)
		once
			Result := file_system.pathname (application_startup_directory, "aom_profiles")
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

feature -- Access

	app_cfg: CONFIG_FILE_ACCESS
			-- accessor object for application config file
		once
			Result := app_cfg_cell.item
			if file_system.file_exists (user_config_file_path) then
				Result.initialise (user_config_file_path)
			elseif file_system.file_exists (fallback_user_config_file_path) then
				Result.initialise (fallback_user_config_file_path)
			else
				Result.initialise (user_config_file_path)
			end
			app_cfg_initialise
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

	repository_config_table_path: STRING
			-- path of the REPOSITORY_CONFIG_TABLE within the parent object representing the whole .cfg file
		once
			Result := "/" + {REPOSITORY_CONFIG_TABLE}.root_attribute_name
		end

	repository_config_table: REPOSITORY_CONFIG_TABLE
			-- hash of repo configs each of which is a list of {ref_repo_path, working_repo_path} configs or maybe just
			-- {ref_repo_path}, keyed by config name. The data are stored in the following way:
			--
			--	repository_config_table = <
			--		current_repository = <"CKM">
			--		repositories = <
			--			["CKM"] = <
			--				reference_path = <"C:\\project\\openehr\\knowledge\\archetypes\\CKM">
			--			>
			--			["abc"] = <
			--				reference_path = <"C:\\some\\other\\ref\\dir">
			--				work_path = <"C:\\some\\other\\work\\dir">
			--			>
			--		>
			--	>
			--
		do
			if attached repository_config_table_cache.item as pci then
				Result := pci
			else
				if attached {REPOSITORY_CONFIG_TABLE} app_cfg.object_value (repository_config_table_path, ({REPOSITORY_CONFIG_TABLE}).name) as p then
					Result := p
				else
					create Result.default_create
				end
				repository_config_table_cache.put (Result)
			end
		end

	set_repository_config_table (repo_config_table: REPOSITORY_CONFIG_TABLE)
			-- hash of repo configs each of which is a list of {ref_repo_path, working_repo_path} or maybe just
			-- {ref_repo_path}, keyed by config name.
		do
			repository_config_table_cache.put (repo_config_table)
			app_cfg.put_object (repository_config_table_path, repo_config_table)
		end

	set_current_repository (a_repo_name: STRING)
		require
			repo_name_valid: not a_repo_name.is_empty
		do
			repository_config_table.set_current_repository_name (a_repo_name)
			app_cfg.put_object (repository_config_table_path, repository_config_table)
		ensure
			current_repo_set: repository_config_table.current_repository_name.same_string (a_repo_name)
		end

	default_namespaces: HASH_TABLE [STRING, STRING]
		once
			create Result.make(0)
			Result.put ("org.openehr", "oe")
		end

	namespace_table_path: STRING
			-- path of the NAMESPACE_TABLE within the parent object representing the whole .cfg file
		once
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
		once
			create Result.make(0)
			Result.put ("http://snomedct.info/id/$code_string", "snomedct")
			Result.put ("http://openehr.org/id/$code_string", "openehr")
			Result.put ("http://loinc.org/id/$code_string", "loinc")
		end

	terminology_settings_path: STRING
			-- path of the TERMINOLOGY_SETTINGS within the parent object representing the whole .cfg file
		once
			Result := "/" + {TERMINOLOGY_SETTINGS}.root_attribute_name
		end

	terminology_settings: TERMINOLOGY_SETTINGS
			-- hash of terminology template URIs keyed by terminology name. The data are stored in the following way:
			--
			--		 uri_templates = <
			--			 ["snomedct"] = <"http://snomedct.info/id/$code_string">
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

	init_gen_dirs_from_current_repository
			-- create compiler source and flat generated file areas for current repository
		require
			repository_config_table.has_current_repository
		local
			curr_prof: STRING
		do
			check attached repository_config_table.current_repository_name as cpn then
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

	clear_current_repository
		do
			repository_config_table.clear_current_repository
			app_cfg.put_object(repository_config_table_path, repository_config_table)
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
			app_cfg.put_value ("/file_system/aom_profile_directory", a_path)
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

	set_html_export_directory (a_path: STRING)
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
			app_cfg.put_value ("/authoring/author_copyright", a_value)
		end

	adl_15_roundtripping: BOOLEAN
			-- Set adl_15_roundtripping on
		do
			Result := app_cfg.boolean_value ("/compiler/adl_15_roundtripping")
		end

	set_adl_15_roundtripping (flag: BOOLEAN)
			-- Set flag for adl_15_roundtripping
		do
			app_cfg.put_value ("/compiler/adl_15_roundtripping", flag)
		end

feature {NONE} -- Cached Settings

	compiler_gen_source_directory: STRING
			-- Path of directory where compiled source files go in ODIN serialisation form
		once
			create Result.make_empty
		end

	compiler_gen_flat_directory: STRING
			-- Path of directory where compiled flat files go in ODIN serialisation form
		once
			create Result.make_empty
		end

	repository_config_table_cache: CELL [detachable REPOSITORY_CONFIG_TABLE]
		once
			create Result.put (Void)
		end

	namespace_table_cache: CELL [detachable NAMESPACE_TABLE]
		once
			create Result.put (Void)
		end

	terminology_settings_cache: CELL [detachable TERMINOLOGY_SETTINGS]
		once
			create Result.put (Void)
		end

	resources_refresh_from_file
			-- actions to clear any cached content from config file, due to file being re-loaded
		do
			repository_config_table_cache.put (Void)
			init_gen_dirs_from_current_repository
		end

end



