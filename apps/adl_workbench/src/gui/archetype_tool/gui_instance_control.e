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

	STRING_UTILITIES
		export
			{NONE} all
		end

create
	make

feature {NONE}-- Initialization

	make
		do
			-- create root widget
			create ev_root_container
--			create gui_controls.make (0)

--			-- JSON tab
--			create evx_json_editor.make_editable (agent json_text, agent save_json_text)
--			ev_root_container.extend (evx_json_editor.ev_root_container)
--			ev_root_container.set_item_text (evx_json_editor.ev_root_container, get_text ({ADL_MESSAGES_IDS}.ec_json_instance_text))
--			gui_controls.extend (evx_json_editor)

--			-- YAML tab
--			create evx_yaml_editor.make_editable (agent yaml_text, agent save_yaml_text)
--			ev_root_container.extend (evx_yaml_editor.ev_root_container)
--			ev_root_container.set_item_text (evx_yaml_editor.ev_root_container, get_text ({ADL_MESSAGES_IDS}.ec_yaml_instance_text))
--			gui_controls.extend (evx_yaml_editor)

--			-- XML tab
--			create evx_xml_editor.make_editable (agent xml_text, agent save_xml_text)
--			ev_root_container.extend (evx_xml_editor.ev_root_container)
--			ev_root_container.set_item_text (evx_xml_editor.ev_root_container, get_text ({ADL_MESSAGES_IDS}.ec_xml_instance_text))
--			gui_controls.extend (evx_xml_editor)


			-- rich text
			create ev_instance_rich_text
			ev_instance_rich_text.disable_edit
			ev_instance_rich_text.set_tab_width ((ev_instance_rich_text.tab_width/2).floor.max (1))  -- this is in pixels, and assumes 7-pixel wide chars
			ev_root_container.extend (ev_instance_rich_text)

			-- serialise controls VBOX
			create ev_instance_controls_vbox
			ev_root_container.extend (ev_instance_controls_vbox)
			ev_root_container.disable_item_expand (ev_instance_controls_vbox)

			-- serialise controls frame
			create ev_instance_controls_frame
			ev_instance_controls_frame.set_text (get_msg ({ADL_MESSAGES_IDS}.ec_serialise_frame_text, Void))
			ev_instance_controls_frame.set_minimum_width (125)
			ev_instance_controls_vbox.extend (ev_instance_controls_frame)
			ev_instance_controls_vbox.disable_item_expand (ev_instance_controls_frame)

			-- serialise radio button VBOX
			create ev_instance_rb_vbox
			ev_instance_rb_vbox.set_border_width (Default_border_width)
			ev_instance_controls_frame.extend (ev_instance_rb_vbox)

			-- serialise radio buttons
			create ev_instance_json_rb
			create ev_instance_yaml_rb
			create ev_instance_xml_rb
			ev_instance_json_rb.select_actions.extend (agent try_repopulate)
			ev_instance_yaml_rb.select_actions.extend (agent try_repopulate)
			ev_instance_xml_rb.select_actions.extend (agent try_repopulate)
			ev_instance_rb_vbox.extend (ev_instance_json_rb)
			ev_instance_rb_vbox.extend (ev_instance_yaml_rb)
			ev_instance_rb_vbox.extend (ev_instance_xml_rb)
			ev_instance_rb_vbox.disable_item_expand (ev_instance_json_rb)
			ev_instance_rb_vbox.disable_item_expand (ev_instance_yaml_rb)
			ev_instance_rb_vbox.disable_item_expand (ev_instance_xml_rb)

			-- include RM check button
			create ev_flatten_with_rm_cb
			ev_flatten_with_rm_cb.set_text (get_msg ({ADL_MESSAGES_IDS}.ec_flatten_with_rm_cb_text, Void))
			ev_flatten_with_rm_cb.select_actions.extend (agent do set_rm_flattening_on (ev_flatten_with_rm_cb.is_selected) end)
			ev_flatten_with_rm_cb.select_actions.extend (agent try_repopulate)
			ev_flatten_with_rm_cb.set_tooltip (get_msg ({ADL_MESSAGES_IDS}.ec_flatten_with_rm_cb_tooltip, Void))
			ev_instance_controls_vbox.extend (ev_flatten_with_rm_cb)
			ev_instance_controls_vbox.disable_item_expand (ev_flatten_with_rm_cb)

			-- line numbers check button
			create ev_line_numbers_cb
			ev_line_numbers_cb.set_text (get_msg ({EVX_MESSAGES_IDS}.ec_add_line_numbers_text, Void))
			ev_line_numbers_cb.set_tooltip (get_msg ({EVX_MESSAGES_IDS}.ec_add_line_numbers_tooltip, Void))
			ev_line_numbers_cb.select_actions.extend (agent do set_show_line_numbers (ev_line_numbers_cb.is_selected) end)
			ev_line_numbers_cb.select_actions.extend (agent try_repopulate)
			ev_instance_controls_vbox.extend (ev_line_numbers_cb)
			ev_instance_controls_vbox.disable_item_expand (ev_line_numbers_cb)

			-- save button
