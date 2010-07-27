note
	component:   "openEHR Archetype Project"
	description: "Populate ontology controls in ADL editor"
	keywords:    "ADL"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2004 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"


class GUI_VIEW_ARCHETYPE_TREE_CONTROL

inherit
	SHARED_APP_UI_RESOURCES
		export
			{NONE} all
		end

	SHARED_KNOWLEDGE_REPOSITORY
		export
			{NONE} all
		end

	SHARED_REFERENCE_MODEL_ACCESS
		export
			{NONE} all
		end

	STRING_UTILITIES
		export
			{NONE} all
		end

create
	make

feature -- Definitions

	Right_arrow_char: NATURAL_32 = 0x279C

feature {NONE} -- Initialisation

	make (a_main_window: MAIN_WINDOW; a_tree_control: EV_TREE; a_label: EV_LABEL; artefact_types_list: ARRAY [INTEGER])
			-- Create controller for the tree representing archetype files found in `archetype_directory'.
		require
			a_main_window /= Void
			a_tree_control /= Void
			a_label /= Void
			valid_artefact_type: (create {ARTEFACT_TYPE}).valid_artefact_types(artefact_types_list)
		do
			gui := a_main_window
   			gui_tree := a_tree_control
   			explorer_label := a_label
   			gui_tree.set_minimum_width (gui.max_arch_explorer_width)
   			artefact_types := artefact_types_list
		end

feature -- Commands

	display_details_of_selected_item_after_delay
			-- When the user selects an item in `gui_file_tree', delay before displaying it.
		do
			if delay_to_make_keyboard_navigation_practical = Void then
				create delay_to_make_keyboard_navigation_practical
				delay_to_make_keyboard_navigation_practical.actions.extend (agent
					do
						delay_to_make_keyboard_navigation_practical.set_interval (0)
						if attached {EV_TREE_NODE} gui_tree.selected_item as node and then attached {ARCH_REP_ITEM} node.data as ari then
							arch_dir.set_selected_item (ari)
							if attached {ARCH_REP_ARCHETYPE} ari as ara then
								gui.parse_archetype
							else
								gui.display_class
							end
						end
					end)
			end
			delay_to_make_keyboard_navigation_practical.set_interval (300)
		end

	populate
			-- Populate `gui_file_tree' from `archetype_directory'.
		local
			lpos: INTEGER
			s: STRING
		do
			-- update explorer label with RM name
			s := explorer_label.text
			lpos := s.index_of ('-', 1)
			if lpos = 0 then
				s.append (" -")
				lpos := s.count
			else
				s.remove_substring (lpos+1, s.count)
			end
			s.append_character (' ')
			s.append (current_repository_profile)
			explorer_label.set_text (s)

			-- update tree
			create gui_node_descriptor_map.make(0)
			gui_tree.wipe_out
 			create gui_tree_item_stack.make (0)
 			arch_dir.do_all (agent populate_gui_tree_node_enter, agent populate_gui_tree_node_exit)
			gui_tree.recursive_do_all (agent ev_tree_expand)
			gui.select_node_in_archetype_tree_view
		end

	update_tree_node_for_archetype (ara: ARCH_REP_ARCHETYPE)
			-- update Explorer tree node with changes in compilation status
		require
			Descriptor_valid: ara /= Void
		local
			an_id: STRING
		do
			an_id := ara.id.as_string
			if gui_node_descriptor_map.has (an_id) then
				update_tree_node (gui_node_descriptor_map.item (ara.ontological_name))
			elseif attached ara.old_id then
				if gui_node_descriptor_map.has (ara.old_id.as_string) then
					gui_node_descriptor_map.replace_key (ara.ontological_name, ara.old_id.as_string)
					update_tree_node (gui_node_descriptor_map.item (ara.ontological_name))
				end
			end
		end

	ensure_item_visible (ari_ont_id: STRING)
			-- ensure node with ontological node id `ari_ont_id' is visible in the tree
		require
			ari_ont_id /= Void
		do
			if gui_node_descriptor_map.has(ari_ont_id) and gui_tree.is_displayed then
				gui_tree.ensure_item_visible (gui_node_descriptor_map.item(ari_ont_id))
				gui_node_descriptor_map.item(ari_ont_id).enable_select
			end
		end

feature {NONE} -- Implementation

	gui_node_descriptor_map: HASH_TABLE [EV_TREE_ITEM, STRING]
			-- list of GUI explorer nodes, keyed by artefact id

	artefact_types: ARRAY [INTEGER]
			-- types of artefact in this view

	explorer_label: EV_LABEL
			-- label of explorer control in GUI

	gui: MAIN_WINDOW
			-- Main window of system.

	gui_tree: EV_TREE
			-- reference to MAIN_WINDOW.archetype_file_tree

	gui_tree_item_stack: ARRAYED_STACK [EV_TREE_ITEM]
			-- Stack used during `populate_gui_tree_node_enter'.

	delay_to_make_keyboard_navigation_practical: EV_TIMEOUT
			-- Timer to delay a moment before calling `display_details_of_selected_item'.

   	populate_gui_tree_node_enter (ari: ARCH_REP_ITEM)
   			-- Add a node representing `an_item' to `gui_file_tree'.
		require
			item_attached: ari /= Void
   		local
			node: EV_TREE_ITEM
		do
			if not ari.is_root and (ari.sub_tree_artefact_count (artefact_types) > 0 or else show_entire_ontology or else
								(attached {ARCH_REP_ARCHETYPE} ari as ara and then artefact_types.has(ara.artefact_type))) then
				create node
	 			node.set_data (ari)

	 			if attached {ARCH_REP_ARCHETYPE} ari as ara then
	 				gui_node_descriptor_map.put (node, ara.ontological_name)
	 			end

	 			update_tree_node (node)

				if gui_tree_item_stack.is_empty then
					gui_tree.extend (node)
				else
					gui_tree_item_stack.item.extend (node)
				end

				gui_tree_item_stack.extend (node)
			end
		end

   	populate_gui_tree_node_exit (ari: ARCH_REP_ITEM)
   		do
			if not ari.is_root and (ari.sub_tree_artefact_count (artefact_types) > 0 or else show_entire_ontology or else
								(attached {ARCH_REP_ARCHETYPE} ari as ara and then artefact_types.has(ara.artefact_type))) then

				gui_tree_item_stack.remove
			end
		end

   	update_tree_node (node: EV_TREE_NODE)
   			-- Set the text, tooltip and icon appropriate to the item attached to `node'.
		require
			node_attached: node /= Void
   		local
			text, tooltip: STRING_32
			pixmap: EV_PIXMAP
		do
			if attached {ARCH_REP_ITEM} node.data as ari then
				text := utf8 (ari.display_name)

				if attached {ARCH_REP_ARCHETYPE} ari as ara then
					tooltip := utf8 (ara.full_path)
					if ara.legacy_is_primary and display_archetype_source then
						text.prepend (utf8("(f) "))
					end

					if ara.has_slots then
						text.append_code (Right_arrow_char)	-- Unicode character: an arrow pointing right
					end

					if ara.has_compilation_result then
						tooltip.append (utf8 ("%N%N" + ara.compilation_result))
					end
	 				node.set_tooltip (tooltip)
	 			else -- it is a model node
	 				text.append (utf8(" (" + ari.sub_tree_artefact_count (artefact_types).out + ")"))
				end

				node.set_text (text)
				pixmap := pixmaps [ari.group_name]
				if pixmap /= Void then
					node.set_pixmap (pixmap)
				end
			end
		end

	ev_tree_expand(node: EV_TREE_NODE)
			--
		do
	 		if attached {ARCH_REP_MODEL_NODE} node.data as arf then
	 			if (arf.is_abstract_class or arf.is_package) and node.is_expandable then
					node.expand
	 			end
	 		end
		end

invariant
	gui_attached: gui /= Void
	tree_attached: gui_tree /= Void
	valid_artefact_types: artefact_types /= Void and then (create {ARTEFACT_TYPE}).valid_artefact_types(artefact_types)

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
--| The Original Code is adl_node_control.e.
--|
--| The Initial Developer of the Original Code is Thomas Beale.
--| Portions created by the Initial Developer are Copyright (C) 2003-2004
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
