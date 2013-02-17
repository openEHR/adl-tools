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

class EVX_TEXT_LIST_CONTROL

inherit
	EVX_MLIST_CONTROL
		rename
			make as make_mlist, make_linked as make_linked_mlist
		redefine
			data_source_agent, data_source_setter_agent
		end

create
	make, make_linked

feature -- Initialisation

	make (a_title: STRING; a_data_source_agent: like data_source_agent;
			min_height, min_width: INTEGER; arrange_horizontally: BOOLEAN)
		do
			make_mlist (a_title, a_data_source_agent, min_height, min_width, arrange_horizontally, Void)
		ensure
			not is_readonly
		end

	make_linked (a_title: STRING; a_data_source_agent: like data_source_agent;
			a_data_source_create_agent: like data_source_setter_agent;
			a_data_source_remove_agent: like data_source_remove_agent;
			an_undo_redo_chain: like undo_redo_chain;
			min_height, min_width: INTEGER;
			arrange_horizontally: BOOLEAN)
		do
			make_linked_mlist (a_title,
				a_data_source_agent, a_data_source_create_agent, a_data_source_remove_agent, an_undo_redo_chain,
				min_height, min_width, arrange_horizontally, Void)
		ensure
			not is_readonly
		end

feature -- Access

	data_source_agent: FUNCTION [ANY, TUPLE, DYNAMIC_LIST [STRING]]
			-- function that produces a correct reference to the data source of this
			-- control when called

	data_source_setter_agent: detachable PROCEDURE [ANY, TUPLE [STRING, INTEGER]]
			-- agent for add an item to the data source list

feature {NONE} -- Implementation

	do_populate_control_from_source
		do
			populate_ev_multi_list_from_list (ev_data_control, data_source_agent.item ([]))
		end

	process_in_place_edit
		local
			old_val, new_val: STRING
			ds: DYNAMIC_LIST [STRING]
			ds_index: INTEGER
		do
			ds := data_source_agent.item ([])
			ds_index := 1
			from ds.start until ds_index = ev_data_control.widget_row or ds.off loop
				ds_index := ds_index + 1
				ds.forth
			end
			old_val := ds.item_for_iteration

			new_val := utf32_to_utf8 (ev_data_control.i_th (ev_data_control.widget_row).i_th (1))

			if not old_val.same_string (new_val) then
				ds.replace (new_val)
				undo_redo_chain.add_link (
					-- undo
					agent ds.put_i_th (old_val, ds_index),
					agent (a_val: STRING_32; row_idx: INTEGER)
						local
							a_row: EV_MULTI_COLUMN_LIST_ROW
						do
							a_row := ev_data_control.i_th (row_idx)
							a_row.put_i_th (a_val, 1)
						end (utf8_to_utf32 (old_val), ev_data_control.widget_row),
					-- redo
					agent ds.put_i_th (new_val, ds_index),
					agent (a_val: STRING_32; row_idx: INTEGER)
						local
							a_row: EV_MULTI_COLUMN_LIST_ROW
						do
							a_row := ev_data_control.i_th (row_idx)
							a_row.put_i_th (a_val, 1)
						end (utf8_to_utf32 (new_val), ev_data_control.widget_row)
				)
			end
		end

	process_add_new
		local
			new_row: EV_MULTI_COLUMN_LIST_ROW
			new_val: STRING
		do
			new_val := "new_val#" + uniqueness_counter.out

			create new_row
			new_row.extend (new_val)
			ev_data_control.extend (new_row)
	--		new_row.pointer_button_press_actions.force_extend (agent mlist_handler (ev_data_control, ?, ?, ?, ?, ?, ?, ?, ?))

			data_source_setter_agent.call ([new_val, 0])
			undo_redo_chain.add_link (
				-- undo
				agent data_source_remove_agent.call ([new_val]),
				agent populate,
				-- redo
				agent data_source_setter_agent.call ([new_val, 0]),
				agent populate
			)
		end

	process_remove_existing
		local
			undo_add_idx: INTEGER
			old_val: STRING
			ds: DYNAMIC_LIST [STRING]
			ds_index: INTEGER
		do
			ds := data_source_agent.item ([])
			check attached ev_data_control.selected_item as sel_item then
				ds_index := ev_data_control.index_of (sel_item, 1)
			end
			old_val := ds.i_th (ds_index)

			if ds_index = ev_data_control.count then -- removing last element
				undo_add_idx := 0
			else
				undo_add_idx := ds_index
			end
			data_source_remove_agent.call ([old_val])
			undo_redo_chain.add_link (
				agent data_source_setter_agent.call ([old_val, undo_add_idx]),
				agent populate,
				agent data_source_remove_agent.call ([old_val]),
				agent populate
			)
			ev_data_control.remove_selected_item
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
