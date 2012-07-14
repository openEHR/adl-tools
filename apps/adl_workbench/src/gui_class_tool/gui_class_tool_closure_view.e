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
		redefine
			repopulate
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

feature -- Definitions

	Default_closure_depth: INTEGER = 2
			-- default depth to explore supplier closure

	Tree_control_panel_width: INTEGER = 100

feature -- Initialisation

	make
		do
			create gui_controls.make (0)

			-- create widgets
			create ev_root_container
			ev_root_container.set_data (Current)
			ev_root_container.set_padding (Default_padding_width)
			ev_root_container.set_border_width (Default_border_width)

			-- EV_GRID
			create gui_grid.make (True, False, True, True)
			gui_grid.set_tree_expand_collapse_icons (get_icon_pixmap ("tool/tree_expand"), get_icon_pixmap ("tool/tree_collapse"))
			ev_root_container.extend (gui_grid.ev_grid)

			-- view controls VBOX
			create ev_view_controls_vbox
			ev_view_controls_vbox.set_padding (Default_padding_width)
			ev_view_controls_vbox.set_border_width (Default_border_width)
			ev_root_container.extend (ev_view_controls_vbox)
			ev_root_container.disable_item_expand (ev_view_controls_vbox)

			-- tree collapse/expand control
			create gui_treeview_control.make (get_text ("view_label_text"), create {GUI_TREE_CONTROL_GRID}.make (gui_grid), agent tree_recurse_node)
			ev_view_controls_vbox.extend (gui_treeview_control.ev_root_container)
			ev_view_controls_vbox.disable_item_expand (gui_treeview_control.ev_root_container)

			-- ========= RM view options =========

			-- frame
			create rm_property_visibility_frame_ctl.make (get_text ("rm_visibility_controls_text"), 85, 0, False)
			ev_view_controls_vbox.extend (rm_property_visibility_frame_ctl.ev_root_container)
			ev_view_controls_vbox.disable_item_expand (rm_property_visibility_frame_ctl.ev_root_container)

			-- add RM data properties check button
			create rm_attrs_visible_checkbox_ctl.make_active (get_text ("show_rm_properties_button_text"),
				get_text ("show_rm_properties_tooltip"),
				agent :BOOLEAN do Result := include_rm_data_properties end, agent update_include_rm_data_properties)
			gui_controls.extend (rm_attrs_visible_checkbox_ctl)
			rm_property_visibility_frame_ctl.extend (rm_attrs_visible_checkbox_ctl.ev_data_control, False)

			-- add RM runtime properties option check button
			create rm_runtime_attrs_visible_checkbox_ctl.make_active (get_text ("show_rm_runtime_properties_button_text"),
				get_text ("show_rm_runtime_properties_tooltip"),
				agent :BOOLEAN do Result := include_rm_runtime_properties end, agent update_include_rm_runtime_properties)
			gui_controls.extend (rm_runtime_attrs_visible_checkbox_ctl)
			rm_property_visibility_frame_ctl.extend (rm_runtime_attrs_visible_checkbox_ctl.ev_data_control, False)

			-- add RM infrastructure properties option check button
			create rm_if_attrs_visible_checkbox_ctl.make_active (get_text ("show_rm_if_properties_button_text"),
				get_text ("show_rm_if_properties_tooltip"),
				agent :BOOLEAN do Result := include_rm_infrastructure_properties end, agent update_include_rm_infrastructure_properties)
			gui_controls.extend (rm_if_attrs_visible_checkbox_ctl)
			rm_property_visibility_frame_ctl.extend (rm_if_attrs_visible_checkbox_ctl.ev_data_control, False)

			-- frame
			create rm_rendering_frame_ctl.make (get_text ("rm_rendering_controls_text"), 85, 0, False)
			ev_view_controls_vbox.extend (rm_rendering_frame_ctl.ev_root_container)
			ev_view_controls_vbox.disable_item_expand (rm_rendering_frame_ctl.ev_root_container)

			-- use RM icons check button
			create view_rm_use_icons_checkbox_ctl.make_active (get_text ("use_rm_icons_text"),
				get_text ("use_rm_icons_tooltip"),
				agent :BOOLEAN do Result := use_rm_pixmaps end, agent update_use_rm_pixmaps)
			gui_controls.extend (view_rm_use_icons_checkbox_ctl)
			rm_rendering_frame_ctl.extend (view_rm_use_icons_checkbox_ctl.ev_data_control, False)

			-- ========== recompute controls =========
			create rm_recompute_frame_ctl.make (get_text ("rm_closure_depth_control_frame_text"), 0, 0, False)
			ev_view_controls_vbox.extend (rm_recompute_frame_ctl.ev_root_container)
			ev_view_controls_vbox.disable_item_expand (rm_recompute_frame_ctl.ev_root_container)

			-- closure depth control
			create ev_closure_depth_spin_button
			ev_closure_depth_spin_button.set_tooltip (get_msg ("closure_depth_spin_button_tooltip", Void))
			ev_closure_depth_spin_button.set_value (default_closure_depth)
			rm_recompute_frame_ctl.extend (ev_closure_depth_spin_button, False)

			-- initial state
			include_rm_data_properties := True
		end

