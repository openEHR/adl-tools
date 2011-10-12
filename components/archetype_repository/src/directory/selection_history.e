note
	component:   "openEHR Archetype Project"
	description: "[
				 Any tool that is enabled with a history facility, typically visualised as forward
				 and backward arrows as available in most browsers.
				 ]"
	keywords:    "ADL"
	author:      "Thomas Beale"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2011 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"


deferred class SELECTION_HISTORY [G]

feature {NONE} -- Initialisation

	make_selection_history
		do
			clear_selection_history
		end

feature -- Access

	selected_item: G
			-- currently selected item from some kind of repository of items
		do
			if not selection_history.off then
				Result := selection_history.item
			end
		ensure
			consistent_with_history: attached Result implies Result = selection_history.item
		end

	recently_selected_items (n: INTEGER): attached ARRAYED_LIST [G]
			-- The `n' most recently used items from `selection_history', excluding duplicates.
		require
			positive: n > 0
		local
			cursor: LINKED_LIST_CURSOR [G]
		do
			create Result.make (n)
			cursor := selection_history.cursor

			from selection_history.finish until selection_history.off or Result.full loop
				if not Result.has (selection_history.item) then
					Result.extend (selection_history.item)
				end
				selection_history.back
			end
			
			selection_history.go_to (cursor)
		ensure
			not_too_long: Result.count <= n
		end

feature -- Status Report

	has_selected_item: BOOLEAN
			-- Has an item been selected?
		do
			Result := attached selected_item
		end

	selection_history_has_previous: BOOLEAN
			-- Can `selection_history' go back?
		do
			Result := not selection_history.off and not selection_history.isfirst
		end

	selection_history_has_next: BOOLEAN
			-- Can `selection_history' go forth?
		do
			Result := not selection_history.off and not selection_history.islast
		end

	item_selectable (an_item_id: STRING): BOOLEAN
			-- True if item can be selected
		deferred
		end

feature -- Commands

	clear_selection_history
			-- reduce to initial state
		do
			create selection_history.make
		end

feature -- Modification

	set_selected_item (an_item: G)
			-- Append `an_item' to `selection_history' and select it.
		do
			if selected_item /= an_item then
				if selection_history.is_empty or else selection_history.last /= an_item then
					selection_history.extend (an_item)
				end
				selection_history.finish
			end
		ensure
			selected_item_set: selected_item = an_item
			history_is_last_if_value_different: old selected_item /= an_item implies selection_history.islast
			history_extended_if_value_different_and_wasnt_last: selection_history.count = old
				(selection_history.count + (selected_item /= an_item and (selection_history.is_empty or else selection_history.last /= an_item)).to_integer)
		end

	set_selected_item_from_id (an_item_id: STRING)
			-- Append `an_item' to `selection_history' and select it.
		require
			Id_valid: item_selectable (an_item_id)
		do
			set_selected_item (selectable_item_by_id (an_item_id))
		end

	selection_history_back
			-- Select the previous archetype or folder in `selection_history'.
		require
			history_can_go_back: selection_history_has_previous
		do
			selection_history.back
		ensure
			history_isnt_last: selection_history_has_next
		end

	selection_history_forth
			-- Select the next archetype or folder in `selection_history'.
		require
			history_can_go_forth: selection_history_has_next
		do
			selection_history.forth
		ensure
			history_isnt_first: selection_history_has_previous
		end

feature {NONE} -- Implementation

	selection_history: attached LINKED_LIST [G]
			-- The history of user selection of items from oldest to most recent

	selectable_item_by_id (an_item_id: STRING): G
			-- obtain a selectable item via an id
		require
			Id_valid: item_selectable (an_item_id)
		deferred
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
--| The Original Code is archetype_directory.e.
--|
--| The Initial Developer of the Original Code is Thomas Beale.
--| Portions created by the Initial Developer are Copyright (C) 2003-2008
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
