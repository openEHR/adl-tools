indexing
	component:   "openEHR Re-usable Components"
	description: "Populate various Eiffel Vision2 standard controls from standard EiffelBase data structures"
	keywords:    "EiffelVision, GUI"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2007 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"


class GUI_CONTROLLER_TOOLS

inherit
	STRING_UTILITIES

feature {NONE} -- Implementation

	populate_ev_multi_list_from_hash(ev_mlist: EV_MULTI_COLUMN_LIST; ht: HASH_TABLE [ANY, STRING]) is
			-- populate rows of a multi-column list with name - value pairs in a HASH_TABLE
			-- Note that the value type is assumed to have a sensible outpur from its 'out' function
		require
			ev_mlist_valid: ev_mlist /= Void
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

	populate_ev_list_from_list(ev_list: EV_LIST; a_list: ARRAYED_LIST [STRING]) is
			-- populate rows of a list with items from a ARRAYED_LIST [STRING]
		require
			ev_list_valid: ev_list /= Void
		local
			ev_list_item: EV_LIST_ITEM
		do
			if a_list /= Void then
				from
					a_list.start
				until
					a_list.off
				loop
					create ev_list_item.make_with_text (utf8 (a_list.item))
					ev_list.extend(ev_list_item)
					a_list.forth
				end
			end
		end

	populate_ev_list_from_hash_keys(ev_list: EV_LIST; ht: HASH_TABLE [ANY, STRING]) is
			-- populate list from hash table keys
		local
			ev_list_item: EV_LIST_ITEM
		do
			if ht /= Void then
				from
					ht.start
				until
					ht.off
				loop
					create ev_list_item.make_with_text (utf8 (ht.key_for_iteration))
					ev_list.extend(ev_list_item)
					ht.forth
				end
			end
		end

	populate_ev_combo_from_hash_keys(ev_combo: EV_COMBO_BOX; ht: DS_HASH_TABLE [INTEGER, STRING]) is
			-- populate combo from hash table items
		local
			strs: ARRAYED_LIST[STRING]
		do
			create strs.make (0)
			if ht /= Void then
				from
					ht.start
				until
					ht.off
				loop
					strs.extend (utf8 (ht.key_for_iteration))
					ht.forth
				end
			end
			ev_combo.set_strings (strs)
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
