note
	component:   "openEHR Archetype Project"
	description: "EV_GRID form of EVX_TREE_CONTROL_I"
	keywords:    "UI"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2012 Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "See notice at bottom of class"

class EVX_TREE_CONTROL_GRID

inherit
	EVX_TREE_CONTROL_I

	EVX_DEFINITIONS
		export
			{NONE} all
		end

create
	make

feature -- Initialisation

	make (a_gui_grid: EVX_GRID)
		do
			ev_grid := a_gui_grid.ev_grid
			ev_root_widget := ev_grid
		end

feature -- Access

	ev_grid: EV_GRID_KBD_MOUSE

feature -- Commands

	ev_tree_do_all (a_node_action: PROCEDURE [ANY, TUPLE [EV_GRID_ROW]])
			-- do `a_node_action' to all nodes in the structure
		do
			ev_grid.tree_do_all (a_node_action)
		end

	collapse_one_level (test: FUNCTION [ANY, TUPLE [EV_GRID_ROW], BOOLEAN])
		do
			ev_grid.row_collapse_actions.block
			ev_grid.collapse_one_level (test)
			ev_grid.row_collapse_actions.resume
		end

	expand_one_level (test: FUNCTION [ANY, TUPLE [EV_GRID_ROW], BOOLEAN])
		do
			ev_grid.row_expand_actions.block
			ev_grid.expand_one_level (test)
			ev_grid.row_expand_actions.resume
		end

	expand_all (test: FUNCTION [ANY, TUPLE [EV_GRID_ROW], BOOLEAN])
		do
			ev_grid.row_collapse_actions.block
			ev_grid.expand_all (test)
			ev_grid.row_collapse_actions.resume
		end

	collapse_all
		do
			ev_grid.row_collapse_actions.block
			ev_grid.collapse_all
			ev_grid.row_collapse_actions.resume
		end

	collapse_except (test: FUNCTION [ANY, TUPLE [EV_GRID_ROW], BOOLEAN])
		do
			ev_grid.row_collapse_actions.block
			ev_grid.collapse_except (test)
			ev_grid.row_collapse_actions.resume
			resize_columns_to_content (default_grid_expansion_factor)
		end

	resize_columns_to_content (grid_expansion_factor: REAL)
		do
			ev_grid.resize_columns_to_content (grid_expansion_factor)
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
