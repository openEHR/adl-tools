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
			app_cfg_initialise, Application_developer_name, Default_application_name
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

	EOMF_COMPILED_MESSAGE_IDS
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

	Default_application_name: STRING
		once
			Result := "adl_workbench"
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

	old_repository_config_table_path: STRING
			-- path of the old REPOSITORY_PROFILE_CONFIG within the parent object representing the whole .cfg file
		once
			Result := "/" + {REPOSITORY_PROFILE_CONFIG}.root_attribute_name
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
				if app_cfg.has_resource (old_repository_config_table_path) and then
					attached {REPOSITORY_PROFILE_CONFIG} app_cfg.object_value (old_repository_config_table_path, ({REPOSITORY_PROFILE_CONFIG}).name) as op
				then
					create Result.make_from_old (op)
					app_cfg.remove_resource (old_repository_config_table_path)
				elseif attached {REPOSITORY_CONFIG_TABLE} app_cfg.object_value (repository_config_table_path, ({REPOSITORY_CONFIG_TABLE}).name) as p then
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

	repository_config_table_cache: CELL [detachable REPOSITORY_CONFIG_TABLE]
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



