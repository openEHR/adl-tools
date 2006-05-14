indexing
	component:   "openEHR Reusable Libraries"
	description: "Simple menu class"
	keywords:    "menu"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2003 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"
	
class MENU

creation
	make

feature -- Initialisation

	make(a_title:STRING) is
		require
			title_exists: a_title /= Void
		do
			title := a_title
			title.to_upper
			create items.make
			all_item := default_all_item.twin
			quit_item := default_quit_item.twin
		ensure
			All_item_initialised: all_item.is_equal(default_all_item)
			Quit_item_initialised: quit_item.is_equal(default_quit_item)
		end
		
feature -- Access

	item_at_index(i:INTEGER): STRING is
			-- get i'th menu item
		require
			valid_index: i > 0 and i <= count
		do
			Result := items.i_th(i)
		end
		
	count: INTEGER is
			-- number of items in menu excluding all and quit options
		do
			Result := items.count
		end

feature -- Modification

	add_item(s:STRING) is
			-- an empty string creates a blank line in the menu display
		require
			Item_Exists: s /= Void
		do
			items.extend(s)
		end

	set_i_th_item(i:INTEGER; s:STRING) is
			-- set an existing item to 's'
		require
			Index_valid: i >= 1 and i <= count
			Item_Exists: s /= Void
		do
			items.put_i_th (s, i)
		end

	set_all_item(s:STRING) is
			-- string to display for All option
		require
			Item_Exists: s /= Void
		do
			all_item := s
		end

	set_quit_item(s:STRING) is
			-- string to display for Quit option
		require
			Item_Exists: s /= Void
		do
			quit_item := s
		end

	clear is
			-- wipe out menu items and reset selection state
		do
			items.wipe_out
			selection := 0
			quit_selected := False
			all_selected := False
		end

feature -- Output

	display is
		local
			i:INTEGER
		do
			io.put_string("%N=====  ") io.put_string(title) io.put_string("  ===============%N%N")
			from 
				items.start 
				i := 1
			until 
				items.off 
			loop
				io.put_string("< ") io.put_integer(i) io.put_string(" >  ")
				io.put_string(items.item) io.new_line
				items.forth
				i := i + 1
			end

			io.new_line
			io.put_string("< A >  ") io.put_string(all_item) io.new_line
			io.put_string("< Q >  ") io.put_string(quit_item) io.new_line
			io.new_line
		end

feature -- commands

	choose is
			-- get an answer from the user; must be between 1 and number of items added;
			-- result in 'selection'
		local
			ans_in_range:BOOLEAN
			str:STRING
		do
			from
				selection := 0
				quit_selected := False
				all_selected := False
			until 
				quit_selected or all_selected or ans_in_range 
			loop
				io.put_string("       Choice (1-") io.put_integer(items.count) io.put_string(", a, q): ")
				io.read_line
				str := io.last_string
				str.to_lower
				if str.is_integer then
					if str.to_integer > 0 and str.to_integer <= items.count then
						ans_in_range := True
						selection := str.to_integer
					else
						io.put_string("Response out of range%N")
					end
				elseif str.is_equal("a") then
					all_selected := True
				elseif str.is_equal("q") then
					quit_selected := True
				else
					io.put_string("Invalid response%N")
				end
			end
			io.new_line
		end

feature -- Status

	selection:INTEGER
		-- last menu selection; 0 if all or quit is True

	all_selected:BOOLEAN
		-- True if last 'select' resulted in "All"

	quit_selected:BOOLEAN
		-- True if last 'select' resulted in "Quit"

feature {NONE} -- Implementation

	title:STRING
	items:LINKED_LIST[STRING]
	quit_item:STRING
	all_item:STRING

	default_quit_item:STRING is "Quit"
	default_all_item:STRING is "All"

invariant
	Title_exists: title /= Void
	Items_exists: items /= Void
	All_item_exists: all_item /= Void
	Quit_item_exists: quit_item /= Void
	All_consistency: all_selected implies selection = 0
	Quit_consistency: quit_selected implies selection = 0

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
--| The Original Code is menu.e.
--|
--| The Initial Developer of the Original Code is Thomas Beale.
--| Portions created by the Initial Developer are Copyright (C) 2003-2004
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
