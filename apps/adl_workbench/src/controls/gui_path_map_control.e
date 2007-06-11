indexing
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
	SHARED_UI_RESOURCES
		export
			{NONE} all
		end

	SHARED_ARCHETYPE_DIRECTORY
		export
			{NONE} all
		end

	SHARED_ARCHETYPE_CONTEXT
		export
			{NONE} all
		end

	STRING_UTILITIES
		export
			{NONE} all
		end

create
	make

feature -- Initialisation

	make(a_main_window: MAIN_WINDOW) is
			-- create tree control repersenting archetype files found in repository_path
		require
			a_main_window /= Void
		do
			gui := a_main_window
			path_list := gui.parsed_archetype_found_paths
			path_list.enable_multiple_selection
			filter_combo := gui.path_filter_combo
			column_check_list := gui.path_view_check_list
		end

feature -- Access

	path_list: EV_MULTI_COLUMN_LIST

	filter_combo: EV_COMBO_BOX

	column_check_list: EV_CHECKABLE_LIST

feature -- Commands

	clear is
			-- wipe out content from controls
		do
		end

	populate is
			-- populate path control
		local
			mcl: EV_MULTI_COLUMN_LIST
			list_row: EV_MULTI_COLUMN_LIST_ROW
			p_paths, l_paths: ARRAYED_LIST[STRING]
			c_o: C_OBJECT
			c_l_o: C_LEAF_OBJECT
			c_r: CONSTRAINT_REF
			c_c_o: C_COMPLEX_OBJECT
			is_logical_leaf: BOOLEAN
		do
			mcl := path_list
			mcl.wipe_out
			mcl.set_column_titles(path_control_column_names)
			p_paths := archetype_directory.selected_archetype.physical_paths
			l_paths := archetype_directory.selected_archetype.logical_paths(current_language)
			from
				p_paths.start
				l_paths.start
			until
				p_paths.off
			loop
				create list_row
		--		if archetype_directory.selected_archetype.definition.has_object_path (p_paths.item) then
		--		if archetype_directory.selected_archetype.has_physical_path (p_paths.item) then
					c_o := archetype_directory.selected_archetype.c_object_at_path (p_paths.item)
					if c_o /= Void then
						c_l_o ?= c_o
						c_r ?= c_o
						c_c_o ?= c_o

						is_logical_leaf := c_l_o /= Void or c_r /= Void or (c_c_o /= Void and c_c_o.attributes.count = 0)
						if filter_combo.has_selection and filter_combo.selected_text.is_equal ("All") or else is_logical_leaf then
							list_row.extend (utf8 (p_paths.item))
							list_row.extend (utf8 (l_paths.item))
							list_row.extend (utf8 (c_o.rm_type_name))
							list_row.extend (utf8 (c_o.generating_type))
							mcl.extend(list_row)
						end
					end
		--		end
				p_paths.forth
				l_paths.forth
			end

			adjust_columns
		end

	column_select (a_list_item: EV_LIST_ITEM) is
			-- Called by `check_actions' of `column_check_list'.
		do
			if path_list.is_displayed then
				path_list.resize_column_to_content(column_check_list.index_of (a_list_item, 1))
			end
		end

	column_unselect (a_list_item: EV_LIST_ITEM) is
			-- Called by `check_actions' of `column_check_list'.
		do
			if path_list.is_displayed then
				path_list.set_column_width (0, column_check_list.index_of (a_list_item, 1))
			end
		end

	set_filter is
			-- Called by `select_actions' of `filter_combo'.
		do
			if path_list.is_displayed then
				populate
			end
		end

	copy_path_to_clipboard is
			-- copy a selected path row from the paths control to the OS clipboard
		local
			mcl: EV_MULTI_COLUMN_LIST
			ev_rows: DYNAMIC_LIST[EV_MULTI_COLUMN_LIST_ROW]
			ev_col: EV_MULTI_COLUMN_LIST_ROW
			copy_text: STRING
		do
			mcl := path_list
			ev_rows := mcl.selected_items
			create copy_text.make(0)
			if not ev_rows.is_empty then
				from
					ev_rows.start
				until
					ev_rows.off
				loop
					ev_col := ev_rows.item
					from
						ev_col.start
					until
						ev_col.off
					loop
						copy_text.append(ev_col.item.string + "%N")
						ev_col.forth
					end
					ev_rows.forth
				end
			end
			gui.parent_app.clipboard.set_text (copy_text)
		end

feature {NONE} -- Implementation

	gui: MAIN_WINDOW
			-- main window of system

	adjust_columns is
			-- adjust column view of paths control according to checklist
		local
			i:INTEGER
		do
			from
				i := 1
			until
				i > path_list.column_count
			loop
				if column_check_list.is_item_checked (column_check_list.i_th(i)) then
					path_list.resize_column_to_content(i)
				else
					path_list.set_column_width (0, i)
				end
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
