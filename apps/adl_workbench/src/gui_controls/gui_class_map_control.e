note
	component:   "openEHR Archetype Project"
	description: "Class map control - Visualise a reference model class as a node map"
	keywords:    "archetype, cadl, gui"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.com>"
	copyright:   "Copyright (c) 2010 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class GUI_CLASS_MAP_TOOL

inherit
	GUI_TOOL
		redefine
			ev_root_container
		end

	SHARED_APP_UI_RESOURCES
		export
			{NONE} all
		end

	GUI_UTILITIES
		export
			{NONE} all
		end

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

feature -- Initialisation

	make
		do
			-- create root widget
			create ev_root_container
			create ev_action_bar
			create ev_class_id
			create ev_view_label
			create ev_view_tool_bar
			create ev_differential_view_button
			create ev_flat_view_button
			create ev_tree

			-- connect widgets
			ev_root_container.extend (ev_action_bar)
			ev_root_container.extend (ev_tree)

			ev_action_bar.extend (ev_class_id)
			ev_action_bar.extend (ev_view_label)
			ev_action_bar.extend (ev_view_tool_bar)
			ev_view_tool_bar.extend (ev_differential_view_button)
			ev_view_tool_bar.extend (ev_flat_view_button)

			-- visual characteristics
			ev_root_container.disable_item_expand (ev_action_bar)
			ev_action_bar.set_padding (10)
			ev_action_bar.set_border_width (4)
			ev_action_bar.disable_item_expand (ev_view_label)
			ev_action_bar.disable_item_expand (ev_view_tool_bar)
			ev_class_id.disable_edit
			ev_view_label.set_text ("View ")
			ev_differential_view_button.set_pixmap (pixmaps ["diff"])
			ev_flat_view_button.set_pixmap (pixmaps ["flat"])
			ev_differential_view_button.set_tooltip (create_message_content ("Set differential archetype view", Void))
			ev_flat_view_button.set_tooltip (create_message_content ("Set flat archetype view", Void))

			-- set events: action bar
			ev_differential_view_button.select_actions.extend (agent on_differential_view)
			ev_flat_view_button.select_actions.extend (agent on_flat_view)

			differential_view := True
			ev_differential_view_button.enable_select
		end

feature -- Access

	ev_root_container: EV_VERTICAL_BOX

	ev_class_id: EV_TEXT_FIELD

	ev_tree: EV_TREE

	class_desc: ARCH_CAT_MODEL_NODE

feature -- Status Report

	differential_view: BOOLEAN

feature -- Events

	on_flat_view
			-- Called by `select_actions' of `flat_view_button'.
		do
			set_view (False)
		end

	on_differential_view
			-- Called by `select_actions' of `differential_view_button'.
		do
			set_view (True)
		end

	set_view (differential_flag: BOOLEAN)
			-- set view one way or the other
		do
			if (differential_flag and not differential_view) or -- changing from flat to diff
				(not differential_flag and differential_view)  -- changing from diff to flat
			then
				differential_view := differential_flag
				repopulate
			end
		end

feature -- Commands

	clear
		do
			ev_tree.wipe_out
 			ev_class_id.remove_text
		end

	populate (a_class_desc: attached ARCH_CAT_MODEL_NODE)
			-- populate the ADL tree control by creating it from scratch
		do
			class_desc := a_class_desc
			repopulate
		end

	repopulate
		do
			do_with_wait_cursor (ev_root_container, agent do_repopulate)
		end

	do_repopulate
		do
			clear
 			create ev_tree_item_stack.make (0)

 			ev_class_id.set_text (class_desc.class_definition.name)
			populate_root_node

			class_desc.class_definition.do_supplier_closure (not differential_view, agent populate_gui_tree_node_enter, agent populate_gui_tree_node_exit)

			-- now collapse the tree, and then expand out just the top node
			ev_tree.recursive_do_all (agent ev_tree_collapse)
			if not ev_tree.is_empty and then ev_tree.first.is_expandable then
				ev_tree.first.expand
			end
		end

	select_flat_view
			-- Called by `select_actions' of `flat_view_button'.
		do
			if not ev_flat_view_button.is_selected then
				ev_flat_view_button.enable_select
				set_view (False)
			end
		end

	select_differential_view
			-- Called by `select_actions' of `differential_view_button'.
		do
			if not ev_differential_view_button.is_selected then
				ev_differential_view_button.enable_select
				set_view (True)
			end
		end