feature -- Access

	ev_root_container: EV_HORIZONTAL_BOX

feature -- Status Report

	is_expanded: BOOLEAN
			-- True if last whole tree operation was expand

	include_rm_data_properties: BOOLEAN

	include_rm_runtime_properties: BOOLEAN

	include_rm_infrastructure_properties: BOOLEAN

feature -- Events

	update_use_rm_pixmaps (a_flag: BOOLEAN)
		do
			set_use_rm_pixmaps (a_flag)
			if attached source then
				repopulate
				-- reflect change to other editor tools
				gui_agents.update_all_tools_rm_icons_setting_agent.call ([])
			end
		end

	update_include_rm_data_properties (a_flag: BOOLEAN)
			-- turn on or off the display of reference model data properties details in `ev_grid'.
		do
			include_rm_data_properties := a_flag
			if not a_flag then
				if include_rm_infrastructure_properties then
					include_rm_infrastructure_properties := False
				end
				if include_rm_runtime_properties then
					include_rm_runtime_properties := False
				end
			end
			if attached source then
				repopulate
			end
		end

	update_include_rm_runtime_properties (a_flag: BOOLEAN)
			-- turn on or off the display of reference model runtime properties details in `ev_grid'.
		do
			include_rm_runtime_properties := a_flag
			if a_flag and not include_rm_data_properties then
				rm_attrs_visible_checkbox_ctl.ev_data_control.enable_select
			else
				if not a_flag and include_rm_infrastructure_properties then
					include_rm_infrastructure_properties := False
				end
				if attached source then
					do_with_wait_cursor (gui_grid.ev_grid, agent repopulate)
				end
			end
		end

	update_include_rm_infrastructure_properties (a_flag: BOOLEAN)
			-- turn on or off the display of reference model infrastructure properties details in `ev_grid'.
		do
			include_rm_infrastructure_properties := a_flag
			if a_flag and not include_rm_runtime_properties then
				rm_runtime_attrs_visible_checkbox_ctl.ev_data_control.enable_select
			elseif attached source then
				do_with_wait_cursor (gui_grid.ev_grid, agent repopulate)
			end
		end

feature -- Commands

	repopulate
			-- repopulate current tree items if needed
		do
			-- populate peripheral controls
			gui_controls.do_all (agent (an_item: GUI_DATA_CONTROL) do an_item.populate end)

 			-- populate the tree
			refresh_row (gui_grid.ev_grid.row (1))
			source.do_supplier_closure (not differential_view, agent continue_rm_property,
					agent enter_rm_property, agent exit_rm_property)
		end

feature {NONE} -- Implementation

	do_clear
		do
 			ev_closure_depth_spin_button.set_value (Default_closure_depth)
			gui_grid.wipe_out
			gui_controls.do_all (agent (an_item: GUI_DATA_CONTROL) do an_item.clear end)
		end

	do_populate
		do
			-- populate peripheral controls
			gui_controls.do_all (agent (an_item: GUI_DATA_CONTROL) do an_item.populate end)

			-- for use in icon switching
 			rm_publisher := source.bmm_schema.rm_publisher

 			-- populate the tree
			create ev_grid_rm_row_stack.make (0)
			create ev_grid_rm_row_removals_stack.make (0)

			populate_root_node
			source.do_supplier_closure (not differential_view, agent continue_rm_property,
					agent enter_rm_property, agent exit_rm_property)

			gui_grid.set_column_titles (Node_grid_col_names.linear_representation)
			gui_grid.hide_column (node_grid_col_meaning)

			-- now collapse the tree, and then expand out just the top node
			gui_treeview_control.on_collapse_all
			gui_treeview_control.on_expand_one_level
		end

	gui_grid: GUI_EV_GRID

	view_rm_use_icons_checkbox_ctl: GUI_CHECK_BOX_CONTROL

	rm_attrs_visible_checkbox_ctl, rm_runtime_attrs_visible_checkbox_ctl, rm_if_attrs_visible_checkbox_ctl: GUI_CHECK_BOX_CONTROL

	view_detail_frame_ctl, rm_property_visibility_frame_ctl, rm_rendering_frame_ctl, rm_recompute_frame_ctl: GUI_FRAME_CONTROL

	gui_controls: ARRAYED_LIST [GUI_DATA_CONTROL]

	gui_treeview_control: GUI_TREEVIEW_CONTROL

	ev_view_controls_vbox: EV_VERTICAL_BOX

	ev_closure_depth_spin_button: EV_SPIN_BUTTON

	ev_closure_recompute_button: EV_BUTTON

	ev_grid_rm_row_stack: ARRAYED_STACK [EV_GRID_ROW]
			-- stack for building the RM node tree

	ev_grid_rm_row_removals_stack: ARRAYED_STACK [BOOLEAN]
			-- stack for tracking removals

	rm_publisher: STRING
			-- name of publisher, e.g. 'openehr', which is the key to RM-specific icons

	rm_node_path: OG_PATH

	node_list: ARRAYED_LIST [EV_TREE_NODE]

	closure_depth: INTEGER
			-- closure compute depth; limits closure computation to manageable level

   	populate_root_node
			-- Add root node representing class to `gui_file_tree'.
		do
			create rm_node_path.make_root
			gui_grid.add_row (1, source)
			ev_grid_rm_row_stack.extend (gui_grid.last_row)
			ev_grid_rm_row_removals_stack.extend (False)
			gui_grid.set_last_row_label_col (Node_grid_col_rm_name, source.name, rm_node_path.as_string, archetype_rm_type_color, rm_type_pixmap (source, rm_publisher))
			if attached {EV_GRID_LABEL_ITEM} gui_grid.last_row.item (Node_grid_col_rm_name) as gli then
	 	 		gli.pointer_button_press_actions.force_extend (agent class_node_handler (gui_grid.last_row, ?, ?, ?))
	 	 	end
		end

	continue_rm_property (a_bmm_prop: BMM_PROPERTY_DEFINITION; depth: INTEGER): BOOLEAN
			-- detrmine whether to continue a BMM_PROPERTY_DEFINITION
		local
			parent_class_row: EV_GRID_ROW
		do
			if attached last_property_grid_row then
				if last_property_grid_row.subrow (1).subrow_count > 0 then
					Result := True
				else
					Result := depth < ev_closure_depth_spin_button.value
				end
			end
		end

	last_property_grid_row: EV_GRID_ROW

	enter_rm_property (a_bmm_prop: BMM_PROPERTY_DEFINITION; depth: INTEGER)
			-- enter a BMM_PROPERTY_DEFINITION
		local
			parent_class_row: EV_GRID_ROW
			prop_str, type_str: STRING
			has_type_subs: BOOLEAN
			type_spec: BMM_TYPE_SPECIFIER
			col: EV_COLOR
			show_prop: BOOLEAN
			ignore: BOOLEAN
		do
			if not ev_grid_rm_row_removals_stack.item then -- don't do anything if descending into a removed subtree
				-- first of all work out whether we want this property
				show_prop := include_rm_data_properties
					and (not a_bmm_prop.is_im_runtime or else include_rm_runtime_properties)
					and (not a_bmm_prop.is_im_infrastructure or else include_rm_infrastructure_properties)

				parent_class_row := ev_grid_rm_row_stack.item
				last_property_grid_row := Void
				-- if a row for the property already exists then refresh it or remove it depending on settings; otherwise create it or do nothing
				if attached gui_grid.matching_sub_row (parent_class_row,
					agent (a_row: EV_GRID_ROW; match_bmm_prop: BMM_PROPERTY_DEFINITION): BOOLEAN
						do
							Result := attached {BMM_PROPERTY_DEFINITION} a_row.data as bmm_prop and then bmm_prop = match_bmm_prop
						end (?, a_bmm_prop)) as a_prop_row
				then
					-- put something on the stack to match stack removal in exit routine
					if show_prop then
						last_property_grid_row := a_prop_row
						-- refresh its object rows
						refresh_row (a_prop_row.subrow (1))
						rm_node_path.append_segment (create {OG_PATH_ITEM}.make (a_bmm_prop.name))
						ev_grid_rm_row_stack.extend (a_prop_row.subrow (1))
					else
						gui_grid.ev_grid.remove_row (a_prop_row.index)
						ignore := True
					end

				else
					if show_prop then
						-- determine data for property and one or more (in the case of generics with > 1 param) class nodes
						prop_str := a_bmm_prop.name.twin
						if attached {BMM_CLASS_DEFINITION} a_bmm_prop.type as bmm_class_def then
							type_str := bmm_class_def.name
							has_type_subs := bmm_class_def.has_type_substitutions
							type_spec := bmm_class_def

						elseif attached {BMM_CONTAINER_TYPE_REFERENCE} a_bmm_prop.type as bmm_cont_type_ref then
							prop_str.append (": " + bmm_cont_type_ref.container_type.name + Generic_left_delim.out + Generic_right_delim.out)
							type_str := bmm_cont_type_ref.type.name
							has_type_subs := bmm_cont_type_ref.type.has_type_substitutions
							type_spec := bmm_cont_type_ref.type

						elseif attached {BMM_GENERIC_TYPE_REFERENCE} a_bmm_prop.type as bmm_gen_type_ref then
							type_str := bmm_gen_type_ref.as_type_string
							has_type_subs := bmm_gen_type_ref.has_type_substitutions
							type_spec := bmm_gen_type_ref.root_type

						elseif attached {BMM_GENERIC_PARAMETER_DEFINITION} a_bmm_prop.type as bmm_gen_parm_def then -- type is T, U etc
							type_str := bmm_gen_parm_def.as_type_string
							has_type_subs := bmm_gen_parm_def.has_type_substitutions
							type_spec := a_bmm_prop.type
						end

						-- ======== property node =========
						gui_grid.add_sub_row (parent_class_row, a_bmm_prop)
						last_property_grid_row := gui_grid.last_row

						if a_bmm_prop.is_im_infrastructure then
							col := rm_infrastructure_attribute_colour
						elseif a_bmm_prop.is_im_runtime then
							col := rm_runtime_attribute_colour
						else
							col := rm_attribute_color
						end
						rm_node_path.append_segment (create {OG_PATH_ITEM}.make (a_bmm_prop.name))
						gui_grid.set_last_row_label_col (Node_grid_col_rm_name, prop_str, rm_node_path.as_string,
							col, get_icon_pixmap ("rm/generic/" + a_bmm_prop.multiplicity_key_string))

						-- existence
						gui_grid.set_last_row_label_col (Node_grid_col_existence, a_bmm_prop.existence.as_string, Void, col, Void)

						-- cardinality
						if attached {BMM_CONTAINER_PROPERTY} a_bmm_prop as bmm_cont_prop then
							gui_grid.set_last_row_label_col (Node_grid_col_card_occ, bmm_cont_prop.cardinality.as_string, Void, col, Void)
						end

						-- add tree expand handler to this node
						gui_grid.last_row.expand_actions.force_extend (agent property_node_expand_handler (gui_grid.last_row))

						-- add right-click menu to property node for removal etc
			--			if attached {EV_GRID_LABEL_ITEM} gui_grid.last_row.item (Node_grid_col_rm_name) as gli then
			--		 		gli.pointer_button_press_actions.force_extend (agent property_node_handler (gli, ?, ?, ?))
			--			end

						-- ======== type node =========
						gui_grid.add_sub_row (gui_grid.last_row, type_spec)
						ev_grid_rm_row_stack.extend (gui_grid.last_row)
						gui_grid.set_last_row_label_col (Node_grid_col_rm_name, type_str, rm_node_path.as_string, archetype_rm_type_color, rm_type_pixmap (type_spec, rm_publisher))
						if attached {EV_GRID_LABEL_ITEM} gui_grid.last_row.item (Node_grid_col_rm_name) as gli then
				 	 		gli.pointer_button_press_actions.force_extend (agent class_node_handler (gui_grid.last_row, ?, ?, ?))
				 	 	end
				 	else
						ignore := True
				 	end
			 	end
			else
				ignore := True
			end
		 	ev_grid_rm_row_removals_stack.extend (ignore)
		end

	exit_rm_property (a_bmm_prop: BMM_PROPERTY_DEFINITION)
			-- exit a BMM_PROPERTY_DEFINITION
		do
			if not ev_grid_rm_row_removals_stack.item then
				rm_node_path.remove_last
				ev_grid_rm_row_stack.remove
			end
		 	ev_grid_rm_row_removals_stack.remove
		end

	class_node_handler (a_class_grid_row: EV_GRID_ROW; x,y, button: INTEGER)
			-- creates the context menu for a right click action for class node
		local
			subs: ARRAYED_SET[STRING]
			menu: EV_MENU
		do
			if button = {EV_POINTER_CONSTANTS}.right and attached {BMM_TYPE_SPECIFIER} a_class_grid_row.data as bmm_type_spec then
				a_class_grid_row.item (1).enable_select
				create menu
				-- add menu item for retarget tool to current node / display in new tool
				if attached {BMM_CLASS_DEFINITION} a_class_grid_row.data as a_class_def then
					add_class_context_menu (menu, a_class_def)
				end

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
					add_subtype_context_menu (menu, subs, a_class_grid_row)
				end
				menu.show
			end
		end

	property_node_handler (a_prop_grid_row: EV_GRID_ROW; x,y, button: INTEGER)
			-- creates the context menu for a right click action for property node
		local
			menu: EV_MENU
			an_mi: EV_MENU_ITEM
		do
			if button = {EV_POINTER_CONSTANTS}.right and attached {BMM_PROPERTY_DEFINITION} a_prop_grid_row.data as bmm_pd and then not bmm_pd.is_mandatory then
				create menu
				create an_mi.make_with_text_and_action ("Remove", agent remove_optional_property (a_prop_grid_row))
				menu.extend (an_mi)
				menu.show
			end
		end

	add_subtype_context_menu (menu: EV_MENU; a_substitutions: ARRAYED_SET[STRING]; a_class_grid_row: EV_GRID_ROW)
			-- dynamically initializes the context menu for this tree
		local
			an_mi: EV_MENU_ITEM
			chg_sub_menu: EV_MENU
		do
			-- create sub menu listing subtypes to change current node into
			create chg_sub_menu.make_with_text (get_text ("context_menu_convert_node_to_subtype"))
			from a_substitutions.start until a_substitutions.off loop
				create an_mi.make_with_text_and_action (a_substitutions.item, agent convert_node_to_subtype (a_substitutions.item, a_class_grid_row, True))
				if rm_schema.class_definition (a_substitutions.item).is_abstract then
					an_mi.set_pixmap (get_icon_pixmap ("rm/generic/class_abstract"))
				else
					an_mi.set_pixmap (get_icon_pixmap ("rm/generic/class_concrete"))
				end
	    		chg_sub_menu.extend (an_mi)
				a_substitutions.forth
			end
			menu.extend (chg_sub_menu)

			-- if owning attribute is multiple, allow adding of sibling nodes
