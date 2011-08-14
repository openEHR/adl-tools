note
	component:   "openEHR Archetype Project"
	description: "Archetype notebook"
	keywords:    "GUI, ADL"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2011 Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class GUI_ARCHETYPE_TOOL

inherit
	GUI_TOOL
		redefine
			ev_root_container
		end

	CONSTANTS
		export
			{NONE} all
		end

	EV_SHARED_APPLICATION
		export
			{NONE} all
		end

	STRING_UTILITIES
		export
			{NONE} all
		end

	EV_KEY_CONSTANTS
		export
			{NONE} all
		end

	ARCHETYPE_TERM_CODE_TOOLS
		export
			{NONE} all
		end

	ARCHETYPE_DEFINITIONS
		export
			{NONE} all
		end

create
	make

feature {NONE}-- Initialization

	make (a_select_archetype_from_gui_data_agent: like select_archetype_from_gui_data)
		do
			select_archetype_from_gui_data := a_select_archetype_from_gui_data_agent

			-- create root widget
			create ev_root_container

			-- text field handling
			create text_widget_handler.make (ev_root_container)

			-- create subordinate widgets
			create ev_action_bar
			create ev_archetype_id
			create ev_view_label
			create ev_view_tool_bar
			create ev_differential_view_button
			create ev_flat_view_button
			create ev_language_label
			create ev_language_combo
			create ev_adl_version_label
			create ev_adl_version_text

			create ev_notebook
			create description_controls.make (agent text_widget_handler.on_select_all)
			create node_map_control.make (agent select_ontology_item_from_code)
			create path_map_control.make (agent on_path_map_key_press)
			create slot_map_control.make (agent update_slots_tab_label)
			create ontology_controls.make
			create annotations_control.make

			create ev_serialised_hbox
			create ev_serialised_rich_text
			create ev_serialise_controls_vbox
			create ev_serialise_controls_frame
			create ev_serialise_rb_vbox
			create ev_adl_rb
			create ev_dadl_rb
			create ev_xml_rb
			create ev_serialise_padding_cell

			-- connect widgets
			ev_root_container.extend (ev_action_bar)
			ev_root_container.extend (ev_notebook)

			ev_action_bar.extend (ev_archetype_id)
			ev_action_bar.extend (ev_view_label)
			ev_action_bar.extend (ev_view_tool_bar)
			ev_view_tool_bar.extend (ev_differential_view_button)
			ev_view_tool_bar.extend (ev_flat_view_button)
			ev_action_bar.extend (ev_language_label)
			ev_action_bar.extend (ev_language_combo)
			ev_action_bar.extend (ev_adl_version_label)
			ev_action_bar.extend (ev_adl_version_text)

			ev_notebook.extend (description_controls.ev_notebook)
			ev_notebook.extend (node_map_control.ev_root_container)
			ev_notebook.extend (ontology_controls.ev_root_container)
			ev_notebook.extend (annotations_control.grid)
			ev_notebook.extend (path_map_control.ev_root_container)
			ev_notebook.extend (slot_map_control.ev_root_container)
			ev_notebook.extend (ev_serialised_hbox)

			ev_serialised_hbox.extend (ev_serialised_rich_text)
			ev_serialised_hbox.extend (ev_serialise_controls_vbox)
			ev_serialise_controls_vbox.extend (ev_serialise_controls_frame)
			ev_serialise_controls_vbox.extend (ev_serialise_padding_cell)
			ev_serialise_controls_frame.extend (ev_serialise_rb_vbox)
			ev_serialise_rb_vbox.extend (ev_adl_rb)
			ev_serialise_rb_vbox.extend (ev_dadl_rb)
			ev_serialise_rb_vbox.extend (ev_xml_rb)

			-- set visual characteristics
			ev_root_container.disable_item_expand (ev_action_bar)
			ev_action_bar.set_padding (10)
			ev_action_bar.set_border_width (4)
			ev_action_bar.disable_item_expand (ev_view_label)
			ev_action_bar.disable_item_expand (ev_view_tool_bar)
			ev_action_bar.disable_item_expand (ev_language_label)
			ev_action_bar.disable_item_expand (ev_language_combo)
			ev_action_bar.disable_item_expand (ev_adl_version_label)
			ev_action_bar.disable_item_expand (ev_adl_version_text)
			ev_archetype_id.disable_edit
			ev_view_label.set_text ("View ")
			ev_differential_view_button.set_pixmap (pixmaps ["diff"])
			ev_flat_view_button.set_pixmap (pixmaps ["flat"])
			ev_differential_view_button.set_tooltip (create_message_content ("differential_view_button_tooltip", Void))
			ev_flat_view_button.set_tooltip (create_message_content ("flat_view_button_tooltip", Void))
			ev_language_label.set_text (create_message_content ("language_label", Void))
			ev_language_label.set_minimum_width (70)
			ev_language_label.set_minimum_height (23)
			ev_language_label.align_text_right
			ev_language_combo.set_tooltip (create_message_content ("language_combo_tooltip", Void))
			ev_language_combo.set_minimum_width (min_combo_box_width)
			ev_language_combo.set_minimum_height (23)
			ev_language_combo.disable_edit
			ev_adl_version_label.set_text (create_message_content ("adl_version_label", Void))
			ev_adl_version_label.set_minimum_width (80)
			ev_adl_version_label.align_text_right
			ev_adl_version_label.set_tooltip (create_message_content ("adl_version_label_tooltip", Void))

			ev_notebook.set_minimum_width (app_min_width)
			ev_notebook.set_minimum_height (arch_notebook_min_height)

			ev_notebook.set_item_text (description_controls.ev_notebook, create_message_content ("description_tab_text", Void))
			ev_notebook.item_tab (description_controls.ev_notebook).set_pixmap (pixmaps ["description"])

			ev_notebook.set_item_text (node_map_control.ev_root_container, create_message_content ("definition_tab_text", Void))
			ev_notebook.item_tab (node_map_control.ev_root_container).set_pixmap (pixmaps ["node_map"])

			ev_notebook.set_item_text (path_map_control.ev_root_container, create_message_content ("paths_tab_text", Void))
			ev_notebook.item_tab (path_map_control.ev_root_container).set_pixmap (pixmaps ["paths"])

			ev_notebook.set_item_text (slot_map_control.ev_root_container, create_message_content ("slots_tab_text", Void))
			ev_notebook.item_tab (slot_map_control.ev_root_container).set_pixmap (pixmaps ["archetype_slot"])

			ev_notebook.set_item_text (ontology_controls.ev_root_container, create_message_content ("terminology_tab_text", Void))
			ev_notebook.item_tab (ontology_controls.ev_root_container).set_pixmap (pixmaps ["terminology"])

			ev_notebook.set_item_text (annotations_control.grid, create_message_content ("annotations_tab_text", Void))
			ev_notebook.item_tab (annotations_control.grid).set_pixmap (pixmaps ["annotations"])

			ev_notebook.set_item_text (ev_serialised_hbox, create_message_content ("serialised_tab_text", Void))
			ev_notebook.item_tab (ev_serialised_hbox).set_pixmap (pixmaps ["diff"])

			ev_serialised_rich_text.disable_edit
			ev_serialised_hbox.disable_item_expand (ev_serialise_controls_vbox)
			ev_serialise_controls_vbox.disable_item_expand (ev_serialise_controls_frame)
			ev_serialised_hbox.set_border_width (border_width)
			ev_serialised_hbox.set_padding_width (padding_width)
			ev_serialise_rb_vbox.set_border_width (border_width)
			ev_serialised_rich_text.set_tab_width ((ev_serialised_rich_text.tab_width/2).floor.max (1))  -- this is in pixels, and assumes 7-pixel wide chars
			ev_serialise_rb_vbox.disable_item_expand (ev_adl_rb)
			ev_serialise_rb_vbox.disable_item_expand (ev_dadl_rb)
			ev_serialise_rb_vbox.disable_item_expand (ev_xml_rb)
			ev_serialise_controls_frame.set_text (create_message_content ("serialise_frame_text", Void))
			ev_serialise_controls_frame.set_minimum_width (125)
			ev_serialise_controls_frame.set_minimum_height (95)
			set_serialisation_control_texts

			-- set events: action bar
			ev_differential_view_button.select_actions.extend (agent on_differential_view)
			ev_flat_view_button.select_actions.extend (agent on_flat_view)
			ev_language_combo.select_actions.extend (agent on_select_language)

			-- set events: press Enter on Slots map trees
			slot_map_control.ev_suppliers_tree.key_press_actions.force (agent on_slot_map_suppliers_tree_key_press)
			slot_map_control.ev_clients_tree.key_press_actions.force (agent on_slot_map_clients_tree_key_press)
			slot_map_control.ev_suppliers_tree.pointer_double_press_actions.force (agent on_slot_map_suppliers_tree_double_click)
			slot_map_control.ev_clients_tree.pointer_double_press_actions.force (agent on_slot_map_clients_tree_double_click)

			-- set events: select a notebook tab
			ev_notebook.selection_actions.extend (agent on_select_archetype_notebook)

			-- set events: serialisation controls
			ev_adl_rb.select_actions.extend (agent populate_source_text)
			ev_dadl_rb.select_actions.extend (agent populate_dadl_text)
			ev_xml_rb.select_actions.extend (agent populate_xml_text)

			differential_view := True
			ev_differential_view_button.enable_select
			set_tab_texts
		end

