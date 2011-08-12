note
	component:   "openEHR Archetype Project"
	description: "Controller for multiple editor tools within a docking area."
	keywords:    "GUI, docking"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2011 Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class GUI_DOCKING_EDITOR_CONTROLLER

feature -- Definitions

	Editor_group_name: STRING
		once
			Result := "editor"
		end

	Editor_pixmap: EV_PIXMAP
		once
			create Result.default_create
		end

feature -- Initialisation

	make_docking (a_docking_manager: attached SD_DOCKING_MANAGER)
		do
			create docking_editors.make (0)
			docking_manager := a_docking_manager
		end

feature -- Access

	current_tool: like tool_type
			-- get currently active tool
		require
			has_current_tool
		do
			Result := docking_editors.item (current_docking_editor_id).tool
		end

feature -- Status Report

	has_current_tool: BOOLEAN
		do
			Result := docking_editors.has (current_docking_editor_id)
		end

feature -- Commands

	clear
		do
			from docking_editors.start until docking_editors.off loop
				docking_editors.item_for_iteration.docking_pane.set_long_title ("")
				docking_editors.item_for_iteration.docking_pane.set_short_title ("")
				docking_editors.item_for_iteration.docking_pane.set_pixmap (Editor_pixmap)
				docking_editors.item_for_iteration.tool.clear
				docking_editors.forth
			end
		end

feature {NONE} -- Implementation

	tool_type: GUI_TOOL

	docking_editors: HASH_TABLE [TUPLE [tool: like tool_type; docking_pane: SD_CONTENT], INTEGER]

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

	current_docking_editor_id: INTEGER
			-- id of editor tool currently in use

	current_docking_editor: SD_CONTENT
		do
			Result := docking_editors.item (current_docking_editor_id).docking_pane
		end

	has_docking_editor (a_tool_id: INTEGER): BOOLEAN
		do
			Result := docking_editors.has (a_tool_id)
		end

	create_new_docking_editor (a_gui_tool: like tool_type)
			-- set up docking container
		local
			docking_pane: SD_CONTENT
			last_ed: SD_CONTENT
			a_gui_tool_dummy: like tool_type
		do
			-- FIXME: the following line, plus local decl above is to get around cat-call error thrown at
			-- runtime by the ***** line below, due to manifest tuple static type not being correctly inferred by compiler
			a_gui_tool_dummy := a_gui_tool

			-- find out what the current last editor in the docking panel is, before making a new one
			last_ed := docking_manager_last_editor
			current_docking_editor_id := docking_editors.count + 1
			create docking_pane.make_with_widget_title_pixmap (a_gui_tool.ev_root_container, Editor_pixmap, Editor_group_name + " #" + current_docking_editor_id.out)
			docking_manager.contents.extend (docking_pane)
			docking_pane.set_type ({SD_ENUMERATION}.editor)
			if attached last_ed then
				docking_pane.set_tab_with (last_ed, False)
			else
				docking_pane.set_default_editor_position
			end
			docking_pane.close_request_actions.extend (agent remove_docking_editor (current_docking_editor_id))
			docking_pane.focus_in_actions.extend (agent select_docking_editor (current_docking_editor_id))
			docking_editors.put ([a_gui_tool_dummy, docking_pane], current_docking_editor_id) -- ***********
		ensure
			has_current_tool
		end

	remove_docking_editor (tool_id: INTEGER)
		require
			valid_tool_id: has_docking_editor (tool_id)
		local
			docking_pane: SD_CONTENT
			keys: ARRAYED_LIST [INTEGER]
		do
			-- work out a sensible value for new current_archetype_tool_id
			create keys.make_from_array (docking_editors.current_keys)
			from keys.start until keys.off or keys.item = tool_id loop
				keys.forth
			end
			if keys.isfirst then
				if keys.count = 1 then
					current_docking_editor_id := 0
				else
					current_docking_editor_id := keys.i_th (2)
				end
			else
				keys.back
				current_docking_editor_id := keys.item
			end

			-- destroy the docking pane and archetype tool controls
			docking_pane := docking_editors.item (tool_id).docking_pane
			docking_pane.close
			docking_pane.destroy
			docking_editors.remove (tool_id)
		ensure
			not has_docking_editor (tool_id)
		end

	select_docking_editor (a_tool_id: INTEGER)
		require
			valid_tool_id: has_docking_editor (a_tool_id)
		do
			current_docking_editor_id := a_tool_id
		end

	populate_current_editor_docking_pane (a_long_title, a_short_title: STRING; a_pixmap: EV_PIXMAP)
			-- Populate content from visual controls.
		do
			current_docking_editor.set_long_title (a_long_title)
			current_docking_editor.set_short_title (a_short_title)
			current_docking_editor.set_pixmap (a_pixmap)
			if not current_docking_editor.is_visible then
				current_docking_editor.show
			end
			current_docking_editor.set_focus
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
--| The Original Code is gui_docking_editor_controller.e
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
