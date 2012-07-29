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
	GUI_ARCHETYPE_TOOL_FRAME
		redefine
			make, do_clear, do_populate, disable_edit
		end

	EV_KEY_CONSTANTS
		export
			{NONE} all
		end

	ARCHETYPE_TERM_CODE_TOOLS
		export
			{NONE} all
		end

	EV_SHARED_APPLICATION
		export
			{NONE} all
		end
create
	make

feature {NONE}-- Initialization

	make
		do
			precursor

			-- create subordinate widgets
			create description_controls.make (Void)
			ev_notebook.extend (description_controls.ev_root_container)
			ev_notebook.set_item_text (description_controls.ev_root_container, get_text ("description_tab_text"))
			ev_notebook.item_tab (description_controls.ev_root_container).set_pixmap (get_icon_pixmap ("tool/description"))

			create node_map_control.make (agent select_ontology_item_from_code, agent select_path_item_from_path)
			ev_notebook.extend (node_map_control.ev_root_container)
			ev_notebook.set_item_text (node_map_control.ev_root_container, get_text ("definition_tab_text"))
			ev_notebook.item_tab (node_map_control.ev_root_container).set_pixmap (get_icon_pixmap ("tool/node_map"))

			create ontology_controls.make (Void)
			ev_notebook.extend (ontology_controls.ev_root_container)
			ev_notebook.set_item_text (ontology_controls.ev_root_container, get_text ("terminology_tab_text"))
			ev_notebook.item_tab (ontology_controls.ev_root_container).set_pixmap (get_icon_pixmap ("tool/terminology"))

			create annotations_control.make
			ev_notebook.extend (annotations_control.ev_root_container)
			ev_notebook.set_item_text (annotations_control.ev_root_container, get_text ("annotations_tab_text"))
			ev_notebook.item_tab (annotations_control.ev_root_container).set_pixmap (get_icon_pixmap ("tool/annotations"))

			create path_map_control.make (agent on_path_map_key_press)
			ev_notebook.extend (path_map_control.ev_root_container)
			ev_notebook.set_item_text (path_map_control.ev_root_container, get_text ("paths_tab_text"))
			ev_notebook.item_tab (path_map_control.ev_root_container).set_pixmap (get_icon_pixmap ("tool/path_map"))

			create slot_map_control.make (agent update_slots_tab_label)
			ev_notebook.extend (slot_map_control.ev_root_container)
			ev_notebook.set_item_text (slot_map_control.ev_root_container, get_text ("slots_tab_text"))
			ev_notebook.item_tab (slot_map_control.ev_root_container).set_pixmap (get_icon_pixmap ("tool/slot_map"))
			slot_map_control.ev_suppliers_tree.key_press_actions.force (agent on_slot_map_suppliers_tree_key_press)
			slot_map_control.ev_clients_tree.key_press_actions.force (agent on_slot_map_clients_tree_key_press)
			slot_map_control.ev_suppliers_tree.pointer_double_press_actions.force (agent on_slot_map_suppliers_tree_double_click)
			slot_map_control.ev_clients_tree.pointer_double_press_actions.force (agent on_slot_map_clients_tree_double_click)

			create source_control.make
			ev_notebook.extend (source_control.ev_root_container)
			ev_notebook.set_item_text (source_control.ev_root_container, get_text ("source_tab_text"))
			ev_notebook.item_tab (source_control.ev_root_container).set_pixmap (get_icon_pixmap ("tool/source"))

			create serialisation_control.make
			ev_notebook.extend (serialisation_control.ev_root_container)
			ev_notebook.set_item_text (serialisation_control.ev_root_container, get_text ("serialised_tab_text"))
			ev_notebook.item_tab (serialisation_control.ev_root_container).set_pixmap (get_icon_pixmap ("tool/serialised"))

			create validity_report_control.make
			ev_notebook.extend (validity_report_control.ev_root_container)
			ev_notebook.set_item_text (validity_report_control.ev_root_container, get_text ("validity_tab_text"))

			create statistical_information_control.make
			ev_notebook.extend (statistical_information_control.ev_root_container)
			ev_notebook.set_item_text (statistical_information_control.ev_root_container, get_text ("stat_info_tab_text"))


			set_tab_appearance
			set_tab_texts
		end

