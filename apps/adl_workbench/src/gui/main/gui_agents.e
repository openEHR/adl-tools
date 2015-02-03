note
	component:   "openEHR ADL Tools"
	description: "Shared GUI agents for use across GUI tools"
	keywords:    "AWB, archetypes, workbench"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2011 Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


class
	GUI_AGENTS

feature -- Access

	history_update_agent: detachable PROCEDURE [ANY, TUPLE]
			-- agent to update history toolbar (left & right arrow controls)

	history_set_active_agent: detachable PROCEDURE [ANY, TUPLE [GUI_TOOL]]
			-- agent to set a GUI_TOOL as active for history, then update history toolbar (left & right arrow controls)

	console_tool_append_agent: detachable PROCEDURE [ANY, TUPLE [STRING]]
			-- agent to update global console

	select_archetype_agent, select_archetype_in_new_tool_agent: detachable PROCEDURE [ANY, TUPLE [ARCH_LIB_ARCHETYPE]]

	edit_archetype_in_new_tool_agent: detachable PROCEDURE [ANY, TUPLE [ARCH_LIB_ARCHETYPE]]

	archetype_has_editor_agent: detachable FUNCTION [ANY, TUPLE [ARCH_LIB_ARCHETYPE], BOOLEAN]

	select_class_agent, select_class_in_new_tool_agent: detachable PROCEDURE [ANY, TUPLE [BMM_CLASS]]

	select_rm_agent, select_rm_in_new_tool_agent: detachable PROCEDURE [ANY, TUPLE [BMM_SCHEMA]]

	select_class_in_rm_schema_tool_agent: detachable PROCEDURE [ANY, TUPLE [STRING]]

	update_all_tools_rm_icons_setting_agent: detachable PROCEDURE [ANY, TUPLE]

	refresh_archetype_viewers_agent: detachable PROCEDURE [ANY, TUPLE [archetype_id: READABLE_STRING_8]]

	refresh_archetype_editors_agent: detachable PROCEDURE [ANY, TUPLE [archetype_id: READABLE_STRING_8]]

	select_archetype_from_gui_data_agent: detachable PROCEDURE [ANY, TUPLE [EV_ANY]]
			-- agent provided by upper level of GUI for doing something
			-- when an archetype in this tool is selected

	show_tool_with_artefact_agent: detachable FUNCTION [ANY, TUPLE [STRING], BOOLEAN]
			-- if there is a live tool with artefact with id = `an_id' then show it and return True

	close_test_tool_agent: detachable PROCEDURE [ANY, TUPLE]
			-- agent to close test tool

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

	set_refresh_archetype_viewers_agent (an_agent: like refresh_archetype_viewers_agent)
		do
			refresh_archetype_viewers_agent := an_agent
		end

	set_refresh_archetype_editors_agent (an_agent: like refresh_archetype_editors_agent)
		do
			refresh_archetype_editors_agent := an_agent
		end

	set_select_archetype_from_gui_data_agent (an_agent: like select_archetype_from_gui_data_agent)
		do
			select_archetype_from_gui_data_agent := an_agent
		end

	set_show_tool_with_artefact_agent (an_agent: like show_tool_with_artefact_agent)
		do
			show_tool_with_artefact_agent := an_agent
		end

	set_close_test_tool_agent (an_agent: like close_test_tool_agent)
		do
			close_test_tool_agent := an_agent
		end

end


