note
	component:   "openEHR Re-usable Components"
	description: "Populate various Eiffel Vision2 standard controls from standard EiffelBase data structures"
	keywords:    "EiffelVision, GUI"
	author:      "Thomas Beale"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2007 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"


class GUI_UTILITIES

inherit
	STRING_UTILITIES

feature {NONE} -- Implementation

	show_in_system_browser (url: attached STRING)
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

	get_file (init_value: STRING; a_parent_window: attached EV_WINDOW): STRING
			-- get a file path from user
		local
			dialog: EV_FILE_OPEN_DIALOG
			a_file: RAW_FILE
			error_dialog: EV_INFORMATION_DIALOG
			end_pos: INTEGER
			pathname: STRING
		do
			create dialog
			end_pos := init_value.last_index_of (operating_environment.Directory_separator, init_value.count)

			if end_pos = 0 then
				end_pos := init_value.count
			end

			pathname := init_value.substring (1, end_pos)
			dialog.set_start_directory (pathname)

			from
			until
				Result /= Void
			loop
				dialog.show_modal_to_window (a_parent_window)

				if dialog.selected_button = Void or else dialog.selected_button.is_equal ("Cancel") then
					Result := init_value
				else
					if not dialog.file_name.is_empty then
						create a_file.make (dialog.file_name.as_string_8)

						if a_file.exists then
							Result := a_file.name
						else
							create error_dialog.make_with_text ("File " + dialog.file_name + " does not exist")
							error_dialog.show_modal_to_window (a_parent_window)
						end
					else
						create error_dialog.make_with_text("File <empty> does not exist")
						error_dialog.show_modal_to_window (a_parent_window)
					end
				end
			end
		end

	get_directory (init_value: STRING; a_parent_window: attached EV_WINDOW): STRING
			-- get a directory from user
		local
			dialog: EV_DIRECTORY_DIALOG
			a_dir: DIRECTORY
			error_dialog: EV_INFORMATION_DIALOG
		do
			create dialog

			if (create {DIRECTORY}.make (init_value)).exists then
				dialog.set_start_directory (init_value)
			end

			from until Result /= Void loop
				dialog.show_modal_to_window (a_parent_window)

				if dialog.selected_button = Void or else dialog.selected_button.is_equal ("Cancel") then
					Result := ""
				else
					if not dialog.directory.is_empty then
						create a_dir.make (dialog.directory.as_string_8)

						if a_dir.exists then
							Result := a_dir.name
						else
							create error_dialog.make_with_text ("Directory " + dialog.directory + " does not exist")
							error_dialog.show_modal_to_window (a_parent_window)
						end
					else
						create error_dialog.make_with_text ("Directory <empty dir> does not exist")
						error_dialog.show_modal_to_window (a_parent_window)
					end
				end
			end
		end

	populate_ev_multi_list_from_hash (ev_mlist: attached EV_MULTI_COLUMN_LIST; ht: HASH_TABLE [ANY, STRING])
			-- populate rows of a multi-column list with name - value pairs in a HASH_TABLE
			-- Note that the value type is assumed to have a sensible outpur from its 'out' function
		local
			ev_list_row: EV_MULTI_COLUMN_LIST_ROW
			i: INTEGER
		do
			if ht /= Void then
				from
					ht.start
				until
					ht.off
				loop
					create ev_list_row
					ev_list_row.extend (utf8 (ht.key_for_iteration))
					ev_list_row.extend (utf8 (ht.item_for_iteration.out))
					ev_mlist.extend(ev_list_row)
					ht.forth
				end

				from i := 1
				until i > ev_mlist.column_count
				loop ev_mlist.resize_column_to_content(i)
					i := i + 1
				end
			end
		end

	populate_ev_list_from_hash_keys (ev_list: EV_LIST; ht: HASH_TABLE [ANY, STRING])
			-- populate list from hash table keys
		local
			ev_list_item: EV_LIST_ITEM
		do
			if ht /= Void then
				from ht.start until ht.off loop
					create ev_list_item.make_with_text (utf8 (ht.key_for_iteration))
					ev_list.extend(ev_list_item)
					ht.forth
				end
			end
		end

	populate_ev_combo_from_ds_hash_keys (ev_combo: EV_COMBO_BOX; ht: DS_HASH_TABLE [ANY, STRING])
			-- populate combo from hash table items
		local
			strs: ARRAYED_LIST [STRING_32]
		do
			create strs.make (0)
			if ht /= Void then
				from ht.start until ht.off loop
					strs.extend (utf8 (ht.key_for_iteration))
					ht.forth
				end
			end
			ev_combo.set_strings (strs)
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
