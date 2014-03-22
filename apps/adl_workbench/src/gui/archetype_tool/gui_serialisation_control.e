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
			can_populate, can_repopulate, ev_root_container
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
			-- create root widget
			create ev_root_container
			ev_root_container.set_border_width (Default_border_width)
			ev_root_container.set_padding_width (Default_padding_width)

			-- rich text
			create ev_serialised_rich_text
			ev_serialised_rich_text.disable_edit
			ev_serialised_rich_text.set_tab_width ((ev_serialised_rich_text.tab_width/2).floor.max (1))  -- this is in pixels, and assumes 7-pixel wide chars
			ev_root_container.extend (ev_serialised_rich_text)

			-- serialise controls VBOX
			create ev_serialise_controls_vbox
			ev_root_container.extend (ev_serialise_controls_vbox)
			ev_root_container.disable_item_expand (ev_serialise_controls_vbox)

			-- serialise controls frame
			create ev_serialise_controls_frame
			ev_serialise_controls_frame.set_text (get_msg (ec_serialise_frame_text, Void))
			ev_serialise_controls_frame.set_minimum_width (125)
			ev_serialise_controls_vbox.extend (ev_serialise_controls_frame)
			ev_serialise_controls_vbox.disable_item_expand (ev_serialise_controls_frame)

			-- serialise radio button VBOX
			create ev_serialise_rb_vbox
			ev_serialise_rb_vbox.set_border_width (Default_border_width)
			ev_serialise_controls_frame.extend (ev_serialise_rb_vbox)

			-- serialise radio buttons
			create ev_serialise_adl_rb
			create ev_serialise_odin_rb
			create ev_serialise_xml_rb
			create ev_serialise_json_rb
			create ev_serialise_yaml_rb
			ev_serialise_adl_rb.select_actions.extend (agent try_repopulate)
			ev_serialise_odin_rb.select_actions.extend (agent try_repopulate)
			ev_serialise_xml_rb.select_actions.extend (agent try_repopulate)
			ev_serialise_json_rb.select_actions.extend (agent try_repopulate)
			ev_serialise_yaml_rb.select_actions.extend (agent try_repopulate)
			ev_serialise_rb_vbox.extend (ev_serialise_adl_rb)
			ev_serialise_rb_vbox.extend (ev_serialise_odin_rb)
			ev_serialise_rb_vbox.extend (ev_serialise_xml_rb)
			ev_serialise_rb_vbox.extend (ev_serialise_json_rb)
			ev_serialise_rb_vbox.extend (ev_serialise_yaml_rb)
			ev_serialise_rb_vbox.disable_item_expand (ev_serialise_adl_rb)
			ev_serialise_rb_vbox.disable_item_expand (ev_serialise_odin_rb)
			ev_serialise_rb_vbox.disable_item_expand (ev_serialise_xml_rb)
			ev_serialise_rb_vbox.disable_item_expand (ev_serialise_json_rb)
			ev_serialise_rb_vbox.disable_item_expand (ev_serialise_yaml_rb)

			-- flatten radio button
			create ev_flatten_with_rm_cb
			ev_flatten_with_rm_cb.set_text (get_msg (ec_flatten_with_rm_cb_text, Void))
			ev_flatten_with_rm_cb.select_actions.extend (agent try_repopulate)
			ev_flatten_with_rm_cb.set_tooltip (get_msg (ec_flatten_with_rm_cb_tooltip, Void))
			ev_serialise_controls_vbox.extend (ev_flatten_with_rm_cb)
			ev_serialise_controls_vbox.disable_item_expand (ev_flatten_with_rm_cb)

			-- line numbers check button
			create ev_line_numbers_cb
			ev_line_numbers_cb.set_text (get_msg (ec_add_line_numbers_text, Void))
			ev_line_numbers_cb.set_tooltip (get_msg (ec_add_line_numbers_tooltip, Void))
			ev_line_numbers_cb.select_actions.extend (agent do set_show_line_numbers (ev_line_numbers_cb.is_selected) end)
			ev_line_numbers_cb.select_actions.extend (agent try_repopulate)
			ev_serialise_controls_vbox.extend (ev_line_numbers_cb)
			ev_serialise_controls_vbox.disable_item_expand (ev_line_numbers_cb)

			-- bottom padding cell
			create ev_serialise_padding_cell
			ev_serialise_controls_vbox.extend (ev_serialise_padding_cell)

			-- set initial visual characteristics
			set_serialisation_control_texts
			differential_view := True

			ev_root_container.set_data (Current)
		end