feature -- Access

	ev_archetype_id: EV_TEXT_FIELD

	ev_root_container: EV_VERTICAL_BOX

	ev_notebook: EV_NOTEBOOK

	target_archetype_descriptor: ARCH_CAT_ARCHETYPE
			-- archetype to which this tool is targetted

	target_archetype: ARCHETYPE
			-- differential or flat version of archetype, depending on setting of `differential_view'
		do
			if differential_view then
				Result := target_archetype_descriptor.differential_archetype
			else
				Result := target_archetype_descriptor.flat_archetype
			end
		end

	selected_language: attached STRING

feature -- Status Report

	differential_view: BOOLEAN

feature -- Events

	on_select_archetype_notebook
			-- Called by `selection_actions' of `archetype_notebook'.
		do
			if ev_notebook.selected_item = slot_map_control.ev_root_container then
				if attached target_archetype_descriptor and then target_archetype_descriptor.is_valid then
					slot_map_control.populate (target_archetype_descriptor, selected_language)
				end
			elseif ev_notebook.selected_item = path_map_control.ev_root_container then
				if attached target_archetype_descriptor and then target_archetype_descriptor.is_valid then
					path_map_control.populate (target_archetype, selected_language)
				end
			elseif ev_notebook.selected_item = annotations_control.grid then
				if attached target_archetype_descriptor and then target_archetype_descriptor.is_valid then
					annotations_control.populate (target_archetype_descriptor, differential_view, selected_language)
				end
			elseif ev_notebook.selected_item = ontology_controls.ev_root_container then
				if attached target_archetype_descriptor and then target_archetype_descriptor.is_valid then
					ontology_controls.populate (target_archetype_descriptor, differential_view, selected_language)
				end
			elseif ev_notebook.selected_item = ev_serialised_hbox then
				if attached target_archetype_descriptor and then target_archetype_descriptor.is_valid then
					set_serialisation_control_texts
					populate_serialised
				end
			end
		end

	on_slot_map_suppliers_tree_key_press (key: EV_KEY)
			-- When the user presses Enter on an archetype, select it in the main window's explorer tree.
		do
			if not (ev_application.shift_pressed or ev_application.alt_pressed or ev_application.ctrl_pressed) then
				if key /= Void and then key.code = key_enter then
					select_archetype_from_gui_data.call ([slot_map_control.ev_suppliers_tree.selected_item])
				end
			end
		end

	on_slot_map_clients_tree_key_press (key: EV_KEY)
			-- When the user presses Enter on an archetype, select it in the main window's explorer tree.
		do
			if not (ev_application.shift_pressed or ev_application.alt_pressed or ev_application.ctrl_pressed) then
				if key /= Void and then key.code = key_enter then
					select_archetype_from_gui_data.call ([slot_map_control.ev_clients_tree.selected_item])
				end
			end
		end

	on_slot_map_suppliers_tree_double_click (x, y, button: INTEGER; x_tilt, y_tilt, pressure: DOUBLE; screen_x, screen_y: INTEGER)
			-- When the user double-clicks on an archetype, select it in the main window's explorer tree.
		do
			select_archetype_from_gui_data.call ([slot_map_control.ev_suppliers_tree.selected_item])
		end

	on_slot_map_clients_tree_double_click (x, y, button: INTEGER; x_tilt, y_tilt, pressure: DOUBLE; screen_x, screen_y: INTEGER)
			-- When the user double-clicks on an archetype, select it in the main window's explorer tree.
		do
			select_archetype_from_gui_data.call ([slot_map_control.ev_clients_tree.selected_item])
		end

	on_path_map_key_press (key: EV_KEY)
			-- When the user presses ctrl-C on row in path map, copy it to clipboard
		do
			if ev_application.ctrl_pressed and attached key and then key.code = key_c then
				ev_application.clipboard.set_text (path_map_control.selected_text)
			end
		end

	on_flat_view
			-- Called by `select_actions' of `flat_view_button'.
		do
			set_view (False)
		end

	on_differential_view
			-- Called by `select_actions' of `differential_view_button'.
		do
			set_view (True)
		end

	set_view (differential_flag: BOOLEAN)
			-- set view one way or the other
		do
			if (differential_flag and not differential_view) or -- changing from flat to diff
				(not differential_flag and differential_view)  -- changing from diff to flat
			then
				differential_view := differential_flag
				set_tab_texts
				repopulate
				on_select_archetype_notebook
			end
		end

	on_select_language
			-- Repopulate the view of the archetype when the user selects a different language.
		do
			selected_language := ev_language_combo.text.as_string_8
			if target_archetype_descriptor.is_valid then
				description_controls.populate (target_archetype, selected_language)
				node_map_control.repopulate (selected_language)
			end
			on_select_archetype_notebook
		end

	repopulate
		do
			clear_content
			if target_archetype_descriptor.is_valid then
				description_controls.populate (target_archetype, selected_language)
				node_map_control.populate (target_archetype_descriptor, differential_view, selected_language)
			end
		end

