note
	component:   "openEHR Archetype Project"
	description: "Search control, opccupying the 'address bar' position in the UI. Operates on whichever main tool is active."
	keywords:    "ADL workbench"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2011 Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class
	GUI_ADDRESS_BAR

inherit
	SHARED_APP_UI_RESOURCES
		export
			{NONE} all
		end

	GUI_UTILITIES
		export
			{NONE} all
		end

create
	make

feature {NONE} -- Initialization

	make (a_windows_hide_combo_dropdown_agent, a_windows_show_combo_dropdown_agent: like windows_hide_combo_dropdown_agent)
		do
			create client_controls.make (0)

			windows_hide_combo_dropdown_agent := a_windows_hide_combo_dropdown_agent
			windows_show_combo_dropdown_agent := a_windows_show_combo_dropdown_agent

			-- create controls
			create ev_root_container
			create ev_search_combo
			create ev_tool_bar
			create ev_search_button

			-- connect controls
			ev_root_container.extend (ev_search_combo)
			ev_root_container.extend (ev_tool_bar)
			ev_tool_bar.extend (ev_search_button)

			-- set visual characteristics
			ev_root_container.disable_item_expand (ev_tool_bar)
			ev_search_combo.set_tooltip ("Display or search for archetype id")
			ev_search_combo.set_minimum_width (600)
			ev_tool_bar.set_minimum_width (20)
			ev_tool_bar.set_minimum_height (20)
			ev_tool_bar.disable_vertical_button_style
			ev_search_button.set_tooltip ("Search for archetype id")
			ev_search_button.set_pixmap (get_icon_pixmap ("tool/magnifier"))

			-- set up events
			ev_search_combo.select_actions.extend (agent select_item_from_search_key)
			ev_search_combo.return_actions.extend (agent find_item_by_key)
			ev_search_button.select_actions.extend (agent start_search_by_id)
		end

feature -- Access

	ev_root_container: EV_HORIZONTAL_BOX

	current_client: INTEGER
			-- object_id of currently active searchable GUI TOOL root widget

feature -- Status Report

	has_client_control (a_searchable_tool: attached GUI_SEARCHABLE_TOOL): BOOLEAN
		do
			Result := client_controls.has (a_searchable_tool.tool_unique_id)
		end

feature -- Modification

	add_client_control (a_searchable_tool: attached GUI_SEARCHABLE_TOOL)
			-- add `a_searchable_tool' to list of tools that this tools can search
		do
			client_controls.force (a_searchable_tool, a_searchable_tool.tool_unique_id)
			current_client := a_searchable_tool.tool_unique_id
		end

	set_current_client (a_searchable_tool: attached GUI_SEARCHABLE_TOOL)
		require
			has_client_control (a_searchable_tool)
		do
			current_client := a_searchable_tool.tool_unique_id
		end

feature -- Commands

	find_item_by_key
			-- Called by `return_actions' of `ev_search_combo'.
		local
			key: STRING
			matching_ids: attached ARRAYED_SET[STRING]
		do
			if is_windows and ev_search_combo.is_list_shown then
				client_controls.item (current_client).select_item_by_id (ev_search_combo.selected_text)
				windows_hide_combo_dropdown_agent.call ([ev_search_combo])

			else
				key := ev_search_combo.text
				if key.count > 0 then
					ev_search_combo.select_actions.block

					-- check if it is valid as is, e.g. created by slightly modifying currently displayed id
					if client_controls.item (current_client).valid_item_id (key) then
						client_controls.item (current_client).select_item_by_id (key)

					elseif key.count >= 3 then
						 -- it is a partial id, get a list of candidates
						matching_ids := client_controls.item (current_client).matching_ids (regex_from_string(key))
						if matching_ids.count > 0 then
							ev_search_combo.set_strings (matching_ids)
							windows_show_combo_dropdown_agent.call ([ev_search_combo])

							if ev_search_combo.count = 1 then
								client_controls.item (current_client).select_item_by_id (ev_search_combo.text)
							end
						else
							ev_search_combo.set_text (get_msg ("no_match_found", Void))
							ev_search_combo.set_focus
							ev_search_combo.select_all
						end

					else -- key too short
						ev_search_combo.set_text (get_msg ("key_too_short", Void))
						ev_search_combo.set_focus
						ev_search_combo.select_all
					end

					ev_search_combo.select_actions.resume
				end
			end
		end

	select_item_from_search_key
			-- Called by `select_actions' of `ev_address_combo'.
			-- archetype_search_combo.text is guaranteed to be a valid archetype id, and one that is in the current repository
		do
			if not (is_windows and ev_search_combo.is_list_shown) then
				client_controls.item (current_client).select_item_by_id (ev_search_combo.text.as_string_8)
			end
		end

	start_search_by_id
			-- Called by `select_actions' of `search_button'.
		do
			ev_search_combo.wipe_out
			ev_search_combo.set_text (get_msg ("enter_search_string", Void))
			ev_search_combo.set_focus
			ev_search_combo.select_all
		end

	clear
			-- Wipe out content from visual controls.
		do
			ev_search_combo.remove_text
		end

feature {NONE} -- Implementation

	ev_search_combo: EV_COMBO_BOX
	ev_tool_bar: EV_TOOL_BAR
	ev_search_button: EV_TOOL_BAR_BUTTON

	client_controls: HASH_TABLE [GUI_SEARCHABLE_TOOL, INTEGER]

	windows_hide_combo_dropdown_agent, windows_show_combo_dropdown_agent: PROCEDURE [ANY, TUPLE [EV_COMBO_BOX]]

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
--| The Original Code is main_window.e.
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
