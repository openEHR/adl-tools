note
	component:   "openEHR ADL Tools"
	description: "[
				 Any tool that is enabled with a history facility, typically visualised as forward
				 and backward arrows as available in most browsers.
				 ]"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2011- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class SELECTION_HISTORY

create
	make

feature {NONE} -- Initialisation

	make
		do
			clear
		end

feature -- Access

	selected_item: detachable IDENTIFIED_TOOL_ARTEFACT
			-- currently selected item from some kind of repository of items
		do
			if not history.off then
				Result := history.item
			end
		ensure
			consistent_with_history: attached Result implies Result = history.item
		end

	recently_selected_items (n: INTEGER): ARRAYED_LIST [IDENTIFIED_TOOL_ARTEFACT]
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


