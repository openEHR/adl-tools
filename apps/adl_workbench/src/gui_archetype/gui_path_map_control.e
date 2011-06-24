note
	component:   "openEHR Archetype Project"
	description: "Path map control and logic"
	keywords:    "ADL"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2006 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"


class GUI_PATH_MAP_CONTROL

inherit
	SHARED_KNOWLEDGE_REPOSITORY
		export
			{NONE} all;
			{ANY} has_current_profile
		end

	CONSTANTS
		export
			{NONE} all
		end

	STRING_UTILITIES
		export
			{NONE} all
		end

create
	make

feature -- Definitions

	path_control_filter_names: ARRAY [STRING]
			-- names of row filters of path control
		once
			Result := <<"All", "Leaf">>
		end

	path_control_column_names: ARRAY [STRING]
			-- names of columns of path view control
		once
			Result := <<"Machine", "Nat lang", "RM Type", "AOM Type">>
		end

feature {NONE} -- Initialisation

	make (on_path_map_key_press_agent: PROCEDURE [ANY, TUPLE [EV_KEY]])
			-- create tree control repersenting archetype files found in repository_path
		do
			-- create widgets
			create ev_root_container
			create ev_path_list
			create ev_vbox
			create ev_row_frame
			create ev_row_vbox
			create ev_filter_combo
			create ev_col_frame
			create ev_col_vbox
			create ev_column_check_list

			-- connect them together
			ev_root_container.extend (ev_path_list)
			ev_root_container.extend (ev_vbox)
			ev_vbox.extend (ev_row_frame)
			ev_row_frame.extend (ev_row_vbox)
			ev_row_vbox.extend (ev_filter_combo)
			ev_vbox.extend (ev_col_frame)
			ev_col_frame.extend (ev_col_vbox)
			ev_col_vbox.extend (ev_column_check_list)

			-- set visual characteristics
			ev_root_container.set_minimum_width (140)
			ev_root_container.set_minimum_height (93)
			ev_root_container.disable_item_expand (ev_vbox)
			ev_path_list.set_background_color (editable_colour)
			ev_path_list.set_minimum_width (1)
			ev_path_list.set_minimum_height (1)
			ev_vbox.set_minimum_width (140)
			ev_vbox.set_minimum_height (93)
			ev_vbox.set_padding (3)
			ev_vbox.set_border_width (4)
			ev_vbox.disable_item_expand (ev_row_frame)
			ev_vbox.disable_item_expand (ev_col_frame)
			ev_row_frame.set_text ("Row Filter")
			ev_row_vbox.set_border_width (border_width)
			ev_filter_combo.set_tooltip ("Filter which rows are shown in the Path Analysis")
			ev_filter_combo.set_minimum_width (80)
			ev_filter_combo.disable_edit
			ev_col_frame.set_text ("Column View")
			ev_col_frame.set_minimum_height (150)
			ev_col_vbox.set_border_width (border_width)
			ev_column_check_list.set_tooltip ("Choose view of columns in the Path Analysis")
			ev_column_check_list.set_minimum_width (100)
			ev_column_check_list.set_minimum_height (30)

			-- set events
			ev_filter_combo.select_actions.extend (agent path_row_set_filter)
			ev_column_check_list.check_actions.extend (agent path_column_select)
			ev_column_check_list.uncheck_actions.extend (agent path_column_unselect)

			-- set events: path map
			ev_path_list.key_press_actions.extend (on_path_map_key_press_agent)

			initialise_controls
		end

feature -- Access

	ev_root_container: EV_HORIZONTAL_BOX

	ev_column_check_list: EV_CHECKABLE_LIST

	selected_filter: STRING
		do
			Result := ev_filter_combo.selected_item.text.as_string_8
		end

	selected_language: STRING

feature -- Events

	path_column_select (a_list_item: EV_LIST_ITEM)
			-- Show a column in the Path Analysis list after setting a check box in `path_view_check_list'.
		do
			adjust_columns
		end

	path_column_unselect (a_list_item: EV_LIST_ITEM)
			-- Hide a column in the Path Analysis list after clearing a check box in `path_view_check_list'.
		do
			adjust_columns
		end

	path_row_set_filter
			-- Called by `select_actions' of `path_filter_combo'.
		do
			set_filter
		end

