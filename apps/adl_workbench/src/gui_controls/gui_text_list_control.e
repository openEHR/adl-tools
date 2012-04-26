note
	component:   "openEHR Archetype Project"
	description: "[
				 Visual control for LIST [STRING] data source. Control structure is a single column table with a title, 
				 in-place editing and deletion, right-click context menu to add a row.
				 
								   Title
						+----------------------------+
						|                            |
						|                            |
						|                            |
						|                            |
						+----------------------------+

				 ]"
	keywords:    "UI, ADL"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2012 Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"


class GUI_TEXT_LIST_CONTROL

inherit
	GUI_EV_MLIST_CONTROL
		redefine
			data_source, data_source_create_agent
		end

create
	make, make_editable

feature -- Access

	data_source: FUNCTION [ANY, TUPLE, DYNAMIC_LIST [STRING]]
			-- function that produces a correct reference to the data source of this
			-- control when called

	data_source_create_agent: detachable PROCEDURE [ANY, TUPLE [STRING, INTEGER]]
			-- agent for add an item to the data source list

feature {NONE} -- Implementation

	do_populate_control_from_source
		do
			populate_ev_multi_list_from_list (ev_data_control, data_source.item ([]))
		end

	process_in_place_edit
		do
			ds := data_source.item ([])
			ds_index := 1
			from ds.start until ds_index = ev_data_control.widget_row or ds.off loop
				ds_index := ds_index + 1
				ds.forth
			end
			old_val := ds.item_for_iteration

			new_val := ev_data_control.i_th (ev_data_control.widget_row).i_th (1)
			ds.replace (new_val)
			undo_redo_chain.add_link (
				agent do ds.go_i_th (ds_index); ds.replace (old_val) end,
				agent do ds.go_i_th (ds_index); ds.replace (new_val) end,
				agent do_populate
			)
		end

	process_add_new
		local
			new_row: EV_MULTI_COLUMN_LIST_ROW
		do
			new_val := "new_value"

			create new_row
			new_row.extend (new_val)
			ev_data_control.extend (new_row)
			new_row.pointer_button_press_actions.force_extend (agent mlist_row_handler (new_row, ?, ?, ?))

			data_source_create_agent.call ([new_val, 0])
			undo_redo_chain.add_link (
				agent data_source_remove_agent.call ([new_val]),
				agent data_source_create_agent.call ([new_val, 0]),
				agent do_populate
			)
		end

	process_remove_existing
		local
			undo_add_idx: INTEGER
		do
			ds := data_source.item ([])
			ds_index := ev_data_control.index_of (ev_data_control.selected_item, 1)
			old_val := ds.i_th (ds_index)

			if ds_index = ev_data_control.count then -- removing last element
				undo_add_idx := 0
			else
				undo_add_idx := ds_index
			end
			data_source_remove_agent.call ([old_val])
			undo_redo_chain.add_link (
				agent data_source_create_agent.call ([old_val, undo_add_idx]),
				agent data_source_remove_agent.call ([old_val]),
				agent do_populate
			)
			ev_data_control.remove_selected_item
		end

	ds: DYNAMIC_LIST [STRING]

	ds_index: INTEGER

	old_val, new_val: STRING

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
--| The Original Code is gui_hash_table.e.
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
