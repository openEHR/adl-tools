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


class SELECTION_HISTORY

create
	make

feature {NONE} -- Initialisation

	make
		do
			clear
		end

feature -- Access

	selected_item: IDENTIFIED_TOOL_ARTEFACT
			-- currently selected item from some kind of repository of items
		do
			if not history.off then
				Result := history.item
			end
		ensure
			consistent_with_history: attached Result implies Result = history.item
		end

	recently_selected_items (n: INTEGER): attached ARRAYED_LIST [IDENTIFIED_TOOL_ARTEFACT]
			-- The `n' most recently used items from `history', excluding duplicates.
		require
			positive: n > 0
		local
			cursor: LINKED_LIST_CURSOR [IDENTIFIED_TOOL_ARTEFACT]
		do
			create Result.make (n)
			cursor := history.cursor

			from history.finish until history.off or Result.full loop
				if not Result.has (history.item) then
					Result.extend (history.item)
				end
				history.back
			end

			history.go_to (cursor)
		ensure
			not_too_long: Result.count <= n
		end

feature -- Status Report

	has_selected_item: BOOLEAN
			-- Has an item been selected?
		do
			Result := attached selected_item
		end

	has_previous: BOOLEAN
			-- Can `history' go back?
		do
			Result := not history.off and not history.isfirst
		end

	has_next: BOOLEAN
			-- Can `history' go forth?
		do
			Result := not history.off and not history.islast
		end

feature -- Commands

	clear
			-- reduce to initial state
		do
			create history.make
		end

feature -- Modification

	set_selected_item (an_item: IDENTIFIED_TOOL_ARTEFACT)
			-- Append `an_item' to `history' and select it.
		do
			if selected_item /= an_item then
				if history.is_empty or else history.last /= an_item then
					history.extend (an_item)
				end
				history.finish
			end
		ensure
			selected_item_set: selected_item = an_item
			history_is_last_if_value_different: old selected_item /= an_item implies history.islast
			history_extended_if_value_different_and_wasnt_last: history.count = old
				(history.count + (selected_item /= an_item and (history.is_empty or else history.last /= an_item)).to_integer)
		end

	go_to (an_item_id: STRING)
			-- if an item with id `an_item_id' exists in the history, go to it
		local
			csr: LINKED_LIST_CURSOR [IDENTIFIED_TOOL_ARTEFACT]
		do
			csr := history.cursor
			from history.start until history.off or history.item.global_artefact_identifier.same_string (an_item_id) loop
				history.forth
			end
			if history.off then
				history.go_to (csr)
			end
		end

	back
			-- Select the previous archetype or folder in `history'.
		require
			history_can_go_back: has_previous
		do
			history.back
		ensure
			history_isnt_last: has_next
		end

	forth
			-- Select the next archetype or folder in `history'.
		require
			history_can_go_forth: has_next
		do
			history.forth
		ensure
			history_isnt_first: has_previous
		end

feature {NONE} -- Implementation

	history: attached LINKED_LIST [IDENTIFIED_TOOL_ARTEFACT]
			-- The history of user selection of items from oldest to most recent

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
