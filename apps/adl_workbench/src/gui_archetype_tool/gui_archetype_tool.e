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
	GUI_ARCHETYPE_TARGETTED_TOOL

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

feature -- Definitions

	arch_notebook_min_height: INTEGER = 350

feature {NONE}-- Initialization

	make
		do
			-- create root widget
			create ev_root_container
			ev_root_container.set_data (Current)

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
			create serialisation_control.make
			create source_control.make
			create validity_report_control.make
			create statistical_information_control.make

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

			ev_notebook.extend (description_controls.ev_root_container)
			ev_notebook.extend (node_map_control.ev_root_container)
			ev_notebook.extend (annotations_control.ev_root_container)
			ev_notebook.extend (path_map_control.ev_root_container)
			ev_notebook.extend (slot_map_control.ev_root_container)
			ev_notebook.extend (ontology_controls.ev_root_container)
			ev_notebook.extend (source_control.ev_root_container)
			ev_notebook.extend (serialisation_control.ev_root_container)
			ev_notebook.extend (validity_report_control.ev_root_container)
			ev_notebook.extend (statistical_information_control.ev_root_container)

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
			ev_differential_view_button.set_pixmap (pixmaps ["diff_class"])
			ev_flat_view_button.set_pixmap (pixmaps ["flat_class"])
			ev_differential_view_button.set_tooltip (create_message_content ("differential_view_button_tooltip", Void))
			ev_flat_view_button.set_tooltip (create_message_content ("flat_view_button_tooltip", Void))
			ev_language_label.set_text (create_message_content ("language_label", Void))
			ev_language_label.set_minimum_width (70)
			ev_language_label.set_minimum_height (23)
			ev_language_label.align_text_right
			ev_language_combo.set_tooltip (create_message_content ("language_combo_tooltip", Void))
			ev_language_combo.set_minimum_width (60)
			ev_language_combo.set_minimum_height (23)
			ev_language_combo.disable_edit
			ev_adl_version_label.set_text (create_message_content ("adl_version_label_text", Void))
			ev_adl_version_label.set_minimum_width (80)
			ev_adl_version_label.align_text_right
			ev_adl_version_label.set_tooltip (create_message_content ("adl_version_label_tooltip", Void))

			ev_notebook.set_minimum_width (500)
			ev_notebook.set_minimum_height (arch_notebook_min_height)

			ev_notebook.set_item_text (description_controls.ev_root_container, create_message_content ("description_tab_text", Void))
			ev_notebook.item_tab (description_controls.ev_root_container).set_pixmap (pixmaps ["description"])

			ev_notebook.set_item_text (node_map_control.ev_root_container, create_message_content ("definition_tab_text", Void))
			ev_notebook.item_tab (node_map_control.ev_root_container).set_pixmap (pixmaps ["node_map"])

			ev_notebook.set_item_text (path_map_control.ev_root_container, create_message_content ("paths_tab_text", Void))
			ev_notebook.item_tab (path_map_control.ev_root_container).set_pixmap (pixmaps ["path_map"])

			ev_notebook.set_item_text (slot_map_control.ev_root_container, create_message_content ("slots_tab_text", Void))
			ev_notebook.item_tab (slot_map_control.ev_root_container).set_pixmap (pixmaps ["slot_map"])

			ev_notebook.set_item_text (ontology_controls.ev_root_container, create_message_content ("terminology_tab_text", Void))
			ev_notebook.item_tab (ontology_controls.ev_root_container).set_pixmap (pixmaps ["terminology"])

			ev_notebook.set_item_text (annotations_control.ev_root_container, create_message_content ("annotations_tab_text", Void))
			ev_notebook.item_tab (annotations_control.ev_root_container).set_pixmap (pixmaps ["annotations"])

			ev_notebook.set_item_text (serialisation_control.ev_root_container, create_message_content ("serialised_tab_text", Void))
			ev_notebook.item_tab (serialisation_control.ev_root_container).set_pixmap (pixmaps ["serialised"])

			ev_notebook.set_item_text (source_control.ev_root_container, create_message_content ("source_tab_text", Void))
			ev_notebook.item_tab (source_control.ev_root_container).set_pixmap (pixmaps ["source"])

			ev_notebook.set_item_text (validity_report_control.ev_root_container, create_message_content ("validity_tab_text", Void))

			ev_notebook.set_item_text (statistical_information_control.ev_root_container, create_message_content ("stat_info_tab_text", Void))

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

			differential_view := True
			ev_differential_view_button.enable_select
			set_tab_texts
			set_tab_appearance
		end

