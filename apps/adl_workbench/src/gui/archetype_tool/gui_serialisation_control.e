note
	component:   "openEHR ADL Tools"
	description: "Archetype serialisation control"
	keywords:    "GUI, ADL"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2011 Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class
	GUI_SERIALISATION_CONTROL

inherit
	GUI_ARCHETYPE_TARGETTED_TOOL
		redefine
			enable_edit, disable_edit, can_populate, can_repopulate
		end

	STRING_UTILITIES
		export
			{NONE} all
		end

create
	make

feature {NONE}-- Initialization

	make (a_visual_update_action: PROCEDURE [ANY, TUPLE [ARCH_LIB_ARCHETYPE]])
		do
			create adl_text_cache.make(20000)
			create json_text_cache.make(20000)
			create yaml_text_cache.make(20000)
			create xml_text_cache.make(20000)
			create odin_text_cache.make(20000)

			-- create root Notebook
			create ev_root_container
			create gui_controls.make (0)

			visual_update_action := a_visual_update_action

			--------------------------- ADL text tab -----------------------
			create evx_adl_text_editor.make (agent adl_text)
			ev_root_container.extend (evx_adl_text_editor.ev_root_container)
			ev_root_container.set_item_text (evx_adl_text_editor.ev_root_container, {ARCHETYPE_DEFINITIONS}.syntax_type_adl.as_upper)

			-- symbolic syntax
--			evx_adl_text_editor.set_text_filter (get_text ({ADL_MESSAGES_IDS}.ec_symbolic_text), get_text ({ADL_MESSAGES_IDS}.ec_symbolic_text_tooltip), agent symbolic_text)

			-- save button
			evx_adl_text_editor.add_button (Void, Void, get_text ({EVX_MESSAGES_IDS}.ec_save_button_text),
				get_text ({EVX_MESSAGES_IDS}.ec_save_button_tooltip), agent save_adl_text_as, Void)

			gui_controls.extend (evx_adl_text_editor)

			--------------------------- JSON text tab -----------------------
			create evx_json_text_editor.make (agent json_text)
			ev_root_container.extend (evx_json_text_editor.ev_root_container)
			ev_root_container.set_item_text (evx_json_text_editor.ev_root_container, {ODIN_DEFINITIONS}.syntax_type_json.as_upper)

			-- include RM check button
			evx_json_text_editor.add_check_box (
				get_msg ({ADL_MESSAGES_IDS}.ec_flatten_with_rm_cb_text, Void),
				get_msg ({ADL_MESSAGES_IDS}.ec_flatten_with_rm_cb_tooltip, Void),
				agent rm_flattening_on,
				agent (cb_selected: BOOLEAN) do set_rm_flattening_on (cb_selected); try_repopulate end)

			-- include type marking on check button
			evx_json_text_editor.add_check_box (
				get_msg ({ADL_MESSAGES_IDS}.ec_type_marking_cb_text, Void),
				get_msg ({ADL_MESSAGES_IDS}.ec_type_marking_cb_tooltip, Void),
				agent type_marking_on,
				agent (cb_selected: BOOLEAN) do set_type_marking_on (cb_selected); try_repopulate end)

			-- save button
			evx_json_text_editor.add_button (Void, Void, get_text ({EVX_MESSAGES_IDS}.ec_save_button_text),
				get_text ({EVX_MESSAGES_IDS}.ec_save_button_tooltip), agent save_json_text_as, Void)

			gui_controls.extend (evx_json_text_editor)

			--------------------------- YAML text tab -----------------------
			create evx_yaml_text_editor.make (agent yaml_text)
			ev_root_container.extend (evx_yaml_text_editor.ev_root_container)
			ev_root_container.set_item_text (evx_yaml_text_editor.ev_root_container, {ODIN_DEFINITIONS}.syntax_type_yaml.as_upper)

			-- include RM check button
			evx_yaml_text_editor.add_check_box (
				get_msg ({ADL_MESSAGES_IDS}.ec_flatten_with_rm_cb_text, Void),
				get_msg ({ADL_MESSAGES_IDS}.ec_flatten_with_rm_cb_tooltip, Void),
				agent rm_flattening_on,
				agent (cb_selected: BOOLEAN) do set_rm_flattening_on (cb_selected); try_repopulate end)

			-- include type marking on check button
			evx_yaml_text_editor.add_check_box (
				get_msg ({ADL_MESSAGES_IDS}.ec_type_marking_cb_text, Void),
				get_msg ({ADL_MESSAGES_IDS}.ec_type_marking_cb_tooltip, Void),
				agent type_marking_on,
				agent (cb_selected: BOOLEAN) do set_type_marking_on (cb_selected); try_repopulate end)

			-- save button
			evx_yaml_text_editor.add_button (Void, Void, get_text ({EVX_MESSAGES_IDS}.ec_save_button_text),
				get_text ({EVX_MESSAGES_IDS}.ec_save_button_tooltip), agent save_yaml_text_as, Void)

			gui_controls.extend (evx_yaml_text_editor)

			--------------------------- XML text tab -----------------------
			create evx_xml_text_editor.make (agent xml_text)
			ev_root_container.extend (evx_xml_text_editor.ev_root_container)
			ev_root_container.set_item_text (evx_xml_text_editor.ev_root_container, {ODIN_DEFINITIONS}.syntax_type_xml.as_upper)

			-- include RM check button
			evx_xml_text_editor.add_check_box (
				get_msg ({ADL_MESSAGES_IDS}.ec_flatten_with_rm_cb_text, Void),
				get_msg ({ADL_MESSAGES_IDS}.ec_flatten_with_rm_cb_tooltip, Void),
				agent rm_flattening_on,
				agent (cb_selected: BOOLEAN) do set_rm_flattening_on (cb_selected); try_repopulate end)

			-- include type marking on check button
			evx_xml_text_editor.add_check_box (
				get_msg ({ADL_MESSAGES_IDS}.ec_type_marking_cb_text, Void),
				get_msg ({ADL_MESSAGES_IDS}.ec_type_marking_cb_tooltip, Void),
				agent type_marking_on,
				agent (cb_selected: BOOLEAN) do set_type_marking_on (cb_selected); try_repopulate end)

			-- save button
			evx_xml_text_editor.add_button (Void, Void, get_text ({EVX_MESSAGES_IDS}.ec_save_button_text),
				get_text ({EVX_MESSAGES_IDS}.ec_save_button_tooltip), agent save_xml_text_as, Void)

			gui_controls.extend (evx_xml_text_editor)

			--------------------------- ODIN text tab -----------------------
			create evx_odin_text_editor.make (agent odin_text)
			ev_root_container.extend (evx_odin_text_editor.ev_root_container)
			ev_root_container.set_item_text (evx_odin_text_editor.ev_root_container, {ODIN_DEFINITIONS}.syntax_type_odin.as_upper)

			gui_controls.extend (evx_odin_text_editor)

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