feature -- UI Feedback

	update_slots_tab_label (slots_count, used_by_count: INTEGER)
			-- On the Slots tab, indicate the numbers of slots and used-by's.
		do
			ev_notebook.set_item_text (slot_map_control.ev_root_container, create_message_content ("slots_tab_text", Void) + " (" + slots_count.out + "/" + used_by_count.out + ")")
		end

	select_ontology_item_from_code (a_code: attached STRING)
		do
			if is_term_code (a_code) then
				ontology_controls.select_term (a_code)
			elseif is_constraint_code (a_code) then
				ontology_controls.select_constraint (a_code)
			end
		end

feature -- Commands

	clear
			-- Wipe out content from visual controls.
		do
			ev_archetype_id.remove_text
			ev_adl_version_text.remove_text
			ev_language_combo.wipe_out
			ev_language_combo.remove_text
			clear_content
		end

	clear_content
			-- Wipe out content from visual controls.
		do
			description_controls.clear
			node_map_control.clear
			path_map_control.clear
			ontology_controls.clear
			slot_map_control.clear
			annotations_control.clear

			ev_serialised_rich_text.remove_text
		end

	populate (aca: attached ARCH_CAT_ARCHETYPE)
			-- Populate content from visual controls.
		do
			target_archetype_descriptor := aca
			clear
			if target_archetype_descriptor.is_valid then
				ev_archetype_id.set_text (target_archetype_descriptor.ontological_name)
				ev_adl_version_text.set_text (target_archetype_descriptor.differential_archetype.adl_version)
				selected_language := target_archetype_descriptor.differential_archetype.original_language.code_string
				populate_languages
				description_controls.populate (target_archetype, selected_language)
				node_map_control.populate (target_archetype_descriptor, differential_view, selected_language)
			end
		end

	select_flat_view
			-- Called by `select_actions' of `flat_view_button'.
		do
			if not ev_flat_view_button.is_selected then
				ev_flat_view_button.enable_select
				set_view (False)
			end
		end

	select_differential_view
			-- Called by `select_actions' of `differential_view_button'.
		do
			if not ev_differential_view_button.is_selected then
				ev_differential_view_button.enable_select
				set_view (True)
			end
		end

	change_adl_serialisation_version
			-- call this if changing it becase control labels and contents need to be repopulated
		do
			set_serialisation_control_texts
			if attached target_archetype_descriptor then
				populate_serialised
			end
		end

