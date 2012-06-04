note
	component:   "openEHR Archetype Project"
	description: "Form of EV_GRID to add keyboard and mouse wheel accessibility to a grid widget."
	keywords:    "ADL"
	author:      "Peter Gummer"
	support:     "Ocean Informatics <support@OceanInformatics.com>"
	copyright:   "Copyright (c) 2008 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class
	EV_GRID_KBD_MOUSE

inherit
	EV_GRID

	EV_KEY_CONSTANTS
		export
			{NONE} all;
			{ANY} valid_key_code
		undefine
			copy, default_create
		end

	EV_SHARED_APPLICATION
		export
			{NONE} all;
		undefine
			copy, default_create
		end

create
	make

feature {NONE} -- Initialisation

	make
		do
			default_create
			key_press_actions.wipe_out
			key_press_actions.extend (agent on_grid_key_press)
			mouse_wheel_actions.wipe_out
			mouse_wheel_actions.extend (agent on_mouse_wheel)
			create user_key_map.make (0)
		end

feature -- Access

	selected_cell: EV_GRID_ITEM
			-- The currently selected cell in `grid'; else Void if no cell is selected.
		local
			items: ARRAYED_LIST [EV_GRID_ITEM]
		do
			items := selected_items
			if not items.is_empty then
				Result := items.first
			end
		end

	index_of_viewable_offset_from_row (index, offset: INTEGER): INTEGER
			-- The index of the row at viewable `offset' from the row at `index'.
		require
			has_rows: row_count > 0
		local
			indexes: ARRAYED_LIST [INTEGER]
			i: INTEGER
		do
			from
				indexes := viewable_row_indexes
				i := indexes.count
			until
				i = 1 or else indexes [i] <= index
			loop
				i := i - 1
			end

			Result := indexes [(i + offset).max (1).min (indexes.count)]
		end

feature -- Modification

	add_key_event (a_key_code: INTEGER; an_event: PROCEDURE [ANY, TUPLE])
		require
			a_code_valid: valid_key_code (a_key_code)
		do
			user_key_map.force (an_event, a_key_code)
		end

feature -- Events

	on_grid_key_press (key: EV_KEY)
			-- Process keystrokes in `grid' to scroll, expand and collapse rows, etc.
		local
			a_row: EV_GRID_ROW
		do
			if attached key and row_count > 0 then
				if not ev_application.shift_pressed and not ev_application.alt_pressed then
					if ev_application.ctrl_pressed then
						if key.code = key_up then
							key.set_code (key_menu)
							scroll_to_row (first_visible_row.index - 1)
						elseif key.code = key_down then
							key.set_code (key_menu)
							if visible_row_indexes.count > 1 then
								scroll_to_row (visible_row_indexes [2])
							end
						elseif key.code = key_home then
							scroll_to_row (1)
						elseif key.code = key_end then
							scroll_to_row (row_count)
						elseif key.code = key_page_up then
							scroll_to_row (index_of_viewable_offset_from_row (first_visible_row.index, 1 - visible_row_indexes.count))
						elseif key.code = key_page_down then
							scroll_to_row (last_visible_row.index)
						end
					elseif key.code = key_home then
						step_to_row (1)
					elseif key.code = key_end then
						step_to_row (row_count)
					elseif selected_cell /= Void then
						a_row := selected_cell.row

						if key.code = key_page_up then
							step_to_row (index_of_viewable_offset_from_row (a_row.index, 1 - visible_row_indexes.count))
						elseif key.code = key_page_down then
							step_to_row (index_of_viewable_offset_from_row (a_row.index, visible_row_indexes.count - 1))
						elseif key.code = key_numpad_multiply then
							expand_tree (a_row)
						elseif key.code = key_numpad_add or key.code = key_right then
							if a_row.is_expandable then
								a_row.expand
							end
						elseif key.code = key_numpad_subtract then
							if a_row.is_expanded then
								a_row.collapse
							end
						elseif key.code = key_left then
							if selected_cell.column.index = a_row.index_of_first_item then
								if a_row.is_expanded then
									a_row.collapse
								elseif a_row.parent_row /= Void then
									step_to_row (a_row.parent_row.index)
								end
							end
						elseif key.code = key_back_space then
							if a_row.parent_row /= Void then
								step_to_row (a_row.parent_row.index)
							end
						elseif user_key_map.has (key.code) then
							user_key_map.item (key.code).call ([])
						end
					end
				end
			end
		end

	on_mouse_wheel (step: INTEGER)
			-- Scroll `grid' when the mouse wheel moves.
		do
			if row_count > 0 then
				if step > 0 then
					scroll_to_row (first_visible_row.index - step)
				else
					scroll_to_row (visible_row_indexes [visible_row_indexes.count.min (1 - step)])
				end
			end
		end

feature -- Commands

	scroll_to_row (index: INTEGER)
			-- Scroll `grid' so the row at `index' is at the top.
		require
			has_rows: row_count > 0
		local
			i: INTEGER
		do
			i := index.max (1).min (row_count)
			set_first_visible_row (i)
		end

	step_to_row (an_index: INTEGER)
			-- Select the first non-void cell on the row at `index'.
			-- If that row is hidden within a collapsed parent, select its nearest viewable parent.
		require
			has_rows: row_count > 0
		local
			a_row: EV_GRID_ROW
			an_item: EV_GRID_ITEM
			i: INTEGER
		do
			a_row := row (index_of_viewable_offset_from_row (an_index, 0))
			from i := 1 until i > a_row.count or attached an_item loop
				an_item := a_row.item (i)
				i := i + 1
			end
			if attached an_item and then not an_item.is_selected then
				remove_selection
				an_item.enable_select
				a_row.ensure_visible
			end
		end

	step_to_viewable_parent_of_selected_row
			-- If the selected row is hidden within a collapsed parent, select its nearest viewable parent.
		do
			if selected_cell /= Void then
				step_to_row (selected_cell.row.index)
			end
		end

	expand_tree (a_row: attached EV_GRID_ROW)
			-- Expand `row' and all of its sub-rows, recursively.
		local
			i: INTEGER
		do
			if a_row.is_expandable then
				a_row.expand
				from i := 1 until i > a_row.subrow_count loop
					expand_tree (a_row.subrow (i))
					i := i + 1
				end
			end
		ensure
			row_expanded: a_row.is_expandable implies a_row.is_expanded
		end

	collapse_tree (a_row: attached EV_GRID_ROW)
			-- Collapse `row' and all of its sub-rows, recursively.
		local
			i: INTEGER
		do
			from i := 1 until i > a_row.subrow_count loop
				collapse_tree (a_row.subrow (i))
				i := i + 1
			end
			a_row.collapse
		ensure
			row_collapsed: not a_row.is_expanded
		end

feature {NONE} -- Implementation

	user_key_map: HASH_TABLE [PROCEDURE [ANY, TUPLE], INTEGER]
			-- user-defined key => actions map for other keys

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
--| The Original Code is gui_grid_controller.e.
--|
--| The Initial Developer of the Original Code is Thomas Beale.
--| Portions created by the Initial Developer are Copyright (C) 2003-2008
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
