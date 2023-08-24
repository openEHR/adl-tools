note
	component:   "openEHR ADL Tools"
	description: "Archetype viewer tool"
	keywords:    "GUI, ADL"
	author:      "Thomas Beale <thomas.beale@openehr.org>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2011- The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class GUI_ARCHETYPE_VIEWER

inherit
	GUI_ARCHETYPE_TOOL
		redefine
			make, do_clear, do_populate, set_differential_tab_texts, set_flat_tab_texts, link_sub_tools
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
			archetype_tool_agents.set_path_select_action_agent (agent select_path_item_from_path)
			archetype_tool_agents.set_path_copy_action_agent (agent copy_path_to_clipbpoard)

			precursor

			-- interface map control
			create interface_map_control.make (agent on_path_map_key_press)
			ev_notebook.extend (interface_map_control.ev_root_container)
			ev_notebook.set_item_text (interface_map_control.ev_root_container, Tool_tab_name (Tool_tab_interface))
			ev_notebook.item_tab (interface_map_control.ev_root_container).set_pixmap (get_icon_pixmap ("tool/path_map"))
			tabs_index.put (interface_map_control.ev_root_container, Tool_tab_interface)

			-- slot map control
			create slot_map_control.make (agent update_slots_tab_label)
			ev_notebook.extend (slot_map_control.ev_root_container)
			ev_notebook.set_item_text (slot_map_control.ev_root_container, Tool_tab_name (Tool_tab_slots))
			ev_notebook.item_tab (slot_map_control.ev_root_container).set_pixmap (get_icon_pixmap ("tool/slot_map"))
			tabs_index.put (slot_map_control.ev_root_container, Tool_tab_slots)

			-- client/supplier control
			create clients_suppliers_control.make (agent update_clients_suppliers_tab_label)
			ev_notebook.extend (clients_suppliers_control.ev_root_container)
			ev_notebook.set_item_text (clients_suppliers_control.ev_root_container, Tool_tab_name (Tool_tab_clients_suppliers))
			ev_notebook.item_tab (clients_suppliers_control.ev_root_container).set_pixmap (get_icon_pixmap ("tool/archetype_reference"))
			tabs_index.put (clients_suppliers_control.ev_root_container, Tool_tab_clients_suppliers)

			-- source control
			create source_control.make
			ev_notebook.extend (source_control.ev_root_container)
			ev_notebook.set_item_text (source_control.ev_root_container, Tool_tab_name (Tool_tab_source))
			ev_notebook.item_tab (source_control.ev_root_container).set_pixmap (get_icon_pixmap ("tool/source"))
			tabs_index.put (source_control.ev_root_container, Tool_tab_source)

			-- serialisation control
			create serialisation_control.make
			ev_notebook.extend (serialisation_control.ev_root_container)
			ev_notebook.set_item_text (serialisation_control.ev_root_container, Tool_tab_name (Tool_tab_serialised))
			ev_notebook.item_tab (serialisation_control.ev_root_container).set_pixmap (get_icon_pixmap ("tool/serialised"))
			tabs_index.put (serialisation_control.ev_root_container, Tool_tab_serialised)

			-- instance control
			create instance_control.make
			ev_notebook.extend (instance_control.ev_root_container)
			ev_notebook.set_item_text (instance_control.ev_root_container, Tool_tab_name (Tool_tab_instance))
			ev_notebook.item_tab (instance_control.ev_root_container).set_pixmap (get_icon_pixmap ("tool/instance"))
			tabs_index.put (instance_control.ev_root_container, Tool_tab_instance)

			-- validity control
			create validity_report_control.make
			ev_notebook.extend (validity_report_control.ev_root_container)
			ev_notebook.set_item_text (validity_report_control.ev_root_container, Tool_tab_name (Tool_tab_validity))
			tabs_index.put (interface_map_control.ev_root_container, Tool_tab_validity)

			-- statistical info control
			create statistical_information_control.make
			ev_notebook.extend (statistical_information_control.ev_root_container)
			ev_notebook.set_item_text (statistical_information_control.ev_root_container, Tool_tab_name (Tool_tab_stats))
			tabs_index.put (statistical_information_control.ev_root_container, Tool_tab_stats)

			set_tab_appearance
			set_view_tab_texts

			ev_root_container.set_data (Current)

			link_sub_tools
		end

