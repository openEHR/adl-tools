note
	component:   "openEHR Archetype Project"
	description: "Shared UI resources"
	keywords:    "UI, resources"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "Ocean Informatics <support@OceanInformatics.com>"
	copyright:   "Copyright (c) 2003-2011 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

class SHARED_APP_UI_RESOURCES

inherit
	SHARED_APP_RESOURCES

feature -- Definitions

	resource_path_separator: STRING = "/"
			-- regardless of OS, this is used in paths to locate resources, including icons and also
			-- .cfg file items

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
			-- Directory where archetypes are currently being opened and saved
			-- from GUI open and save buttons; automatic opens (due to clicking
			-- on archetype name) still use main repository directory.
		do
			Result := app_cfg.string_value ("/file_system/current_work_directory")
		end

	set_current_work_directory (a_path: attached STRING)
			-- set the directory where archetypes are currently being opened and saved.
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