feature {NONE} -- Implementation

	text_widget_handler: GUI_TEXT_WIDGET_HANDLER
			-- FIXME: this is a hack to get round lack of standard behaviour in Vision2 for
			-- focussed text widgets & cut & paste behaviours

	description_controls: GUI_DESCRIPTION_CONTROLS

	node_map_control: GUI_NODE_MAP_CONTROL

	path_map_control: GUI_PATH_MAP_CONTROL

	slot_map_control: GUI_SLOT_MAP_CONTROL

	ontology_controls: GUI_ONTOLOGY_CONTROLS

	annotations_control: GUI_ANNOTATIONS_CONTROL

	ev_serialised_rich_text: EV_RICH_TEXT

	ev_action_bar, ev_serialised_hbox: EV_HORIZONTAL_BOX

	ev_serialise_rb_vbox, ev_serialise_controls_vbox: EV_VERTICAL_BOX

	ev_serialise_padding_cell: EV_CELL

	ev_view_tool_bar: EV_TOOL_BAR

	ev_differential_view_button, ev_flat_view_button: EV_TOOL_BAR_RADIO_BUTTON

	ev_view_label, ev_language_label, ev_adl_version_label, ev_adl_version_text: EV_LABEL

	ev_language_combo: EV_COMBO_BOX

	ev_serialise_controls_frame: EV_FRAME

	ev_adl_rb, ev_dadl_rb, ev_xml_rb: EV_RADIO_BUTTON

	selected_path_filter: STRING
			-- currently selected filter in path map, for saving across sessions
		do
			Result := path_map_control.selected_filter
		end

	path_map_selected_columns: attached ARRAYED_LIST [STRING]
			-- currently selected path map columns, for saving across sessions
		local
			ev_items: DYNAMIC_LIST [EV_LIST_ITEM]
		do
			ev_items := path_map_control.ev_column_check_list.checked_items
			create Result.make (0)
			from ev_items.start until ev_items.off loop
				Result.extend (ev_items.item.text.as_string_8)
				ev_items.forth
			end
		end

	select_archetype_from_gui_data: PROCEDURE [ANY, TUPLE [EV_ANY]]
			-- agent provided by upper level of GUI for doing something
			-- when an archetype in this tool is selected

	populate_languages
			-- Populate `language_combo' in the toolbar for currently selected archetype
		do
			ev_language_combo.select_actions.block
			ev_language_combo.set_strings (target_archetype_descriptor.differential_archetype.languages_available)
			ev_language_combo.do_all (agent (li: EV_LIST_ITEM) do if li.text.same_string (selected_language) then li.enable_select end end)
			ev_language_combo.select_actions.resume
		end

	populate_serialised
		require
			attached target_archetype_descriptor
		do
			if ev_adl_rb.is_selected then
				populate_source_text
			elseif ev_dadl_rb.is_selected then
				populate_dadl_text
			elseif ev_xml_rb.is_selected then
				populate_xml_text
			end
		end

	populate_source_text
			-- Display the selected archetype's differential or flat text in `source_rich_text', optionally with line numbers.
		require
			attached target_archetype_descriptor
		do
			if not differential_view then
				if target_archetype_descriptor.is_valid then
					populate_source_text_with_line_numbers (target_archetype_descriptor.flat_text)
				elseif target_archetype_descriptor.has_legacy_flat_file then
					populate_source_text_with_line_numbers (target_archetype_descriptor.legacy_flat_text)
				else -- not valid, but derived from differential source
					ev_serialised_rich_text.set_text (create_message_line ("compiler_no_flat_text", <<>>))
				end
			elseif target_archetype_descriptor.has_differential_file then
				populate_source_text_with_line_numbers (target_archetype_descriptor.differential_text)
			else
				ev_serialised_rich_text.set_text (create_message_line ("compiler_no_source_text", <<>>))
			end
		end

	populate_dadl_text
			-- Display the selected archetype's differential or flat text in `ev_serialised_rich_text', in dADL format.
		require
			attached target_archetype_descriptor
		do
			if target_archetype_descriptor.is_valid then
				if differential_view then
					ev_serialised_rich_text.set_text (utf8 (target_archetype_descriptor.serialise_object (False, Syntax_type_adl)))
				else
					ev_serialised_rich_text.set_text (utf8 (target_archetype_descriptor.serialise_object (True, Syntax_type_adl)))
				end
			else
				ev_serialised_rich_text.set_text (create_message_line ("compiler_no_dadl_text", <<>>))
			end
		end

	populate_xml_text
			-- Display the selected archetype's differential or flat text in `ev_serialised_rich_text', in XML format.
		require
			attached target_archetype_descriptor
		do
			if target_archetype_descriptor.is_valid then
				if differential_view then
					ev_serialised_rich_text.set_text (utf8 (target_archetype_descriptor.serialise_object (False, Syntax_type_xml)))
				else
					ev_serialised_rich_text.set_text (utf8 (target_archetype_descriptor.serialise_object (True, Syntax_type_xml)))
				end
			else
				ev_serialised_rich_text.set_text (create_message_line ("compiler_no_xml_text", <<>>))
			end
		end

	populate_source_text_with_line_numbers (text: attached STRING)
			-- Display `text' in `source_rich_text', optionally with each line preceded by line numbers.
		local
			s: STRING
			len, left_pos, right_pos, number: INTEGER
		do
			if show_line_numbers then
				from
					len := text.count
					create s.make (len)
					left_pos := 1
					number := 1
				until
					left_pos > len
				loop
					s.append (number.out)

					if number < 1000 then
						s.append ("%T")
					end

					s.append (" ")

					right_pos := text.index_of ('%N', left_pos)

					if right_pos = 0 then
						right_pos := len
					end

					s.append (text.substring (left_pos, right_pos))
					left_pos := right_pos + 1
					number := number + 1
				end
			else
				s := text
			end

			ev_serialised_rich_text.set_text (utf8 (s))
		end

	set_serialisation_control_texts
		do
			ev_adl_rb.set_text ("ADL " + adl_version_for_flat_output)
			ev_adl_rb.set_tooltip (create_message_content ("show_adl_serialisation_tooltip", <<adl_version_for_flat_output>>))
			ev_dadl_rb.set_text ("dADL " + adl_version_for_flat_output)
			ev_dadl_rb.set_tooltip (create_message_content ("show_dadl_serialisation_tooltip", <<adl_version_for_flat_output>>))
			ev_xml_rb.set_text ("XML " + adl_version_for_flat_output)
			ev_xml_rb.set_tooltip (create_message_content ("show_xml_serialisation_tooltip", <<adl_version_for_flat_output>>))
		end

	set_tab_texts
			-- set taxt on tabs depending on view
		do
			-- serialised rich text tab
			if differential_view then
				ev_notebook.set_item_text (ev_serialised_hbox, "Serialised (src)")
			else
				ev_notebook.set_item_text (ev_serialised_hbox, "Serialised (flat)")
			end
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
--| The Original Code is gui_archetype_tool.e.
--|
--| The Initial Developer of the Original Code is Thomas Beale.
--| Portions created by the Initial Developer are Copyright (C) 20011
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
