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

feature {NONE} -- Access

	history_update_agent: detachable PROCEDURE [ANY, TUPLE]
			-- agent to update history toolbar (left & right arrow controls)

	history_set_active_agent: detachable PROCEDURE [ANY, TUPLE [GUI_TOOL]]
			-- agent to set a GUI_TOOL as active for history, then update history toolbar (left & right arrow controls)

	console_tool_append_agent: detachable PROCEDURE [ANY, TUPLE [STRING]]
			-- agent to update global console

	select_archetype_agent: detachable PROCEDURE [ANY, TUPLE [ARCH_LIB_ARCHETYPE]]

	select_archetype_in_new_tool_agent: detachable PROCEDURE [ANY, TUPLE [ARCH_LIB_ARCHETYPE]]

	edit_archetype_in_new_tool_agent: detachable PROCEDURE [ANY, TUPLE [ARCH_LIB_ARCHETYPE]]

	archetype_has_editor_agent: detachable FUNCTION [ANY, TUPLE [ARCH_LIB_ARCHETYPE], BOOLEAN]

	select_class_agent, select_class_in_new_tool_agent: detachable PROCEDURE [ANY, TUPLE [BMM_CLASS]]

	select_rm_agent, select_rm_in_new_tool_agent: detachable PROCEDURE [ANY, TUPLE [BMM_SCHEMA]]

	select_class_in_rm_schema_tool_agent: detachable PROCEDURE [ANY, TUPLE [STRING]]

	update_all_tools_use_rm_pixmaps_setting_agent: detachable PROCEDURE [ANY, TUPLE]

	refresh_archetype_viewers_agent: detachable PROCEDURE [ANY, TUPLE [archetype_id: READABLE_STRING_8]]

	refresh_archetype_editors_agent: detachable PROCEDURE [ANY, TUPLE [archetype_id: READABLE_STRING_8]]

	refresh_all_archetype_editors_agent: detachable PROCEDURE [ANY, TUPLE]

	select_archetype_from_gui_data_agent: detachable PROCEDURE [ANY, TUPLE [EV_ANY]]
			-- agent provided by upper level of GUI for doing something
			-- when an archetype in this tool is selected

	show_tool_with_artefact_agent: detachable FUNCTION [ANY, TUPLE [STRING], BOOLEAN]
			-- if there is a live tool with artefact with id = `an_id' then show it and return True

	close_test_tool_agent: detachable PROCEDURE [ANY, TUPLE]
			-- agent to close test tool

	on_toggle_use_rm_pixmaps_agent: detachable PROCEDURE [ANY, TUPLE[BOOLEAN, BOOLEAN]]
			-- agent to call when 'use_rm_pixmaps' setting is changed

	on_toggle_view_all_classes_agent: detachable PROCEDURE [ANY, TUPLE[BOOLEAN, BOOLEAN]]
			-- agent to call when 'show all classes' UI option is toggled

	save_resources_agent: detachable PROCEDURE [ANY, TUPLE]
			-- save resources file

feature -- Command

	call_history_update_agent
		do
			if attached history_update_agent as att_agt then
				att_agt.call ([])
			end
		end

	call_history_set_active_agent (a_gui_tool: GUI_TOOL)
			-- agent to set a GUI_TOOL as active for history, then update history toolbar (left & right arrow controls)
		do
			if attached history_set_active_agent as att_agt then
				att_agt.call ([a_gui_tool])
			end
		end

	call_console_tool_append_agent (a_str: STRING)
		do
			if attached console_tool_append_agent as att_agt then
				att_agt.call ([a_str])
			end
		end

	call_select_archetype_agent (ala: ARCH_LIB_ARCHETYPE)
		do
			if attached select_archetype_agent as att_agt then
				att_agt.call ([ala])
			end
		end

	call_select_archetype_in_new_tool_agent (ala: ARCH_LIB_ARCHETYPE)
		do
			if attached select_archetype_in_new_tool_agent as att_agt then
				att_agt.call ([ala])
			end
		end

	call_edit_archetype_in_new_tool_agent (ala: ARCH_LIB_ARCHETYPE)
		do
			if attached edit_archetype_in_new_tool_agent as att_agt then
				att_agt.call ([ala])
			end
		end

	call_archetype_has_editor_agent (ala: ARCH_LIB_ARCHETYPE): BOOLEAN
		do
			if attached archetype_has_editor_agent as att_agt then
				Result := att_agt.item ([ala])
			end
		end

	call_select_class_agent (a_class_def: BMM_CLASS)
		do
			if attached select_class_agent as att_agt then
				att_agt.call ([a_class_def])
			end
		end

	call_select_class_in_new_tool_agent (a_class_def: BMM_CLASS)
		do
			if attached select_class_in_new_tool_agent as att_agt then
				att_agt.call ([a_class_def])
			end
		end

	call_select_rm_agent (a_schema: BMM_SCHEMA)
		do
			if attached select_rm_agent as att_agt then
				att_agt.call ([a_schema])
			end
		end

	call_select_rm_in_new_tool_agent (a_schema: BMM_SCHEMA)
		do
			if attached select_rm_in_new_tool_agent as att_agt then
				att_agt.call ([a_schema])
			end
		end

	call_select_class_in_rm_schema_tool_agent (a_str: STRING)
			-- agent to update global console
		do
			if attached select_class_in_rm_schema_tool_agent as att_agt then
				att_agt.call ([a_str])
			end
		end

	call_refresh_archetype_viewers_agent (archetype_id: READABLE_STRING_8)
		do
			if attached refresh_archetype_viewers_agent as att_agt then
				att_agt.call ([archetype_id])
			end
		end

	call_refresh_archetype_editors_agent (archetype_id: READABLE_STRING_8)
		do
			if attached refresh_archetype_editors_agent as att_agt then
				att_agt.call ([archetype_id])
			end
		end

	call_refresh_all_archetype_editors_agent
		do
			if attached refresh_all_archetype_editors_agent as att_agt then
				att_agt.call ([])
			end
		end

	call_select_archetype_from_gui_data_agent (ui_control: EV_ANY)
		do
			if attached select_archetype_from_gui_data_agent as att_agt then
				att_agt.call ([ui_control])
			end
		end

	call_show_tool_with_artefact_agent (an_id: STRING): BOOLEAN
			-- if there is a live tool with artefact with id = `an_id' then show it and return True
		do
			if attached show_tool_with_artefact_agent as att_agt then
				Result := att_agt.item ([an_id])
			end
		end

	call_close_test_tool_agent
			-- agent to close test tool
		do
			if attached close_test_tool_agent as att_agt then
				att_agt.call ([])
			end
		end

	call_on_toggle_use_rm_pixmaps_agent (a_flag, save_options_file_flag: BOOLEAN)
		do
			if attached on_toggle_use_rm_pixmaps_agent as att_agt then
				att_agt.call ([a_flag, save_options_file_flag])
			end
		end

	call_update_all_tools_use_rm_pixmaps_setting_agent
		do
			if attached update_all_tools_use_rm_pixmaps_setting_agent as att_agt then
				att_agt.call ([])
			end
		end

	call_on_toggle_view_all_classes_agent (a_flag, save_options_file_flag: BOOLEAN)
		do
			if attached on_toggle_view_all_classes_agent as att_agt then
				att_agt.call ([a_flag, save_options_file_flag])
			end
		end

	call_save_resources_agent
		do
			if attached save_resources_agent as att_agt then
				att_agt.call ([])
			end
		end

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

	set_refresh_archetype_viewers_agent (an_agent: like refresh_archetype_viewers_agent)
		do
			refresh_archetype_viewers_agent := an_agent
		end

	set_refresh_archetype_editors_agent (an_agent: like refresh_archetype_editors_agent)
		do
			refresh_archetype_editors_agent := an_agent
		end

	set_refresh_all_archetype_editors_agent (an_agent: like refresh_all_archetype_editors_agent)
		do
			refresh_all_archetype_editors_agent := an_agent
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

	set_on_toggle_use_rm_pixmaps_agent (an_agent: like on_toggle_use_rm_pixmaps_agent)
		do
			on_toggle_use_rm_pixmaps_agent := an_agent
		end

	set_update_all_tools_use_rm_pixmaps_setting_agent (an_agent: like update_all_tools_use_rm_pixmaps_setting_agent)
		do
			update_all_tools_use_rm_pixmaps_setting_agent := an_agent
		end

	set_on_toggle_view_all_classes_agent (an_agent: like on_toggle_view_all_classes_agent)
		do
			on_toggle_view_all_classes_agent := an_agent
		end

	set_save_resources_agent (an_agent: like save_resources_agent)
		do
			save_resources_agent := an_agent
		end

end