feature {NONE} -- Implementation

	ev_action_bar: EV_HORIZONTAL_BOX

	ev_view_tool_bar: EV_TOOL_BAR

	ev_differential_view_button, ev_flat_view_button: EV_TOOL_BAR_RADIO_BUTTON

	ev_view_label: EV_LABEL

	ev_tree_item_stack: ARRAYED_STACK[EV_TREE_ITEM]

	node_path: OG_PATH

   	populate_root_node
			-- Add root node representing class to `gui_file_tree'.
   		local
			a_ti: EV_TREE_ITEM
		do
			create a_ti
			a_ti.set_text (class_desc.class_definition.name)
			a_ti.set_pixmap (pixmaps [class_desc.group_name])
			ev_tree.extend (a_ti)
			ev_tree_item_stack.extend (a_ti)
			create node_path.make_root
		end

   	populate_gui_tree_node_enter (a_prop_def: attached BMM_PROPERTY_DEFINITION)
   			-- Add a node representing `a_prop_def' to `gui_file_tree'.
   		local
			a_ti: EV_TREE_ITEM
			prop_str, type_str: STRING
			is_terminal: BOOLEAN
			has_type_subs: BOOLEAN
		do
			-- update path value
			prop_str := a_prop_def.name.twin
			node_path.append_segment (create {OG_PATH_ITEM}.make (prop_str))

			-- determine data for property and one or more (in the case of generics with > 1 param) class nodes
			if attached {BMM_CLASS_DEFINITION} a_prop_def.type_def as bmm_class_def then
				if bmm_class_def.bmm_model.primitive_types.has (bmm_class_def.name) then
					prop_str.append (": " + bmm_class_def.name)
					is_terminal := True
				else
					type_str := bmm_class_def.name
				end
				has_type_subs := bmm_class_def.has_type_substitutions

			elseif attached {BMM_CONTAINER_TYPE_REFERENCE} a_prop_def.type_def as bmm_cont_type_ref then
				-- assume first gen param is only type of interest
				prop_str.append (": " + bmm_cont_type_ref.container_type + Generic_left_delim.out + Generic_right_delim.out)
				type_str := bmm_cont_type_ref.type
				has_type_subs := bmm_cont_type_ref.type_def.has_type_substitutions

			elseif attached {BMM_GENERIC_TYPE_REFERENCE} a_prop_def.type_def as bmm_gen_type_ref then
				type_str := bmm_gen_type_ref.as_type_string
				has_type_subs := bmm_gen_type_ref.has_type_substitutions

			elseif attached {BMM_GENERIC_PARAMETER_DEFINITION} a_prop_def.type_def as bmm_gen_parm_def then -- type is T, U etc
				type_str := bmm_gen_parm_def.name.twin
				if bmm_gen_parm_def.is_constrained then
					type_str.append (": " + bmm_gen_parm_def.conforms_to_type)
				end
				has_type_subs := bmm_gen_parm_def.has_type_substitutions
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
			a_ti.set_pixmap (pixmaps [rm_attribute_pixmap_string (a_prop_def)])	-- pixmap
			ev_tree_item_stack.item.extend (a_ti)
			ev_tree_item_stack.extend (a_ti)

			if not is_terminal then
				-- class / type node(s)
				create a_ti
				set_class_node_details (a_ti, a_prop_def.type_def, type_str, has_type_subs)

				ev_tree_item_stack.item.extend (a_ti)
				ev_tree_item_stack.extend (a_ti)
			end
		end

	set_class_node_details (a_ti: EV_TREE_ITEM; a_type_spec: BMM_TYPE_SPECIFIER; a_type_str: STRING; has_type_subs: BOOLEAN)
		local
			type_category: STRING
		do
			type_category := a_type_spec.type_category
			a_ti.set_data (a_type_spec)						-- node data
			a_ti.set_text (a_type_str)						-- node text
			a_ti.set_pixmap (pixmaps [type_category])		-- pixmap

			if has_type_subs then
	 			a_ti.set_pebble_function (agent pebble_function)
				a_ti.set_configurable_target_menu_handler (agent context_menu_handler)
				a_ti.set_configurable_target_menu_mode
			end
		end

   	populate_gui_tree_node_exit (a_prop_def: attached BMM_PROPERTY_DEFINITION)
   		do
			node_path.remove_last
			ev_tree_item_stack.remove
			if not attached {BMM_CLASS_DEFINITION} a_prop_def.type_def as bmm_class_def or else not bmm_class_def.bmm_model.primitive_types.has (bmm_class_def.name) then
				ev_tree_item_stack.remove
			end
		end

	rm_attribute_pixmap_string (rm_attr: attached BMM_PROPERTY_DEFINITION): STRING
			-- string name of pixmap for attribute rm_attr
		do
			create Result.make(0)
			Result.append ("C_ATTRIBUTE")
			if rm_attr.is_container then
				Result.append (".multiple")
			end
			if not rm_attr.is_mandatory then
				Result.append (".optional")
			end
			Result.append (".reference_model")
		end

	ev_tree_collapse (node: attached EV_TREE_NODE)
			--
		do
 			if node.is_expandable then
				node.collapse
 			end
		end

	context_menu_handler (a_menu: EV_MENU; a_target_list: ARRAYED_LIST [EV_PND_TARGET_DATA]; a_source: EV_PICK_AND_DROPABLE; a_pebble: ANY)
			-- creates the context menu for a right click action for class node
		local
			subs: ARRAYED_SET[STRING]
		do
			if attached {EV_TREE_ITEM} a_source as eti then
				if attached {BMM_CLASS_DEFINITION} eti.data as bmm_class_def then
					subs := bmm_class_def.type_substitutions

				elseif attached {BMM_CONTAINER_TYPE_REFERENCE} eti.data as bmm_cont_type_ref then
					subs := bmm_cont_type_ref.type_def.type_substitutions

				elseif attached {BMM_GENERIC_TYPE_REFERENCE} eti.data as bmm_gen_type_ref then
					subs := bmm_gen_type_ref.type_substitutions

				elseif attached {BMM_GENERIC_PARAMETER_DEFINITION} eti.data as bmm_gen_parm_def then -- type is T, U etc
					subs := bmm_gen_parm_def.type_substitutions
				end
				if not subs.is_empty then
					create_context_menu (a_menu, subs, a_source, a_pebble)
				end
			end
		end

	create_context_menu (menu: EV_MENU; a_substitutions: ARRAYED_SET[STRING]; a_source: EV_PICK_AND_DROPABLE; a_pebble: ANY)
			-- dynamically initializes the context menu for this tree
		local
			an_mi: EV_MENU_ITEM
			sub_menu: EV_MENU
		do
			if attached {EV_TREE_ITEM} a_source as a_ti then
				create sub_menu.make_with_text ("subtypes")
				from a_substitutions.start until a_substitutions.off loop
					create an_mi.make_with_text_and_action (a_substitutions.item, agent rebuild_from_interior_node (a_substitutions.item, a_ti))
					if attached {BMM_TYPE_SPECIFIER} a_ti.data as a_type_spec then
						if a_type_spec.bmm_model.class_definition (a_substitutions.item).is_abstract then
							an_mi.set_pixmap (pixmaps ["class_abstract"])
						else
							an_mi.set_pixmap (pixmaps ["class_concrete"])
						end
					end
		    		sub_menu.extend (an_mi)
					a_substitutions.forth
				end
				menu.extend (sub_menu)
			end
		end

	rebuild_from_interior_node (a_class_name: attached STRING; a_ti: EV_TREE_ITEM)
			-- rebuild EV tree from interior node of class with a new tree of selected subtype
		local
			bmm_class_def: BMM_CLASS_DEFINITION
		do
			a_ti.enable_select
			a_ti.wipe_out
			ev_tree_item_stack.extend (a_ti)
			if attached {BMM_TYPE_SPECIFIER} a_ti.data as a_type_spec then
				bmm_class_def := a_type_spec.bmm_model.class_definition (a_class_name)
				set_class_node_details (a_ti, bmm_class_def, a_class_name, True)
				if attached {EV_TREE_ITEM} a_ti.parent as a_parent_ti then
					create node_path.make_from_string (a_parent_ti.tooltip)
				end
				do_with_wait_cursor (ev_root_container, agent bmm_class_def.do_supplier_closure (not differential_view, agent populate_gui_tree_node_enter, agent populate_gui_tree_node_exit))
			end
			ev_tree_item_stack.remove
		end

	pebble_function (a_x, a_y: INTEGER): ANY
			-- Pebble function for pebble source
		do
			Result := "pebble"
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
