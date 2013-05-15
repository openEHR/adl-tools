note
	component:   "openEHR Archetype Project"
	description: "Root application class for any ADL application; performs all application-wide initialisation."
	keywords:    "ADL"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2010- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "See notice at bottom of class"

class APP_ROOT

inherit
	GLOBAL_ERROR_REPORTING_LEVEL

	SHARED_ARCHETYPE_CATALOGUES

	SHARED_AOM_PROFILES_ACCESS

	SHARED_ARCHETYPE_SERIALISERS
		export
			{NONE} all
		end

	-- FIXME: this is a hack to allow add_custom_dt_dynamic_type_from_string to be called, adding in some
	-- type correspondences that otherwise the runtime gets wrong if just INTERNAL.type_from_type_name() is used
	DT_TYPES
		export
			{NONE} all
		end

	SHARED_DT_OBJECT_CONVERTER
		export
			{NONE} all
		end

	SHARED_ARCHETYPE_COMPILER
		export
			{NONE} all
		end

	ANY_VALIDATOR
		rename
			validate as initialise_app, ready_to_validate as ready_to_initialise_app
		redefine
			ready_to_initialise_app
		end

	SHARED_XML_RULES_FILE_ACCESS
		export
			{NONE} all
		undefine
			app_cfg_initialise, Default_application_name, Application_developer_name
		end

feature -- Initialisation

	set_application_developer_name (a_name: STRING)
			-- override the default of "openEHR" for the developer (i.e. vendor) name; this
			-- name is what gets used in the user's app config path, install directory and so on
		do
			application_developer_name.make_from_string (a_name)
		end

	initialise_shell
		once
			-- see DT_TYPES note above; a hack needed to make string name -> type_id work for class names
			-- that clash with Eiffel type names
			add_custom_dt_dynamic_type_from_string (({C_STRING}).name, ({C_STRING}).type_id)
			add_custom_dt_dynamic_type_from_string (({C_DATE}).name, ({C_DATE}).type_id)

			-- add some converter agents for converting between native DT/ODIN types and AOM types
			dt_object_converter.add_type_converter_agent (agent (a_tc: TERMINOLOGY_CODE): CODE_PHRASE do create Result.make (a_tc.terminology_id, a_tc.code_string) end, ({TERMINOLOGY_CODE}).type_id)

			-- add in ADL error message DB to main message DB
			message_db.add_table (create {ADL_COMPILED_MESSAGE_DB}.make)

			-- set up XML serialiser rules file
			set_xml_load_rules_agent

			initialise_serialisers
			reset

			if app_cfg.errors.has_errors then
				merge_errors (app_cfg.errors)
			end
		end

	initialise_app
		local
			term_init: XML_TERMINOLOGY_SERVICE_POPULATOR
			dead_repos: ARRAYED_LIST [STRING]
		once
			-- set error reporting level in billboard and all error accumulator objects
			set_global_error_reporting_level (error_reporting_level)

			-- initialise terminology
			if terminology_directory.is_empty then
				set_terminology_directory (Default_terminology_directory)
			end
			create term_init.make
			if term_init.init_failed then
				add_error (ec_terminology_init_failed, <<term_init.init_fail_reason>>)
			end

			--
			-- check if found an XML rules file, and copy in sample one if none
			--
			if not file_system.file_exists (xml_rules_file_path) and not file_system.file_exists (Default_xml_rules_file_path) then
				if file_system.file_exists (xml_rules_sample_file_path) then
					file_system.copy_file (xml_rules_sample_file_path, xml_rules_file_path)
				else
					add_warning (ec_xml_rules_sample_file_missing, <<xml_rules_sample_file_path>>)
				end
			end

			--
			-- set up the RM schemas
			--
			if rm_schema_directory.is_empty then
				set_rm_schema_directory (Default_rm_schema_directory)
			end
			if file_system.directory_exists (rm_schema_directory) then
				rm_schemas_access.initialise_with_load_list (rm_schema_directory, rm_schemas_load_list)
				if not rm_schemas_access.found_valid_schemas then
					if repository_config_table.is_empty then
						add_warning (ec_bmm_schemas_config_not_valid, <<rm_schemas_access.schemas_load_list_string, rm_schema_directory>>)
					else
						add_error (ec_bmm_schemas_config_not_valid, <<rm_schemas_access.schemas_load_list_string, rm_schema_directory>>)
					end
				end
			else
				add_error (ec_bmm_schema_dir_not_valid, <<rm_schema_directory>>)
			end

			--
			-- set up the AOM profiles
			--
			if aom_profile_directory.is_empty then
				set_aom_profile_directory (Default_aom_profile_directory)
			end
			if file_system.directory_exists (aom_profile_directory) then
				aom_profiles_access.initialise (aom_profile_directory)
				if not aom_profiles_access.found_valid_profiles then
					merge_errors (aom_profiles_access.errors)
				end
			else
				add_error (ec_aom_profile_dir_not_valid, <<aom_profile_directory>>)
			end

			-- adjust for repositories being out of sync with current repository setting (e.g. due to
			-- manual editing of .cfg file)
			-- first of all check for broken repositories and get rid of them
			if not has_errors then
				create dead_repos.make (0)
				across repository_config_table as repos_csr loop
					if not is_repository_valid (repos_csr.key) then
						dead_repos.extend (repos_csr.key)
					end
				end
				across dead_repos as repos_csr loop
					add_warning (ec_remove_repo_cfg, <<invalid_repository_reason (repos_csr.item)>>)
					repository_config_table.remove_repository (repos_csr.item)
				end

				-- now choose a repository to start with
				if not repository_config_table.is_empty then
					if not has_current_repository then
						set_current_repository (repository_config_table.first_repository)
					end
					use_current_repository (False)
				end

				-- tell the user a few useful things
				add_warning (ec_adl_version_warning, <<adl_version_for_flat_output>>)
				if validation_strict then
					add_info (ec_validation_strict, Void)
				else
					add_info (ec_validation_non_strict, Void)
				end
			end
		end

feature -- Status Report

	ready_to_initialise_app: BOOLEAN
		do
			Result := not app_cfg.errors.has_errors
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
