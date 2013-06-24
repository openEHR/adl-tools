note
	component:   "openEHR ADL Tools"
	description: "Controller for multiple archetype editors within a docking area."
	keywords:    "ADL, archetype"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2012- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class GUI_ARCHETYPE_EDITORS_CONTROLLER

inherit
	GUI_DOCKING_EDITOR_CONTROLLER
		redefine
			Editor_group_name, Editor_pixmap, active_tool
		end

	SHARED_APP_UI_RESOURCES
		export
			{NONE} all
		end

	SHARED_ARCHETYPE_CATALOGUES

create
	make

feature -- Definitions

	Editor_group_name: STRING
		once
			Result := "archetype editor"
		end

	Editor_pixmap: EV_PIXMAP
		once
			Result := get_icon_pixmap ("tool/archetype_editor")
		end

feature -- Initialisation

	make (a_docking_manager: SD_DOCKING_MANAGER)
		do
			make_docking (a_docking_manager)
		end

feature -- Access

	active_tool: GUI_ARCHETYPE_EDITOR
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

	populate_active_tool (aca: ARCH_CAT_ARCHETYPE_EDITABLE)
			-- Populate content from visual controls.
		do
			if not has_tools then
				create_new_tool
			end
			active_tool.populate (aca, False, aca.display_language)
			populate_active_tool_pane (aca.id.as_string, aca.id.as_abbreviated_string, Editor_pixmap)
		end

end


