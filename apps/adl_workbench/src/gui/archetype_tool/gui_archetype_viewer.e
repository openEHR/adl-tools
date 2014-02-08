note
	component:   "openEHR ADL Tools"
	description: "Archetype viewer tool"
	keywords:    "GUI, ADL"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2011 Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class GUI_ARCHETYPE_VIEWER

inherit
	GUI_ARCHETYPE_TOOL
		redefine
			make, do_clear, do_populate, set_differential_tab_texts, set_flat_tab_texts
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
			-- set up shared agents
			tool_agents.set_path_select_action_agent (agent select_path_item_from_path)

			precursor

			-- path map control
			create path_map_control.make (agent on_path_map_key_press)
			ev_notebook.extend (path_map_control.ev_root_container)
			ev_notebook.set_item_text (path_map_control.ev_root_container, get_text (ec_paths_tab_text))
			ev_notebook.item_tab (path_map_control.ev_root_container).set_pixmap (get_icon_pixmap ("tool/path_map"))

			-- slot map control
			create slot_map_control.make (agent update_slots_tab_label)
			ev_notebook.extend (slot_map_control.ev_root_container)
			ev_notebook.set_item_text (slot_map_control.ev_root_container, get_text (ec_slots_tab_text))
			ev_notebook.item_tab (slot_map_control.ev_root_container).set_pixmap (get_icon_pixmap ("tool/slot_map"))
			slot_map_control.ev_suppliers_tree.key_press_actions.force (agent on_slot_map_suppliers_tree_key_press)
			slot_map_control.ev_clients_tree.key_press_actions.force (agent on_slot_map_clients_tree_key_press)
			slot_map_control.ev_suppliers_tree.pointer_double_press_actions.force (agent on_slot_map_suppliers_tree_double_click)
			slot_map_control.ev_clients_tree.pointer_double_press_actions.force (agent on_slot_map_clients_tree_double_click)

			-- source control
			create source_control.make
			ev_notebook.extend (source_control.ev_root_container)
			ev_notebook.set_item_text (source_control.ev_root_container, get_text (ec_source_tab_text))
			ev_notebook.item_tab (source_control.ev_root_container).set_pixmap (get_icon_pixmap ("tool/source"))

			-- serialisation control
			create serialisation_control.make
			ev_notebook.extend (serialisation_control.ev_root_container)
			ev_notebook.set_item_text (serialisation_control.ev_root_container, get_text (ec_serialised_tab_text))
			ev_notebook.item_tab (serialisation_control.ev_root_container).set_pixmap (get_icon_pixmap ("tool/serialised"))

			-- validity control
			create validity_report_control.make
			ev_notebook.extend (validity_report_control.ev_root_container)
			ev_notebook.set_item_text (validity_report_control.ev_root_container, get_text (ec_validity_tab_text))

			-- statistical info control
			create statistical_information_control.make
			ev_notebook.extend (statistical_information_control.ev_root_container)
			ev_notebook.set_item_text (statistical_information_control.ev_root_container, get_text (ec_stat_info_tab_text))

			set_tab_appearance
			set_view_tab_texts

			ev_root_container.set_data (Current)
		end

