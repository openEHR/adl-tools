note
	component:   "openEHR Archetype Project"
	description: "Slot map control - Visualise archetype ids matching slots"
	keywords:    "archetype, slot, gui"
	author:      "Thomas Beale"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2008-2011 Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class GUI_SLOT_MAP_CONTROL

inherit
	SHARED_KNOWLEDGE_REPOSITORY
		export
			{NONE} all;
			{ANY} has_current_profile
		end

	CONSTANTS
		export
			{NONE} all
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
			ev_root_container.set_padding (padding_width)
			ev_root_container.set_border_width (border_width)
			supplier_frame.set_text (create_message_content ("supplier_frame_text", Void))
			supplier_vbox.set_border_width (border_width)
			client_frame.set_text (create_message_content ("client_frame_text", Void))
			client_vbox.set_border_width (border_width)

			visual_update_action := a_visual_update_action
		end

feature -- Access

	ev_root_container: EV_VERTICAL_BOX

	ev_suppliers_tree, ev_clients_tree: EV_TREE

feature -- UI Feedback

	visual_update_action: PROCEDURE [ANY, TUPLE [INTEGER, INTEGER]]
			-- Called after processing each archetype (to perform GUI updates during processing).

feature -- Commands

	clear
		do
			ev_suppliers_tree.wipe_out
			ev_clients_tree.wipe_out
			call_visual_update_action (0, 0)
		end

	populate (aca: attached ARCH_CAT_ARCHETYPE; a_language: attached STRING)
			-- populate the ADL tree control by creating it from scratch
		require
			aca.is_valid
		local
			eti: EV_TREE_ITEM
			slot_index: DS_HASH_TABLE [ARRAYED_LIST [STRING], STRING]
			slots_count: INTEGER
			used_by_count: INTEGER
		do
			clear

			if aca.has_slots then
				slot_index := aca.slot_id_index
				from slot_index.start until slot_index.off loop
					create eti.make_with_text (utf8 (aca.differential_archetype.ontology.physical_to_logical_path (slot_index.key_for_iteration, a_language, True)))
					eti.set_pixmap (pixmaps ["ARCHETYPE_SLOT"])
					ev_suppliers_tree.extend (eti)
					append_tree (eti, slot_index.item_for_iteration)
					slots_count := slots_count + eti.count

					if eti.is_expandable then
						eti.expand
					end

					slot_index.forth
				end
			end

			if current_arch_cat.compile_attempt_count < current_arch_cat.total_archetype_count then
				ev_clients_tree.extend (create {EV_TREE_ITEM}.make_with_text (create_message_line ("slots_incomplete_w1", <<>>)))
			end

			if aca.is_supplier then
				append_tree (ev_clients_tree, aca.clients_index)
				used_by_count := used_by_count + ev_clients_tree.count
			end

			call_visual_update_action (slots_count, used_by_count)
		end

feature {NONE} -- Implementation

	supplier_vbox, client_vbox: EV_VERTICAL_BOX

	supplier_frame, client_frame: EV_FRAME

	append_tree (subtree: attached EV_TREE_NODE_LIST; ids: attached ARRAYED_LIST [STRING])
			-- Populate `subtree' from `ids'.
		local
			eti: EV_TREE_ITEM
			ara: ARCH_CAT_ARCHETYPE
		do
			from ids.start until ids.off loop
				create eti.make_with_text (utf8 (ids.item))
				if current_arch_cat.archetype_index.has(ids.item) then
					ara := current_arch_cat.archetype_index.item (ids.item)
					eti.set_pixmap (pixmaps [ara.group_name])
					eti.set_data (ara)
				end
				subtree.extend (eti)
				ids.forth
			end
		ensure
			appended: subtree.count = old subtree.count + ids.count
		end

	call_visual_update_action (val1, val2: INTEGER)
			-- Call `visual_update_action', if it is attached.
		do
			if attached visual_update_action then
				visual_update_action.call ([val1, val2])
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
--| The Original Code is gui_slot_map_control.e.
--|
--| The Initial Developer of the Original Code is Thomas Beale.
--| Portions created by the Initial Developer are Copyright (C) 2003-2011
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
