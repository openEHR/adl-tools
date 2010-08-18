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
			Result := resource_value ("default", "current_work_directory")
		end

	app_width: INTEGER
			-- application width
		local
			str: STRING
		do
			str := resource_value("default", "app_width")
			if str.is_integer then
				Result := str.to_integer
			end
		end

	app_height: INTEGER
			-- application height
		local
			str: STRING
		do
			str := resource_value("default", "app_height")
			if str.is_integer then
				Result := str.to_integer
			end
		end

	app_x_position: INTEGER
			-- application horizontal position
		local
			str: STRING
		do
			str := resource_value("default", "app_x_position")
			if str.is_integer then
				Result := str.to_integer
			end
		end

	app_y_position: INTEGER
			-- application vertical position
		local
			str: STRING
		do
			str := resource_value("default", "app_y_position")
			if str.is_integer then
				Result := str.to_integer
			end
		end

	app_maximised: BOOLEAN
			-- True if app should be maximised
		local
			str: STRING
		do
			str := resource_value("default", "app_maximised")
			if str.is_boolean then
				Result := str.to_boolean
			end
		end

	editor_command: attached STRING
			-- Path of editor application for ADL files.
		do
			Result := substitute_env_vars (resource_value ("default", "editor"))
		end

	main_notebook_tab_pos: INTEGER
			-- which tab of the main notebook was visible at the end of the last session
		local
			str: STRING
		do
			str := resource_value("default", "main_notebook_tab_pos")
			if str.is_integer then
				Result := str.to_integer
			end
		end

	explorer_split_position: INTEGER
			-- Split position of explorer horizontal split control.
		local
			str: STRING
		do
			str := resource_value ("default", "explorer_split_position")
			if str.is_integer then
				Result := str.to_integer
			end
		end

feature -- Application Switch Setting

	set_current_work_directory (a_path: STRING)
			-- set the directory where archetypes are currently being opened and saved.
		require
			a_path_attached: a_path /= Void
		do
			if not a_path.is_empty then
				set_resource_value ("default", "current_work_directory", a_path)
			else
				remove_resource ("default", "current_work_directory")
			end
		end

	set_editor_command (value: STRING)
			-- set editor
		require
			value_attached: value /= Void
			value_not_empty: not value.is_empty
		do
			set_resource_value("default", "editor", value)
		end

	set_app_width (v: INTEGER)
			-- set app width
		require
			v > 0
		do
			set_resource_value("default", "app_width", v.out)
		end

	set_app_height (v: INTEGER)
			-- set app height
		require
			v > 0
		do
			set_resource_value("default", "app_height", v.out)
		end

	set_app_x_position (v: INTEGER)
			-- set app x position
		do
			set_resource_value("default", "app_x_position", v.out)
		end

	set_app_y_position (v: INTEGER)
			-- set app y position
		do
			set_resource_value("default", "app_y_position", v.out)
		end

	set_app_maximised (f: BOOLEAN)
			-- set app maximised flag
		do
			set_resource_value("default", "app_maximised", f.out)
		end

	set_explorer_split_position (v: INTEGER)
			-- Set split position of explorer horizontal split control.
		require
			v > 0
		do
			set_resource_value ("default", "explorer_split_position", v.out)
		end

	set_main_notebook_tab_pos(a_tab_pos: INTEGER)
			-- set main notebook tab pos
		require
			a_tab_pos_valid: a_tab_pos > 0
		do
			set_resource_value("default", "main_notebook_tab_pos", a_tab_pos.out)
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
