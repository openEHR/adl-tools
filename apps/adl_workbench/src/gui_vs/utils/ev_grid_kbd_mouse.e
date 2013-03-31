note
	component:   "openEHR Archetype Project"
	description: "Form of EV_GRID to add keyboard and mouse wheel accessibility to a grid widget."
	keywords:    "ADL"
	author:      "Peter Gummer <peter.gummer@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2008- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "See notice at bottom of class"

class
	EV_GRID_KBD_MOUSE

inherit
	EV_GRID
		redefine
			create_interface_objects, initialize
		end

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

feature {NONE} -- Initialisation

	create_interface_objects
		do
			precursor
			create user_key_map.make (0)
		end

	initialize
		do
			precursor
			key_press_actions.wipe_out
			key_press_actions.extend (agent on_grid_key_press)
			mouse_wheel_actions.wipe_out
			mouse_wheel_actions.extend (agent on_mouse_wheel)
		end

feature -- Access

	selected_cell: detachable EV_GRID_ITEM
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
			indexes := viewable_row_indexes
			from i := indexes.count until i = 1 or else indexes [i] <= index loop
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
							expand_tree (a_row, Void)
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
			an_item: detachable EV_GRID_ITEM
			i: INTEGER
		do
			a_row := row (index_of_viewable_offset_from_row (an_index, 0))
			from i := 1 until i > a_row.count or attached an_item loop
				an_item := a_row.item (i)
				i := i + 1
			end
			if attached an_item as it and then not it.is_selected then
				remove_selection
				it.enable_select
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

	expand_tree (a_row: EV_GRID_ROW; test: detachable FUNCTION [ANY, TUPLE [EV_GRID_ROW], BOOLEAN])
			-- Expand `row' and all of its sub-rows, recursively.
		require
			is_tree_enabled
		local
			i: INTEGER
		do
			if a_row.is_expandable and (not attached test or else test.item ([a_row])) then
				a_row.expand_actions.block
				a_row.expand
				a_row.expand_actions.resume
				from i := 1 until i > a_row.subrow_count loop
					expand_tree (a_row.subrow (i), test)
					i := i + 1
				end
			end
		ensure
			row_expanded: a_row.is_expandable and (not attached test or else test.item ([a_row])) implies a_row.is_expanded
		end

	collapse_tree (a_row: EV_GRID_ROW)
			-- Collapse `row' and all of its sub-rows, recursively.
		require
			is_tree_enabled
		local
			i: INTEGER
		do
			from i := 1 until i > a_row.subrow_count loop
				collapse_tree (a_row.subrow (i))
				i := i + 1
			end
			a_row.collapse_actions.block
			a_row.collapse
			a_row.collapse_actions.resume
		ensure
			row_collapsed: not a_row.is_expanded
		end

	resize_columns_to_content (expansion_factor: REAL)
			-- resize all columns to content, applying `expansion_factor'
		require
			Sane_expansion_factor: expansion_factor >= 1.0 and expansion_factor <= 2.0
		local
			i: INTEGER
		do
			from i := 1 until i > column_count loop
				if column (i).is_show_requested then
					column(i).resize_to_content
					column(i).set_width ((column (i).width * expansion_factor).ceiling)
				end
				i := i + 1
			end
		end

	tree_do_all (a_node_action: PROCEDURE [ANY, TUPLE [EV_GRID_ROW]])
			-- do `a_node_action' to all nodes in the structure
		require
			is_tree_enabled
		local
			i: INTEGER
			top_level_rows: ARRAYED_LIST [EV_GRID_ROW]
		do
			create top_level_rows.make (0)
			from i := 1 until i > row_count loop
				if depth_in_tree (i) = 1 then
					top_level_rows.extend (row (i))
				end
				i := i + 1
			end
			top_level_rows.do_all (agent tree_do_all_nodes (?, a_node_action))
		end

	tree_do_all_nodes (a_grid_row: EV_GRID_ROW; a_node_action: PROCEDURE [ANY, TUPLE [EV_GRID_ROW]])
		require
			is_tree_enabled
		local
			i: INTEGER
		do
			from i := 1 until i > a_grid_row.subrow_count loop
				tree_do_all_nodes (a_grid_row.subrow (i), a_node_action)
				i := i + 1
			end
			a_node_action.call ([a_grid_row])
		end

	collapse_one_level (test: detachable FUNCTION [ANY, TUPLE [EV_GRID_ROW], BOOLEAN])
		require
			is_tree_enabled
		local
			i: INTEGER
		do
			from i := 1 until i > row_count loop
				create ev_grid_row_list.make (0)
				if row (i).is_expandable then
					get_grid_row_collapsable_nodes (row (i))
				end
				from ev_grid_row_list.start until ev_grid_row_list.off loop
					if not attached test or else test.item ([ev_grid_row_list.item]) then
						ev_grid_row_list.item.collapse_actions.block
						ev_grid_row_list.item.collapse
						ev_grid_row_list.item.collapse_actions.resume
					end
					ev_grid_row_list.forth
				end
				i := i + row (i).subrow_count_recursive + 1
			end
		end

	expand_one_level (test: detachable FUNCTION [ANY, TUPLE [EV_GRID_ROW], BOOLEAN])
		require
			is_tree_enabled
		local
			i: INTEGER
		do
			from i := 1 until i > row_count loop
				create ev_grid_row_list.make (0)
				if row (i).is_expandable then
					get_grid_row_expandable_nodes (row (i))
				end
				from ev_grid_row_list.start until ev_grid_row_list.off loop
					if not attached test or else test.item ([ev_grid_row_list.item]) then
						ev_grid_row_list.item.expand_actions.block
						ev_grid_row_list.item.expand
						ev_grid_row_list.item.expand_actions.resume
					end
					ev_grid_row_list.forth
				end
				i := i + row (i).subrow_count_recursive + 1
			end
		end

	expand_all (test: detachable FUNCTION [ANY, TUPLE [EV_GRID_ROW], BOOLEAN])
			-- expand rows that pass `test'
		require
			is_tree_enabled
		local
			i: INTEGER
		do
			from i := 1 until i > row_count loop
				expand_tree (row (i), test)
				i := i + row (i).subrow_count_recursive + 1
			end
		end

	collapse_all
		require
			is_tree_enabled
		local
			i: INTEGER
		do
			from i := 1 until i > row_count loop
				collapse_tree (row (i))
				i := i + row (i).subrow_count_recursive + 1
			end
		end

	collapse_except (test: FUNCTION [ANY, TUPLE [EV_GRID_ROW], BOOLEAN])
			-- collapse except rows that pass `test'
		require
			is_tree_enabled
		local
			i: INTEGER
			matching_rows: ARRAYED_LIST [INTEGER]
		do
			create matching_rows.make (0)
			from i := 1 until i > row_count loop
				if test.item ([row (i)]) and attached row (i).parent_row then
					matching_rows.extend (i)
				end
				i := i + 1
			end
			collapse_all
			across matching_rows as rows_csr loop
				check attached row (rows_csr.item).parent_row as a_row then
					if not a_row.is_expanded then
						expand_to_row (a_row)
					end
				end
			end
		end

	expand_to_row (a_row: EV_GRID_ROW)
			-- ensure `a_row' is expanded to in tree
		require
			is_tree_enabled
		local
			csr: detachable EV_GRID_ROW
		do
			from csr := a_row until csr = Void or csr.is_expanded loop
				if csr.is_expandable then
					csr.expand_actions.block
					csr.expand
					csr.expand_actions.resume
				end
				csr := csr.parent_row
			end
		end

	ensure_visible (a_row: EV_GRID_ROW)
			-- ensure `a_row' is visible in grid, expand it if necessary
		require
			is_tree_enabled
		do
			expand_to_row (a_row)
			if is_displayed then
				a_row.ensure_visible
			end
		end

