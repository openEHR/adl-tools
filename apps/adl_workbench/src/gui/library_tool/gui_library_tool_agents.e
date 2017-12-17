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

	call_create_new_non_specialised_archetype_agent (accn: ARCH_LIB_CLASS; an_arch_agent: detachable PROCEDURE [ANY, TUPLE[ARCHETYPE]])
		do
			if attached create_new_non_specialised_archetype_agent as att_agt then
				att_agt.call ([accn, an_arch_agent])
			end
		end

	call_create_new_specialised_archetype_agent (parent_aca: ARCH_LIB_AUTHORED_ARCHETYPE)
		do
			if attached create_new_specialised_archetype_agent as att_agt then
				att_agt.call ([parent_aca])
			end
		end

	call_create_new_template_agent (parent_aca: ARCH_LIB_AUTHORED_ARCHETYPE)
		do
			if attached create_new_template_agent as att_agt then
				att_agt.call ([parent_aca])
			end
		end

feature -- Access

	edit_archetype_source_agent: detachable PROCEDURE [ANY, TUPLE [aca: ARCH_LIB_AUTHORED_ARCHETYPE]]

	save_archetype_agent: detachable PROCEDURE [ANY, TUPLE [aca: ARCH_LIB_AUTHORED_ARCHETYPE; diff_flag, native_format_flag: BOOLEAN]]

	archetype_explorer_select_in_tree_agent: detachable PROCEDURE [ANY, TUPLE [key: STRING]]

	update_explorers_and_select_agent: detachable PROCEDURE [ANY, TUPLE [ali_id: STRING]]

	update_archetype_explorer_agent: detachable PROCEDURE [ANY, TUPLE]

	create_new_non_specialised_archetype_agent: detachable PROCEDURE [ANY, TUPLE [accn: ARCH_LIB_CLASS; an_arch_agent: detachable PROCEDURE [ANY, TUPLE[ARCHETYPE]]]]
			-- create a new archetype, with an optional agent to post-process the archetype

	create_new_specialised_archetype_agent: detachable PROCEDURE [ANY, TUPLE[parent_aca: ARCH_LIB_AUTHORED_ARCHETYPE]]
			-- create a new specialised archetype, given a parent archetype descriptor

	create_new_template_agent: detachable PROCEDURE [ANY, TUPLE [parent_aca: ARCH_LIB_AUTHORED_ARCHETYPE]]
			-- create a new template, given an archetype descriptor

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

	set_create_new_non_specialised_archetype_agent (an_agent: like create_new_non_specialised_archetype_agent)
		do
			create_new_non_specialised_archetype_agent := an_agent
		end

	set_create_new_specialised_archetype_agent (an_agent: like create_new_specialised_archetype_agent)
		do
			create_new_specialised_archetype_agent := an_agent
		end

	set_create_new_template_agent (an_agent: like create_new_template_agent)
		do
			create_new_template_agent := an_agent
		end

end


