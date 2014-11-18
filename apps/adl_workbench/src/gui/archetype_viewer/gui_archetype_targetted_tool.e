note
	component:   "openEHR ADL Tools"
	description: "General model of a GUI tool whose data source is an archetype"
	keywords:    "statistics, archteype"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2011 Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

deferred class
	GUI_ARCHETYPE_TARGETTED_TOOL

inherit
	GUI_TOOL
		rename
			populate as gui_tool_populate
		redefine
			is_populated, source
		end

feature -- Access

	source: detachable ARCH_LIB_ARCHETYPE_EDITABLE
			-- archetype descriptor to which this tool is targetted

	source_archetype: detachable ARCHETYPE
			-- differential or flat version of archetype, depending on setting of `differential_view'
		require
			is_populated
		do
			if not editing_enabled then
				if differential_view then
					Result := source.differential_archetype
				else
					Result := source.flat_archetype
				end
			else
				Result := source.flat_archetype_clone
			end
		end

	source_ui_graph: detachable ARCHETYPE_UI_GRAPH_ROOT
			-- display / editor context, loaded with archetype for display, or a clone, for editing
		require
			is_populated
		do
			if not editing_enabled then
				if differential_view then
					Result := source.gui_context.differential_ui_graph
				else
					Result := source.gui_context.flat_ui_graph
				end
			else
				Result := source.gui_context.editor_ui_graph
			end
		end

	tool_artefact_id: STRING
			-- a system-wide unique artefact id that can be used to find a tool in a GUI collection like
			-- docked panes or similar
		do
			Result := source.id.as_string
		end

	selected_language: detachable STRING
		note
			option: stable
		attribute
		end

feature -- Status Report

	differential_view: BOOLEAN

	is_populated: BOOLEAN
		do
			Result := precursor and attached selected_language
		end

feature -- Commands

	populate (a_source: attached like source; differential_view_flag: BOOLEAN; a_selected_language: STRING)
			-- populate the control by creating it from scratch
		require
			can_populate (a_source)
		do
			differential_view := differential_view_flag
			selected_language := a_selected_language
			gui_tool_populate (a_source)
		ensure
			is_populated
		end

	repopulate_with_language (a_selected_language: STRING)
			-- repopulate with changed language
		do
			selected_language := a_selected_language
			repopulate
		end

end


