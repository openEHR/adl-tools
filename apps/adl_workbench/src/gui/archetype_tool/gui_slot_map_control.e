note
	component:   "openEHR ADL Tools"
	description: "Slot map control - Visualise archetype ids matching slots"
	keywords:    "archetype, slot, gui"
	author:      "Thomas Beale"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2008-2012 Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class GUI_SLOT_MAP_CONTROL

inherit
	GUI_ARCHETYPE_TARGETTED_TOOL
		redefine
			can_populate, can_repopulate
		end

	SHARED_ARCHETYPE_CATALOGUES
		export
			{NONE} all;
			{ANY} has_current_repository
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
			-- create widgets
			create ev_root_container

			create ev_suppliers_tree
			create ev_clients_tree
			create supplier_frame
			create supplier_vbox
			create client_frame
			create client_vbox

			-- connect them together
			ev_root_container.extend (supplier_frame)
			supplier_frame.extend (supplier_vbox)
			supplier_vbox.extend (ev_suppliers_tree)
			ev_root_container.extend (client_frame)
			client_frame.extend (client_vbox)
			client_vbox.extend (ev_clients_tree)

			-- set visual characteristics
			ev_root_container.set_padding (Default_padding_width)
			ev_root_container.set_border_width (Default_border_width)
			supplier_frame.set_text (get_msg (ec_supplier_frame_text, Void))
			supplier_vbox.set_border_width (Default_border_width)
			client_frame.set_text (get_msg (ec_client_frame_text, Void))
			client_vbox.set_border_width (Default_border_width)

			visual_update_action := a_visual_update_action

			ev_root_container.set_data (Current)
		end

feature -- Access

	ev_root_container: EV_VERTICAL_BOX

	ev_suppliers_tree, ev_clients_tree: EV_TREE

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

	supplier_vbox, client_vbox: EV_VERTICAL_BOX

	supplier_frame, client_frame: EV_FRAME

	append_tree (subtree: attached EV_TREE_NODE_LIST; ids: attached ARRAYED_LIST [STRING])
			-- Populate `subtree' from `ids'.
		local
			eti: EV_TREE_ITEM
		do
			across ids as id_csr loop
				create eti.make_with_text (utf8_to_utf32 (id_csr.item))
				if current_arch_cat.archetype_index.has(id_csr.item) and then attached current_arch_cat.archetype_index.item (id_csr.item) as ara then
					eti.set_pixmap (get_icon_pixmap ("archetype/" + ara.group_name))
					eti.set_data (ara)
				end
				subtree.extend (eti)
			end
		ensure
			appended: subtree.count = old subtree.count + ids.count
		end

	do_clear
		do
			ev_suppliers_tree.wipe_out
			ev_clients_tree.wipe_out
			call_visual_update_action (0, 0)
		end

	do_populate
			-- populate the ADL tree control by creating it from scratch
		local
			eti: EV_TREE_ITEM
			slots_count: INTEGER
			used_by_count: INTEGER
		do
			if attached source as src and attached selected_language as sel_lang then
				if src.has_slots then
					across src.slot_id_index as slots_csr loop
						create eti.make_with_text (utf8_to_utf32 (src.differential_archetype.annotated_path (slots_csr.key, sel_lang, True)))
						eti.set_pixmap (get_icon_pixmap ("am/added/archetype_slot"))
						ev_suppliers_tree.extend (eti)
						append_tree (eti, slots_csr.item)
						slots_count := slots_count + eti.count
						if eti.is_expandable then
							eti.expand
						end
					end
				end

				if current_arch_cat.compile_attempt_count < current_arch_cat.archetype_count then
					ev_clients_tree.extend (create {EV_TREE_ITEM}.make_with_text (get_text (ec_slots_incomplete_w1)))
				end

				if src.is_supplier and attached src.clients_index as ci then
					append_tree (ev_clients_tree, ci)
					used_by_count := used_by_count + ev_clients_tree.count
				end

				call_visual_update_action (slots_count, used_by_count)
			end
		end

	call_visual_update_action (val1, val2: INTEGER)
			-- Call `visual_update_action', if it is attached.
		do
			if attached visual_update_action then
				visual_update_action.call ([val1, val2])
			end
		end

end