feature -- UI Feedback

	update_slots_tab_label (slots_count, used_by_count: INTEGER)
			-- On the Slots tab, indicate the numbers of slots and used-by's.
		do
			ev_notebook.set_item_text (slot_map_control.ev_root_container, get_msg (ec_slots_tab_text, Void) + " (" + slots_count.out + "/" + used_by_count.out + ")")
		end

	select_path_item_from_path (a_path: STRING)
			-- select the `a_path' in the paths tab of this tool
		do
			if attached source as src and attached selected_language as sel_lang then
				if not path_map_control.is_populated then
					path_map_control.populate (src, differential_view, sel_lang)
				end
				ev_notebook.select_item (path_map_control.ev_root_container)
				path_map_control.select_path (a_path)
			end
		end

feature -- Commands

	change_adl_serialisation_version
			-- call this if changing it becase control labels and contents need to be repopulated
		do
			if attached source and serialisation_control.can_repopulate then
				serialisation_control.repopulate
			end
		end

feature {NONE} -- Events

	on_slot_map_suppliers_tree_key_press (key: EV_KEY)
			-- When the user presses Enter on an archetype, select it in the main window's explorer tree.
		do
			if not (ev_application.shift_pressed or ev_application.alt_pressed or ev_application.ctrl_pressed) then
				if key.code = key_enter and attached slot_map_control.ev_suppliers_tree.selected_item as sel_item then
					gui_agents.select_archetype_from_gui_data_agent.call ([sel_item])
				end
			end
		end

	on_slot_map_clients_tree_key_press (key: EV_KEY)
			-- When the user presses Enter on an archetype, select it in the main window's explorer tree.
		do
			if not (ev_application.shift_pressed or ev_application.alt_pressed or ev_application.ctrl_pressed) then
				if key.code = key_enter and attached slot_map_control.ev_clients_tree.selected_item as sel_item then
					gui_agents.select_archetype_from_gui_data_agent.call ([sel_item])
				end
			end
		end

	on_slot_map_suppliers_tree_double_click (x, y, button: INTEGER; x_tilt, y_tilt, pressure: DOUBLE; screen_x, screen_y: INTEGER)
			-- When the user double-clicks on an archetype, select it in the main window's explorer tree.
		do
			if attached slot_map_control.ev_suppliers_tree.selected_item as sel_item then
				gui_agents.select_archetype_from_gui_data_agent.call ([sel_item])
			end
		end

	on_slot_map_clients_tree_double_click (x, y, button: INTEGER; x_tilt, y_tilt, pressure: DOUBLE; screen_x, screen_y: INTEGER)
			-- When the user double-clicks on an archetype, select it in the main window's explorer tree.
		do
			if attached slot_map_control.ev_clients_tree.selected_item as sel_item then
				gui_agents.select_archetype_from_gui_data_agent.call ([sel_item])
			end
		end

	on_path_map_key_press (key: EV_KEY)
			-- When the user presses ctrl-C on row in path map, copy it to clipboard
		do
			if ev_application.ctrl_pressed and attached key and then key.code = key_c then
				ev_application.clipboard.set_text (path_map_control.selected_text)
			end
		end

feature {NONE} -- Implementation

	make_core_tools
		do
			create description_controls.make
			create definition_control.make
			create terminology_controls.make
			create annotations_control.make
			create serialisation_control.make
		end

	do_clear
			-- Wipe out content from visual controls.
		do
			precursor
			path_map_control.clear
			slot_map_control.clear
			validity_report_control.clear
			statistical_information_control.clear
			source_control.clear
			serialisation_control.clear
		end

	do_populate
		do
			precursor
			if attached source as src and attached selected_language as sel_lang then
				if src.is_valid then
					-- pre-populate the description and node-map controls, or else populate the validity control and show it
					description_controls.populate (src, differential_view, sel_lang)
					definition_control.populate (src, differential_view, sel_lang)
					ev_notebook.select_item (definition_control.ev_root_container)
				else
					ev_notebook.select_item (validity_report_control.ev_root_container)
				end
				set_tab_appearance
				set_view_tab_texts
			end
		end

	attach_gui_context
		do
			if attached source as src and then not src.has_gui_context then
				src.set_gui_context (create {ACA_EDITOR_STATE}.make (src))
			end
		end

	path_map_control: GUI_PATH_MAP_CONTROL

	slot_map_control: GUI_SLOT_MAP_CONTROL

	source_control: GUI_SOURCE_CONTROL

	validity_report_control: GUI_VALIDITY_REPORT_CONTROL

	statistical_information_control: GUI_ARCHETYPE_INFORMATION_TOOL

	serialisation_control: GUI_SERIALISATION_CONTROL

	set_differential_tab_texts
			-- set text on tabs for differential form of archetype
		do
			ev_notebook.set_item_text (serialisation_control.ev_root_container, get_msg (ec_serialised_diff_tab_text, Void))
		end

	set_flat_tab_texts
			-- set text on tabs for flat form of archetype
		do
			ev_notebook.set_item_text (serialisation_control.ev_root_container, get_msg (ec_serialised_flat_tab_text, Void))
		end

	set_tab_appearance
			-- set visual appearance of validity tab according to whether there are errors or not
		do
			if not attached source as src or else (src.is_valid and then not src.has_warnings) then
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


