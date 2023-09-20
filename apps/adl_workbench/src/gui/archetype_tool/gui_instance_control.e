note
	component:   "openEHR ADL Tools"
	description: "Archetype serialisation control"
	keywords:    "GUI, ADL"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2011 Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class
	GUI_INSTANCE_CONTROL

inherit
	GUI_ARCHETYPE_TARGETTED_TOOL
		redefine
			enable_edit, disable_edit, can_populate, can_repopulate
		end

create
	make

feature {NONE}-- Initialization

	make
		do
			create json_text_cache.make(20000)
			create yaml_text_cache.make(20000)
			create xml_text_cache.make(20000)

			-- create root widget
			create ev_root_container
			create gui_controls.make (0)

			-- JSON tab
			create evx_json_editor.make_editable (agent json_text, agent save_json_text_as)
			ev_root_container.extend (evx_json_editor.ev_root_container)
			ev_root_container.set_item_text (evx_json_editor.ev_root_container, {ODIN_DEFINITIONS}.syntax_type_json.as_upper)
			gui_controls.extend (evx_json_editor)

			-- YAML tab
			create evx_yaml_editor.make_editable (agent yaml_text, agent save_yaml_text_as)
			ev_root_container.extend (evx_yaml_editor.ev_root_container)
			ev_root_container.set_item_text (evx_yaml_editor.ev_root_container, {ODIN_DEFINITIONS}.syntax_type_yaml.as_upper)
			gui_controls.extend (evx_yaml_editor)

			-- XML tab
			create evx_xml_editor.make_editable (agent xml_text, agent save_xml_text_as)
			ev_root_container.extend (evx_xml_editor.ev_root_container)
			ev_root_container.set_item_text (evx_xml_editor.ev_root_container, {ODIN_DEFINITIONS}.syntax_type_xml.as_upper)
			gui_controls.extend (evx_xml_editor)

			-- set initial visual characteristics
			differential_view := True

			ev_root_container.set_data (Current)
		end

feature -- Access

	ev_root_container: EV_NOTEBOOK

feature -- Status Report

	can_populate (a_source: attached like source; a_params: TUPLE [diff_view: BOOLEAN; a_lang: STRING]): BOOLEAN
		do
			Result := True
		end

	can_repopulate: BOOLEAN
		do
			Result := is_populated
		end

feature -- Commands

	enable_edit
			-- enable editing
		do
			precursor
			gui_controls.do_all (agent (an_item: EVX_CONTROL_SHELL) do an_item.enable_editable end)
		end

	disable_edit
			-- disable editing
		do
			precursor
			gui_controls.do_all (agent (an_item: EVX_CONTROL_SHELL) do an_item.disable_editable end)
		end

feature {NONE} -- Implementation

	update_line_numbers (flag: BOOLEAN)
		do
			set_show_line_numbers (flag)
			try_repopulate
		end

	gui_controls: ARRAYED_LIST [EVX_CONTROL_SHELL]


	evx_json_editor: EVX_TEXT_EDITOR_CONTROL

	json_text: STRING
		do
			if json_text_cache.is_empty then
				json_text_cache.append (safe_source.generate_instance ({ODIN_DEFINITIONS}.Syntax_type_json))
			end
			Result := json_text_cache
		end

	save_json_text_as (a_text: STRING)
		do
			do_save_text (json_text, {ODIN_DEFINITIONS}.Syntax_type_json, {ODIN_DEFINITIONS}.File_ext_json_default)
		end

	evx_yaml_editor: EVX_TEXT_EDITOR_CONTROL

	yaml_text: STRING
		do
			if yaml_text_cache.is_empty then
				yaml_text_cache.append (safe_source.generate_instance ({ODIN_DEFINITIONS}.Syntax_type_yaml))
			end
			Result := yaml_text_cache
		end

	save_yaml_text_as (a_text: STRING)
		do
			do_save_text (yaml_text, {ODIN_DEFINITIONS}.Syntax_type_yaml, {ODIN_DEFINITIONS}.File_ext_yaml_default)
		end

	evx_xml_editor: EVX_TEXT_EDITOR_CONTROL

	xml_text: STRING
		do
			if xml_text_cache.is_empty then
				xml_text_cache.append (safe_source.generate_instance ({ODIN_DEFINITIONS}.Syntax_type_xml))
			end
			Result := xml_text_cache
		end

	save_xml_text_as (a_text: STRING)
		do
			do_save_text (xml_text, {ODIN_DEFINITIONS}.Syntax_type_xml, {ODIN_DEFINITIONS}.File_ext_xml_default)
		end

	do_clear
		do
			json_text_cache.wipe_out
			yaml_text_cache.wipe_out
			xml_text_cache.wipe_out
			gui_controls.do_all (agent (an_item: EVX_CONTROL_SHELL) do an_item.clear end)
		end

	do_populate
		local
			sel_tab: detachable EV_NOTEBOOK_TAB
		do
			gui_controls.do_all (agent (an_item: EVX_CONTROL_SHELL) do an_item.populate end)

			-- select the most recent active tab
			if attached sel_tab as att_sel_tab then
				att_sel_tab.enable_select
			end
		end

	do_save_text (a_text: STRING; format, ext: STRING)
			-- export model as XML and allow saving
		local
			path: STRING
			save_dialog: EV_FILE_SAVE_DIALOG
		do
			create save_dialog
			save_dialog.set_title (get_text ({ADL_MESSAGES_IDS}.ec_save_instance_dialog_title))
			save_dialog.set_file_name (safe_source.id.as_string + ext)
			save_dialog.set_start_directory (export_directory)
			save_dialog.filters.extend (["*" + ext, get_msg ({ADL_MESSAGES_IDS}.ec_save_instance_to_file_title, <<format.as_upper>>)])
			check attached proximate_ev_window (ev_root_container) as prox_win then
				save_dialog.show_modal_to_window (prox_win)
			end
			path := save_dialog.file_name.as_string_8

			if not path.is_empty and then attached {ARCH_LIB_AUTHORED_ARCHETYPE} safe_source as arch_src then
				arch_src.save_text_to_file (path, a_text)
				gui_agents.call_console_tool_append_agent (get_msg_line ({GENERAL_MESSAGES_IDS}.ec_file_saved_as_in_format, <<path, ext>>))
			end
		end

	json_text_cache: STRING

	yaml_text_cache: STRING

	xml_text_cache: STRING


end



