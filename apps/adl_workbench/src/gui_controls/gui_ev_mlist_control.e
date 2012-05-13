note
	component:   "openEHR Archetype Project"
	description: "[
				 Visual control for a data source that outputs to an EV_MULTI_COLUMN_LIST. Specialise data source
				 in descendants.
				 Visual control structure is a single or multi-column table with a title, in-place editing and deletion, 
				 right-click context menu to add a row.
				 
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


deferred class GUI_EV_MLIST_CONTROL

inherit
	GUI_DATA_CONTROL
		rename
			make as make_data_control, make_editable as make_editable_data_control
		redefine
			do_populate, enable_edit
		end

feature -- Initialisation

	make (a_title: STRING; a_data_source: like data_source;
			min_height, min_width: INTEGER;
			use_hbox_container: BOOLEAN;
			a_header_strings_agent: like header_strings_agent)
		do
			make_data_control (a_title, a_data_source, min_height, min_width, use_hbox_container, True)
			if attached a_header_strings_agent then
				header_strings_agent := a_header_strings_agent
			else
				ev_data_control.hide_title_row
			end
		end

	make_editable (a_title: STRING; a_data_source: like data_source;
			a_data_source_create_agent: like data_source_create_agent;
			a_data_source_remove_agent: like data_source_remove_agent;
			an_undo_redo_chain: UNDO_REDO_CHAIN;
			min_height, min_width: INTEGER;
			use_hbox_container: BOOLEAN;
			a_header_strings_agent: like header_strings_agent)
		do
			make_editable_data_control (a_title,
				a_data_source, a_data_source_create_agent, a_data_source_remove_agent, an_undo_redo_chain,
				min_height, min_width, use_hbox_container, True)
			if attached a_header_strings_agent then
				header_strings_agent := a_header_strings_agent
			else
				ev_data_control.hide_title_row
			end
		end

feature -- Access

	ev_data_control: EV_MULTI_COLUMN_LIST_EDITABLE

	header_strings_agent: detachable FUNCTION [ANY, TUPLE, ARRAY [STRING]]
			-- agent that returns a set of strings that can be used to populate the
			-- title row of the data control

feature -- Commands

	do_populate
		do
			if attached header_strings_agent then
				ev_data_control.set_column_titles (header_strings_agent.item ([]))
			end
			do_populate_control_from_source

			if edit_enabled then
				set_columns_editable
--				from ev_data_control.start until ev_data_control.off loop
--					ev_data_control.item.pointer_button_press_actions.force_extend (agent mlist_row_handler (ev_data_control.item, ?, ?, ?))
--					ev_data_control.forth
--				end
				ev_data_control.pointer_button_press_actions.force_extend (agent mlist_handler (ev_data_control, ?, ?, ?, ?, ?, ?, ?, ?))
			end
		end

	enable_edit
			-- enable editing
		local
			root_win: EV_WINDOW
		do
			precursor
			root_win := proximate_ev_window (ev_root_container)
			ev_data_control.enable_editing (root_win)
			ev_data_control.end_edit_actions.extend (agent process_in_place_edit)
		end

	do_clear
			-- Wipe out content.
		do
			ev_data_control.wipe_out
		end

feature {NONE} -- Implementation

	do_populate_control_from_source
		deferred
		end

	create_ev_data_control
		do
			create ev_data_control
		end

	process_in_place_edit
		deferred
		end

	process_add_new
		deferred
		end

	process_remove_existing
		deferred
		end

	mlist_handler (ev_mlist: EV_MULTI_COLUMN_LIST; x,y, button: INTEGER; x_tilt, y_tilt, pressure: DOUBLE; screen_x, screen_y: INTEGER)
			-- creates the context menu for a right click action on a list
		local
			menu: EV_MENU
			an_mi: EV_MENU_ITEM
		do
			if button = {EV_POINTER_CONSTANTS}.right then
				create menu
				if attached ev_mlist.selected_item then
					create an_mi.make_with_text_and_action (get_msg ("remove_mi", Void), agent process_remove_existing)
				--		an_mi.set_pixmap (get_icon_pixmap ("tool/archetype_tool_new"))
					menu.extend (an_mi)
				end
				create an_mi.make_with_text_and_action (get_msg ("add_mi", Void), agent process_add_new)
		--		an_mi.set_pixmap (get_icon_pixmap ("tool/archetype_tool"))
		    	menu.extend (an_mi)
				menu.show
			end
		end

	set_columns_editable
		do
			ev_data_control.set_all_columns_editable
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
