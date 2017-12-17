note
	component:   "openEHR ADL Tools"
	description: "Agents required to specify definition tree context menu actions"
	keywords:    "archetype, definition, gui"
	author:      "Thomas Beale <thomas.beale@openehr.org>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2012- The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class GUI_ARCHETYPE_TOOL_AGENTS

feature -- Access

	path_select_action_agent: detachable PROCEDURE [ANY, TUPLE [STRING]]

	path_copy_action_agent: detachable PROCEDURE [ANY, TUPLE [STRING]]

	id_code_select_action_agent: detachable PROCEDURE [ANY, TUPLE [STRING]]

feature -- Modification

	set_id_code_select_action_agent (agt: like id_code_select_action_agent)
		do
			id_code_select_action_agent := agt
		end

	set_path_select_action_agent (agt: like path_select_action_agent)
		do
			path_select_action_agent := agt
		end

	set_path_copy_action_agent (agt: like path_copy_action_agent)
		do
			path_copy_action_agent := agt
		end

end