feature -- UI Feedback

	visual_update_action: PROCEDURE [ANY, TUPLE [ARCH_LIB_ARCHETYPE]]
			-- Called after processing each archetype (to perform GUI updates during processing).

feature {NONE} -- Implementation

	gui_controls: ARRAYED_LIST [EVX_CONTROL_SHELL]

	evx_adl_text_editor: EVX_TEXT_EDITOR_CONTROL

	adl_text: STRING
		do
			if adl_text_cache.is_empty then
				adl_text_cache.append (safe_source.select_native_serialised_archetype (differential_view, rm_flattening_on))
			end
			Result := adl_text_cache
		end

	save_adl_text_as
		do
			do_save_text (adl_text, {ARCHETYPE_DEFINITIONS}.syntax_type_adl, {ARCHETYPE_DEFINITIONS}.File_ext_opt2)
		end

	evx_json_text_editor: EVX_TEXT_EDITOR_CONTROL

	json_text: STRING
		do
			if json_text_cache.is_empty then
				json_text_cache.append (safe_source.serialise_object (not differential_view, type_marking_on, {ODIN_DEFINITIONS}.Syntax_type_json))
			end
			Result := json_text_cache
		end

	save_json_text_as
		do
			do_save_text (json_text, {ODIN_DEFINITIONS}.Syntax_type_json, {ODIN_DEFINITIONS}.File_ext_json_default)
		end


	evx_yaml_text_editor: EVX_TEXT_EDITOR_CONTROL

	yaml_text: STRING
		do
			if yaml_text_cache.is_empty then
				yaml_text_cache.append (safe_source.serialise_object (not differential_view, type_marking_on, {ODIN_DEFINITIONS}.Syntax_type_yaml))
			end
			Result := yaml_text_cache
		end

	save_yaml_text_as
		do
			do_save_text (yaml_text, {ODIN_DEFINITIONS}.Syntax_type_yaml, {ODIN_DEFINITIONS}.File_ext_yaml_default)
		end


	evx_xml_text_editor: EVX_TEXT_EDITOR_CONTROL

	xml_text: STRING
		do
			if xml_text_cache.is_empty then
				xml_text_cache.append (safe_source.serialise_object (not differential_view, type_marking_on, {ODIN_DEFINITIONS}.Syntax_type_xml))
			end
			Result := xml_text_cache
		end

	save_xml_text_as
		do
			do_save_text (xml_text, {ODIN_DEFINITIONS}.Syntax_type_xml, {ODIN_DEFINITIONS}.File_ext_xml_default)
		end


	evx_odin_text_editor: EVX_TEXT_EDITOR_CONTROL

	odin_text: STRING
		do
			if odin_text_cache.is_empty then
				odin_text_cache.append (safe_source.serialise_object (not differential_view, type_marking_on, {ARCHETYPE_DEFINITIONS}.Syntax_type_adl))
			end
			Result := odin_text_cache
		end

	save_odin_text_as
		do
			do_save_text (odin_text, {ODIN_DEFINITIONS}.Syntax_type_odin, {ODIN_DEFINITIONS}.File_ext_odin)
		end

	do_clear
		do
			clear_cache
			gui_controls.do_all (agent (an_item: EVX_CONTROL_SHELL) do an_item.clear end)
			if is_populated then
				call_visual_update_action (safe_source)
			end
		end

	do_populate
		local
			sel_tab: detachable EV_NOTEBOOK_TAB
		do
			clear_cache

			gui_controls.do_all (agent (an_item: EVX_CONTROL_SHELL) do an_item.populate end)

			-- select the most recent active tab
			if attached sel_tab as att_sel_tab then
				att_sel_tab.enable_select
			end

			call_visual_update_action (safe_source)
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

	call_visual_update_action (an_artefact: ARCH_LIB_ARCHETYPE)
			-- Call `visual_update_action', if it is attached.
		do
			if attached visual_update_action then
				visual_update_action.call ([an_artefact])
			end
		end

	clear_cache
		do
			adl_text_cache.wipe_out
			json_text_cache.wipe_out
			yaml_text_cache.wipe_out
			xml_text_cache.wipe_out
			odin_text_cache.wipe_out
		end

	adl_text_cache: STRING

	json_text_cache: STRING

	yaml_text_cache: STRING

	xml_text_cache: STRING

	odin_text_cache: STRING

end