--			if attached a_class_grid_row.parent_row and then
--				attached {BMM_PROPERTY_DEFINITION} a_class_grid_row.parent_row.data as a_prop_def and then a_prop_def.is_container
--			then
--				-- create sub menu listing subtypes to add to parent node
--				create chg_sub_menu.make_with_text (get_text ("context_menu_add_subtype_mode"))
--				from a_substitutions.start until a_substitutions.off loop
--					create an_mi.make_with_text_and_action (a_substitutions.item, agent convert_node_to_subtype (a_substitutions.item, a_class_grid_row, False))
--					if rm_schema.class_definition (a_substitutions.item).is_abstract then
--						an_mi.set_pixmap (get_icon_pixmap ("rm/generic/class_abstract"))
--					else
--						an_mi.set_pixmap (get_icon_pixmap ("rm/generic/class_concrete"))
--					end
--		    		chg_sub_menu.extend (an_mi)
--					a_substitutions.forth
--				end
--				menu.extend (chg_sub_menu)
--			end
		end

	remove_optional_property (a_prop_grid_row: EV_GRID_ROW)
			-- remove this node
		do
			a_prop_grid_row.parent.remove_row (a_prop_grid_row.index)
		end

	property_node_expand_handler (a_prop_grid_row: EV_GRID_ROW)
		local
			i: INTEGER
		do
			-- there can be more than one class subrow below a property because of additions done by user choosing
			-- 'add_subtype' menu option
			from i := 1 until i > a_prop_grid_row.subrow_count loop
				if a_prop_grid_row.subrow (i).subrow_count = 0 and attached {BMM_TYPE_SPECIFIER} a_prop_grid_row.subrow (i).data as bmm_type_spec then
					convert_node_to_subtype (bmm_type_spec.root_class, a_prop_grid_row.subrow (i), True)
				end
				i := i + 1
			end
		end

	convert_node_to_subtype (a_subtype: attached STRING; a_class_grid_row: EV_GRID_ROW; replace_mode: BOOLEAN)
			-- rebuild EV tree from interior node of class with a new tree of selected subtype
		local
			bmm_subtype_def: BMM_CLASS_DEFINITION
		do
			bmm_subtype_def := rm_schema.class_definition (a_subtype)
			-- set the RM path from the sibling node; it is the regardless of whether we are replacing or adding nodes
			if attached {EV_GRID_LABEL_ITEM} a_class_grid_row.item (Node_grid_col_rm_name) as gli then
				create rm_node_path.make_from_string (utf32_to_utf8 (gli.tooltip))
			end
			if replace_mode then
				gui_grid.remove_sub_rows (a_class_grid_row)
				gui_grid.set_last_row (a_class_grid_row)
				gui_grid.update_last_row_label_col (Node_grid_col_rm_name, a_subtype, Void, archetype_rm_type_color, rm_type_pixmap (bmm_subtype_def, rm_publisher))
				gui_grid.last_row.set_data (bmm_subtype_def)
				ev_grid_rm_row_stack.extend (a_class_grid_row)
			else
				gui_grid.add_sub_row (a_class_grid_row.parent_row, bmm_subtype_def)
				gui_grid.set_last_row_label_col (Node_grid_col_rm_name, a_subtype, rm_node_path.as_string, archetype_rm_type_color, rm_type_pixmap (bmm_subtype_def, rm_publisher))
				if attached {EV_GRID_LABEL_ITEM} gui_grid.last_row.item (Node_grid_col_rm_name) as gli then
	 	 			gli.pointer_button_press_actions.force_extend (agent class_node_handler (gui_grid.last_row, ?, ?, ?))
					gui_grid.last_row.expand_actions.force_extend (agent property_node_expand_handler (gui_grid.last_row))
				end
				ev_grid_rm_row_stack.extend (gui_grid.last_row)
			end

			ev_grid_rm_row_removals_stack.extend (False)

			bmm_subtype_def.do_supplier_closure (not differential_view, agent continue_rm_property, agent enter_rm_property, agent exit_rm_property)

			ev_grid_rm_row_stack.remove
			ev_grid_rm_row_removals_stack.remove

			if a_class_grid_row.is_expandable then
				a_class_grid_row.expand
			end
		end

	refresh_row (a_row: EV_GRID_ROW)
		do
			if attached {BMM_TYPE_SPECIFIER} a_row.data as a_type_spec then
				if attached {EV_GRID_LABEL_ITEM} a_row.item (Node_grid_col_rm_name) as gli then
					gli.set_pixmap (rm_type_pixmap (a_type_spec, rm_publisher))
				end
			end
		end

	tree_recurse_node (a_row: EV_GRID_ROW): BOOLEAN
		do
			Result := a_row.parent.depth_in_tree (a_row.index) < ev_closure_depth_spin_button.value or else a_row.is_expandable
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
