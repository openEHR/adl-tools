note
	component:   "openEHR ADL Tools"
	description: "Agents required by GUI_CATALOGUE_TOOL subtools"
	keywords:    "archetype, definition, gui"
	author:      "Thomas Beale"
	support:     "http://www.openehr.org/issues/browse/AWBPR"
	copyright:   "Copyright (c) 2012 Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class GUI_LIBRARY_TOOL_AGENTS

feature -- Access

	edit_archetype_source_agent: detachable PROCEDURE [ANY, TUPLE [aca:ARCH_LIB_ARCHETYPE]]

	save_archetype_agent: detachable PROCEDURE [ANY, TUPLE [aca: ARCH_LIB_ARCHETYPE; diff_flag, native_format_flag: BOOLEAN]]

	archetype_explorer_select_in_tree_agent: detachable PROCEDURE [ANY, TUPLE [key: STRING]]

feature -- Modification

	set_edit_archetype_source_agent (agt: like edit_archetype_source_agent)
		do
			edit_archetype_source_agent := agt
		end

	set_save_archetype_agent (agt: like save_archetype_agent)
		do
			save_archetype_agent := agt
		end

	set_archetype_explorer_select_in_tree_agent (agt: like archetype_explorer_select_in_tree_agent)
		do
			archetype_explorer_select_in_tree_agent := agt
		end

end