feature -- Access

	ev_root_container: EV_HORIZONTAL_BOX

feature -- Status Report

	can_populate (a_source: attached like source): BOOLEAN
		do
			Result := a_source.is_valid
		end

	can_repopulate: BOOLEAN
		do
			Result := is_populated and source.is_valid
		end

feature {NONE} -- Implementation

	ev_serialised_rich_text: EV_RICH_TEXT

	ev_serialise_rb_vbox, ev_serialise_controls_vbox: EV_VERTICAL_BOX

	ev_serialise_padding_cell: EV_CELL

	ev_serialise_controls_frame: EV_FRAME

	ev_serialise_adl_rb, ev_serialise_odin_rb, ev_serialise_xml_rb, ev_serialise_json_rb, ev_serialise_yaml_rb: EV_RADIO_BUTTON

	ev_flatten_with_rm_cb, ev_line_numbers_cb: EV_CHECK_BUTTON

	do_clear
		do
			ev_serialised_rich_text.remove_text
		end

	do_populate
		local
			syntax_type: detachable STRING
			s: STRING
		do
			set_serialisation_control_texts
			if ev_serialise_adl_rb.is_selected then
				if not differential_view then
					s := source.flat_serialised (ev_flatten_with_rm_cb.is_selected)
				elseif attached source.serialised_differential_archetype as sda then
					s := sda
				else
					create s.make_empty
				end
			else
				if ev_serialise_odin_rb.is_selected then
					syntax_type := Syntax_type_adl
				elseif ev_serialise_xml_rb.is_selected then
					syntax_type := Syntax_type_xml
				elseif ev_serialise_json_rb.is_selected then
					syntax_type := Syntax_type_json
				elseif ev_serialise_yaml_rb.is_selected then
					syntax_type := Syntax_type_yaml
				end
				check attached syntax_type end
				s := source.serialise_object (not differential_view, syntax_type)
			end
			populate_serialised_rich_text (s)
		end

	populate_serialised_rich_text (text: attached STRING)
			-- Display `text' in `source_rich_text', optionally with each line preceded by line numbers.
		local
			s: STRING
		do
			if show_line_numbers then
				s := add_line_numbers (text, 4, " ")
			else
				s := text
			end
			ev_serialised_rich_text.set_text (utf8_to_utf32 (s))
		end

	set_serialisation_control_texts
		do
			ev_serialise_adl_rb.set_text (syntax_type_adl.as_upper)
			ev_serialise_adl_rb.set_tooltip (get_msg (ec_show_adl_serialisation_tooltip, <<latest_adl_version>>))
			ev_serialise_odin_rb.set_text (syntax_type_odin.as_upper)
			ev_serialise_odin_rb.set_tooltip (get_msg (ec_show_dadl_serialisation_tooltip, <<latest_adl_version>>))
			ev_serialise_xml_rb.set_text (syntax_type_xml.as_upper)
			ev_serialise_xml_rb.set_tooltip (get_msg (ec_show_xml_serialisation_tooltip, <<latest_adl_version>>))
			ev_serialise_json_rb.set_text (syntax_type_json.as_upper)
			ev_serialise_json_rb.set_tooltip (get_msg (ec_show_json_serialisation_tooltip, <<latest_adl_version>>))
			ev_serialise_yaml_rb.set_text (syntax_type_yaml)
			ev_serialise_yaml_rb.set_tooltip (get_msg (ec_show_yaml_serialisation_tooltip, <<latest_adl_version>>))
		end

end