feature -- Access

	ev_archetype_id: EV_TEXT_FIELD

	ev_root_container: EV_VERTICAL_BOX

	ev_notebook: EV_NOTEBOOK

feature -- Events

	on_select_archetype_notebook
			-- Called by `selection_actions' of `archetype_notebook'.
		do
			if attached {GUI_ARCHETYPE_TARGETTED_TOOL} ev_notebook.selected_item.data as arch_tool and attached source then
				if (source /= arch_tool.source or else
					not arch_tool.is_populated or else
					arch_tool.last_populate_timestamp < source.last_compile_attempt_timestamp or
					differential_view /= arch_tool.differential_view or
					selected_language /= arch_tool.selected_language) and
					arch_tool.can_populate (source)
				then
					arch_tool.populate (source, differential_view, selected_language)
				end
			end
		end

feature -- UI Feedback

	update_slots_tab_label (slots_count, used_by_count: INTEGER)
			-- On the Slots tab, indicate the numbers of slots and used-by's.
		do
			ev_notebook.set_item_text (slot_map_control.ev_root_container, create_message_content ("slots_tab_text", Void) + " (" + slots_count.out + "/" + used_by_count.out + ")")
		end

	select_ontology_item_from_code (a_code: attached STRING)
			-- if a code is selected in teh archetype definition tree, select the code in the ontology part of the UI
		do
			if not ontology_controls.is_populated then
				ontology_controls.populate (source, differential_view, selected_language)
			end
			ev_notebook.select_item (ontology_controls.ev_root_container)
			if is_term_code (a_code) then
				ontology_controls.select_term (a_code)
			elseif is_constraint_code (a_code) then
				ontology_controls.select_constraint (a_code)
			end
		end

feature -- Commands

	select_flat_view
			-- Called from MAIN_WINDOW View menu
		do
			if not ev_flat_view_button.is_selected then
				ev_flat_view_button.enable_select
				set_view (False)
			end
		end

	select_differential_view
			-- Called from MAIN_WINDOW View menu
		do
			if not ev_differential_view_button.is_selected then
				ev_differential_view_button.enable_select
				set_view (True)
			end
		end

	change_adl_serialisation_version
			-- call this if changing it becase control labels and contents need to be repopulated
		do
			if attached source and serialisation_control.can_repopulate then
				serialisation_control.repopulate
			end
		end

	update_rm_icons_setting
			-- call this routine if rm_icons setting changed elsewhere in tool
		do
			node_map_control.update_rm_icons_cb
		end

feature {NONE} -- Events

	on_flat_view
			-- Called by `select_actions' of `ev_flat_view_button' in this tool
		do
			set_view (False)
		end

	on_differential_view
			-- Called by `select_actions' of `ev_differential_view_button' in this tool
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
				on_select_archetype_notebook
			end
		end

	on_slot_map_suppliers_tree_key_press (key: EV_KEY)
			-- When the user presses Enter on an archetype, select it in the main window's explorer tree.
		do
			if not (ev_application.shift_pressed or ev_application.alt_pressed or ev_application.ctrl_pressed) then
				if key /= Void and then key.code = key_enter then
					gui_agents.select_archetype_from_gui_data_agent.call ([slot_map_control.ev_suppliers_tree.selected_item])
				end
			end
		end

	on_slot_map_clients_tree_key_press (key: EV_KEY)
			-- When the user presses Enter on an archetype, select it in the main window's explorer tree.
		do
			if not (ev_application.shift_pressed or ev_application.alt_pressed or ev_application.ctrl_pressed) then
				if key /= Void and then key.code = key_enter then
					gui_agents.select_archetype_from_gui_data_agent.call ([slot_map_control.ev_clients_tree.selected_item])
				end
			end
		end

	on_slot_map_suppliers_tree_double_click (x, y, button: INTEGER; x_tilt, y_tilt, pressure: DOUBLE; screen_x, screen_y: INTEGER)
			-- When the user double-clicks on an archetype, select it in the main window's explorer tree.
		do
			gui_agents.select_archetype_from_gui_data_agent.call ([slot_map_control.ev_suppliers_tree.selected_item])
		end

	on_slot_map_clients_tree_double_click (x, y, button: INTEGER; x_tilt, y_tilt, pressure: DOUBLE; screen_x, screen_y: INTEGER)
			-- When the user double-clicks on an archetype, select it in the main window's explorer tree.
		do
			gui_agents.select_archetype_from_gui_data_agent.call ([slot_map_control.ev_clients_tree.selected_item])
		end

	on_path_map_key_press (key: EV_KEY)
			-- When the user presses ctrl-C on row in path map, copy it to clipboard
		do
			if ev_application.ctrl_pressed and attached key and then key.code = key_c then
				ev_application.clipboard.set_text (path_map_control.selected_text)
			end
		end

	on_select_language
			-- Repopulate the view of the archetype when the user selects a different language.
		do
			selected_language := ev_language_combo.text.as_string_8
			on_select_archetype_notebook
		end

