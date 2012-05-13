note
	component:   "openEHR Archetype Project"
	description: "Archetype serialisation control"
	keywords:    "GUI, ADL"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2011 Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

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
			ev_root_container.set_data (Current)

			create ev_serialised_rich_text
			create ev_serialise_controls_vbox
			create ev_serialise_controls_frame
			create ev_serialise_rb_vbox
			create ev_serialise_adl_rb
			create ev_serialise_dadl_rb
			create ev_serialise_xml_rb
			create ev_serialise_json_rb
			create ev_serialise_yaml_rb
			create ev_flatten_with_rm_cb
			create ev_line_numbers_cb
			create ev_serialise_padding_cell

			-- connect widgets
			ev_root_container.extend (ev_serialised_rich_text)
			ev_root_container.extend (ev_serialise_controls_vbox)
			ev_serialise_controls_vbox.extend (ev_serialise_controls_frame)
			ev_serialise_controls_frame.extend (ev_serialise_rb_vbox)
			ev_serialise_rb_vbox.extend (ev_serialise_adl_rb)
			ev_serialise_rb_vbox.extend (ev_serialise_dadl_rb)
			ev_serialise_rb_vbox.extend (ev_serialise_xml_rb)
			ev_serialise_rb_vbox.extend (ev_serialise_json_rb)
			ev_serialise_rb_vbox.extend (ev_serialise_yaml_rb)

			ev_serialise_controls_vbox.extend (ev_flatten_with_rm_cb)
			ev_serialise_controls_vbox.disable_item_expand (ev_flatten_with_rm_cb)

			ev_serialise_controls_vbox.extend (ev_line_numbers_cb)
			ev_serialise_controls_vbox.disable_item_expand (ev_line_numbers_cb)

			ev_serialise_controls_vbox.extend (ev_serialise_padding_cell)

			-- set visual characteristics
			ev_serialised_rich_text.disable_edit
			ev_root_container.disable_item_expand (ev_serialise_controls_vbox)
			ev_serialise_controls_vbox.disable_item_expand (ev_serialise_controls_frame)
			ev_root_container.set_border_width (Default_border_width)
			ev_root_container.set_padding_width (Default_padding_width)
			ev_serialise_rb_vbox.set_border_width (Default_border_width)
			ev_serialised_rich_text.set_tab_width ((ev_serialised_rich_text.tab_width/2).floor.max (1))  -- this is in pixels, and assumes 7-pixel wide chars
			ev_serialise_rb_vbox.disable_item_expand (ev_serialise_adl_rb)
			ev_serialise_rb_vbox.disable_item_expand (ev_serialise_dadl_rb)
			ev_serialise_rb_vbox.disable_item_expand (ev_serialise_xml_rb)
			ev_serialise_rb_vbox.disable_item_expand (ev_serialise_json_rb)
			ev_serialise_rb_vbox.disable_item_expand (ev_serialise_yaml_rb)
			ev_serialise_controls_frame.set_text (get_msg ("serialise_frame_text", Void))
			ev_serialise_controls_frame.set_minimum_width (125)
		--	ev_serialise_controls_frame.set_minimum_height (110)
			set_serialisation_control_texts

			ev_flatten_with_rm_cb.set_text (get_msg ("flatten_with_rm_cb_text", Void))
			ev_flatten_with_rm_cb.set_tooltip (get_msg ("flatten_with_rm_cb_tooltip", Void))

			ev_line_numbers_cb.set_text (get_msg ("add_line_numbers_text", Void))
			ev_line_numbers_cb.set_tooltip (get_msg ("add_line_numbers_tooltip", Void))

			-- set events: serialisation controls
			ev_serialise_adl_rb.select_actions.extend (agent try_repopulate)
			ev_serialise_dadl_rb.select_actions.extend (agent try_repopulate)
			ev_serialise_xml_rb.select_actions.extend (agent try_repopulate)
			ev_serialise_json_rb.select_actions.extend (agent try_repopulate)
			ev_serialise_yaml_rb.select_actions.extend (agent try_repopulate)
			ev_flatten_with_rm_cb.select_actions.extend (agent try_repopulate)
			ev_line_numbers_cb.select_actions.extend (agent do set_show_line_numbers (ev_line_numbers_cb.is_selected) end)
			ev_line_numbers_cb.select_actions.extend (agent try_repopulate)

			differential_view := True
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

	ev_serialise_adl_rb, ev_serialise_dadl_rb, ev_serialise_xml_rb, ev_serialise_json_rb, ev_serialise_yaml_rb: EV_RADIO_BUTTON

	ev_flatten_with_rm_cb, ev_line_numbers_cb: EV_CHECK_BUTTON

	do_clear
		do
			ev_serialised_rich_text.remove_text
		end

	do_populate
		local
			s, syntax_type: STRING
		do
			set_serialisation_control_texts
			if ev_serialise_adl_rb.is_selected then
				if not differential_view then
					s := source.flat_text (ev_flatten_with_rm_cb.is_selected)
				else
					s := source.differential_text
				end
			else
				if ev_serialise_dadl_rb.is_selected then
					syntax_type := Syntax_type_adl
				elseif ev_serialise_xml_rb.is_selected then
					syntax_type := Syntax_type_xml
				elseif ev_serialise_json_rb.is_selected then
					syntax_type := Syntax_type_json
				elseif ev_serialise_yaml_rb.is_selected then
					syntax_type := Syntax_type_yaml
				end
				if differential_view then
					s := source.serialise_object (False, syntax_type)
				else
					s := source.serialise_object (True, syntax_type)
				end
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
			ev_serialise_adl_rb.set_text ("ADL " + adl_version_for_flat_output)
			ev_serialise_adl_rb.set_tooltip (get_msg ("show_adl_serialisation_tooltip", <<adl_version_for_flat_output>>))
			ev_serialise_dadl_rb.set_text ("dADL " + adl_version_for_flat_output)
			ev_serialise_dadl_rb.set_tooltip (get_msg ("show_dadl_serialisation_tooltip", <<adl_version_for_flat_output>>))
			ev_serialise_xml_rb.set_text ("XML " + adl_version_for_flat_output)
			ev_serialise_xml_rb.set_tooltip (get_msg ("show_xml_serialisation_tooltip", <<adl_version_for_flat_output>>))
			ev_serialise_json_rb.set_text ("JSON " + adl_version_for_flat_output)
			ev_serialise_json_rb.set_tooltip (get_msg ("show_json_serialisation_tooltip", <<adl_version_for_flat_output>>))
			ev_serialise_yaml_rb.set_text ("YAML " + adl_version_for_flat_output)
			ev_serialise_yaml_rb.set_tooltip (get_msg ("show_yaml_serialisation_tooltip", <<adl_version_for_flat_output>>))
		end