feature -- Commands

	clear
			-- wipe out content from controls
		do
			ev_path_list.wipe_out
		end

	populate (an_archetype: attached ARCHETYPE; a_language: attached STRING)
			-- Populate `path_list'.
		require
			an_archetype.is_valid
		local
			list_row: EV_MULTI_COLUMN_LIST_ROW
			p_paths, l_paths: ARRAYED_LIST[STRING]
		do
			target_archetype := an_archetype
			selected_language := a_language
			repopulate (selected_language)
		end

	repopulate (a_language: attached STRING)
		local
			list_row: EV_MULTI_COLUMN_LIST_ROW
			p_paths, l_paths: ARRAYED_LIST[STRING]
		do
			ev_path_list.wipe_out
			ev_path_list.set_column_titles (path_control_column_names)

			-- Add am empty column at the end so the width of the true last column can be set to zero on all platforms.
			ev_path_list.set_column_title ("", path_control_column_names.count + 1)

			if ev_filter_combo.text.is_equal ("All") then
				p_paths := target_archetype.physical_paths
				l_paths := target_archetype.logical_paths (selected_language, False)
			else
				p_paths := target_archetype.physical_leaf_paths
				l_paths := target_archetype.logical_paths (selected_language, True)
			end

			from
				p_paths.start
				l_paths.start
			until
				p_paths.off
			loop
				if attached {C_OBJECT} target_archetype.c_object_at_path (p_paths.item) as c_o then
					create list_row
					list_row.extend (utf8 (p_paths.item))
					list_row.extend (utf8 (l_paths.item))
					list_row.extend (utf8 (c_o.rm_type_name))
					list_row.extend (utf8 (c_o.generating_type))
					ev_path_list.extend (list_row)
				end

				p_paths.forth
				l_paths.forth
			end

			adjust_columns
		end

	adjust_columns
			-- Adjust column view of paths control according to `column_check_list'.
		local
			i: INTEGER
		do
			from i := 1 until i > ev_path_list.column_count loop
				if i > ev_column_check_list.count or else not ev_column_check_list.is_item_checked (ev_column_check_list [i]) then
					ev_path_list.set_column_width (0, i)
				else
					ev_path_list.resize_column_to_content (i)
					if ev_path_list.column_width (i) < 100 then
						ev_path_list.set_column_width (100, i)
					end
				end

				i := i + 1
			end
		end

	set_filter
			-- Called by `select_actions' of `filter_combo'.
		do
			if ev_path_list.is_displayed then
				repopulate (selected_language)
			end
		end

	selected_text: STRING
			-- copy a selected path row from the paths control to the OS clipboard
		local
			ev_rows: DYNAMIC_LIST[EV_MULTI_COLUMN_LIST_ROW]
			ev_col: EV_MULTI_COLUMN_LIST_ROW
		do
			ev_rows := ev_path_list.selected_items
			create Result.make (0)

			if not ev_rows.is_empty then
				from ev_rows.start until ev_rows.off loop
					ev_col := ev_rows.item
					from ev_col.start until ev_col.off loop
						Result.append (ev_col.item.string + "%N")
						ev_col.forth
					end
					ev_rows.forth
				end
			end
		end

feature {NONE} -- Implementation

	ev_vbox, ev_row_vbox, ev_col_vbox: EV_VERTICAL_BOX

	ev_filter_combo: EV_COMBO_BOX

	ev_row_frame, ev_col_frame: EV_FRAME

	ev_path_list: EV_MULTI_COLUMN_LIST

	target_archetype: ARCHETYPE

	initialise_controls
			-- Initialise widgets associated with the Path Analysis.
		local
			filter_combo_index: INTEGER
			strs: LIST [STRING]
		do
			ev_path_list.enable_multiple_selection
			ev_filter_combo.set_strings (path_control_filter_names)

			if not ev_filter_combo.is_empty then
				from
					filter_combo_index := 1
				until
					filter_combo_index > path_control_filter_names.count or
					path_control_filter_names [filter_combo_index].is_equal (path_filter_combo_selection)
				loop
					filter_combo_index := filter_combo_index + 1
				end

				if filter_combo_index > path_control_filter_names.count then -- non-existent string in session file
					filter_combo_index := 1
				end
			else
				filter_combo_index := 1
			end

			ev_filter_combo [filter_combo_index].enable_select

			ev_column_check_list.set_strings (path_control_column_names)
			strs := path_view_check_list_settings

			if not strs.is_empty then
				from ev_column_check_list.start until ev_column_check_list.off loop
					if strs.has (ev_column_check_list.item.text.as_string_8) then
						ev_column_check_list.check_item (ev_column_check_list.item)
					end

					ev_column_check_list.forth
				end
			else -- default to physical paths
				ev_column_check_list.check_item (ev_column_check_list [2])
				ev_column_check_list.check_item (ev_column_check_list [3])
			end
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
--| The Original Code is adl_path_map.e.
--|
--| The Initial Developer of the Original Code is Thomas Beale.
--| Portions created by the Initial Developer are Copyright (C) 2006
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
