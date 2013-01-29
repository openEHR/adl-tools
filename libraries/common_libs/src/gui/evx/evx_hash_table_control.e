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

				 Note that the undo/redo actions for adding and deleting rows can cause re-ordering of the table
				 because HASH_TABLE iterates in chronological addition order. Therefore all undo/redo actions
				 have to be impervious to table re-ordering.
				 ]"
	keywords:    "UI, ADL"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2012 Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "See notice at bottom of class"

class EVX_HASH_TABLE_CONTROL

inherit
	EVX_MLIST_CONTROL
		redefine
			data_source_agent, data_source_setter_agent, data_source_remove_agent
		end

create
	make, make_linked

feature -- Access

	data_source_agent: FUNCTION [ANY, TUPLE, HASH_TABLE [STRING, STRING]]
			-- function that produces a correct reference to the data source of this
			-- control when called

	data_source_setter_agent: detachable PROCEDURE [ANY, TUPLE [STRING, STRING]]
			-- agent for creating & setting the data source

	data_source_remove_agent: detachable PROCEDURE [ANY, TUPLE [STRING]]
			-- agent for removing a data item

feature {NONE} -- Implementation

	do_populate_control_from_source
		do
			populate_ev_multi_list_from_hash (ev_data_control, data_source_agent.item([]))
		end

	process_in_place_edit
		local
			old_key, old_val, new_key, new_val: STRING
			i: INTEGER
			ds: HASH_TABLE [STRING, STRING]
		do
			ds := data_source_agent.item ([])
			i := 1
			from ds.start until i = ev_data_control.widget_row or ds.off loop
				i := i + 1
				ds.forth
			end
			old_key := ds.key_for_iteration
			old_val := ds.item_for_iteration

			if ev_data_control.widget_column = 1 then -- key was modified; treat it as a remove & add
				new_key := utf32_to_utf8 (ev_data_control.i_th (ev_data_control.widget_row).i_th (1))
				if not new_key.same_string (old_key) then
					ds.replace_key (new_key, old_key)
					undo_redo_chain.add_link (
						-- undo
						agent ds.replace_key (old_key, new_key),
						agent populate,
						-- redo
						agent ds.replace_key (new_key, old_key),
						agent populate
					)
				end
			else -- value modified; it's a normal replace
				new_val := utf32_to_utf8 (ev_data_control.i_th (ev_data_control.widget_row).i_th (2))
				if not new_val.same_string (old_val) then
					ds.force (new_val, old_key)
					undo_redo_chain.add_link (
						-- undo
						agent ds.force (old_val, old_key),
						agent populate,
						-- redo
						agent ds.force (new_val, old_key),
						agent populate
					)
				end
			end
		end

	process_add_new
		local
			new_key, new_val: STRING
			new_row: EV_MULTI_COLUMN_LIST_ROW
		do
			new_key := "new_key#" + uniqueness_counter.out
			increment_uniqueness_counter
			new_val := "new_value"

			create new_row
			new_row.extend (new_key)
			new_row.extend (new_val)
			ev_data_control.extend (new_row)
	--		new_row.pointer_button_press_actions.force_extend (agent mlist_handler (ev_data_control, ?, ?, ?, ?, ?, ?, ?, ?))

			data_source_setter_agent.call ([new_key, new_val])
			undo_redo_chain.add_link (
				agent data_source_remove_agent.call ([new_key]), agent populate, -- undo
				agent data_source_setter_agent.call ([new_key, new_val]), agent populate -- redo
			)
		end

	process_remove_existing
		local
			old_key, old_val: STRING
		do
			old_key := ev_data_control.selected_item.i_th (1)
			old_val := ev_data_control.selected_item.i_th (2)

			data_source_remove_agent.call ([old_key])
			ev_data_control.remove_selected_item

			undo_redo_chain.add_link (
				agent data_source_setter_agent.call ([old_key, old_val]), agent populate,  -- undo
				agent data_source_remove_agent.call ([old_key]), agent populate -- redo
			)
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
