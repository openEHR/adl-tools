note
	component:   "openEHR Archetype Project"
	description: "Composite control for viewing templates"
	keywords:    "ADL"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.com>"
	copyright:   "Copyright (c) 2010 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"


class GUI_VIEW_TEMPLATE_TREE_CONTROL

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
						if attached {EV_TREE_NODE} gui_tree.selected_item as node and then attached {ARCH_REP_ARCHETYPE} node.data as ara then
							arch_dir.set_selected_item (ara)
							gui.parse_archetype
							populate_template_nodes (ara)
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
			-- update tree
			create gui_node_descriptor_map.make(0)
			gui_tree.wipe_out
 			create gui_tree_item_stack.make (0)
 			arch_dir.do_all_archetypes (agent populate_template_nodes)
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
--			if gui_node_descriptor_map.has (an_id) then
				populate_template_nodes (ara)
--			elseif attached ara.old_id then
--				if gui_node_descriptor_map.has (ara.old_id.as_string) then
--					gui_node_descriptor_map.replace_key (ara.id.as_string, ara.old_id.as_string)
--					populate_template_nodes (gui_node_descriptor_map.item (ara.id.as_string))
--				end
--			end
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

   	populate_template_nodes (ara: ARCH_REP_ARCHETYPE)
   			-- Add a node representing `an_item' to `gui_file_tree'.
		require
			item_attached: ara /= Void
   		local
			tree_iterator: OG_ITERATOR
		do
			-- make sure it is a template of some kind
			if artefact_types.has(ara.artefact_type) then
				-- if it is compiled & valid, display its flat filler structure
				if gui_node_descriptor_map.has (ara.ontological_name) then
					if ara.is_valid then
						gui_tree_item_stack.extend (gui_node_descriptor_map.item (ara.ontological_name))
						gui_tree_item_stack.item.wipe_out
						gui_tree_item_stack.item.set_pixmap (pixmaps[ara.group_name])
						create tree_iterator.make (ara.flat_archetype.definition.representation)
						tree_iterator.do_all (agent node_build_enter_action (?, ?), agent node_build_exit_action (?, ?))
						gui_tree_item_stack.remove
					else
						gui_node_descriptor_map.item (ara.ontological_name).set_pixmap (pixmaps[ara.group_name])
					end
				else -- otherwise just display the template root
					attach_node(ara.id.rm_entity + "." + ara.display_name, pixmaps[ara.group_name], ara)
					gui_node_descriptor_map.force (gui_tree_item_stack.item, ara.ontological_name)
					gui_tree_item_stack.remove
				end
			end
		end

	node_build_enter_action (an_og_node: OG_ITEM; indent_level: INTEGER)
		require
			Node_exists: an_og_node /= Void
		local
			ara: ARCH_REP_ARCHETYPE
			ca_path: STRING
			csr: ARCHETYPE_CONSTRAINT
		do
			if attached {ARCHETYPE_CONSTRAINT} an_og_node.content_item as ca then
				if attached {C_ATTRIBUTE} ca as c_attr then
					-- first see if it is an atribute containing any ext ref nodes
					from c_attr.children.start until c_attr.children.off or attached {C_ARCHETYPE_ROOT} c_attr.children.item as car loop
						c_attr.children.forth
					end

					-- now compute the path from this attr node back to the nearest C_ARCHETYPE_ROOT
					from csr := c_attr until csr.parent = Void loop
						if attached {C_ARCHETYPE_ROOT} csr as car then
							ca_path := c_attr.path_to_node(car)
						end
						csr := csr.parent
					end
					if not attached ca_path then
						ca_path := c_attr.path
					end
					if not c_attr.children.off then
						attach_node(ca_path, pixmaps[c_attribute_pixmap_string(c_attr)], Void)
					end
				elseif attached {C_ARCHETYPE_ROOT} ca as car then
					ara := arch_dir.archetype_index.item (car.archetype_id)
					attach_node(ara.id.rm_entity + "." + ara.display_name, pixmaps[ara.group_name], ara)
				end
			end
		end

	node_build_exit_action(an_og_node: OG_ITEM; indent_level: INTEGER)
		require
			Node_exists: an_og_node /= Void
		do
			if attached {C_ATTRIBUTE} an_og_node.content_item as c_attr then
				from c_attr.children.start until c_attr.children.off or attached {C_ARCHETYPE_ROOT} c_attr.children.item as car loop
					c_attr.children.forth
				end
				if not c_attr.children.off then
					gui_tree_item_stack.remove
				end
			elseif attached {C_ARCHETYPE_ROOT} an_og_node.content_item as car then
				gui_tree_item_stack.remove
			end
		end

	c_attribute_pixmap_string(c_attr: C_ATTRIBUTE): STRING
			-- string name of pixmap for attribute c_attr
			-- FIXME: this is a straight copy from GUI_NODE_MAP_CONTROL and should be consolidated at some point
		do
			create Result.make(0)
			Result.append ("C_ATTRIBUTE")
			if c_attr.is_multiple then
				if c_attr.cardinality = Void or else c_attr.cardinality.interval.lower = 0 then
					Result.append (".multiple.optional")
				else
					Result.append (".multiple")
				end
			else
				if c_attr.existence = Void or else c_attr.existence.lower = 0 then
					Result.append (".optional")
				end
			end
		end

	attach_node(str: STRING; pixmap: EV_PIXMAP; ara: ARCH_REP_ARCHETYPE)
			-- attach a node into the tree
		local
			a_ti: EV_TREE_ITEM
		do
			create a_ti.make_with_text (utf8 (str))
			if attached ara then
				a_ti.set_data (ara)
				gui_node_descriptor_map.force (a_ti, ara.ontological_name)
			end
			a_ti.set_pixmap (pixmap)
			if gui_tree_item_stack.is_empty then
				gui_tree.extend (a_ti)
			else
				gui_tree_item_stack.item.extend (a_ti)
			end
			gui_tree_item_stack.extend (a_ti)
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
