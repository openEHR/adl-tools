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

feature -- Modification

	set_editing_agents (an_undo_redo_chain: like undo_redo_chain;
			an_add_item_agent: like add_item_agent;
			a_replace_item_agent: like replace_item_agent;
			a_remove_item_agent: like remove_item_agent)
		do
			undo_redo_chain := an_undo_redo_chain
			add_item_agent := an_add_item_agent
			replace_item_agent := a_replace_item_agent
			remove_item_agent := a_remove_item_agent
		end

feature -- Commands

	do_populate
		do
			populate_ev_multi_list_from_hash (ev_data_control, data_source.item([]))
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
				replace_item_agent.call ([old_key, new_val])
				undo_redo_chain.add_link (
					agent do_replace_item (old_key, new_val), agent undo_replace_item (old_key, old_val), agent do_populate
				)
			end

		end

	process_add_new
		do

		end

	process_remove_existing
		local
			ds: HASH_TABLE [STRING, STRING]
			old_key, old_val: STRING
		do
			ds := data_source.item ([])
			do_remove_item (old_key)
			undo_redo_chain.add_link (
				agent do_remove_item (old_key), agent undo_remove_item (old_key, old_val), agent do_populate
			)
		end

	do_replace_key (an_old_key, a_new_key, an_old_value: STRING)
		do
			remove_item_agent.call ([an_old_key, an_old_value])
			add_item_agent.call ([a_new_key, an_old_value])
		end

	undo_replace_key (an_old_key, a_new_key, an_old_value: STRING)
		do
			remove_item_agent.call ([a_new_key, an_old_value])
			add_item_agent.call ([an_old_key, an_old_value])
		end

	do_replace_item (a_key, a_new_value: STRING)
		do
			replace_item_agent.call ([a_key, a_new_value])
		end

	undo_replace_item (a_key, an_old_value: STRING)
		do
			replace_item_agent.call ([a_key, an_old_value])
		end

	do_add_item (a_key, a_value: STRING)
		do
			add_item_agent.call ([a_key, a_value])
		end

	undo_add_item (a_key: STRING)
		do
			remove_item_agent.call ([a_key])
		end

	do_remove_item (a_key: STRING)
		do
			remove_item_agent.call ([a_key])
		end

	undo_remove_item (a_key, an_old_value: STRING)
		do
			add_item_agent.call ([a_key, an_old_value])
		end

	add_item_agent: PROCEDURE [ANY, TUPLE [a_key: STRING; a_new_value: STRING]]
			-- an agent that can be used to add an entry to the hash table;
			-- this will typically be a setter routine from a high-level object, not the HASH_TABLE in question

	replace_item_agent: PROCEDURE [ANY, TUPLE [a_key: STRING; a_new_value: STRING]]
			-- an agent that can be used to replace an entry in the hash table;
			-- this will typically be a setter routine from a high-level object, not the HASH_TABLE in question

	remove_item_agent: PROCEDURE [ANY, TUPLE [a_key: STRING]]
			-- an agent that can be used to remove an entry in the hash table;
			-- this will typically be a setter routine from a high-level object, not the HASH_TABLE in question

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
