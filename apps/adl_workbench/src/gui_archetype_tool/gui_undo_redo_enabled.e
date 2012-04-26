note
	component:   "openEHR Archetype Project"
	description: "Undo/redo enabling mixin for GUI_* classes."
	keywords:    "GUI, ADL"
	author:      "Thomas Beale <t homas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2012 Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

deferred class GUI_UNDO_REDO_ENABLED

inherit
	SHARED_APP_UI_RESOURCES
		export
			{NONE} all
		end

feature {NONE}-- Initialization

	add_undo_redo_toolbar
			-- add undo/redo buttons to toolbar
		do
			tool_bar.add_tool_bar
			tool_bar.add_tool_bar_button (get_icon_pixmap ("tool/undo_active"), get_icon_pixmap ("tool/undo_inactive"),
				create_message_content ("undo_button_tooltip", Void), agent on_undo)
			ev_undo_button := tool_bar.last_tool_bar_button
			tool_bar.add_tool_bar_button (get_icon_pixmap ("tool/redo_active"), get_icon_pixmap ("tool/redo_inactive"),
				create_message_content ("redo_button_tooltip", Void), agent on_redo)
			ev_redo_button := tool_bar.last_tool_bar_button
		end

feature -- Access

	tool_bar: GUI_TOOL_BAR
		deferred
		end

feature -- Commands

	on_undo
		do
			undo_redo_chain.undo
		end

	on_redo
		do
			undo_redo_chain.redo
		end

feature {NONE} -- Implementation

	ev_undo_button, ev_redo_button: EV_TOOL_BAR_BUTTON

	undo_redo_chain: UNDO_REDO_CHAIN

	update_undo_redo_controls (a_chain: UNDO_REDO_CHAIN)
			-- set undo/redo buttons appropriately
		do
			undo_redo_chain := a_chain
			populate_undo_redo_controls
		end

	populate_undo_redo_controls
			-- set undo/redo buttons appropriately
		do
			if attached undo_redo_chain and not undo_redo_chain.is_empty then
				if undo_redo_chain.has_undos then
					tool_bar.activate_tool_bar_button (ev_undo_button)
				else
					tool_bar.deactivate_tool_bar_button (ev_undo_button)
				end
				if undo_redo_chain.has_redos then
					tool_bar.activate_tool_bar_button (ev_redo_button)
				else
					tool_bar.deactivate_tool_bar_button (ev_redo_button)
				end
			else
				tool_bar.deactivate_tool_bar_button (ev_undo_button)
				tool_bar.deactivate_tool_bar_button (ev_redo_button)
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
--| The Original Code is gui_archetype_tool.e.
--|
--| The Initial Developer of the Original Code is Thomas Beale.
--| Portions created by the Initial Developer are Copyright (C) 20011
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
