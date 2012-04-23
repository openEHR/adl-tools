note
	component:   "openEHR Archetype Project"
	description: "[
				 Visual control for HASH_TABLE [ANY, STRING] data source, where the ANY generic parameter has 
				 reasonable .out output.  Control structure is a 2 column table with a title, in-place 
				 editing and deletion, right-click context menu to add a row.
				 
									   Title
						+------+----------------------------+
						|      |                            |
						|      |                            |
						|      |                            |
						|      |                            |
						+------+----------------------------+

				 ]"
	keywords:    "UI, ADL"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2012 Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"


class GUI_HASH_TABLE_CONTROL

inherit
	GUI_EV_MLIST_CONTROL
		redefine
			data_source
		end

create
	make

feature -- Access

	data_source: FUNCTION [ANY, TUPLE, HASH_TABLE [STRING, STRING]]
			-- function that produces a correct reference to the data source of this
			-- control when called

feature -- Modification

	set_editing_agents (an_undo_redo_chain: like undo_redo_chain;
			an_put_item_agent: like put_item_agent;
			a_remove_item_agent: like remove_item_agent)
		do
			undo_redo_chain := an_undo_redo_chain
			put_item_agent := an_put_item_agent
			remove_item_agent := a_remove_item_agent
		end

feature -- Commands

	do_populate
		do
			populate_ev_multi_list_from_hash (ev_data_control, data_source.item([]))

			if edit_enabled then
				from ev_data_control.start until ev_data_control.off loop
					ev_data_control.item.pointer_button_press_actions.force_extend (agent mlist_row_handler (ev_data_control.item, ?, ?, ?))
					ev_data_control.forth
				end
			end
		end

feature -- Events

feature {NONE} -- Implementation

	undo_redo_chain: UNDO_REDO_CHAIN

	process_in_place_edit
		local
			old_key, old_val, new_key, new_val: STRING
			ds: HASH_TABLE [STRING, STRING]
			i: INTEGER
		do
			ds := data_source.item ([])
			i := 1
			from ds.start until i = ev_data_control.widget_row or ds.off loop
				i := i + 1
				ds.forth
			end
			old_key := ds.key_for_iteration
			old_val := ds.item_for_iteration

			if ev_data_control.widget_column = 1 then -- key was modified; treat it as a remove & add
				new_key := ev_data_control.i_th (ev_data_control.widget_row).i_th (1)
				do_replace_key (old_key, new_key, old_val)
				undo_redo_chain.add_link (
					agent do_replace_key (old_key, new_key, old_val), agent undo_replace_key (old_key, new_key, old_val), agent do_populate
				)
			else -- value modified; it's a normal replace
				new_val := ev_data_control.i_th (ev_data_control.widget_row).i_th (2)
				put_item_agent.call ([old_key, new_val])
				undo_redo_chain.add_link (
					agent put_item_agent.call ([old_key, new_val]), agent put_item_agent.call ([old_key, old_val]), agent do_populate
				)
			end

		end

	process_add_new
		local
			new_key, new_val: STRING
			new_row: EV_MULTI_COLUMN_LIST_ROW
		do
			new_key := "new_key-" + uniqueness_counter.out
			uniqueness_counter := uniqueness_counter + 1
			new_val := "new_value"

			create new_row
			new_row.extend (new_key)
			new_row.extend (new_val)
			ev_data_control.extend (new_row)
			new_row.pointer_button_press_actions.force_extend (agent mlist_row_handler (new_row, ?, ?, ?))
			put_item_agent.call ([new_key, new_val])
			undo_redo_chain.add_link (
				agent put_item_agent.call ([new_key, new_val]), agent remove_item_agent.call ([new_key]), agent do_populate
			)
		end

	process_remove_existing
		local
			old_key, old_val: STRING
		do
			old_key := ev_data_control.selected_item.i_th (1)
			old_val := ev_data_control.selected_item.i_th (2)
			remove_item_agent.call ([old_key])
			undo_redo_chain.add_link (
				agent remove_item_agent.call ([old_key]), agent put_item_agent.call ([old_key, old_val]), agent do_populate
			)
			ev_data_control.remove_selected_item
		end

	do_replace_key (an_old_key, a_new_key, an_old_value: STRING)
		do
			remove_item_agent.call ([an_old_key, an_old_value])
			put_item_agent.call ([a_new_key, an_old_value])
		end

	undo_replace_key (an_old_key, a_new_key, an_old_value: STRING)
		do
			remove_item_agent.call ([a_new_key, an_old_value])
			put_item_agent.call ([an_old_key, an_old_value])
		end

	put_item_agent: PROCEDURE [ANY, TUPLE [a_key: STRING; a_new_value: STRING]]
			-- an agent that can be used to add or replace an entry to the hash table;
			-- this will typically be a setter routine from a high-level object, not the HASH_TABLE in question

	remove_item_agent: PROCEDURE [ANY, TUPLE [a_key: STRING]]
			-- an agent that can be used to remove an entry in the hash table;
			-- this will typically be a setter routine from a high-level object, not the HASH_TABLE in question

	uniqueness_counter: INTEGER

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
