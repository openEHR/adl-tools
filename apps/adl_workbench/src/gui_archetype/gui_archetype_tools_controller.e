note
	component:   "openEHR Archetype Project"
	description: "Controller for multiple archetype tools within a docking area."
	keywords:    "ADL, archetype"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2003-2010 Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class GUI_ARCHETYPE_TOOLS_CONTROLLER

inherit
	SHARED_APP_UI_RESOURCES
		export
			{NONE} all
		end

	SHARED_KNOWLEDGE_REPOSITORY

create
	make

feature -- Initialisation

	make (a_docking_manager: attached SD_DOCKING_MANAGER;
			a_select_archetype_from_gui_data_agent: like select_archetype_from_gui_data)
		do
			create tools.make (0)
			docking_manager := a_docking_manager
			select_archetype_from_gui_data := a_select_archetype_from_gui_data_agent
		end

feature -- Access

	current_docking_pane: SD_CONTENT
		do
			Result := tools.item (current_tool_id).docking_pane
		end

	current_tool_id: INTEGER
			-- id of archetype tool currently in use

	current_tool: GUI_ARCHETYPE_TOOL
			-- get currently active tool
		require
			has_current_tool
		do
			Result := tools.item (current_tool_id).tool
		end

	tools_count: INTEGER
		do
			Result := tools.count
		end

	last_tool: TUPLE [tool: GUI_ARCHETYPE_TOOL; docking_pane: SD_CONTENT]
		require
			tools_count > 0
		local
			keys: ARRAYED_LIST [INTEGER]
		do
			create keys.make_from_array (tools.current_keys)
			Result := tools.item (keys.last)
		end

feature -- Status Report

	has_current_tool: BOOLEAN
		do
			Result := tools.has (current_tool_id)
		end

	has_tool (a_tool_id: INTEGER): BOOLEAN
		do
			Result := tools.has (a_tool_id)
		end

feature -- Commands

	create_new_tool
		local
			arch_tool: GUI_ARCHETYPE_TOOL
			docking_pane: SD_CONTENT
			last_ed: SD_CONTENT
		do
			last_ed := docking_manager_last_editor

			current_tool_id := tools.count + 1
			create arch_tool.make (current_tool_id, select_archetype_from_gui_data)

			-- set up docking container
			create docking_pane.make_with_widget_title_pixmap (arch_tool.ev_root_container, pixmaps ["archetype_2"], "archetype tool #" + current_tool_id.out)
			docking_manager.contents.extend (docking_pane)
			docking_pane.set_type ({SD_ENUMERATION}.editor)
			if attached last_ed then
				docking_pane.set_tab_with (last_ed, False)
			else
				docking_pane.set_default_editor_position
			end
			docking_pane.close_request_actions.extend (agent remove_tool (current_tool_id))
			docking_pane.focus_in_actions.extend (agent select_tool (current_tool_id))
			tools.put ([arch_tool, docking_pane], current_tool_id)
		ensure
			has_current_tool
		end

	remove_tool (tool_id: INTEGER)
		require
			valid_tool_id: has_tool (tool_id)
		local
			docking_pane: SD_CONTENT
			keys: ARRAYED_LIST [INTEGER]
		do
			-- work out a sensible value for new current_archetype_tool_id
			create keys.make_from_array (tools.current_keys)
			from keys.start until keys.off or keys.item = tool_id loop
				keys.forth
			end
			if keys.isfirst then
				if keys.count = 1 then
					current_tool_id := 0
				else
					current_tool_id := keys.i_th (2)
				end
			else
				keys.back
				current_tool_id := keys.item
			end

			-- destroy the docking pane and archetype tool controls
			docking_pane := tools.item (tool_id).docking_pane
			docking_pane.close
			docking_pane.destroy
			tools.remove (tool_id)
		end

	select_tool (a_tool_id: INTEGER)
		require
			valid_tool_id: has_tool (a_tool_id)
		do
			current_tool_id := a_tool_id
		end

	populate_current_tool
			-- Populate content from visual controls.
		require
			has_current_profile
			current_arch_cat.has_selected_archetype
		do
			if not has_current_tool then
				create_new_tool
			end
			current_docking_pane.set_long_title (current_arch_cat.selected_archetype.id.as_string)
			current_docking_pane.set_short_title (current_arch_cat.selected_archetype.id.as_abbreviated_string)
			current_docking_pane.set_pixmap (pixmaps [current_arch_cat.selected_archetype.group_name])
			current_tool.populate (current_arch_cat.selected_archetype)
			current_docking_pane.set_focus
		end

	clear
		do
			from tools.start until tools.off loop
				tools.item_for_iteration.docking_pane.set_long_title ("")
				tools.item_for_iteration.docking_pane.set_short_title ("")
				tools.item_for_iteration.docking_pane.set_pixmap (pixmaps ["archetype_2"])
				tools.item_for_iteration.tool.clear
				tools.forth
			end
		end

feature {NONE} -- Implementation

	tools: HASH_TABLE [TUPLE [tool: GUI_ARCHETYPE_TOOL; docking_pane: SD_CONTENT], INTEGER]

	docking_manager: attached SD_DOCKING_MANAGER

	docking_manager_last_editor: SD_CONTENT
			-- obtain last (i.e. rightmost) editor from docking manager
			-- FIXME: should be managed inside SD_DOCKING_MANAGER
		do
			from docking_manager.contents.start until docking_manager.contents.off loop
				if docking_manager.contents.item.type = {SD_ENUMERATION}.editor then
					Result := docking_manager.contents.item
				end
				docking_manager.contents.forth
			end
		end

	select_archetype_from_gui_data: PROCEDURE [ANY, TUPLE [EV_ANY]]
			-- agent provided by upper level of GUI for doing something
			-- when an archetype in this tool is selected

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
--| The Original Code is gui_arhetype_tools_controller.e
--|
--| The Initial Developer of the Original Code is Thomas Beale.
--| Portions created by the Initial Developer are Copyright (C) 2011
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
