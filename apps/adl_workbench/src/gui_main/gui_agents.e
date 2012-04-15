note
	component:   "openEHR Archetype Project"
	description: "Shared GUI agents for use across GUI tools"
	keywords:    "AWB, archetypes, workbench"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2011 Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class
	GUI_AGENTS

feature -- Access

	history_update_agent: detachable PROCEDURE [ANY, TUPLE]
			-- agent to update history toolbar (left & right arrow controls)

	history_set_active_agent: detachable PROCEDURE [ANY, TUPLE [GUI_TOOL]]
			-- agent to set a GUI_TOOL as active for history, then update history toolbar (left & right arrow controls)

	console_tool_append_agent: detachable PROCEDURE [ANY, TUPLE [STRING]]
			-- agent to update global console

	select_archetype_agent, select_archetype_in_new_tool_agent, edit_archetype_in_new_tool_agent: detachable PROCEDURE [ANY, TUPLE [ARCH_CAT_ARCHETYPE]]

	archetype_has_editor_agent: detachable FUNCTION [ANY, TUPLE [ARCH_CAT_ARCHETYPE], BOOLEAN]

	select_class_agent, select_class_in_new_tool_agent: detachable PROCEDURE [ANY, TUPLE [BMM_CLASS_DEFINITION]]

	select_rm_agent, select_rm_in_new_tool_agent: detachable PROCEDURE [ANY, TUPLE [BMM_SCHEMA]]

	select_class_in_rm_schema_tool_agent: detachable PROCEDURE [ANY, TUPLE [STRING]]

	update_all_tools_rm_icons_setting_agent: detachable PROCEDURE [ANY, TUPLE]

	select_archetype_from_gui_data_agent: detachable PROCEDURE [ANY, TUPLE [EV_ANY]]
			-- agent provided by upper level of GUI for doing something
			-- when an archetype in this tool is selected

	show_tool_with_artefact_agent: detachable FUNCTION [ANY, TUPLE [STRING], BOOLEAN]
			-- if there is a live tool with artefact with id = `an_id' then show it and return True

feature -- Modification

	set_history_update_agent (an_agent: like history_update_agent)
		do
			history_update_agent := an_agent
		end

	set_history_set_active_agent (an_agent: like history_set_active_agent)
		do
			history_set_active_agent := an_agent
		end

	set_console_tool_append_agent (an_agent: like console_tool_append_agent)
		do
			console_tool_append_agent := an_agent
		end

	set_select_archetype_agent (an_agent: like select_archetype_agent)
		do
			select_archetype_agent := an_agent
		end

	set_select_archetype_in_new_tool_agent (an_agent: like select_archetype_in_new_tool_agent)
		do
			select_archetype_in_new_tool_agent := an_agent
		end

	set_edit_archetype_in_new_tool_agent (an_agent: like edit_archetype_in_new_tool_agent)
		do
			edit_archetype_in_new_tool_agent := an_agent
		end

	set_archetype_has_editor_agent (an_agent: like archetype_has_editor_agent)
		do
			archetype_has_editor_agent := an_agent
		end

	set_select_class_agent (an_agent: like select_class_agent)
		do
			select_class_agent := an_agent
		end

	set_select_class_in_new_tool_agent (an_agent: like select_class_in_new_tool_agent)
		do
			select_class_in_new_tool_agent := an_agent
		end

	set_select_class_in_rm_schema_tool_agent (an_agent: like select_class_in_rm_schema_tool_agent)
		do
			select_class_in_rm_schema_tool_agent := an_agent
		end

	set_select_rm_agent (an_agent: like select_rm_agent)
		do
			select_rm_agent := an_agent
		end

	set_select_rm_in_new_tool_agent (an_agent: like select_rm_in_new_tool_agent)
		do
			select_rm_in_new_tool_agent := an_agent
		end

	set_update_all_tools_rm_icons_setting_agent (an_agent: like update_all_tools_rm_icons_setting_agent)
		do
			update_all_tools_rm_icons_setting_agent := an_agent
		end

	set_select_archetype_from_gui_data_agent (an_agent: like select_archetype_from_gui_data_agent)
		do
			select_archetype_from_gui_data_agent := an_agent
		end

	set_show_tool_with_artefact_agent (an_agent: like show_tool_with_artefact_agent)
		do
			show_tool_with_artefact_agent := an_agent
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
--| The Original Code is gui_agents.e.
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
