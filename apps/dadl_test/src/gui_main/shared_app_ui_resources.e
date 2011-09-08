note
	component:   "openEHR Archetype Project"
	description: "Shared UI resources"
	keywords:    "test, ADL"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.com>"
	copyright:   "Copyright (c) 2003-2010 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class SHARED_APP_UI_RESOURCES

inherit
	SHARED_APP_RESOURCES

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

	app_width: INTEGER
			-- application width
		do
			Result := app_cfg.integer_value ("/gui/app_width")
		end

	set_app_width (v: INTEGER)
			-- set app width
		require
			v > 0
		do
			app_cfg.put_value ("/gui/app_width", v)
		end

	app_height: INTEGER
			-- application height
		do
			Result := app_cfg.integer_value ("/gui/app_height")
		end

	set_app_height (v: INTEGER)
			-- set app height
		require
			v > 0
		do
			app_cfg.put_value ("/gui/app_height", v)
		end

	app_x_position: INTEGER
			-- application horizontal position
		do
			Result := app_cfg.integer_value ("/gui/app_x_position")
		end

	set_app_x_position (v: INTEGER)
			-- set app x position
		do
			app_cfg.put_value ("/gui/app_x_position", v)
		end

	app_y_position: INTEGER
			-- application vertical position
		do
			Result := app_cfg.integer_value ("/gui/app_y_position")
		end

	set_app_y_position (v: INTEGER)
			-- set app y position
		do
			app_cfg.put_value ("/gui/app_y_position", v)
		end

	app_maximised: BOOLEAN
			-- True if app should be maximised
		do
			Result := app_cfg.boolean_value ("/gui/app_maximised")
		end

	set_app_maximised (flag: BOOLEAN)
			-- set app maximised flag
		do
			app_cfg.put_value("/gui/app_maximised", flag)
		end

	main_notebook_tab_pos: INTEGER
			-- which tab of the main notebook was visible at the end of the last session
		do
			Result := app_cfg.integer_value ("/gui/main_notebook_tab_pos")
		end

	set_main_notebook_tab_pos(a_tab_pos: INTEGER)
			-- set main notebook tab pos
		require
			a_tab_pos_valid: a_tab_pos > 0
		do
			app_cfg.put_value("/gui/main_notebook_tab_pos", a_tab_pos)
		end

	explorer_split_position: INTEGER
			-- Split position of explorer horizontal split control.
		do
			Result := app_cfg.integer_value ("/gui/explorer_split_position")
		end

	set_explorer_split_position (v: INTEGER)
			-- Set split position of explorer horizontal split control.
		require
			v > 0
		do
			app_cfg.put_value ("/gui/explorer_split_position", v)
		end

	main_split_position: INTEGER
			-- Split position of explorer horizontal split control.
		do
			Result := app_cfg.integer_value ("/gui/main_split_position")
		end

	set_main_split_position (v: INTEGER)
			-- Set split position of explorer horizontal split control.
		require
			v > 0
		do
			app_cfg.put_value ("/gui/main_split_position", v)
		end

	text_editor_command: attached STRING
			-- Path of editor application for ADL files.
		do
			Result := app_cfg.string_value_env_var_sub ("/commands/text_editor_command")
		end

	set_text_editor_command (a_value: attached STRING)
			-- set editor
		require
			value_not_empty: not a_value.is_empty
		do
			app_cfg.put_value ("/commands/text_editor_command", a_value)
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
