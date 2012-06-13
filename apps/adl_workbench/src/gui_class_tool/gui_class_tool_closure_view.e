note
	component:   "openEHR Archetype Project"
	description: "Class map control - visualise property view of a class, including flattening."
	keywords:    "archetype, ADL, gui"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2010-2011 Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class GUI_CLASS_TOOL_CLOSURE_VIEW

inherit
	GUI_CLASS_TARGETTED_TOOL

	BMM_DEFINITIONS
		export
			{NONE} all
		end

	SHARED_REFERENCE_MODEL_ACCESS
		export
			{NONE} all
		end

create
	make

feature -- Definitions

	Default_closure_depth: INTEGER = 2
			-- default depth to explore supplier closure

	Tree_control_panel_width: INTEGER = 100

feature -- Initialisation

	make
		do
			-- create widgets
			create ev_root_container
			ev_root_container.set_data (Current)

			-- EV_TREE
			create ev_property_tree
			ev_root_container.extend (ev_property_tree)

			-- view controls VBOX
			create ev_view_controls_vbox
--			ev_view_controls_vbox.set_minimum_width (100)
			ev_view_controls_vbox.set_padding (Default_padding_width)
			ev_view_controls_vbox.set_border_width (Default_border_width)
			ev_root_container.extend (ev_view_controls_vbox)
			ev_root_container.disable_item_expand (ev_view_controls_vbox)

			-- tree collapse/expand control
			create gui_treeview_control.make (get_text ("view_label_text"), create {GUI_TREE_CONTROL_TREE}.make (ev_property_tree))
			ev_view_controls_vbox.extend (gui_treeview_control.ev_root_container)
			ev_view_controls_vbox.disable_item_expand (gui_treeview_control.ev_root_container)

			-- closure depth control
			create ev_closure_depth_spin_button
			-- FIXME: can't set text on spin button; need to add a frame or ...
			ev_closure_depth_spin_button.set_text (get_msg ("closure_depth_spin_button_text", Void))
			ev_closure_depth_spin_button.set_tooltip (get_msg ("closure_depth_spin_button_tooltip", Void))
			ev_closure_depth_spin_button.set_value (default_closure_depth)
			ev_view_controls_vbox.extend (ev_closure_depth_spin_button)
			ev_view_controls_vbox.disable_item_expand (ev_closure_depth_spin_button)

			-- closure recompute button
			create ev_closure_recompute_button
			ev_closure_recompute_button.set_text (get_msg ("closure_depth_recompute_button_text", Void))
			ev_closure_recompute_button.set_tooltip (get_msg ("closure_depth_recompute_button_tooltip", Void))
			ev_closure_recompute_button.select_actions.extend (agent repopulate)
			ev_view_controls_vbox.extend (ev_closure_recompute_button)
			ev_view_controls_vbox.disable_item_expand (ev_closure_recompute_button)

			-- filler cell
			create ev_cell
			ev_cell.set_minimum_height (20)
			ev_view_controls_vbox.extend (ev_cell)
			ev_view_controls_vbox.disable_item_expand (ev_cell)

			-- RM icons check button
			create ev_use_rm_icons_cb
			ev_use_rm_icons_cb.set_text (get_msg ("use_rm_icons_button_text", Void))
			ev_use_rm_icons_cb.set_tooltip (get_msg ("use_rm_icons_button_tooltip", Void))
			ev_use_rm_icons_cb.select_actions.extend (agent on_ev_use_rm_icons_cb_selected)
			ev_view_controls_vbox.extend (ev_use_rm_icons_cb)
			ev_view_controls_vbox.disable_item_expand (ev_use_rm_icons_cb)

			-- Initial visual settings
			if use_rm_pixmaps then
				ev_use_rm_icons_cb.enable_select
			end
		end

feature -- Access

	ev_root_container: EV_HORIZONTAL_BOX

feature -- Status Report

	is_expanded: BOOLEAN
			-- True if last whole tree operation was expand