feature -- UI Feedback

	update_slots_tab_label (slots_count, used_by_count: INTEGER)
			-- On the Slots tab, indicate the numbers of slots and used-by's.
		do
			ev_notebook.set_item_text (slot_map_control.ev_root_container, get_msg ("slots_tab_text", Void) + " (" + slots_count.out + "/" + used_by_count.out + ")")
		end

	select_ontology_item_from_code (a_code: attached STRING)
			-- select `a_code' in the ontology tab of this tool
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

	select_path_item_from_path (a_path: attached STRING)
			-- select the `a_path' in the paths tab of this tool
		do
			if not path_map_control.is_populated then
				path_map_control.populate (source, differential_view, selected_language)
			end
			ev_notebook.select_item (path_map_control.ev_root_container)
			path_map_control.select_path (a_path)
		end

feature -- Commands

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
			if node_map_control.can_repopulate then
				node_map_control.repopulate
			end
		end

	disable_edit
		do
			description_controls.disable_edit
		end

feature {NONE} -- Events

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

feature {NONE} -- Implementation

	do_clear
			-- Wipe out content from visual controls.
		do
			precursor
			description_controls.clear
			node_map_control.clear
			path_map_control.clear
			ontology_controls.clear
			slot_map_control.clear
			annotations_control.clear
			serialisation_control.clear
			validity_report_control.clear
			statistical_information_control.clear
			source_control.clear
		end

	do_populate
		do
			precursor
			if source.is_valid then
				-- pre-populate the description and node-map controls, or else populate the validity control and show it
				description_controls.populate (source, differential_view, selected_language)
				node_map_control.populate (source, differential_view, selected_language)
				ev_notebook.select_item (node_map_control.ev_root_container)
			else
				ev_notebook.select_item (validity_report_control.ev_root_container)
			end
			set_tab_appearance
		end

	description_controls: GUI_DESCRIPTION_CONTROLS

	node_map_control: GUI_DEFINITION_CONTROL

	path_map_control: GUI_PATH_MAP_CONTROL

	slot_map_control: GUI_SLOT_MAP_CONTROL

	ontology_controls: GUI_ONTOLOGY_CONTROLS

	annotations_control: GUI_ANNOTATIONS_CONTROL

	serialisation_control: GUI_SERIALISATION_CONTROL

	source_control: GUI_SOURCE_CONTROL

	validity_report_control: GUI_VALIDITY_REPORT_CONTROL

	statistical_information_control: GUI_ARCHETYPE_INFORMATION_TOOL

	selected_path_filter: STRING
			-- currently selected filter in path map, for saving across sessions
		do
			Result := path_map_control.selected_filter
		end

	set_differential_tab_texts
			-- set text on tabs for differential form of archetype
		do
			ev_notebook.set_item_text (serialisation_control.ev_root_container, get_msg ("serialised_diff_tab_text", Void))
		end

	set_flat_tab_texts
			-- set text on tabs for flat form of archetype
		do
			ev_notebook.set_item_text (serialisation_control.ev_root_container, get_msg ("serialised_flat_tab_text", Void))
		end

	set_tab_appearance
			-- set visual appearance of validity tab according to whether there are errors or not
		do
			if not attached source or else source.is_valid then
				ev_notebook.item_tab (validity_report_control.ev_root_container).set_pixmap (get_icon_pixmap ("tool/errors_grey"))
			else
				ev_notebook.item_tab (validity_report_control.ev_root_container).set_pixmap (get_icon_pixmap ("tool/errors"))
			end
			if attached source and then source.is_valid then
				ev_notebook.item_tab (statistical_information_control.ev_root_container).set_pixmap (get_icon_pixmap ("tool/statistics"))
			else
				ev_notebook.item_tab (statistical_information_control.ev_root_container).set_pixmap (get_icon_pixmap ("tool/statistics_grey"))
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
