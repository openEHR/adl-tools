note
	component:   "openEHR Archetype Project"
	description: "Path map control and logic"
	keywords:    "ADL"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2006 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

class GUI_PATH_MAP_CONTROL

inherit
	GUI_ARCHETYPE_TARGETTED_TOOL
		redefine
			can_populate, can_repopulate
		end

	SHARED_ARCHETYPE_CATALOGUES
		export
			{NONE} all;
			{ANY} has_current_profile
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
			Result := <<"Path", "RM Type", "AOM Type">>
		end

feature {NONE} -- Initialisation

	make (on_path_map_key_press_agent: PROCEDURE [ANY, TUPLE [EV_KEY]])
			-- create tree control repersenting archetype files found in repository_path
		do
			-- create widgets
			create ev_root_container
			ev_root_container.set_minimum_width (140)
			ev_root_container.set_minimum_height (93)

			create ev_path_list
			ev_path_list.set_background_color (editable_colour)
			ev_path_list.set_minimum_width (1)
			ev_path_list.set_minimum_height (1)
			ev_path_list.enable_multiple_selection
			ev_root_container.extend (ev_path_list)

			create ev_vbox
			ev_vbox.set_minimum_width (140)
			ev_vbox.set_minimum_height (93)
			ev_vbox.set_padding (3)
			ev_vbox.set_border_width (4)
			ev_root_container.extend (ev_vbox)
			ev_root_container.disable_item_expand (ev_vbox)

			create ev_row_frame
			ev_row_frame.set_text (get_msg ("row_filter_frame_text", Void))
			ev_vbox.extend (ev_row_frame)
			ev_vbox.disable_item_expand (ev_row_frame)

			create ev_row_vbox
			ev_row_vbox.set_border_width (Default_border_width)
			ev_row_frame.extend (ev_row_vbox)

			create ev_row_filter_combo
			ev_row_filter_combo.set_tooltip (get_msg ("row_filter_combo_tooltip", Void))
			ev_row_filter_combo.set_minimum_width (80)
			ev_row_filter_combo.disable_edit
			ev_row_filter_combo.set_strings (path_control_filter_names)
			ev_row_filter_combo[1].enable_select
			ev_row_vbox.extend (ev_row_filter_combo)

			create ev_col_frame
			ev_col_frame.set_text (get_msg ("column_frame_text", Void))
			ev_col_frame.set_minimum_height (50)
			ev_vbox.extend (ev_col_frame)
			ev_vbox.disable_item_expand (ev_col_frame)

			create ev_col_vbox
			ev_col_vbox.set_border_width (Default_border_width)
			ev_col_frame.extend (ev_col_vbox)

			create ev_nat_lang_paths_cb
			ev_nat_lang_paths_cb.set_text (get_msg ("nat_lang_checkbox_text", Void))
			ev_nat_lang_paths_cb.set_tooltip (get_msg ("nat_lang_paths_tooltip", Void))
			ev_nat_lang_paths_cb.set_minimum_width (100)
			ev_nat_lang_paths_cb.set_minimum_height (30)
			ev_col_vbox.extend (ev_nat_lang_paths_cb)

			-- set events
			ev_row_filter_combo.select_actions.extend (agent path_row_set_filter)
			ev_nat_lang_paths_cb.select_actions.extend (agent repopulate)

			-- set events: path map
			ev_path_list.key_press_actions.extend (on_path_map_key_press_agent)

			ev_root_container.set_data (Current)
		end

feature -- Access

	ev_root_container: EV_HORIZONTAL_BOX

	ev_nat_lang_paths_cb: EV_CHECK_BUTTON

	selected_filter: STRING
		do
			Result := ev_row_filter_combo.selected_item.text.as_string_8
		end

feature -- Status Report

	can_populate (a_source: attached like source): BOOLEAN
		do
			Result := a_source.is_valid
		end

	can_repopulate: BOOLEAN
		do
			Result := is_populated and source.is_valid
		end

feature -- Events

	path_row_set_filter
			-- Called by `select_actions' of `path_filter_combo'.
		do
			set_filter
		end

feature -- Commands

	set_filter
			-- Called by `select_actions' of `filter_combo'.
		do
			if ev_path_list.is_displayed then
				repopulate
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

	select_path (a_path: STRING)
		require
			not a_path.is_empty
		local
			match_path, l_path: STRING
			found: BOOLEAN
		do
			if ev_nat_lang_paths_cb.is_selected then
				match_path := source_archetype.ontology.physical_to_logical_path (a_path, selected_language, True)
			else
				match_path := a_path
			end

			-- use length comparison for more efficient matching
			from ev_path_list.start until ev_path_list.off or found loop
				l_path := ev_path_list.item.i_th (1).to_string_8
				if l_path.same_string (match_path) then
					ev_path_list.item.enable_select
					ev_path_list.ensure_item_visible (ev_path_list.item)
					found := True
				end
				ev_path_list.forth
			end
		end

feature {NONE} -- Implementation

	ev_vbox, ev_row_vbox, ev_col_vbox: EV_VERTICAL_BOX

	ev_row_filter_combo: EV_COMBO_BOX

	ev_row_frame, ev_col_frame: EV_FRAME

	ev_path_list: EV_MULTI_COLUMN_LIST

	do_clear
			-- wipe out content from controls
		do
			ev_path_list.wipe_out
		end

	do_populate
		local
			list_row: EV_MULTI_COLUMN_LIST_ROW
			p_paths, l_paths: ARRAYED_LIST[STRING]
			i: INTEGER
		do
			ev_path_list.wipe_out
			ev_path_list.set_column_titles (path_control_column_names)

			-- Add am empty column at the end so the width of the true last column can be set to zero on all platforms.
			ev_path_list.set_column_title ("", path_control_column_names.count + 1)

			create l_paths.make (0)
			if ev_row_filter_combo.text.is_equal ("All") then
				p_paths := source_archetype.physical_paths
				if ev_nat_lang_paths_cb.is_selected then
					l_paths := source_archetype.logical_paths (selected_language, False)
				end
			else
				p_paths := source_archetype.physical_leaf_paths
				if ev_nat_lang_paths_cb.is_selected then
					l_paths := source_archetype.logical_paths (selected_language, True)
				end
			end

			from
				p_paths.start
				l_paths.start
			until
				p_paths.off
			loop
				if attached {C_OBJECT} source_archetype.c_object_at_path (p_paths.item) as c_o then
					create list_row
					if not l_paths.is_empty then
						list_row.extend (utf8_to_utf32 (l_paths.item))
					else
						list_row.extend (utf8_to_utf32 (p_paths.item))
					end
					list_row.extend (utf8_to_utf32 (c_o.rm_type_name))
					list_row.extend (utf8_to_utf32 (c_o.generating_type))
					ev_path_list.extend (list_row)
				end

				p_paths.forth
				if not l_paths.is_empty then
					l_paths.forth
				end
			end

			from i := 1 until i > ev_path_list.column_count loop
				ev_path_list.resize_column_to_content (i)
				i := i + 1
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