--			ev_instance_controls_vbox.add_button (Void, Void, get_text ({ADL_MESSAGES_IDS}.ec_save_instance_as_button_text),
--				get_msg ({ADL_MESSAGES_IDS}.ec_save_instance_as_button_tooltip, <<latest_adl_version>>), agent save_instance_as, Void)
--			gui_controls.extend (evx_adl_serialised_editor)

			-- bottom padding cell
			create ev_instance_padding_cell
			ev_instance_controls_vbox.extend (ev_instance_padding_cell)

			-- set initial visual characteristics
			set_instance_control_texts
			differential_view := True

			ev_root_container.set_data (Current)
		end

feature -- Access

	ev_root_container: EV_HORIZONTAL_BOX
--	ev_root_container: EV_NOTEBOOK

feature {NONE} -- Implementation

--	gui_controls: ARRAYED_LIST [EVX_CONTROL_SHELL]

--	evx_json_editor: EVX_TEXT_EDITOR_CONTROL

--	json_text: detachable STRING
--		do
--			Result := safe_source.generate_instance ({ODIN_DEFINITIONS}.Syntax_type_json)
--		end

--	evx_yaml_editor: EVX_TEXT_EDITOR_CONTROL

--	yaml_text: detachable STRING
--		do
--			Result := safe_source.generate_instance ({ODIN_DEFINITIONS}.Syntax_type_yaml)
--		end

--	evx_xml_editor: EVX_TEXT_EDITOR_CONTROL

--	xml_text: detachable STRING
--		do
--			Result := safe_source.generate_instance ({ODIN_DEFINITIONS}.Syntax_type_xml)
--		end





	ev_instance_rich_text: EV_RICH_TEXT

	ev_instance_rb_vbox, ev_instance_controls_vbox: EV_VERTICAL_BOX

	ev_instance_padding_cell: EV_CELL

	ev_instance_controls_frame: EV_FRAME

	ev_instance_xml_rb, ev_instance_json_rb, ev_instance_yaml_rb: EV_RADIO_BUTTON

	ev_flatten_with_rm_cb, ev_line_numbers_cb: EV_CHECK_BUTTON

	do_clear
		do
			ev_instance_rich_text.remove_text
		end

	do_populate
		local
			syntax_type: STRING
			s: STRING
		do
			set_instance_control_texts
			if ev_instance_json_rb.is_selected then
				syntax_type := {ODIN_DEFINITIONS}.Syntax_type_json
			elseif ev_instance_yaml_rb.is_selected then
				syntax_type := {ODIN_DEFINITIONS}.Syntax_type_yaml
			elseif ev_instance_xml_rb.is_selected then
				syntax_type := {ODIN_DEFINITIONS}.Syntax_type_xml
			else
				create syntax_type.make_empty
			end
			s := safe_source.generate_instance (syntax_type)
			populate_rich_text (s)
		end

	populate_rich_text (text: attached STRING)
			-- Display `text' in `source_rich_text', optionally with each line preceded by line numbers.
		local
			s: STRING
		do
			if show_line_numbers then
				s := add_line_numbers (text, 4, " ")
			else
				s := text
			end
			ev_instance_rich_text.set_text (utf8_to_utf32 (s))
		end

	set_instance_control_texts
		do
			ev_instance_json_rb.set_text ({ODIN_DEFINITIONS}.syntax_type_json.as_upper)
			ev_instance_json_rb.set_tooltip (get_msg ({ADL_MESSAGES_IDS}.ec_show_json_instance_tooltip, <<latest_adl_version>>))

			ev_instance_yaml_rb.set_text ({ODIN_DEFINITIONS}.syntax_type_yaml.as_upper)
			ev_instance_yaml_rb.set_tooltip (get_msg ({ADL_MESSAGES_IDS}.ec_show_yaml_instance_tooltip, <<latest_adl_version>>))

			ev_instance_xml_rb.set_text ({ODIN_DEFINITIONS}.syntax_type_xml.as_upper)
			ev_instance_xml_rb.set_tooltip (get_msg ({ADL_MESSAGES_IDS}.ec_show_xml_instance_tooltip, <<latest_adl_version>>))
		end

	save_instance_as
		do

		end

end



