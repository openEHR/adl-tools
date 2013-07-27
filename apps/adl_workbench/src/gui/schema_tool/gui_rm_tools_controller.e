note
	component:   "openEHR ADL Tools"
	description: "Controller for multiple RM tools within a docking area."
	keywords:    "archetype, reference model"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2011- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class GUI_RM_TOOLS_CONTROLLER

inherit
	GUI_DOCKING_EDITOR_CONTROLLER
		redefine
			Editor_group_name, Editor_pixmap, active_tool
		end

	SHARED_APP_UI_RESOURCES
		export
			{NONE} all
		end

	SHARED_REFERENCE_MODEL_ACCESS
		export
			{NONE} all
		end

create
	make

feature -- Definitions

	Editor_group_name: STRING = "RM tool"

	Editor_pixmap: EV_PIXMAP
		once
			Result := get_icon_pixmap ("tool/rm_schema")
		end

feature -- Initialisation

	make (a_docking_manager: attached SD_DOCKING_MANAGER)
		do
			make_docking (a_docking_manager)
		end

feature -- Access

	active_tool: GUI_RM_TOOL
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
		end

	populate_active_tool (an_rm: BMM_SCHEMA)
			-- Populate content from visual controls.
		do
			if not has_tools then
				create_new_tool
			end
			active_tool.populate (an_rm)
			populate_active_tool_pane (an_rm.schema_id, an_rm.schema_id.substring (1, an_rm.schema_id.count.min (Tab_title_width)), get_icon_pixmap ("tool/rm_schema"))
		end

end