feature -- Events

	on_ev_use_rm_icons_cb_selected
		do
			if is_populated then
				set_use_rm_pixmaps (ev_use_rm_icons_cb.is_selected)
				refresh

				-- reflect change to other editor tools
				gui_agents.update_all_tools_rm_icons_setting_agent.call ([])
			end
		end

	update_rm_icons_cb
			-- update and repopulate if this setting was changed elsewhere in the tool
		do
			if is_populated and use_rm_pixmaps /= ev_use_rm_icons_cb.is_selected then
				if use_rm_pixmaps then
					ev_use_rm_icons_cb.enable_select
				else
					ev_use_rm_icons_cb.disable_select
				end
				refresh
			end
		end

feature -- Commands

	refresh
		do
			do_with_wait_cursor (ev_root_container, agent ev_property_tree.recursive_do_all (agent refresh_node))
		end

feature {NONE} -- Implementation

	do_clear
		do
 			ev_closure_depth_spin_button.set_value (Default_closure_depth)
 			ev_property_tree.wipe_out
		end

	do_populate
		do
 			create ev_tree_item_stack.make (0)

			-- for use in icon switching
 			model_publisher := source.bmm_schema.rm_publisher

 			-- populate the tree
			populate_root_node
			source.do_supplier_closure (not differential_view, ev_closure_depth_spin_button.value-1,
					agent populate_gui_tree_node_enter, agent populate_gui_tree_node_exit)

			-- now collapse the tree, and then expand out just the top node
			gui_treeview_control.on_collapse_all
			if not ev_property_tree.is_empty and then ev_property_tree.first.is_expandable then
				ev_property_tree.first.expand
			end
		end

	ev_property_tree: EV_TREE

	gui_treeview_control: GUI_TREEVIEW_CONTROL

	ev_expand_button, ev_expand_one_button, ev_collapse_one_button, ev_closure_recompute_button: EV_BUTTON

	ev_use_rm_icons_cb: EV_CHECK_BUTTON

	ev_view_controls_vbox: EV_VERTICAL_BOX

	ev_cell: EV_CELL

	ev_closure_depth_spin_button: EV_SPIN_BUTTON

	ev_tree_item_stack: ARRAYED_STACK [EV_TREE_ITEM]

	model_publisher: STRING
			-- name of publisher, e.g. 'openehr', which is the key to RM-specific icons

	node_path: OG_PATH

	node_list: ARRAYED_LIST [EV_TREE_NODE]

	closure_depth: INTEGER
			-- closure compute depth; limits closure computation to manageable level

   	populate_root_node
			-- Add root node representing class to `gui_file_tree'.
   		local
			a_ti: EV_TREE_ITEM
			pixmap_name: STRING
		do
			create a_ti
			a_ti.set_text (source.as_type_string)
			a_ti.set_data (source)
			pixmap_name := rm_icon_dir + "/" + model_publisher + "/" + source.name
			if use_rm_pixmaps and then has_icon_pixmap (pixmap_name) then
				a_ti.set_pixmap (get_icon_pixmap (pixmap_name))
			else
				a_ti.set_pixmap (get_icon_pixmap ("rm/generic/" + source.type_category))
			end
			ev_property_tree.extend (a_ti)
			ev_tree_item_stack.extend (a_ti)
			create node_path.make_root
		end

   	populate_gui_tree_node_enter (a_prop_def: attached BMM_PROPERTY_DEFINITION; depth: INTEGER)
   			-- Add a node representing `a_prop_def' to `gui_file_tree'.
   			-- If depth = 0, but this property is not a terminal node, it means that computation on
   			-- this branch of the closure won't go further due the closure_depth limit; therefore,
   			-- display this node with a special icon that invite the user to manually further expand
   			-- this node
   		local
			a_ti: EV_TREE_ITEM
			prop_str, type_str: STRING
			is_terminal: BOOLEAN
			has_type_subs: BOOLEAN
			type_spec: BMM_TYPE_SPECIFIER
		do
			closure_depth := depth

			-- update path value
			prop_str := a_prop_def.name.twin
			node_path.append_segment (create {OG_PATH_ITEM}.make (prop_str))

			-- determine data for property and one or more (in the case of generics with > 1 param) class nodes
			if attached {BMM_CLASS_DEFINITION} a_prop_def.type as bmm_class_def then
				if bmm_class_def.is_primitive_type then
					prop_str.append (": " + bmm_class_def.name)
					is_terminal := True
				else
					type_str := bmm_class_def.name
					has_type_subs := bmm_class_def.has_type_substitutions
				end
				type_spec := bmm_class_def

			elseif attached {BMM_CONTAINER_TYPE_REFERENCE} a_prop_def.type as bmm_cont_type_ref then
				-- assume first gen param is only type of interest
				if bmm_cont_type_ref.type.is_primitive_type then
					prop_str.append (": " + bmm_cont_type_ref.as_type_string)
					is_terminal := True
				else
					prop_str.append (": " + bmm_cont_type_ref.container_type.name + Generic_left_delim.out + Generic_right_delim.out)
					type_str := bmm_cont_type_ref.type.name
					has_type_subs := bmm_cont_type_ref.type.has_type_substitutions
				end
				type_spec := bmm_cont_type_ref.type

			elseif attached {BMM_GENERIC_TYPE_REFERENCE} a_prop_def.type as bmm_gen_type_ref then
				type_str := bmm_gen_type_ref.as_type_string
				has_type_subs := bmm_gen_type_ref.has_type_substitutions
				type_spec := bmm_gen_type_ref.root_type

			elseif attached {BMM_GENERIC_PARAMETER_DEFINITION} a_prop_def.type as bmm_gen_parm_def then -- type is T, U etc
				type_str := bmm_gen_parm_def.name.twin
				if bmm_gen_parm_def.is_constrained then
					type_str.append (": " + bmm_gen_parm_def.conforms_to_type.name)
				end
				has_type_subs := bmm_gen_parm_def.has_type_substitutions
				type_spec := a_prop_def.type
			end

			if a_prop_def.is_mandatory then
				prop_str.append (" [1]")
			else
				prop_str.append (" [0..1]")
			end

			-- property node
			create a_ti
			a_ti.set_data (a_prop_def)							-- node data = BMM property definition
			a_ti.set_text (prop_str)							-- node text
			a_ti.set_tooltip (node_path.as_string)				-- tooltip
			a_ti.set_pixmap (get_icon_pixmap ("rm/generic/" + a_prop_def.multiplicity_key_string))	-- pixmap
 	 		a_ti.pointer_button_press_actions.force_extend (agent property_node_handler (a_ti, ?, ?, ?))
 	 		a_ti.expand_actions.force_extend (agent property_node_expand_handler (a_ti))
 			ev_tree_item_stack.item.extend (a_ti)
			ev_tree_item_stack.extend (a_ti)

			-- class / type node(s)
			if not is_terminal then
				create a_ti
				set_class_node_details (a_ti, type_spec, type_str, has_type_subs)
	 	 		a_ti.pointer_button_press_actions.force_extend (agent class_node_handler (a_ti, ?, ?, ?))
				ev_tree_item_stack.item.extend (a_ti)
				ev_tree_item_stack.extend (a_ti)
			end
		end

	set_class_node_details (a_ti: EV_TREE_ITEM; a_type_spec: BMM_TYPE_SPECIFIER; a_type_str: STRING; has_type_subs: BOOLEAN)
		local
			type_category, pixmap_name: STRING
			pixmap: EV_PIXMAP
		do
			type_category := a_type_spec.type_category
			a_ti.set_data (a_type_spec)						-- node data
			a_ti.set_text (a_type_str)						-- node text
			if not attached {BMM_GENERIC_PARAMETER_DEFINITION} a_type_spec then
				pixmap_name := rm_icon_dir + "/" + model_publisher + "/" + type_name_root_type (a_type_str)
				if use_rm_pixmaps and then has_icon_pixmap (pixmap_name) then
					pixmap := get_icon_pixmap (pixmap_name)
				else
					pixmap := get_icon_pixmap ("rm/generic/" + type_category)
				end
			else
				pixmap := get_icon_pixmap ("rm/generic/" + type_category)
			end
			a_ti.set_pixmap (pixmap)
 	 	end

   	populate_gui_tree_node_exit (a_prop_def: attached BMM_PROPERTY_DEFINITION)
   		do
			node_path.remove_last
			ev_tree_item_stack.remove
			if not (	-- some kind of primitive, that did not result in an object node
				attached {BMM_CLASS_DEFINITION} a_prop_def.type as bmm_class_def and then
					bmm_class_def.is_primitive_type or
				attached {BMM_CONTAINER_TYPE_REFERENCE} a_prop_def.type as bmm_cont_type_ref and then
					bmm_cont_type_ref.type.is_primitive_type
			)
			then
				ev_tree_item_stack.remove
			end
		end

	refresh_node (a_ti: EV_TREE_NODE)
		local
			pixmap_name: STRING
		do
			if attached {BMM_TYPE_SPECIFIER} a_ti.data as a_type_spec  then
				pixmap_name := rm_icon_dir + "/" + model_publisher + "/" + a_type_spec.root_class
				if use_rm_pixmaps and then has_icon_pixmap (pixmap_name) then
					a_ti.set_pixmap (get_icon_pixmap (pixmap_name))
				else
					a_ti.set_pixmap (get_icon_pixmap ("rm/generic/" + a_type_spec.type_category))
				end
			end
		end

	class_node_handler (eti: EV_TREE_ITEM; x,y, button: INTEGER)
			-- creates the context menu for a right click action for class node
		local
			subs: ARRAYED_SET[STRING]
			menu: EV_MENU
		do
			if button = {EV_POINTER_CONSTANTS}.right and attached {BMM_TYPE_SPECIFIER} eti.data as bmm_type_spec then
				create menu
				-- add menu item for retarget tool to current node / display in new tool
				add_class_context_menu (menu, eti)

				-- if there are type substitutions available, add sub-menu for that
				if attached {BMM_CLASS_DEFINITION} bmm_type_spec as bmm_class_def then
					subs := bmm_class_def.type_substitutions
				elseif attached {BMM_CONTAINER_TYPE_REFERENCE} bmm_type_spec as bmm_cont_type_ref then
					subs := bmm_cont_type_ref.type.type_substitutions
				elseif attached {BMM_GENERIC_TYPE_REFERENCE} bmm_type_spec as bmm_gen_type_ref then
					subs := bmm_gen_type_ref.type_substitutions
				elseif attached {BMM_GENERIC_PARAMETER_DEFINITION} bmm_type_spec as bmm_gen_parm_def then -- type is T, U etc
					subs := bmm_gen_parm_def.type_substitutions
				end
				if not subs.is_empty then
					add_subtype_context_menu (menu, subs, eti)
				end
				menu.show
			end
		end

	property_node_handler (eti: EV_TREE_ITEM; x,y, button: INTEGER)
			-- creates the context menu for a right click action for class node
		local
			menu: EV_MENU
			an_mi: EV_MENU_ITEM
		do
			if button = {EV_POINTER_CONSTANTS}.right and attached {BMM_PROPERTY_DEFINITION} eti.data as bmm_pd and then not bmm_pd.is_mandatory then
				create menu
				create an_mi.make_with_text_and_action ("Remove", agent remove_optional_property (eti))
				menu.extend (an_mi)
				menu.show
			end
		end

	property_node_expand_handler (eti: EV_TREE_ITEM)
			-- creates the context menu for a right click action for class node
		do
			from eti.start until eti.off loop
				if eti.item.is_empty and attached {EV_TREE_ITEM} eti.item as a_ti and then attached {BMM_TYPE_SPECIFIER} a_ti.data as bmm_type_spec then
					rebuild_from_interior_node (bmm_type_spec.root_class, a_ti, True)
				end
				eti.forth
			end
		end

	add_subtype_context_menu (menu: EV_MENU; a_substitutions: ARRAYED_SET[STRING]; a_ti: EV_TREE_ITEM)
			-- dynamically initializes the context menu for this tree
		local
			an_mi: EV_MENU_ITEM
			chg_sub_menu: EV_MENU
		do
			-- create sub menu listing subtypes to change current node into
			create chg_sub_menu.make_with_text ("Convert this node to subtype")
			from a_substitutions.start until a_substitutions.off loop
				create an_mi.make_with_text_and_action (a_substitutions.item, agent rebuild_from_interior_node (a_substitutions.item, a_ti, True))
				if source.bmm_schema.class_definition (a_substitutions.item).is_abstract then
					an_mi.set_pixmap (get_icon_pixmap ("rm/generic/class_abstract"))
				else
					an_mi.set_pixmap (get_icon_pixmap ("rm/generic/class_concrete"))
				end
	    		chg_sub_menu.extend (an_mi)
				a_substitutions.forth
			end
			menu.extend (chg_sub_menu)

			-- if owning attribute is multiple, allow adding of sibling nodes
			if a_ti.has_parent and then attached {BMM_PROPERTY_DEFINITION} a_ti.parent.data as a_prop_def and then a_prop_def.is_container then
				-- create sub menu listing subtypes to add to parent node
				create chg_sub_menu.make_with_text ("Add new subtype node")
				from a_substitutions.start until a_substitutions.off loop
					create an_mi.make_with_text_and_action (a_substitutions.item, agent rebuild_from_interior_node (a_substitutions.item, a_ti, False))
					if source.bmm_schema.class_definition (a_substitutions.item).is_abstract then
						an_mi.set_pixmap (get_icon_pixmap ("rm/generic/class_abstract"))
					else
						an_mi.set_pixmap (get_icon_pixmap ("rm/generic/class_concrete"))
					end
		    		chg_sub_menu.extend (an_mi)
					a_substitutions.forth
				end
				menu.extend (chg_sub_menu)
			end
		end

	remove_optional_property (a_ti: EV_TREE_ITEM)
			-- remove this node
		do
			a_ti.parent.prune (a_ti)
		end

	rebuild_from_interior_node (a_class_name: attached STRING; a_ti: EV_TREE_ITEM; replace_mode: BOOLEAN)
			-- rebuild EV tree from interior node of class with a new tree of selected subtype
		local
			bmm_class_def: BMM_CLASS_DEFINITION
			target_ti: EV_TREE_ITEM
		do
			a_ti.enable_select
			if replace_mode then
				target_ti := a_ti
				target_ti.wipe_out
			else
				create target_ti.default_create
				a_ti.parent.extend (target_ti)
				target_ti.set_data (a_ti.data)
	 	 		target_ti.pointer_button_press_actions.force_extend (agent class_node_handler (target_ti, ?, ?, ?))
			end
			ev_tree_item_stack.extend (target_ti)
			bmm_class_def := source.bmm_schema.class_definition (a_class_name)
			closure_depth := 1
			set_class_node_details (target_ti, bmm_class_def, a_class_name, True)
			if attached {EV_TREE_ITEM} target_ti.parent as a_parent_ti then
				create node_path.make_from_string (a_parent_ti.tooltip)
			end
			do_with_wait_cursor (ev_root_container, agent bmm_class_def.do_supplier_closure (not differential_view, ev_closure_depth_spin_button.value - 1,
				agent populate_gui_tree_node_enter, agent populate_gui_tree_node_exit))
			if a_ti.is_expandable then
				a_ti.expand
			end
			ev_tree_item_stack.remove
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
--| The Original Code is adl_node_map_control.e.
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
