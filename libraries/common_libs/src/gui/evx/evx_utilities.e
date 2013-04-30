note
	component:   "openEHR Re-usable Components"
	description: "Populate various Eiffel Vision2 standard controls from standard EiffelBase data structures"
	keywords:    "EiffelVision, GUI"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2007- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "See notice at bottom of class"

class EVX_UTILITIES

inherit
	STRING_UTILITIES

feature -- Commands

	do_with_wait_cursor (an_ev_widget: EV_WIDGET; action: PROCEDURE [ANY, TUPLE])
			-- Perform `action' with an hourglass mouse cursor, restoring the cursor when done.
		local
			ptr_style: detachable EV_POINTER_STYLE
		do
			ptr_style := an_ev_widget.pointer_style
			an_ev_widget.set_pointer_style ((create {EV_STOCK_PIXMAPS}).wait_cursor)
			action.call ([])
			an_ev_widget.set_pointer_style (ptr_style)
		rescue
			if attached ptr_style as ps then
				an_ev_widget.set_pointer_style (ps)
			end
		end

feature {NONE} -- Implementation

	show_in_system_browser (url: STRING)
			-- Launch the operating system's default browser to display the contents of `url'.
		require
			url_not_empty: not url.is_empty
		local
			command: STRING
			process: PROCESS
		do
   			if {PLATFORM}.is_windows then
   				command := "cmd /q /d /c start %"%" /b"
			elseif {PLATFORM}.is_mac then
				command := "open"
			elseif {PLATFORM}.is_unix then
   				command := "xdg-open"
			else
   				command := "firefox"
   			end

			command := command + " %"" + url + "%""

   			if {PLATFORM}.is_windows and {PLATFORM}.is_thread_capable then
	   			process := (create {PROCESS_FACTORY}).process_launcher (command, Void, Void)
	   			process.set_hidden (True)
	   			process.set_separate_console (False)
	   			process.launch
   			else
				(create {EXECUTION_ENVIRONMENT}).launch (command)
   			end
		end

	populate_ev_multi_list_from_hash (ev_mlist: EV_MULTI_COLUMN_LIST; ht: detachable HASH_TABLE [ANY, STRING])
			-- populate rows of a multi-column list with name - value pairs in a HASH_TABLE
			-- Note that the value type is assumed to have a sensible outpur from its 'out' function
		local
			ev_list_row: EV_MULTI_COLUMN_LIST_ROW
			item_list: LIST [ANY]
		do
			if attached ht then
				ev_mlist.wipe_out
				from ht.start until ht.off loop
					create ev_list_row
					ev_list_row.extend (utf8_to_utf32 (ht.key_for_iteration))
					if attached {GENERIC_RENDERABLE} ht.item_for_iteration as gr_item then
						item_list := gr_item.as_vector
						from item_list.start until item_list.off loop
							ev_list_row.extend (utf8_to_utf32 (item_list.item.out))
							item_list.forth
						end
					else
						ev_list_row.extend (utf8_to_utf32 (ht.item_for_iteration.out))
					end
					ev_mlist.extend(ev_list_row)
					ht.forth
				end

				resize_ev_multi_list (ev_mlist)
			end
		end

	populate_ev_multi_list_from_list (ev_mlist: EV_MULTI_COLUMN_LIST; a_list: detachable LIST [ANY])
			-- populate rows of a multi-column list with a single column of strings from `a_list'
			-- Note that the list value type is assumed to have a sensible outpur from its 'out' function
		local
			ev_list_row: EV_MULTI_COLUMN_LIST_ROW
		do
			if attached a_list then
				ev_mlist.wipe_out
				from a_list.start until a_list.off loop
					create ev_list_row
					ev_list_row.extend (utf8_to_utf32 (a_list.item.out))
					ev_mlist.extend (ev_list_row)
					a_list.forth
				end
				resize_ev_multi_list (ev_mlist)
			end
		end

	resize_ev_multi_list (ev_mlist: EV_MULTI_COLUMN_LIST)
			-- perform sensible column resizing on a EV_MULTI_COLUMN_LIST
		local
			i: INTEGER
		do
			if not ev_mlist.is_empty then
				from i := 1 until i > ev_mlist.column_count loop
					ev_mlist.resize_column_to_content (i)
					if attached ev_mlist.column_title (i) then
						-- FIXME: a pure hack to get round the problem of Multi-list column resizing not including title contents
						ev_mlist.set_column_width (ev_mlist.column_width (i).max (ev_mlist.column_title (i).count * 12), i)
					end
					i := i + 1
				end
			else
				resize_ev_multi_list_to_headers (ev_mlist)
			end
		end

	resize_ev_multi_list_to_headers (ev_mlist: EV_MULTI_COLUMN_LIST)
			-- perform sensible column resizing on a EV_MULTI_COLUMN_LIST based on column headings
		local
			i: INTEGER
		do
			from i := 1 until i > ev_mlist.column_count loop
				ev_mlist.set_column_width (ev_mlist.column_width (i).max (ev_mlist.column_title (i).count * 12), i)
				i := i + 1
			end
		end

	populate_ev_list_from_hash_keys (ev_list: EV_LIST; ht: detachable HASH_TABLE [ANY, STRING])
			-- populate list from hash table keys
		local
			ev_list_item: EV_LIST_ITEM
		do
			if attached ht then
				from ht.start until ht.off loop
					create ev_list_item.make_with_text (utf8_to_utf32 (ht.key_for_iteration))
					ev_list.extend(ev_list_item)
					ht.forth
				end
			end
		end

	initialise_splitter (split: EV_SPLIT_AREA; position: INTEGER)
			-- Make `position' the position for `split'; but do nothing if `position' is outside the allowed bounds.
		do
			if position = 0 then
				split.set_split_position (((split.minimum_split_position + split.maximum_split_position)/2).floor)
			elseif split.minimum_split_position <= position and position <= split.maximum_split_position then
				split.set_split_position (position)
			end
		end

	proximate_ev_window (a_widget: EV_WIDGET): detachable EV_WINDOW
			-- find closest EV_WINDOW containing `a_widget'
		local
			csr: detachable EV_WIDGET
		do
			from csr := a_widget.parent until not attached csr or else attached {EV_WINDOW} csr loop
				csr := csr.parent
			end
			if attached {EV_WINDOW} csr as ev_win then
				Result := ev_win
			end
		end

	dialog_names: EV_DIALOG_NAMES
		once
			create Result
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
--| The Original Code is gui_controller_tools.e.
--|
--| The Initial Developer of the Original Code is Thomas Beale.
--| Portions created by the Initial Developer are Copyright (C) 2007
--| the Initial Developer. All Rights Reserved.
--|
--| Contributor(s): Peter Gummer
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
