note
	component:   "openEHR ADL Tools"
	description: "Show serialisated form of differential or flat archetypes"
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

	GUI_SEARCHABLE_TOOL
		export
			{NONE} all
		end

	SHARED_GUI_ADDRESS_BAR
		export
			{NONE} all
		end

	STRING_UTILITIES
		export
			{NONE} all
		end

create
	make

feature {NONE}-- Initialization

	make
		do
			create adl_text_cache.make(20000)
			create json_text_cache.make(20000)
			create ejson_text_cache.make(20000)
			create yaml_text_cache.make(20000)
			create xml_text_cache.make(20000)
			create odin_text_cache.make(20000)

			-- create root Notebook
			create ev_root_container
			create gui_controls.make (0)

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

			--------------------------- eiffel-JSON text tab ---------------------------
			create evx_ejson_text_editor.make (agent ejson_text)
			ev_root_container.extend (evx_ejson_text_editor.ev_root_container)
			ev_root_container.set_item_text (evx_ejson_text_editor.ev_root_container, "eJSON")

			-- include type marking on check button
			evx_ejson_text_editor.add_check_box (
				get_msg ({ADL_MESSAGES_IDS}.ec_type_marking_cb_text, Void),
				get_msg ({ADL_MESSAGES_IDS}.ec_type_marking_cb_tooltip, Void),
				agent type_marking_on,
				agent (cb_selected: BOOLEAN) do set_type_marking_on (cb_selected); try_repopulate end)

			-- save button
			evx_ejson_text_editor.add_button (Void, Void, get_text ({EVX_MESSAGES_IDS}.ec_save_button_text),
				get_text ({EVX_MESSAGES_IDS}.ec_save_button_tooltip), agent save_json_text_as, Void)

			gui_controls.extend (evx_ejson_text_editor)

			--------------------------- YAML text tab -----------------------
			create evx_yaml_text_editor.make (agent yaml_text)
			ev_root_container.extend (evx_yaml_text_editor.ev_root_container)
			ev_root_container.set_item_text (evx_yaml_text_editor.ev_root_container, {ODIN_DEFINITIONS}.syntax_type_yaml.as_upper)

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

			-- make focus actions for rich text controls set this overall tool as current search client
			across gui_controls as gui_ctl_csr loop
				if attached {EVX_TEXT_EDITOR_CONTROL} gui_ctl_csr.item as evx_txt_edit then
					evx_txt_edit.set_text_focus_in_action (agent address_bar.set_current_client (Current))
				end
			end

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

feature -- Search

	matching_ids (a_regex: STRING): ARRAYED_SET[STRING]
			-- generate list of schema elemtn ids (packages and classes)
		do
			create Result.make (0)
			Result.compare_objects
			if attached ev_root_container.selected_item as sel_item and then
				attached {EVX_TEXT_EDITOR_CONTROL} sel_item.data as evx_txt_edit and then evx_txt_edit.has_text (a_regex)
			then
				Result.extend (a_regex)
			else
				Result.extend (get_msg_line ("regex_e1", <<a_regex>>))
			end
		end

	item_selectable: BOOLEAN
		do
			Result := True
		end

	valid_item_id (a_key: STRING): BOOLEAN
		do
			Result := not a_key.is_empty -- and is printable
		end

	select_item_by_id (id: STRING)
		local
			ev_text: EV_RICH_TEXT
		do
			if attached ev_root_container.selected_item as sel_item and then attached {EVX_TEXT_EDITOR_CONTROL} sel_item.data as evx_txt_edit then
				evx_txt_edit.search_and_display (id)
			end
		end

	select_next
		do
			if attached ev_root_container.selected_item as sel_item and then attached {EVX_TEXT_EDITOR_CONTROL} sel_item.data as evx_txt_edit then
				evx_txt_edit.search_next
			end
		end

	select_previous
			-- Go to the previous match for previous search, if available
		do
			if attached ev_root_container.selected_item as sel_item and then attached {EVX_TEXT_EDITOR_CONTROL} sel_item.data as evx_txt_edit then
				evx_txt_edit.search_previous
			end
		end

feature {NONE} -- Implementation

	gui_controls: ARRAYED_LIST [EVX_CONTROL_SHELL]

	evx_adl_text_editor: EVX_TEXT_EDITOR_CONTROL

	adl_text: STRING
		do
			if adl_text_cache.is_empty then
				adl_text_cache.append (safe_source.serialised_native (differential_view, False))
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
				json_text_cache.append (safe_source.serialised_object (not differential_view, type_marking_on, {ODIN_DEFINITIONS}.Syntax_type_json))
			end
			Result := json_text_cache
		end

	save_json_text_as
		do
			do_save_text (json_text, {ODIN_DEFINITIONS}.Syntax_type_json, {ODIN_DEFINITIONS}.File_ext_json_default)
		end


	evx_ejson_text_editor: EVX_TEXT_EDITOR_CONTROL

	ejson_text: STRING
		do
			if ejson_text_cache.is_empty then
				ejson_text_cache.append (safe_source.serialised_object_ejson (not differential_view, type_marking_on, {ODIN_DEFINITIONS}.Syntax_type_json))
			end
			Result := ejson_text_cache
		end

	save_ejson_text_as
		do
			do_save_text (ejson_text, {ODIN_DEFINITIONS}.Syntax_type_json, {ODIN_DEFINITIONS}.File_ext_json_default)
		end


	evx_yaml_text_editor: EVX_TEXT_EDITOR_CONTROL

	yaml_text: STRING
		do
			if yaml_text_cache.is_empty then
				yaml_text_cache.append (safe_source.serialised_object (not differential_view, type_marking_on, {ODIN_DEFINITIONS}.Syntax_type_yaml))
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
				xml_text_cache.append (safe_source.serialised_object (not differential_view, type_marking_on, {ODIN_DEFINITIONS}.Syntax_type_xml))
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
				odin_text_cache.append (safe_source.serialised_object (not differential_view, type_marking_on, {ARCHETYPE_DEFINITIONS}.Syntax_type_adl))
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

	clear_cache
		do
			adl_text_cache.wipe_out
			json_text_cache.wipe_out
			ejson_text_cache.wipe_out
			yaml_text_cache.wipe_out
			xml_text_cache.wipe_out
			odin_text_cache.wipe_out
		end

	adl_text_cache: STRING

	json_text_cache: STRING

	ejson_text_cache: STRING

	yaml_text_cache: STRING

	xml_text_cache: STRING

	odin_text_cache: STRING

end



