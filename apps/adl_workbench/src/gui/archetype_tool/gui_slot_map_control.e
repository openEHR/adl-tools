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
			-- create widgets
			create ev_root_container
			ev_root_container.set_padding (Default_padding_width)
			ev_root_container.set_border_width (Default_border_width)

			-- Slot fillers tree
			create ev_slot_fillers_tree
			create ev_slot_owners_tree

			create slot_fillers_frame
			slot_fillers_frame.set_text (get_msg (ec_slot_fillers_frame_text, Void))
			ev_root_container.extend (slot_fillers_frame)

			create slot_fillers_vbox
			slot_fillers_frame.extend (slot_fillers_vbox)
			slot_fillers_vbox.extend (ev_slot_fillers_tree)

			-- Slot owners tree
			create slot_owners_frame
			slot_owners_frame.set_text (get_msg (ec_slot_owners_frame_text, Void))
			ev_root_container.extend (slot_owners_frame)

			create slot_owners_vbox
			slot_owners_frame.extend (slot_owners_vbox)
			slot_owners_vbox.extend (ev_slot_owners_tree)

			-- set visual characteristics
			slot_fillers_vbox.set_border_width (Default_border_width)
			slot_owners_vbox.set_border_width (Default_border_width)

			visual_update_action := a_visual_update_action

			ev_root_container.set_data (Current)
		end

feature -- Access

	ev_root_container: EV_VERTICAL_BOX

	ev_slot_fillers_tree, ev_slot_owners_tree: EV_TREE

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

	slot_fillers_vbox, slot_owners_vbox: EV_VERTICAL_BOX

	slot_fillers_frame, slot_owners_frame: EV_FRAME

	append_tree (subtree: EV_TREE_NODE_LIST; ids: ARRAYED_LIST [STRING])
			-- Populate `subtree' from `ids'.
		local
			eti: EV_TREE_ITEM
			ala: ARCH_LIB_ARCHETYPE_ITEM
		do
			across ids as id_csr loop
				create eti.make_with_text (utf8_to_utf32 (id_csr.item))
				ala := current_library.archetype_with_id (id_csr.item)
				eti.set_pixmap (get_icon_pixmap ("archetype/" + ala.group_name))
				eti.set_data (ala)
				subtree.extend (eti)
			end
		ensure
			appended: subtree.count = old subtree.count + ids.count
		end

	do_clear
		do
			ev_slot_fillers_tree.wipe_out
			ev_slot_owners_tree.wipe_out
			call_visual_update_action (0, 0)
		end

	do_populate
			-- populate the ADL tree control by creating it from scratch
		local
			eti: EV_TREE_ITEM
			slots_count: INTEGER
			used_by_count: INTEGER
			csr_ala: detachable ARCH_LIB_ARCHETYPE_ITEM
		do
			if attached source as src and attached selected_language as sel_lang then
				-- =============== SUPPLIERS ===============
				-- add valid slot fillers to suppliers
				if src.has_slots then
					across src.slot_fillers_index as slots_csr loop
						create_slot_tree_node (src.differential_archetype.annotated_path (slots_csr.key, sel_lang, True))
						append_tree (ev_slot_tree_node, slots_csr.item)
						slots_count := slots_count + ev_slot_tree_node.count
						if ev_slot_tree_node.is_expandable then
							ev_slot_tree_node.expand
						end
					end
				end

				-- if in flat view, add C_ARCHETYPE_ROOTs of parents
				if not differential_view and src.is_specialised then
					from csr_ala := src.specialisation_ancestor until csr_ala = Void loop
						if csr_ala.has_slots then
							across csr_ala.slot_fillers_index as slots_csr loop
								create_slot_tree_node (src.differential_archetype.annotated_path (slots_csr.key, sel_lang, True))
								append_tree (ev_slot_tree_node, slots_csr.item)
								slots_count := slots_count + ev_slot_tree_node.count
								if ev_slot_tree_node.is_expandable then
									ev_slot_tree_node.expand
								end
							end
						end
						csr_ala := csr_ala.specialisation_ancestor
					end
				end

				-- =============== CLIENTS ===============
				if current_library.compile_attempt_count < current_library.archetype_count then
					ev_slot_owners_tree.extend (create {EV_TREE_ITEM}.make_with_text (get_text (ec_slots_incomplete_w1)))
				end

				if attached src.slot_owners_index as ci then
					append_tree (ev_slot_owners_tree, ci)
					used_by_count := used_by_count + ev_slot_owners_tree.count
				end

				call_visual_update_action (slots_count, used_by_count)
			end
		end

	create_slot_tree_node (a_path: STRING)
		do
			create ev_slot_tree_node.make_with_text (utf8_to_utf32 (a_path))
			ev_slot_tree_node.set_pixmap (get_icon_pixmap ("archetype/slot_fillers"))
			ev_slot_fillers_tree.extend (ev_slot_tree_node)
		end

	ev_slot_tree_node: EV_TREE_ITEM
		attribute
			create Result
		end

	call_visual_update_action (val1, val2: INTEGER)
			-- Call `visual_update_action', if it is attached.
		do
			if attached visual_update_action then
				visual_update_action.call ([val1, val2])
			end
		end

end