end



--|
--| ***** BEGIN LICENSE BLOCK *****
--| Version: MPL 1.1/GPL 2.0/LGPL 2.1
--|
--| The contents of this file are subject to the Mozilla Public License Version
--| 1.1 (the 'License'); you may not use this file except in compliance with
--| the License. You may obtain a copy of the License at
--| http://www.mozilla.org/MPL/
--|
--| Software distributed under the License is distributed on an 'AS IS' basis,
--| WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License
--| for the specific language governing rights and limitations under the
--| License.
--|
--| The Original Code is gui_serialisation_control.e.
--|
--| The Initial Developer of the Original Code is Thomas Beale.
--| Portions created by the Initial Developer are Copyright (C) 2011
--| the Initial Developer. All Rights Reserved.
--|
--| Contributor(s):
--|
--| Alternatively, the contents of this file may be used under the terms of
--| either the GNU General Public License Version 2 or later (the 'GPL'), or
--| the GNU Lesser General Public License Version 2.1 or later (the 'LGPL'),
--| in which case the provisions of the GPL or the LGPL are applicable instead
--| of those above. If you wish to allow use of your version of this file only
--| under the terms of either the GPL or the LGPL, and not to allow others to
--| use your version of this file under the terms of the MPL, indicate your
--| decision by deleting the provisions above and replace them with the notice
--| and other provisions required by the GPL or the LGPL. If you do not delete
--| the provisions above, a recipient may use your version of this file under
--| the terms of any one of the MPL, the GPL or the LGPL.
--|
--| ***** END LICENSE BLOCK *****
--|
