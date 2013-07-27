note
	component:   "openEHR ADL Tools"
	description: "General model of a GUI tool whose data source is an archetype/template catalogue"
	keywords:    "GUI, archteype"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2011 Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

deferred class GUI_CATALOGUE_TARGETTED_TOOL

inherit
	GUI_TOOL
		redefine
			source, selection_history, selected_item
		end

	SHARED_GUI_CATALOGUE_TOOL_AGENTS
		export
			{NONE} all
		end

feature -- Access

	source: detachable ARCHETYPE_CATALOGUE
			-- archetype catalogue to which this tool is targetted

	tool_artefact_id: STRING
			-- a system-wide unique artefact id that can be used to find a tool in a GUI collection like
			-- docked panes or similar
		do
			Result := "catalogue"
		end

	selection_history: detachable ARCHETYPE_CATALOGUE_SELECTION_HISTORY

	selected_item: detachable ARCH_CAT_ITEM
		do
			Result := selection_history.selected_item
		end

end


