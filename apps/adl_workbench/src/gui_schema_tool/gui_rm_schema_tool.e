note
	component:   "openEHR Archetype Project"
	description: "Combined control for viewing archetype and template artefacts in 2 trees"
	keywords:    "ADL, archetype, template, UI"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.com>"
	copyright:   "Copyright (c) 2011 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"


class GUI_RM_SCHEMA_TOOL

inherit
	SHARED_REFERENCE_MODEL_ACCESS
		export
			{NONE} all
		end

	SHARED_APP_UI_RESOURCES
		export
			{NONE} all
		end

	CONSTANTS
		export
			{NONE} all
		end

create
	make

feature {NONE} -- Initialisation

	make (a_select_class_agent, a_select_class_in_new_tool_agent: like select_class_agent)
		do
			select_class_agent := a_select_class_agent
			select_class_in_new_tool_agent := a_select_class_in_new_tool_agent

			-- create widgets
			create ev_root_container
--			create ev_hbox
--			create ev_pixmap
--			create ev_label
			create ev_tree

			-- connect widgets
--			ev_root_container.extend (ev_hbox)
--			ev_hbox.extend (ev_pixmap)
--			ev_hbox.extend (ev_label)
			ev_root_container.extend (ev_tree)

			-- visual characteristics
--			ev_root_container.disable_item_expand (ev_hbox)
--			ev_hbox.set_padding (padding_width)
--			ev_hbox.set_border_width (border_width)
--			ev_hbox.disable_item_expand (ev_pixmap)
--			ev_pixmap.set_minimum_width (16)
--			ev_pixmap.set_minimum_height (16)
--			ev_pixmap.copy (pixmaps ["rm_schema"])
--			ev_label.set_text ("Reference Models")
--			ev_label.align_text_left
			ev_tree.set_background_color (editable_colour)
  			ev_tree.set_minimum_width (max_arch_explorer_width)

			-- events
			ev_tree.select_actions.extend (agent tree_item_select)
			ev_tree.focus_in_actions.extend (agent tree_item_select)
		end

feature -- Access

	ev_root_container: EV_VERTICAL_BOX