feature -- UI Feedback

	update_slots_tab_label (slots_count, used_by_count: INTEGER)
			-- On the Slots tab, indicate the numbers of slots and used-by's.
		do
			ev_notebook.set_item_text (slot_map_control.ev_root_container, Tool_tab_name (Tool_tab_slots) + " (" + slots_count.out + "/" + used_by_count.out + ")")
		end

	update_clients_suppliers_tab_label (suppliers_count, clients_count: INTEGER)
			-- On the Clients/Suppliers tab, indicate the numbers of suppliers and clients.
		do
			ev_notebook.set_item_text (clients_suppliers_control.ev_root_container, Tool_tab_name (Tool_tab_clients_suppliers) + " (" + suppliers_count.out + "/" + clients_count.out + ")")
		end

	select_path_item_from_path (a_path: STRING)
			-- select the `a_path' in the paths tab of this tool
		do
			if attached source as src and attached selected_language as sel_lang then
				ev_notebook.select_item (interface_map_control.ev_root_container)
				if not interface_map_control.is_populated then
					interface_map_control.populate (src, differential_view, sel_lang)
				end
				interface_map_control.select_path (a_path)
			end
		end

	copy_path_to_clipbpoard (a_path: STRING)
			-- When the user presses ctrl-C on row in path map, copy it to clipboard
		do
			ev_application.clipboard.set_text (a_path)
		end

feature {NONE} -- Events

	on_path_map_key_press (key: EV_KEY)
			-- When the user presses ctrl-C on row in path map, copy it to clipboard
		do
			if ev_application.ctrl_pressed and attached key and then key.code = key_c then
				ev_application.clipboard.set_text (interface_map_control.selected_row)
			end
		end

feature {NONE} -- Implementation

	make_core_tools
		do
			create description_controls.make
			create definition_control.make
			create terminology_controls.make
			create annotations_control.make
		end

	link_sub_tools
		do
			precursor
			add_sub_tool (interface_map_control)
			add_sub_tool (slot_map_control)
			add_sub_tool (clients_suppliers_control)
			add_sub_tool (source_control)
			add_sub_tool (serialisation_control)
			add_sub_tool (instance_control)
			add_sub_tool (validity_report_control)
			add_sub_tool (statistical_information_control)
		end

	do_clear
			-- Wipe out content from visual controls.
		do
			precursor
			interface_map_control.clear
			slot_map_control.clear
			validity_report_control.clear
			statistical_information_control.clear
			source_control.clear
			serialisation_control.clear
			instance_control.clear
		end

	do_populate
		do
			precursor
			if attached source as src and attached selected_language as sel_lang then
				do_all_sub_tools (
					agent (a_tool: GUI_TOOL)
						do
							if attached {GUI_ARCHETYPE_TARGETTED_TOOL} a_tool as an_arch_tool and then an_arch_tool.is_populated then
								repopulate_tool (an_arch_tool)
							end
						end
				)
				if src.is_valid then
					ev_notebook.select_item (tabs_index_item (default_tool_tab))
				else
					ev_notebook.select_item (validity_report_control.ev_root_container)
				end
				set_tab_appearance
				set_view_tab_texts
			end
		end

	interface_map_control: GUI_INTERFACE_CONTROL

	slot_map_control: GUI_SLOT_MAP_CONTROL

	clients_suppliers_control: GUI_CLIENTS_SUPPLIERS_CONTROL

	source_control: GUI_SOURCE_CONTROL

	validity_report_control: GUI_VALIDITY_REPORT_CONTROL

	statistical_information_control: GUI_ARCHETYPE_INFORMATION_TOOL

	serialisation_control: GUI_SERIALISATION_CONTROL

	instance_control: GUI_INSTANCE_CONTROL

	set_differential_tab_texts
			-- set text on tabs for differential form of archetype
		do
			ev_notebook.set_item_text (serialisation_control.ev_root_container, get_text ({ADL_MESSAGES_IDS}.ec_serialised_diff_tab_text))
		end

	set_flat_tab_texts
			-- set text on tabs for flat form of archetype
		do
			ev_notebook.set_item_text (serialisation_control.ev_root_container, get_text ({ADL_MESSAGES_IDS}.ec_serialised_flat_tab_text))
		end

	set_tab_appearance
			-- set visual appearance of tabs according to current state of archetype
		do
			-- set appearance of validity tab according to whether there are errors or not
			if not attached source as src or else (src.is_valid and then not src.has_warnings) then
				ev_notebook.item_tab (validity_report_control.ev_root_container).set_pixmap (get_icon_pixmap ("tool/errors_grey"))
			else
				ev_notebook.item_tab (validity_report_control.ev_root_container).set_pixmap (get_icon_pixmap ("tool/errors"))
			end

			-- statistics tab
			if attached source as src and then src.is_valid then
				ev_notebook.item_tab (statistical_information_control.ev_root_container).set_pixmap (get_icon_pixmap ("tool/statistics"))
			else
				ev_notebook.item_tab (statistical_information_control.ev_root_container).set_pixmap (get_icon_pixmap ("tool/statistics_grey"))
			end
		end

end


