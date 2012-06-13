note
	component:   "openEHR Archetype Project"
	description: "EV_GRID form of GUI_TREE_CONTROL_I"
	keywords:    "UI"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2012 Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"


class GUI_TREE_CONTROL_GRID

inherit
	GUI_TREE_CONTROL_I

	GUI_DEFINITIONS
		export
			{NONE} all
		end

create
	make

feature -- Initialisation

	make (a_gui_grid: GUI_EV_GRID)
		do
			ev_grid := a_gui_grid.ev_grid
		end

feature -- Access

	ev_grid: EV_GRID_KBD_MOUSE

feature -- Commands

	ev_tree_do_all (a_node_action: attached PROCEDURE [ANY, TUPLE [EV_GRID_ROW]])
			-- do enter_action and exit_action to all nodes in the structure
		local
			i: INTEGER
			top_level_rows: ARRAYED_LIST [EV_GRID_ROW]
		do
			create top_level_rows.make (0)
			from i := 1 until i > ev_grid.row_count loop
				if ev_grid.depth_in_tree (i) = 1 then
					top_level_rows.extend (ev_grid.row (i))
				end
				i := i + 1
			end
			top_level_rows.do_all (agent ev_tree_do_all_nodes (?, a_node_action))
		end

feature -- Events

	on_collapse_one_level
		do
			create ev_grid_row_list.make (0)
			if ev_grid.row (1).is_expandable then
				ev_grid_row_collapse_one_level (ev_grid.row (1))
			end
			from ev_grid_row_list.start until ev_grid_row_list.off loop
				ev_grid_row_list.item.collapse
				ev_grid_row_list.forth
			end
			ev_grid.resize_columns_to_content (Default_grid_expansion_factor)
		end

	on_expand_one_level
		do
			create ev_grid_row_list.make (0)
			if ev_grid.row (1).is_expandable then
				ev_grid_row_expand_one_level (ev_grid.row (1))
			end
			from ev_grid_row_list.start until ev_grid_row_list.off loop
				ev_grid_row_list.item.expand
				ev_grid_row_list.forth
			end
			ev_grid.resize_columns_to_content (Default_grid_expansion_factor)
		end

	on_expand_all
		do
			if ev_grid.row_count > 0 then
				ev_grid.expand_tree (ev_grid.row (1))
			end
		end

	on_collapse_all
		do
			if ev_grid.row_count > 0 then
				ev_grid.collapse_tree (ev_grid.row (1))
			end
		end

feature {NONE} -- Implementation

	ev_grid_row_list: ARRAYED_LIST [EV_GRID_ROW]

	ev_grid_row_expand_one_level (an_ev_grid_row: attached EV_GRID_ROW)
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
							ev_grid_row_expand_one_level (an_ev_grid_row.subrow (i))
						end
					end
					i := i + 1
				end
			else
				ev_grid_row_list.extend (an_ev_grid_row)
			end
		end

	ev_grid_row_collapse_one_level (an_ev_grid_row: attached EV_GRID_ROW)
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
							ev_grid_row_collapse_one_level (an_ev_grid_row.subrow (i))
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

	ev_tree_do_all_nodes (a_grid_row: attached EV_GRID_ROW; a_node_action: PROCEDURE [ANY, TUPLE [EV_GRID_ROW]])
		local
			i: INTEGER
		do
			from i := 1 until i > a_grid_row.subrow_count loop
				ev_tree_do_all_nodes (a_grid_row.subrow (i), a_node_action)
				i := i + 1
			end
			a_node_action.call ([a_grid_row])
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
--| The Original Code is gui_grid_treeview_control.e
--|
--| The Initial Developer of the Original Code is Thomas Beale.
--| Portions created by the Initial Developer are Copyright (C) 2012
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