feature -- Events

	tree_item_select
			-- Display details of `archetype_file_tree' when the user selects it.
		do
			if attached ev_tree.selected_item and attached {BMM_CLASS_DEFINITION} ev_tree.selected_item.data as a_bmm_class_def then
				display_selected_item_after_delay
			end
		end

feature -- Commands

	populate
			-- Populate content from visual controls.
		do
			ev_tree.wipe_out
			populate_tree
		end

	display_selected_item
		do
			delay_to_make_keyboard_navigation_practical.set_interval (0)
			if attached {EV_TREE_ITEM} ev_tree.selected_item as eti and then attached {BMM_CLASS_DEFINITION} eti.data as a_class_def then
				select_class_agent.call ([a_class_def])
			end
		end

feature {NONE} -- Implementation

	ev_pixmap: EV_PIXMAP

	ev_label: EV_LABEL

	ev_tree: EV_TREE

	ev_hbox: EV_HORIZONTAL_BOX

	select_class_agent, select_class_in_new_tool_agent: PROCEDURE [ANY, TUPLE [BMM_CLASS_DEFINITION]]

	populate_tree
		do
			from rm_schemas_access.top_level_schemas.start until rm_schemas_access.top_level_schemas.off loop
				populate_schema (rm_schemas_access.top_level_schemas.item_for_iteration.schema)
				rm_schemas_access.top_level_schemas.forth
			end
			ev_tree.recursive_do_all (agent ev_tree_expand)
		end

	populate_schema (a_schema: BMM_SCHEMA)
		local
			ev_node: EV_TREE_ITEM
		do
			-- put a root schema node on the tree
			create ev_node.make_with_text (a_schema.schema_id)
 			ev_node.set_data (a_schema)
 	 		ev_node.set_tooltip (a_schema.schema_description)
 	 		ev_node.set_pixmap (pixmaps ["rm_schema"])
			ev_tree.extend (ev_node)

 			from a_schema.canonical_packages.start until a_schema.canonical_packages.off loop
 				populate_packages (ev_node, a_schema.canonical_packages.item_for_iteration)
 				a_schema.canonical_packages.forth
 			end
		end

	populate_packages (ev_parent_node: EV_TREE_ITEM; a_pkg: BMM_PACKAGE_DEFINITION)
		local
			ev_pkg_node: EV_TREE_ITEM
		do
			-- do this package
			create ev_pkg_node.make_with_text (a_pkg.name)
 			ev_pkg_node.set_data (a_pkg)
 	 		ev_pkg_node.set_tooltip (a_pkg.qualified_name)
 	 		ev_pkg_node.set_pixmap (pixmaps ["file_folder_2"])
			ev_parent_node.extend (ev_pkg_node)

			-- do the classes
			if a_pkg.has_classes then
	 			from a_pkg.classes.start until a_pkg.classes.off loop
	 				populate_classes (ev_pkg_node, a_pkg.bmm_model.class_definition (a_pkg.classes.item))
	 				a_pkg.classes.forth
	 			end
			end

			-- do the child packages
			if a_pkg.has_packages then
	 			from a_pkg.packages.start until a_pkg.packages.off loop
	 				populate_packages (ev_pkg_node, a_pkg.packages.item_for_iteration)
	 				a_pkg.packages.forth
	 			end
			end
		end

	populate_classes (ev_package_node: EV_TREE_ITEM; a_class_def: BMM_CLASS_DEFINITION)
		local
			ev_class_node: EV_TREE_ITEM
		do
			create ev_class_node.make_with_text (a_class_def.name)
 			ev_class_node.set_data (a_class_def)
 	 		ev_class_node.set_pixmap (pixmaps [a_class_def.type_category])
			ev_package_node.extend (ev_class_node)

 	 		ev_class_node.set_pebble_function (agent pebble_function)
			ev_class_node.set_configurable_target_menu_handler (agent context_menu_handler)
			ev_class_node.set_configurable_target_menu_mode

			from a_class_def.immediate_descendants.start until a_class_def.immediate_descendants.off loop
				populate_classes (ev_class_node, a_class_def.immediate_descendants.item)
				a_class_def.immediate_descendants.forth
			end
		end

	ev_tree_expand (node: EV_TREE_NODE)
			--
		do
	 		if attached {BMM_PACKAGE_DEFINITION} node.data as pkg_def then
	 			if node.is_expandable then
					node.expand
	 			end
	 		end
		end

	context_menu_handler (a_menu: EV_MENU; a_target_list: ARRAYED_LIST [EV_PND_TARGET_DATA]; a_source: EV_PICK_AND_DROPABLE; a_pebble: ANY)
			-- creates the context menu for a right click action for an ARCH_REP_ARCHETYPE node
		do
			if attached {EV_TREE_ITEM} a_source as ev_ti then
				if attached {BMM_CLASS_DEFINITION} ev_ti.data as acmn then
					create_class_context_menu (a_menu, ev_ti)
				end
			end
		end

	create_class_context_menu (menu: EV_MENU; ev_ti: EV_TREE_ITEM)
			-- dynamically initializes the context menu for this tree
		local
			display_mi, new_tool_mi: EV_MENU_ITEM
		do
			create display_mi.make_with_text_and_action ("Display", agent display_context_selected_class_in_active_tool (ev_ti))
	    	menu.extend (display_mi)

			create new_tool_mi.make_with_text_and_action ("Display in new tool", agent display_context_selected_class_in_new_tool (ev_ti))
			menu.extend (new_tool_mi)
		end

	pebble_function (a_x, a_y: INTEGER): ANY
			-- Pebble function for pebble source
		do
			Result := "pebble"
		end

	display_context_selected_class_in_active_tool (ev_ti: EV_TREE_ITEM)
		do
			ev_ti.enable_select
			if attached {BMM_CLASS_DEFINITION} ev_ti.data as a_class_def then
				select_class_agent.call ([a_class_def])
			end
		end

	display_context_selected_class_in_new_tool (ev_ti: EV_TREE_ITEM)
		do
			ev_ti.enable_select
			if attached {BMM_CLASS_DEFINITION} ev_ti.data as a_class_def then
				select_class_in_new_tool_agent.call ([a_class_def])
			end
		end

	display_selected_item_after_delay
			-- When the user selects an item in `gui_file_tree', delay before displaying it.
		do
			if delay_to_make_keyboard_navigation_practical = Void then
				create delay_to_make_keyboard_navigation_practical
				delay_to_make_keyboard_navigation_practical.actions.extend (agent display_selected_item)
			end

			delay_to_make_keyboard_navigation_practical.set_interval (300)
		end

	delay_to_make_keyboard_navigation_practical: EV_TIMEOUT
			-- Timer to delay a moment before calling `display_details_of_selected_item'.

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
--| The Original Code is gui_rm_schema_tool.e.
--|
--| The Initial Developer of the Original Code is Thomas Beale.
--| Portions created by the Initial Developer are Copyright (C) 2011
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
