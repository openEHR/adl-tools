note
	component:   "openEHR ADL Tools"
	description: "Controller for CLASS_TOOL in docking structure."
	keywords:    "ADL, archetype, class map, docking"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2011 Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class GUI_CLASS_TOOL_CONTROLLER

inherit
	GUI_DOCKING_EDITOR_CONTROLLER
		redefine
			Editor_group_name, Editor_pixmap, active_tool
		end

	SHARED_APP_UI_RESOURCES
		export
			{NONE} all
		end

	SHARED_GUI_AGENTS
		export
			{NONE} all
		end

	SHARED_ARCHETYPE_LIBRARIES

create
	make

feature -- Definitions

	Editor_group_name: STRING = "class tool"

	Editor_pixmap: EV_PIXMAP
		once
			Result := get_icon_pixmap ("tool/class_tool")
		end

feature -- Initialisation

	make (a_docking_manager: SD_DOCKING_MANAGER)
		do
			make_docking (a_docking_manager)
		end

feature -- Access

	active_tool: GUI_CLASS_TOOL
		do
			Result := docking_tools.item (active_tool_id).tool
		end

feature -- Commands

	create_new_tool
		local
			new_tool: like active_tool
		do
			create new_tool.make
			add_new_tool (new_tool)
			active_tool_docking_pane.focus_in_actions.extend (agent do gui_agents.history_set_active_agent.call ([active_tool]) end)
		end

	populate_active_tool (a_class_def: BMM_CLASS)
			-- Populate content from visual controls.
		do
			if not has_tools then
				create_new_tool
			end
			active_tool.populate (a_class_def, False)
			populate_active_tool_pane (a_class_def.name, a_class_def.name.substring (1, a_class_def.name.count.min (Tab_title_width)), get_icon_pixmap ("rm/generic/" + a_class_def.type_category))
			active_tool.selection_history.set_selected_item (a_class_def)
		end

end


