note
	component:   "openEHR ADL Tools"
	description: "Client/supplier control - Visualise client/supplier relations"
	keywords:    "archetype, reference, gui"
	author:      "Thomas Beale"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2008-2012 Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class GUI_CLIENTS_SUPPLIERS_CONTROL

inherit
	GUI_ARCHETYPE_TARGETTED_TOOL
		redefine
			can_populate, can_repopulate
		end

	SHARED_ARCHETYPE_LIBRARIES
		export
			{NONE} all;
			{ANY} has_current_library
		end

	STRING_UTILITIES
		export
			{NONE} all
		end

create
	make

feature {NONE} -- Initialisation

	make (a_visual_update_action: PROCEDURE [ANY, TUPLE [INTEGER, INTEGER]])
		do
			create gui_controls.make (0)
			create supplier_ids.make (0)
			supplier_ids.compare_objects
			create client_ids.make (0)
			client_ids.compare_objects

			-- create widgets
			create ev_root_container
			ev_root_container.set_padding (Default_padding_width)
			ev_root_container.set_border_width (Default_border_width)

			-- Suppliers
			create suppliers_frame
			suppliers_frame.set_text (get_msg (ec_suppliers_frame_text, Void))
			ev_root_container.extend (suppliers_frame)

			create evx_suppliers_list.make_readonly ("", agent supplier_ids, 0, 0, True)
			evx_suppliers_list.ev_data_control.pointer_button_press_actions.force_extend (agent suppliers_list_context_menu)
			suppliers_frame.extend (evx_suppliers_list.ev_root_container)
			gui_controls.extend (evx_suppliers_list)

			-- Clients
			create clients_frame
			clients_frame.set_text (get_msg (ec_clients_frame_text, Void))
			ev_root_container.extend (clients_frame)

			create evx_clients_list.make_readonly ("", agent client_ids, 0, 0, True)
			evx_clients_list.ev_data_control.pointer_button_press_actions.force_extend (agent clients_list_context_menu)
			clients_frame.extend (evx_clients_list.ev_root_container)
			gui_controls.extend (evx_clients_list)

			-- set visual characteristics
			visual_update_action := a_visual_update_action

			ev_root_container.set_data (Current)
		end

feature -- Access

	ev_root_container: EV_VERTICAL_BOX

	evx_suppliers_list, evx_clients_list: EVX_TEXT_LIST_CONTROL

feature -- Status Report

	can_populate (a_source: attached like source): BOOLEAN
		do
			Result := a_source.is_valid
		end

	can_repopulate: BOOLEAN
		do
			Result := is_populated and source.is_valid
		end

feature -- UI Feedback

	visual_update_action: PROCEDURE [ANY, TUPLE [INTEGER, INTEGER]]
			-- Called after processing each archetype (to perform GUI updates during processing).

feature {NONE} -- Implementation

	do_populate
		do
			build_supplier_ids
			build_client_ids
			gui_controls.do_all (agent (an_item: EVX_DATA_CONTROL) do an_item.populate end)
			call_visual_update_action (supplier_ids.count, client_ids.count)
		end

	gui_controls: ARRAYED_LIST [EVX_DATA_CONTROL]

	suppliers_frame, clients_frame: EV_FRAME

	do_clear
		do
			supplier_ids.wipe_out
			client_ids.wipe_out
			call_visual_update_action (0, 0)
		end

	supplier_ids: ARRAYED_SET [STRING]

	build_supplier_ids
			-- populate the ADL tree control by creating it from scratch
		local
			csr_ala: detachable ARCH_LIB_ARCHETYPE
		do
			if attached source as src then
				-- add C_ARCHETYPE_ROOTs to suppliers
				across src.suppliers_index as id_csr loop
					supplier_ids.extend (id_csr.key)
				end

				-- if in flat view, add C_ARCHETYPE_ROOTs of parents
				if not differential_view and src.is_specialised then
					from csr_ala := src.specialisation_ancestor until csr_ala = Void loop
						across src.suppliers_index as id_csr loop
							supplier_ids.extend (id_csr.key)
						end
						csr_ala := csr_ala.specialisation_ancestor
					end
				end
			end
		end

	client_ids: ARRAYED_SET [STRING]

	build_client_ids
			-- populate the ADL tree control by creating it from scratch
		local
			csr_ala: detachable ARCH_LIB_ARCHETYPE
		do
			if attached source as src then
				-- add C_ARCHETYPE_ROOTs to clients
				if attached src.clients_index as att_clients then
					across att_clients as id_csr loop
						client_ids.extend (id_csr.item)
					end
				end

				-- if in flat view, add C_ARCHETYPE_ROOTs of parents
				if not differential_view and src.is_specialised then
					from csr_ala := src.specialisation_ancestor until csr_ala = Void loop
						if attached csr_ala.clients_index as att_clients then
							across att_clients as id_csr loop
								client_ids.extend (id_csr.item)
							end
						end
						csr_ala := csr_ala.specialisation_ancestor
					end
				end
			end
		end

	call_visual_update_action (val1, val2: INTEGER)
			-- Call `visual_update_action', if it is attached.
		do
			if attached visual_update_action then
				visual_update_action.call ([val1, val2])
			end
		end

	suppliers_list_context_menu (x,y, button: INTEGER)
			-- creates the context menu for a right click action for class node
		local
			context_menu: EV_MENU
		do
			if button = {EV_POINTER_CONSTANTS}.right and then attached evx_suppliers_list.ev_data_control.selected_item as att_sel_row then
				create context_menu
				build_context_menu (context_menu, utf32_to_utf8 (att_sel_row.first))
				context_menu.show
			end
		end

	clients_list_context_menu (x,y, button: INTEGER)
			-- creates the context menu for a right click action for class node
		local
			context_menu: EV_MENU
		do
			if button = {EV_POINTER_CONSTANTS}.right and then attached evx_clients_list.ev_data_control.selected_item as att_sel_row then
				create context_menu
				build_context_menu (context_menu, utf32_to_utf8 (att_sel_row.first))
				context_menu.show
			end
		end

	build_context_menu (a_menu: EV_MENU; an_archetype_key: STRING)
		local
			an_mi: EV_MENU_ITEM
		do
			if attached {ARCH_LIB_ARCHETYPE} current_library.archetype_matching_ref (an_archetype_key) as ext_ref_node then
				create an_mi.make_with_text_and_action (get_text (ec_open_target_in_new_tab), agent (gui_agents.select_archetype_in_new_tool_agent).call ([ext_ref_node]))
				an_mi.set_pixmap (get_icon_pixmap ("archetype/" + ext_ref_node.group_name))
				a_menu.extend (an_mi)
			end
		end

end
