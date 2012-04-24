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
			data_source
		end

create
	make

feature -- Access

	data_source: FUNCTION [ANY, TUPLE, LIST [STRING]]

feature -- Modification

	set_editing_agents (an_undo_redo_chain: like undo_redo_chain;
			an_add_item_agent: like add_item_agent;
			a_replace_current_item_agent: like replace_current_item_agent;
			a_remove_current_item_agent: like remove_current_item_agent)
		do
			undo_redo_chain := an_undo_redo_chain
			add_item_agent := an_add_item_agent
			replace_current_item_agent := a_replace_current_item_agent
			remove_current_item_agent := a_remove_current_item_agent
		end

feature -- Commands

	do_populate
		do
			populate_ev_multi_list_from_list (ev_data_control, data_source.item ([]))
		end

feature {NONE} -- Implementation

	undo_redo_chain: UNDO_REDO_CHAIN
		-- reference to undo/redo chain from owning visual context

	process_in_place_edit
		do
		end

	process_add_new
		do
		end

	process_remove_existing
		do
		end

	add_item_agent: PROCEDURE [ANY, TUPLE [an_index: INTEGER; a_new_value: STRING]]
			-- an agent that can be used to add an entry to the list at the i'th position;
			-- this will typically be a setter routine from a high-level object, not the LIST in question

	replace_current_item_agent: PROCEDURE [ANY, TUPLE [a_new_value: STRING]]
			-- an agent that can be used to replace the currently selected entry in the list;
			-- this will typically be a setter routine from a high-level object, not the LIST in question

	remove_current_item_agent: PROCEDURE [ANY, TUPLE]
			-- an agent that can be used to remove the current entry from the list;
			-- this will typically be a setter routine from a high-level object, not the LIST in question

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
