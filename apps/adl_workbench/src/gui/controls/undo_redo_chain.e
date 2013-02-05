note
	component:   "openEHR Archetype Project"
	description: "[
				 List of undo/redo objects that can be traversed in either direction. When a new undo/redo
				 element is added, everything to the right is thrown away.
				 The current position is the current undo object; calling `undo' causes execution of that
				 action followed by a move one place back. This can result in moving to the 'before' position
				 of the chain.
				 Calling `redo', if there are elements in front of the cursor, causes a move forward and then
				 execution of the redo action.
				 ]"
	keywords:    "UI, ADL"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2012- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "See notice at bottom of class"

class UNDO_REDO_CHAIN

create
	make

feature -- Initialisation

	make (a_gui_update_agent: like gui_update_agent)
		do
			create chain.make
			gui_update_agent := a_gui_update_agent
			create last_action_time.make_from_epoch (0)
		end

feature -- Access

	chain: TWO_WAY_LIST [UNDO_REDO_ACTION]

	gui_update_agent: PROCEDURE [ANY, TUPLE [UNDO_REDO_CHAIN]]

	last_action_time: DATE_TIME
			-- time stamp of last action, either due to the action executed before the
			-- call to `add_link' or an undo or redo

feature -- Status Report

	is_empty: BOOLEAN
		do
			Result := chain.is_empty
		end

	has_undos: BOOLEAN
			-- True if there are any undo actions available
		do
			Result := not is_empty and then not chain.before
		end

	has_redos: BOOLEAN
			-- True if there are any redo actions available
		do
			Result := not is_empty and then not chain.islast
		end

feature -- Element Change

	add_link (an_undo_action, an_undo_display_action, a_redo_action, a_redo_display_action: PROCEDURE [ANY, TUPLE])
		do
			do_add_link (create {UNDO_REDO_ACTION}.make (an_undo_action, an_undo_display_action, a_redo_action, a_redo_display_action))
		end

	add_link_simple (an_undo_action, a_redo_action: PROCEDURE [ANY, TUPLE])
		do
			do_add_link (create {UNDO_REDO_ACTION}.make_simple (an_undo_action, a_redo_action))
		end

feature -- Commands

	undo
			-- execute current undo action and go back one element
		do
			if not chain.before then
				chain.item.undo
				chain.back
				create last_action_time.make_now
				gui_update_agent.call ([Current])
			end
		end

	redo
			-- go forward one element and execute its redo action
		do
			if not chain.is_empty then
				if chain.before then
					chain.start
				elseif not chain.islast then
					chain.forth
				end
				if not chain.off then
					chain.item.redo
					create last_action_time.make_now
					gui_update_agent.call ([Current])
				end
			end
		end

feature {NONE} -- Implementation

	do_add_link (a_link: UNDO_REDO_ACTION)
		do
			if not chain.is_empty then
				if chain.before then
					create chain.make
				elseif not chain.islast then -- remove everything to the right of current position
					chain.forth
					chain.split (chain.count)
				end
			end
			chain.extend (a_link)
			chain.finish
			create last_action_time.make_now
			gui_update_agent.call ([Current])
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
