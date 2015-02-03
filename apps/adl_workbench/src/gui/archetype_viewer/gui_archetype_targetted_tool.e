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
		redefine
			is_populated, source, populate, can_populate, can_repopulate
		end

feature -- Access

	source: detachable ARCH_LIB_ARCHETYPE
			-- archetype descriptor to which this tool is targetted

	auth_source: detachable ARCH_LIB_AUTHORED_ARCHETYPE
		do
			if attached {ARCH_LIB_AUTHORED_ARCHETYPE} source as att_auth_source then
				Result := att_auth_source
			end
		end

	source_archetype: ARCHETYPE
			-- differential or flat version of archetype, depending on setting of `differential_view' and `editing_enabled'
		require
			is_populated
		do
			check attached source as att_source then
				Result := att_source.select_archetype (differential_view, editing_enabled)
			end
		end

	source_ui_graph: ARCHETYPE_UI_GRAPH_ROOT
			-- display / editor context, loaded with archetype for display, or a clone, for editing
		require
			is_populated
		do
			check attached source as att_source then
				Result := att_source.editor_state.select_ui_graph (differential_view, editing_enabled)
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

	can_populate (a_source: attached like source; a_params: TUPLE [diff_view: BOOLEAN; a_lang: STRING]): BOOLEAN
		do
			Result := a_source.is_valid
		end

	can_repopulate: BOOLEAN
		do
			Result := is_populated and source.is_valid
		end

feature -- Commands

	populate (a_source: attached like source; a_params: TUPLE [diff_view: BOOLEAN; a_lang: STRING])
			-- populate the control by creating it from scratch
		do
			differential_view := a_params.diff_view
			selected_language := a_params.a_lang
			precursor (a_source, a_params)
		end

	repopulate_with_language (a_selected_language: STRING)
			-- repopulate with changed language
		do
			selected_language := a_selected_language
			repopulate
		end

end


