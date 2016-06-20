note
	component:   "openEHR ADL Tools"
	description: "Class map control - visualise property view of a class, including flattening."
	keywords:    "archetype, ADL, gui"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2010- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

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

	DEBUG_HELPER

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
			create rm_node_path.make_root
			create rm_publisher.make_empty
			create rm_closure.make_empty
			create ev_grid_rm_row_stack.make (0)
			create ev_grid_rm_row_removals_stack.make (0)


			-- create widgets
			create ev_root_container
			ev_root_container.set_padding (Default_padding_width)
			ev_root_container.set_border_width (Default_border_width)

			-- EV_GRID
			create gui_grid.make (True, False, True, True)
			gui_grid.set_tree_expand_collapse_icons (get_icon_pixmap ("tool/tree_expand"), get_icon_pixmap ("tool/tree_collapse"))
			ev_root_container.extend (gui_grid.ev_grid)

			-- ============== view controls control panel ================
			create control_panel.make
			ev_root_container.extend (control_panel.ev_root_container)
			ev_root_container.disable_item_expand (control_panel.ev_root_container)

			-- tree collapse/expand control
			create gui_treeview_control.make (create {EVX_TREE_CONTROL_GRID}.make (gui_grid), agent tree_recurse_node,
				get_icon_pixmap ("tool/tree_collapse_all"), get_icon_pixmap ("tool/tree_collapse"),
				get_icon_pixmap ("tool/tree_expand"), get_icon_pixmap ("tool/tree_expand_all"), Void)
			control_panel.add_frame (gui_treeview_control.ev_root_container, False)

			-- ========= RM view options =========

			-- frame
			create rm_property_visibility_frame_ctl.make (get_text (ec_rm_visibility_controls_text), False)
			control_panel.add_frame_control (rm_property_visibility_frame_ctl, False)

			-- add RM data properties check button
			create rm_attrs_visible_checkbox_ctl.make_linked (get_text (ec_show_rm_properties_button_text),
				get_text (ec_show_rm_properties_tooltip),
				agent :BOOLEAN do Result := include_rm_data_properties end, agent update_include_rm_data_properties)
			gui_controls.extend (rm_attrs_visible_checkbox_ctl)
			rm_property_visibility_frame_ctl.extend (rm_attrs_visible_checkbox_ctl.ev_data_control, False)

			-- add RM runtime properties option check button
			create rm_runtime_attrs_visible_checkbox_ctl.make_linked (get_text (ec_show_rm_runtime_properties_button_text),
				get_text (ec_show_rm_runtime_properties_tooltip),
				agent :BOOLEAN do Result := include_rm_runtime_properties end, agent update_include_rm_runtime_properties)
			gui_controls.extend (rm_runtime_attrs_visible_checkbox_ctl)
			rm_property_visibility_frame_ctl.extend (rm_runtime_attrs_visible_checkbox_ctl.ev_data_control, False)

			-- add RM infrastructure properties option check button
			use_rm_pixmaps := True
			create rm_if_attrs_visible_checkbox_ctl.make_linked (get_text (ec_show_rm_if_properties_button_text),
				get_text (ec_show_rm_if_properties_tooltip),
				agent :BOOLEAN do Result := include_rm_infrastructure_properties end, agent update_include_rm_infrastructure_properties)
			gui_controls.extend (rm_if_attrs_visible_checkbox_ctl)
			rm_property_visibility_frame_ctl.extend (rm_if_attrs_visible_checkbox_ctl.ev_data_control, False)

			-- frame
			create rm_rendering_frame_ctl.make (get_text (ec_rendering_controls_text), False)
			control_panel.add_frame_control (rm_rendering_frame_ctl, False)

			-- use RM icons check button
			create view_rm_use_icons_checkbox_ctl.make_linked (get_text (ec_use_rm_icons_text),
				get_text (ec_use_rm_icons_tooltip),
				agent :BOOLEAN do Result := use_rm_pixmaps end, agent update_use_rm_pixmaps)
			gui_controls.extend (view_rm_use_icons_checkbox_ctl)
			rm_rendering_frame_ctl.extend (view_rm_use_icons_checkbox_ctl.ev_data_control, False)

			-- ========== recompute controls =========
			create rm_recompute_frame_ctl.make (get_text (ec_rm_closure_depth_control_frame_text), False)
			control_panel.add_frame_control (rm_recompute_frame_ctl, False)

			-- closure depth control
			create ev_closure_depth_spin_button
			ev_closure_depth_spin_button.set_tooltip (get_msg (ec_closure_depth_spin_button_tooltip, Void))
			ev_closure_depth_spin_button.set_value (default_closure_depth)
			rm_recompute_frame_ctl.extend (ev_closure_depth_spin_button, False)

			-- initial state
			include_rm_data_properties := True
			include_rm_runtime_properties := True
			include_rm_infrastructure_properties := True

			ev_root_container.set_data (Current)
		end