feature {NONE} -- Implementation

	ev_grid_row_list: detachable ARRAYED_LIST [EV_GRID_ROW]

	get_grid_row_expandable_nodes (an_ev_grid_row: EV_GRID_ROW)
			-- for `an_ev_grid_row' generate list of expandable child rows
		require
			an_ev_grid_row.is_expandable
		local
			i: INTEGER
		do
			if an_ev_grid_row.is_expanded then
				from i := 1 until i > an_ev_grid_row.subrow_count loop
					if an_ev_grid_row.subrow (i).is_expandable then
						if not an_ev_grid_row.subrow (i).is_expanded then
							ev_grid_row_list.extend (an_ev_grid_row.subrow (i))
						else
							get_grid_row_expandable_nodes (an_ev_grid_row.subrow (i))
						end
					end
					i := i + 1
				end
			else
				ev_grid_row_list.extend (an_ev_grid_row)
			end
		end

	get_grid_row_collapsable_nodes (an_ev_grid_row: EV_GRID_ROW)
			-- record nodes for collapsing if they have all non-expanded children
		require
			an_ev_grid_row.is_expandable
		local
			i, exp_child_count: INTEGER
		do
			if an_ev_grid_row.is_expanded then
				exp_child_count := 0
				from i := 1 until i > an_ev_grid_row.subrow_count loop
					if an_ev_grid_row.subrow (i).is_expandable then
						if an_ev_grid_row.subrow (i).is_expanded then
							get_grid_row_collapsable_nodes (an_ev_grid_row.subrow (i))
							exp_child_count := exp_child_count + 1
						end
					end
					i := i + 1
				end
				if exp_child_count = 0 then
					ev_grid_row_list.extend (an_ev_grid_row)
				end
			end
		end

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
