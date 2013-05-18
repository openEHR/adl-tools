note
	component:   "openEHR ADL Tools"
	description: "Shared UI resources"
	keywords:    "UI, resources"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "Ocean Informatics <support@OceanInformatics.com>"
	copyright:   "Copyright (c) 2003-2011 Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class SHARED_APP_UI_RESOURCES

inherit
	SHARED_APP_RESOURCES

feature -- Access

	splash_text: STRING
			-- Text for splash screens, About boxes, etc.
		local
			version: OPENEHR_VERSION
		once
			create version
			create Result.make_empty
			Result.append ("ADL Workbench%N")
			Result.append ("Version " + version.out + "%N")
			Result.append ("Copyright (c) 2003-2012 openEHR Foundation%N")
			Result.append ("ADL version: " + Latest_adl_version + "%N")
			Result.append ("Source - https://github.com/openEHR/adl-tools%N")
			Result.append ("Source license: Mozilla tri-license%N")
			Result.append ("(http://www.mozilla.org/MPL/boilerplate-1.1/mpl-tri-license-txt)%N")
			Result.append ("Support: http://www.openehr.org/issues/browse/AWBPR%N")
			Result.append ("Funded by: OceanInformatics.com%N")
			Result.append ("Author: Thomas Beale%N")
			Result.append ("Contributors: Peter Gummer%N")
			Result.append ("Acknowledgements:%N")
			Result.append ("  - Eiffel Software (http://www.eiffel.com)%N")
			Result.append ("  - Gobo parsing libraries & tools (http://www.gobosoft.com)%N")
			Result.append ("  - Jonas Rask Design icons (http://jonasraskdesign.com)%N")
			Result.append ("  - VisualPharm 'must-have' icons (http://www.visualpharm.com/)%N")
			Result.append ("    under CC-BY-ND (http://creativecommons.org/licenses/by-nd/3.0/)%N")
		ensure
			not_empty: not Result.is_empty
		end

	help_text: STRING
			-- Help text
		once
			create Result.make_empty
			Result.append ("ADL Workbench (c) 2003-2012 openEHR Foundation%N")
			Result.append ("ADL version: " + Latest_adl_version + "%N")
			Result.append ("Command line:%N")
			Result.append ("%Tadlc [options] action archetype_id_pattern%N")
			Result.append ("Options:%N")
			Result.append ("%T-h | --help : output this help%N")
			Result.append ("%T-v | --verbose : output verbose feedback, including configuration information on startup%N")
			Result.append ("%T-f | --format <format> : output format for generated files. Supported formats:%N")
			Result.append ("%T%Tjson, adl, dadl, yaml, xml%N")
			Result.append ("%T--flat : use flat form of archetype[s] for actions, e.g. path extraction etc%N")
			Result.append ("%T--cfg : output default configuration file location%N")
			Result.append ("Actions:%N")
			Result.append ("%Tflatten : flatten archetype[s] | template[s]%N")
			Result.append ("%Textract_paths : exract path set from archetype[s]%N")
		ensure
			not_empty: not Result.is_empty
		end

feature -- Application Switches

	current_work_directory: attached STRING
		do
			Result := app_cfg.string_value ("/file_system/current_work_directory")
		end

	set_current_work_directory (a_path: attached STRING)
			-- set the directory that app works in
		do
			if not a_path.is_empty then
				app_cfg.put_value ("/file_system/current_work_directory", a_path)
			else
				app_cfg.remove_resource ("/file_system/current_work_directory")
			end
		end

	option_verbose: BOOLEAN
			-- Display the RM infrastructure properties in the archetype definition node tree?
		do
			Result := app_cfg.boolean_value ("/command_line/option_verbose")
		end

	set_option_verbose (flag: BOOLEAN)
			-- Set flag for verbose output
		do
			app_cfg.put_value ("/command_line/option_verbose", flag)
		end

end


