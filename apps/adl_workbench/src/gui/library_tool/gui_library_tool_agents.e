note
	component:   "openEHR ADL Tools"
	description: "Agents required by GUI_LIBRARY_TOOL subtools"
	keywords:    "archetype, definition, gui"
	author:      "Thomas Beale"
	support:     "http://www.openehr.org/issues/browse/AWBPR"
	copyright:   "Copyright (c) 2012 Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class GUI_LIBRARY_TOOL_AGENTS

feature -- Command

	call_edit_archetype_source_agent (aca: ARCH_LIB_AUTHORED_ARCHETYPE)
		do
			if attached edit_archetype_source_agent as att_agt then
				att_agt.call ([aca])
			end
		end

	call_save_archetype_agent (aca: ARCH_LIB_AUTHORED_ARCHETYPE; diff_flag, native_format_flag: BOOLEAN)
		do
			if attached save_archetype_agent as att_agt then
				att_agt.call ([aca, diff_flag, native_format_flag])
			end
		end

	call_archetype_explorer_select_in_tree_agent (key: STRING)
		do
			if attached archetype_explorer_select_in_tree_agent as att_agt then
				att_agt.call ([key])
			end
		end

	call_update_explorers_and_select_agent (ali_id: STRING)
		do
			if attached update_explorers_and_select_agent as att_agt then
				att_agt.call ([ali_id])
			end
		end

	call_update_archetype_explorer_agent
		do
			if attached update_archetype_explorer_agent as att_agt then
				att_agt.call ([])
			end
		end

feature {NONE} -- Implementation

	edit_archetype_source_agent: detachable PROCEDURE [ANY, TUPLE [aca: ARCH_LIB_AUTHORED_ARCHETYPE]]

	save_archetype_agent: detachable PROCEDURE [ANY, TUPLE [aca: ARCH_LIB_AUTHORED_ARCHETYPE; diff_flag, native_format_flag: BOOLEAN]]

	archetype_explorer_select_in_tree_agent: detachable PROCEDURE [ANY, TUPLE [key: STRING]]

	update_explorers_and_select_agent: detachable PROCEDURE [ANY, TUPLE [ali_id: STRING]]

	update_archetype_explorer_agent: detachable PROCEDURE [ANY, TUPLE]

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

	set_update_explorers_and_select_agent (agt: like update_explorers_and_select_agent)
		do
			update_explorers_and_select_agent := agt
		end

	set_update_archetype_explorer (agt: like update_archetype_explorer_agent)
		do
			update_archetype_explorer_agent := agt
		end

end