feature {NONE} -- Implementation

	do_clear
			-- Wipe out content from visual controls.
		do
			ev_archetype_id.remove_text
			ev_adl_version_text.remove_text
			ev_language_combo.wipe_out
			ev_language_combo.remove_text

			-- Wipe out content from subordinate controls.
			description_controls.clear
			node_map_control.clear
			path_map_control.clear
			ontology_controls.clear
			slot_map_control.clear
			annotations_control.clear
			serialisation_control.clear
			validity_report_control.clear
			statistical_information_control.clear
		end

	do_populate
		do
			if source.is_valid then
				ev_archetype_id.set_text (source.qualified_name)
				ev_adl_version_text.set_text (source.differential_archetype.adl_version)
				selected_language := source.differential_archetype.original_language.code_string
				populate_languages

				-- pre-populate the description and node-map controls, or else populate the validity control and show it
				description_controls.populate (source, differential_view, selected_language)
				node_map_control.populate (source, differential_view, selected_language)
			else
				ev_notebook.select_item (validity_report_control.ev_root_container)
			end
			set_tab_appearance
		end

	text_widget_handler: GUI_TEXT_WIDGET_HANDLER
			-- FIXME: this is a hack to get round lack of standard behaviour in Vision2 for
			-- focussed text widgets & cut & paste behaviours

	description_controls: GUI_DESCRIPTION_CONTROLS

	node_map_control: GUI_NODE_MAP_CONTROL

	path_map_control: GUI_PATH_MAP_CONTROL

	slot_map_control: GUI_SLOT_MAP_CONTROL

	ontology_controls: GUI_ONTOLOGY_CONTROLS

	annotations_control: GUI_ANNOTATIONS_CONTROL

	serialisation_control: GUI_SERIALISATION_CONTROL

	source_control: GUI_SOURCE_CONTROL

	validity_report_control: GUI_VALIDITY_REPORT_CONTROL

	statistical_information_control: GUI_ARCHETYPE_INFORMATION_TOOL

	ev_action_bar: EV_HORIZONTAL_BOX

	ev_view_tool_bar: EV_TOOL_BAR

	ev_differential_view_button, ev_flat_view_button: EV_TOOL_BAR_RADIO_BUTTON

	ev_view_label, ev_language_label, ev_adl_version_label, ev_adl_version_text: EV_LABEL

	ev_language_combo: EV_COMBO_BOX

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

	populate_languages
			-- Populate `language_combo' in the toolbar for currently selected archetype
		do
			ev_language_combo.select_actions.block
			ev_language_combo.set_strings (source.differential_archetype.languages_available)
			ev_language_combo.do_all (agent (li: EV_LIST_ITEM) do if li.text.same_string (selected_language) then li.enable_select end end)
			ev_language_combo.select_actions.resume
		end

	set_tab_texts
			-- set taxt on tabs depending on view
		do
			-- serialised rich text tab
			if differential_view then
				ev_notebook.set_item_text (serialisation_control.ev_root_container, create_message_content ("serialised_diff_tab_text", Void))
			else
				ev_notebook.set_item_text (serialisation_control.ev_root_container, create_message_content ("serialised_flat_tab_text", Void))
			end
		end

	set_tab_appearance
			-- set visual appearance of validity tab according to whether there are errors or not
		do
			if not attached source or else source.is_valid then
				ev_notebook.item_tab (validity_report_control.ev_root_container).set_pixmap (pixmaps ["errors_grey"])
			else
				ev_notebook.item_tab (validity_report_control.ev_root_container).set_pixmap (pixmaps ["errors"])
			end
			if attached source and then source.is_valid then
				ev_notebook.item_tab (statistical_information_control.ev_root_container).set_pixmap (pixmaps ["statistics"])
			else
				ev_notebook.item_tab (statistical_information_control.ev_root_container).set_pixmap (pixmaps ["statistics_grey"])
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