feature -- Access

	ev_root_container: EV_HORIZONTAL_BOX

feature -- Status Report

	is_expanded: BOOLEAN
			-- True if last whole tree operation was expand

	include_rm_data_properties: BOOLEAN

	include_rm_runtime_properties: BOOLEAN

	include_rm_infrastructure_properties: BOOLEAN

	use_rm_pixmaps: BOOLEAN

feature -- Events

	update_use_rm_pixmaps (a_flag: BOOLEAN)
		do
			use_rm_pixmaps := a_flag
			if attached source then
				repopulate
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
			gui_controls.do_all (agent (an_item: EVX_DATA_CONTROL) do an_item.populate end)

 			-- populate the tree
			refresh_row (gui_grid.ev_grid.row (1))
			safe_source.do_supplier_closure (not differential_view, agent continue_rm_property,
					agent enter_rm_property, agent exit_rm_property)
		end

feature {NONE} -- Implementation

	do_clear
		do
 			ev_closure_depth_spin_button.set_value (Default_closure_depth)
			gui_grid.wipe_out
			gui_controls.do_all (agent (an_item: EVX_DATA_CONTROL) do an_item.clear end)
		end

	do_populate
		do
			-- populate peripheral controls
			gui_controls.do_all (agent (an_item: EVX_DATA_CONTROL) do an_item.populate end)

			-- for use in icon switching
 			rm_publisher := safe_source.bmm_model.rm_publisher.as_lower
 			rm_closure := safe_source.bmm_model.schema_name.as_lower

 			-- populate the tree
			create ev_grid_rm_row_stack.make (0)
			create ev_grid_rm_row_removals_stack.make (0)

			populate_root_node
			safe_source.do_supplier_closure (not differential_view, agent continue_rm_property,
					agent enter_rm_property, agent exit_rm_property)

			gui_grid.set_column_titles (Definition_grid_col_names.linear_representation)
			gui_grid.hide_column (Definition_grid_col_meaning)

			-- now collapse the tree, and then expand out just the top node
			gui_treeview_control.on_collapse_all
			gui_treeview_control.on_expand_one_level
		end

	gui_grid: EVX_GRID

	view_rm_use_icons_checkbox_ctl: EVX_CHECK_BOX_CONTROL

	rm_attrs_visible_checkbox_ctl, rm_runtime_attrs_visible_checkbox_ctl, rm_if_attrs_visible_checkbox_ctl: EVX_CHECK_BOX_CONTROL

	rm_property_visibility_frame_ctl, rm_rendering_frame_ctl, rm_recompute_frame_ctl: EVX_FRAME_CONTROL

	gui_controls: ARRAYED_LIST [EVX_DATA_CONTROL]

	gui_treeview_control: EVX_TREEVIEW_CONTROL

	control_panel: EVX_CONTROL_PANEL

	ev_closure_depth_spin_button: EV_SPIN_BUTTON

	ev_grid_rm_row_stack: ARRAYED_STACK [EV_GRID_ROW]
			-- stack for building the RM node tree

	ev_grid_rm_row_removals_stack: ARRAYED_STACK [BOOLEAN]
			-- stack for tracking removals

	rm_publisher: STRING
			-- name of publisher, e.g. 'openehr', which is the key to RM-specific icons

	rm_closure: STRING
			-- name of closure (i.e. model)

	rm_node_path: OG_PATH

	closure_depth: INTEGER
			-- closure compute depth; limits closure computation to manageable level

   	populate_root_node
			-- Add root node representing class to `gui_file_tree'.
		do
			create rm_node_path.make_root
			gui_grid.add_row (source)
			if attached gui_grid.last_row as lr and attached source as src then
				ev_grid_rm_row_stack.extend (lr)
				ev_grid_rm_row_removals_stack.extend (False)
				gui_grid.set_last_row_label_col (Definition_grid_col_rm_name, src.type_signature, rm_node_path.as_string, Void, archetype_rm_type_color, rm_type_pixmap (src, use_rm_pixmaps))
				if attached {EV_GRID_LABEL_ITEM} lr.item (Definition_grid_col_rm_name) as gli then
		 	 		gli.pointer_button_press_actions.force_extend (agent class_node_handler (lr, ?, ?, ?))
		 	 	end
			end
		end

	continue_rm_property (a_bmm_prop: BMM_PROPERTY [BMM_TYPE]; depth: INTEGER): BOOLEAN
			-- detrmine whether to continue a BMM_PROPERTY_DEFINITION
		do
			if attached last_property_grid_row as gr then
				if gr.subrow (1).subrow_count > 0 then
					Result := True
				else
					Result := depth < ev_closure_depth_spin_button.value
				end
			end
		end

	last_property_grid_row: detachable EV_GRID_ROW

	enter_rm_property (a_bmm_prop: BMM_PROPERTY [BMM_TYPE]; depth: INTEGER)
			-- enter a BMM_PROPERTY
		local
			ev_parent_class_row, ev_prop_row, ev_class_row: EV_GRID_ROW
			prop_str, type_str: STRING
			has_type_subs: BOOLEAN
			bmm_class: BMM_CLASS
			col: EV_COLOR
			show_prop: BOOLEAN
			ignore: BOOLEAN
		do
			if not ev_grid_rm_row_removals_stack.item then -- don't do anything if descending into a removed subtree
				-- first of all work out whether we want this property
				show_prop := include_rm_data_properties
					and (not a_bmm_prop.is_im_runtime or else include_rm_runtime_properties)
					and (not a_bmm_prop.is_im_infrastructure or else include_rm_infrastructure_properties)

				ev_parent_class_row := ev_grid_rm_row_stack.item
				check attached {BMM_CLASS} ev_parent_class_row.data end

				last_property_grid_row := Void
				-- if a row for the property already exists then refresh it or remove it depending on settings; otherwise create it or do nothing
				if attached gui_grid.matching_sub_row (ev_parent_class_row,
					agent (a_row: EV_GRID_ROW; match_bmm_prop: BMM_PROPERTY [BMM_TYPE]): BOOLEAN
						do
							Result := attached {BMM_PROPERTY [BMM_TYPE]} a_row.data as bmm_prop and then bmm_prop = match_bmm_prop
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
						if attached {BMM_CONTAINER_TYPE} a_bmm_prop.type as bmm_cont_type then
							bmm_class := bmm_cont_type.base_type.base_class
							prop_str.append (": " + bmm_cont_type.container_type.name + Generic_left_delim.out + Generic_right_delim.out)
						else
							bmm_class := a_bmm_prop.type.base_class
						end
						type_str := bmm_class.type_signature
						has_type_subs := bmm_class.has_descendants

						-- ======== property node =========
						gui_grid.add_sub_row (ev_parent_class_row, a_bmm_prop)
						last_property_grid_row := gui_grid.last_row
						check attached gui_grid.last_row as lr then
							ev_prop_row := lr
						end

						if a_bmm_prop.is_im_infrastructure then
							col := rm_infrastructure_attribute_colour
						elseif a_bmm_prop.is_im_runtime then
							col := rm_runtime_attribute_colour
						else
							col := rm_attribute_color
						end
						rm_node_path.append_segment (create {OG_PATH_ITEM}.make (a_bmm_prop.name))
						gui_grid.set_last_row_label_col (Definition_grid_col_rm_name, prop_str, rm_node_path.as_string,
							Void, col, get_icon_pixmap (Icon_rm_generic_dir + resource_path_separator + a_bmm_prop.multiplicity_key_string))

						-- existence
						gui_grid.set_last_row_label_col (Definition_grid_col_existence, a_bmm_prop.existence.as_string, Void, Void, col, Void)

						-- cardinality
						if attached {BMM_CONTAINER_PROPERTY} a_bmm_prop as bmm_cont_prop then
							gui_grid.set_last_row_label_col (Definition_grid_col_card_occ, bmm_cont_prop.cardinality.as_string, Void, Void, col, Void)
						end

						-- add tree expand handler to this node
						ev_prop_row.expand_actions.force_extend (agent property_node_expand_handler (ev_prop_row))

						-- ======== class node =========					
						gui_grid.add_sub_row (ev_prop_row, bmm_class)
						gui_grid.set_last_row_label_col (Definition_grid_col_rm_name, type_str, rm_node_path.as_string, Void, archetype_rm_type_color, rm_type_pixmap (bmm_class, use_rm_pixmaps))

						check attached gui_grid.last_row as lr then
							ev_class_row := lr
						end
						ev_grid_rm_row_stack.extend (ev_class_row)

						-- class node right hand menu
						if attached {EV_GRID_LABEL_ITEM} ev_class_row.item (Definition_grid_col_rm_name) as gli then
			 	 			gli.pointer_button_press_actions.force_extend (agent class_node_handler (ev_class_row, ?, ?, ?))
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

	exit_rm_property (a_bmm_prop: BMM_PROPERTY [BMM_TYPE])
			-- exit a BMM_PROPERTY
		do
			if not ev_grid_rm_row_removals_stack.item then
				rm_node_path.remove_last
				ev_grid_rm_row_stack.remove
			end
		 	ev_grid_rm_row_removals_stack.remove
		end

	class_node_handler (a_class_grid_row: EV_GRID_ROW; x,y, button: INTEGER)
			-- creates the context menu for a right click action for class node
			-- add menu item for retarget tool to current node / display in new tool
		local
			subs: detachable ARRAYED_SET[STRING]
			menu: EV_MENU
		do
			if button = {EV_POINTER_CONSTANTS}.right and attached {BMM_CLASS} a_class_grid_row.data as bmm_class then
				a_class_grid_row.item (1).enable_select
				create menu
				add_class_context_menu (menu, bmm_class)

				subs := bmm_class.all_descendants
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
			if button = {EV_POINTER_CONSTANTS}.right and attached {BMM_PROPERTY [BMM_TYPE]} a_prop_grid_row.data as bmm_pd and then not bmm_pd.is_mandatory then
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
			create chg_sub_menu.make_with_text (get_text (ec_context_menu_convert_node_to_subtype))
			across a_substitutions as subs_csr loop
				create an_mi.make_with_text_and_action (subs_csr.item, agent convert_node_to_subtype (subs_csr.item, a_class_grid_row, True))
				if ref_model.class_definition (subs_csr.item).is_abstract then
					an_mi.set_pixmap (get_icon_pixmap (Icon_rm_generic_dir + resource_path_separator + "class_abstract"))
				else
					an_mi.set_pixmap (get_icon_pixmap (Icon_rm_generic_dir + resource_path_separator + "class_concrete"))
				end
	    		chg_sub_menu.extend (an_mi)
			end
			menu.extend (chg_sub_menu)

			-- if owning attribute is multiple, allow adding of sibling nodes
--			if attached a_class_grid_row.parent_row and then
--				attached {BMM_PROPERTY} a_class_grid_row.parent_row.data as a_prop_def and then a_prop_def.is_container
--			then
--				-- create sub menu listing subtypes to add to parent node
--				create chg_sub_menu.make_with_text (get_text (ec_context_menu_add_subtype_mode))
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
				if a_prop_grid_row.subrow (i).subrow_count = 0 and attached {BMM_CLASS} a_prop_grid_row.subrow (i).data as bmm_class then
					convert_node_to_subtype (bmm_class.name, a_prop_grid_row.subrow (i), True)
				end
				i := i + 1
			end
		end

	convert_node_to_subtype (a_subtype: STRING; a_class_grid_row: EV_GRID_ROW; replace_mode: BOOLEAN)
			-- rebuild EV tree from interior node of class with a new tree of selected subtype
		require
			class_grid_row_valid: attached a_class_grid_row.parent_row
		local
			bmm_subtype_def: BMM_CLASS
		do
			bmm_subtype_def := ref_model.class_definition (a_subtype)
			-- set the RM path from the sibling node; it is the regardless of whether we are replacing or adding nodes
			if attached {EV_GRID_LABEL_ITEM} a_class_grid_row.item (Definition_grid_col_rm_name) as gli and then attached gli.tooltip as tt then
				create rm_node_path.make_from_string (utf32_to_utf8 (tt))
			end
			if replace_mode then
				gui_grid.remove_sub_rows (a_class_grid_row)
				gui_grid.set_last_row (a_class_grid_row)
				gui_grid.update_last_row_label_col (Definition_grid_col_rm_name, a_subtype, Void, Void, archetype_rm_type_color, rm_type_pixmap (bmm_subtype_def, use_rm_pixmaps))
				gui_grid.last_row.set_data (bmm_subtype_def)
				ev_grid_rm_row_stack.extend (a_class_grid_row)
			else
				check attached a_class_grid_row.parent_row as pr then
					gui_grid.add_sub_row (pr, bmm_subtype_def)
				end
				gui_grid.set_last_row_label_col (Definition_grid_col_rm_name, a_subtype, rm_node_path.as_string, Void, archetype_rm_type_color, rm_type_pixmap (bmm_subtype_def, use_rm_pixmaps))
				if attached gui_grid.last_row as lr then
					if attached {EV_GRID_LABEL_ITEM} lr.item (Definition_grid_col_rm_name) as gli then
	 	 				gli.pointer_button_press_actions.force_extend (agent class_node_handler (lr, ?, ?, ?))
						lr.expand_actions.force_extend (agent property_node_expand_handler (lr))
					end
					ev_grid_rm_row_stack.extend (lr)
				end
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
			if attached {BMM_CLASS} a_row.data as bmm_class then
				if attached {EV_GRID_LABEL_ITEM} a_row.item (Definition_grid_col_rm_name) as gli then
					gli.set_pixmap (rm_type_pixmap (bmm_class, use_rm_pixmaps))
				end
			end
		end

	tree_recurse_node (a_row: EV_GRID_ROW): BOOLEAN
		do
			Result := attached a_row.parent as att_parent_row and then att_parent_row.depth_in_tree (a_row.index) < ev_closure_depth_spin_button.value or else a_row.is_expandable
		end

end
