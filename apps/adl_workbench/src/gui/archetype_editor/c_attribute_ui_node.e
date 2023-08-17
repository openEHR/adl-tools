note
	component:   "openEHR ADL Tools"
	description: "UI visualisation node for any kind of C_ATTRIBUTE"
	keywords:    "archetype, editing"
	author:      "Thomas Beale <thomas.beale@openehr.org>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2012- The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class C_ATTRIBUTE_UI_NODE

inherit
	ARCHETYPE_CONSTRAINT_UI_NODE
		rename
			rm_element as rm_property
		redefine
			make, make_rm, rm_property, arch_node, arch_node_in_ancestor, parent, node_documentation,
			prepare_display_in_grid, display_in_grid, c_attribute_colour
		end

	C_PRIMITIVE_FACTORY
		export
			{NONE} all
		end

create
	make, make_rm

feature -- Initialisation

	make (an_arch_node: attached like arch_node; an_ed_context: ARCHETYPE_UI_GRAPH_STATE)
		do
			precursor (an_arch_node, an_ed_context)
			create internal_ref_for_rm_type.make (0)
			set_arch_node_in_ancestor
			if an_arch_node.has_differential_path then
				rm_property := ui_graph_state.ref_model.property_at_path (an_arch_node.parent.rm_type_name, an_arch_node.rm_attribute_path)
			else
				rm_property := ui_graph_state.ref_model.property_definition (an_arch_node.parent.rm_type_name, an_arch_node.rm_attribute_name)
			end
			create children.make(0)
		end

	make_rm (an_rm_prop: BMM_PROPERTY; an_ed_context: ARCHETYPE_UI_GRAPH_STATE)
			-- make with a C_ATTRIBUTE created based on `an_rm_prop'
		do
			precursor (an_rm_prop, an_ed_context)
			create children.make(0)
			check attached {BMM_MODEL_TYPE} rm_property.bmm_type.effective_type as bmm_model_type then
				attach_child (create_rm_child (bmm_model_type))
			end
		end

feature -- Access

	arch_node: detachable C_ATTRIBUTE
			-- archetype node being edited

	arch_node_in_ancestor: detachable C_ATTRIBUTE
			-- corresponding archetype node in specialisation parent, if applicable

	rm_property: BMM_PROPERTY
			-- RM property of node being edited

	children: ARRAYED_LIST [C_OBJECT_UI_NODE]
			-- child objects

	parent: detachable C_COMPLEX_OBJECT_UI_NODE

	path: STRING
			-- path of this node with respect to top of archetype
		do
			if attached arch_node then
				Result := arch_node.path
			elseif parent.is_root then
				Result := parent.path + rm_property.name
			else
				Result := parent.path + {OG_PATH}.segment_separator_string + rm_property.name
			end
		end

	rm_depth: INTEGER
			-- depth of this node with respect to its top-most RM (non-constrained) node
			-- note that this will always be intermediate in the structure, since it has
			-- to be the child of some archetyped node
		do
			if parent.is_rm then
				Result := parent.rm_depth + 1
			else
				Result := 1
			end
		end

feature -- Status Report

	has_child (a_node: C_OBJECT_UI_NODE): BOOLEAN
		do
			Result := children.has (a_node)
		end

	has_constraint_children: BOOLEAN
			-- True if there are any constraint children
		do
			Result := across children as child_csr some not child_csr.item.is_rm end
		end

feature -- Display

	prepare_display_in_grid (a_gui_grid: EVX_GRID)
		do
			precursor (a_gui_grid)

			-- set an empty string in the rm_name column, so later updates have an object to modify
			evx_grid.set_last_row_label_col_multi_line (Definition_grid_col_rm_name, "", Void, Void, Void, c_pixmap)

			-- constraints
			evx_grid.set_last_row_label_col (Definition_grid_col_existence, "", Void, Void, Void, Void)
			evx_grid.set_last_row_label_col (Definition_grid_col_card_occ, "", Void, Void, Void, Void)
			evx_grid.set_last_row_label_col (Definition_grid_col_constraint, "", Void, Void, Void, Void)

			-- add context menu
			build_context_menu
			evx_grid.add_last_row_pointer_button_press_actions (Definition_grid_col_rm_name, agent context_menu_event_handler)

			-- build out child nodes
			across children as children_csr loop
				children_csr.item.prepare_display_in_grid (a_gui_grid)
			end
		end

	display_in_grid (ui_settings: GUI_DEFINITION_SETTINGS)
		local
			attr_str, ex_str, card_str: STRING
			c_col: EV_COLOR
		do
			precursor (ui_settings)

			if attached arch_node then
				-- RM attr name / path
				if arch_node.has_differential_path then
					create attr_str.make_empty
					if display_settings.show_technical_view then
						attr_str.append (arch_node.rm_attribute_path)
					else
						attr_str.append (ui_graph_state.flat_archetype.annotated_path (arch_node.rm_attribute_path, display_settings.language, True))
					end
					attr_str.replace_substring_all ({OG_PATH}.segment_separator_string, "%N" + {OG_PATH}.segment_separator_string)
					attr_str.remove_head (1)
					evx_grid.update_last_row_label_col_multi_line (Definition_grid_col_rm_name, attr_str, node_tooltip_str, Void, c_attribute_colour, c_pixmap)
				else
					evx_grid.update_last_row_label_col (Definition_grid_col_rm_name, arch_node.rm_attribute_name, node_tooltip_str, c_node_font, c_attribute_colour, c_pixmap)
				end

				-- existence
				c_col := c_attribute_colour
				create ex_str.make_empty
				if attached arch_node.existence as att_ex then
					if not att_ex.is_prohibited then
						ex_str.append (att_ex.as_string)
					else
						ex_str.append (get_text ({ADL_MESSAGES_IDS}.ec_attribute_removed_text))
					end
					c_col := c_constraint_colour
				elseif not ui_graph_state.in_differential_view and display_settings.show_rm_multiplicities then
					ex_str := rm_property.existence.as_string
				end
				evx_grid.update_last_row_label_col (Definition_grid_col_existence, ex_str, Void, Void, c_col, Void)

				-- cardinality
				create card_str.make_empty
				c_col := c_attribute_colour
				if attached arch_node.cardinality as att_card then
					card_str := att_card.as_string
					c_col := c_constraint_colour
				elseif not ui_graph_state.in_differential_view and display_settings.show_rm_multiplicities and then attached {BMM_CONTAINER_PROPERTY} rm_property as bmm_cont_prop then
					card_str := bmm_cont_prop.cardinality.as_string
				end
				evx_grid.update_last_row_label_col (Definition_grid_col_card_occ, card_str, Void, Void, c_col, Void)

				-- any allowed
				if arch_node.any_allowed then
					evx_grid.update_last_row_label_col (Definition_grid_col_constraint, Archetype_any_constraint, Void, Void, c_constraint_colour, Void)
				end

			else
				-- RM name
				evx_grid.update_last_row_label_col (Definition_grid_col_rm_name, rm_property.display_name, node_tooltip_str, Void, c_attribute_colour, c_pixmap)

				-- existence
				evx_grid.update_last_row_label_col (Definition_grid_col_existence, rm_property.existence.as_string, Void, Void, c_attribute_colour, Void)

				-- cardinality
				if attached {BMM_CONTAINER_PROPERTY} rm_property as bmm_cont_prop then
					evx_grid.update_last_row_label_col (Definition_grid_col_card_occ, bmm_cont_prop.cardinality.as_string, Void, Void, c_attribute_colour, Void)
				end
			end

			-- add context menu
			build_context_menu

			if not ev_grid_row.is_displayed then
				ev_grid_row.show
			end

			across children as children_csr loop
				children_csr.item.display_in_grid (ui_settings)
			end
		end

feature -- Modification

	attach_child (a_ui_node: C_OBJECT_UI_NODE)
			-- add `a_ui_node' to UI graph
			-- used when attaching editor structure to an existing archetype
		require
			Not_already_has_node: not has_child (a_ui_node)
			Not_grid_prepared: not is_prepared
		do
			children.extend (a_ui_node)
			a_ui_node.set_parent (Current)
		ensure
			Has_child: has_child (a_ui_node)
		end

	attach_child_and_display (a_ui_node: C_OBJECT_UI_NODE)
			-- add `a_ui_node' to UI graph and display at the same time
		require
			Not_already_has_node: not has_child (a_ui_node)
			Grid_prepared: is_prepared
		do
			children.extend (a_ui_node)
			a_ui_node.set_parent (Current)
			check attached evx_grid then
				a_ui_node.prepare_display_in_grid (evx_grid)
				if is_displayed then
					a_ui_node.display_in_grid (display_settings)
					a_ui_node.show_in_grid
				end
			end
		ensure
			Has_child: has_child (a_ui_node)
			Grid_row_attached: a_ui_node.ev_grid_row.parent_row = ev_grid_row
		end

	remove_child (a_ui_node: C_OBJECT_UI_NODE)
			-- remove context node `a_ui_node' and its `arch_node' completely,
			-- including from the grid
		require
			Child_valid: has_child (a_ui_node)
			Grid_row_included: is_prepared implies a_ui_node.ev_grid_row.parent_row = ev_grid_row
		do
			children.prune_all (a_ui_node)
			if is_prepared then
				evx_grid.ev_grid.remove_row (a_ui_node.ev_grid_row.index)
				if is_displayed then
					display_in_grid (display_settings)
				end
			end
			if attached arch_node and then attached a_ui_node.arch_node as child_a_n then
				arch_node.remove_child (child_a_n)
			end
		ensure
			Child_removed: not has_child (a_ui_node)
			Grid_row_removed: is_prepared implies attached a_ui_node.ev_grid_row as cgr and then not ev_grid_row.has_subrow (cgr)
		end

	add_child (a_ui_node: C_OBJECT_UI_NODE)
			-- add `a_ui_node' and if it is a constraint node, add its arch_node to the archetype
		require
			Not_already_child: not has_child (a_ui_node)
			Coherence: not a_ui_node.is_rm implies not is_rm
		do
			if attached arch_node and attached a_ui_node.arch_node as child_a_n then
				arch_node.put_child (child_a_n)
			end
			attach_child_and_display (a_ui_node)
		ensure
			Has_child: has_child (a_ui_node)
		end

	convert_to_constraint
			-- convert to constrained form with a C_ATTRIBUTE created based on `an_rm_prop'
			-- create new archetype node and attach it inside parent object's archetype node
			-- and redisplay
		require
			Parent_is_constraint: not parent.is_rm
			Not_is_constraint: is_rm
		do
			if rm_property.is_container then
				create arch_node.make_multiple (rm_property.name, Void, Void)
			else
				create arch_node.make_single (rm_property.name, Void)
			end
			parent.convert_rm_property_to_constraint (Current)
			if is_displayed then
				display_in_grid (display_settings)
			end
		ensure
			Is_constraint: attached arch_node as a_n and then (attached parent.arch_node as parent_a_n and then parent_a_n.attributes.has (a_n))
			Grid_row_unchanged: ev_grid_row ~ old ev_grid_row
		end

	set_prohibited
		do
			if is_rm then
				convert_to_constraint
			end
			check attached arch_node then
				arch_node.set_prohibited
			end
			if is_displayed then
				display_in_grid (display_settings)
			end
		end

	set_mandated
		do
			if is_rm then
				convert_to_constraint
			end
			check attached arch_node then
				arch_node.set_mandated
			end
			if is_displayed then
				display_in_grid (display_settings)
			end
		end

	set_optional
		require
			not is_rm
		do
			check attached arch_node then
				arch_node.set_optional
			end
			if is_displayed then
				display_in_grid (display_settings)
			end
		end

	convert_to_rm
			-- convert this node from a constraint to an RM node
			-- and redisplay
		require
			Is_constraint: not is_rm
		do
			parent.convert_constraint_to_rm_property (Current)
			arch_node := Void
			if is_displayed then
				display_in_grid (display_settings)
			end
		ensure
			is_rm: is_rm
		end

feature {ANY_UI_NODE} -- Implementation

	c_attribute_colour: EV_COLOR
			-- generate a foreground colour for RM attribute representing inheritance status
		local
			spec_sts: INTEGER
		do
			if not is_rm then
				if display_settings.show_rm_inheritance then
					if ev_grid_row.is_expandable and not ev_grid_row.is_expanded then
						spec_sts := rolled_up_specialisation_status
					else
						spec_sts := specialisation_status
					end
					check attached c_attribute_colours.item (spec_sts) as cac then
						Result := cac
					end
				else
					Result := archetyped_attribute_color
				end
			else
				Result := rm_attribute_colour
			end
		end

	rm_attribute_colour: EV_COLOR
			-- foreground colours for RM type to visualise BMM attribute classification, i.e.
			-- 'runtime', 'infrastructure' etc
		do
			if rm_property.is_im_infrastructure then
				Result := rm_infrastructure_attribute_colour
			elseif rm_property.is_im_runtime then
				Result := rm_runtime_attribute_colour
			else
				Result := rm_attribute_color
			end
		end

	c_pixmap: EV_PIXMAP
		do
			Result := get_icon_pixmap (Icon_rm_generic_dir + resource_path_separator + rm_property.multiplicity_key_string)
		end

	default_occurrences: MULTIPLICITY_INTERVAL
			-- generate a reasonable default occurrences for child C_objects of this C_attribute
		do
			if attached {BMM_CONTAINER_PROPERTY} rm_property as bmm_cont_prop then
				check attached bmm_cont_prop.cardinality as card then
					Result := card.deep_twin
				end
				Result.set_lower (0)
			else
				Result := rm_property.existence.deep_twin
			end
		end

	create_arch_child (co_create_params: C_OBJECT_PROPERTIES): C_OBJECT_UI_NODE
			-- make new C_OBJECT child
		require
			not is_rm
		local
			cco: C_COMPLEX_OBJECT
			car: C_ARCHETYPE_ROOT
			air: C_COMPLEX_OBJECT_PROXY
			arch_slot: ARCHETYPE_SLOT
			new_code: STRING
			rm_type_name: STRING
			occ: MULTIPLICITY_INTERVAL
			rm_type_spec: BMM_CLASS
			c_int: C_INTEGER
			c_str: C_STRING
		do
			rm_type_spec := ui_graph_state.ref_model.class_definition (co_create_params.rm_type)
			rm_type_name := co_create_params.rm_type

			-- first figure out if a new code definition is needed
			if co_create_params.term_definition_required then
				ui_graph_state.archetype.terminology.create_added_id_definition (co_create_params.node_id_text, co_create_params.node_id_description)
				new_code := ui_graph_state.archetype.terminology.last_new_definition_code
			else
				new_code := ui_graph_state.archetype.create_new_id_code
			end

			if co_create_params.aom_type.is_equal (bare_type_name(({C_BOOLEAN}).name)) then
				create {C_BOOLEAN_UI_NODE} Result.make (create {C_BOOLEAN}.make_example, ui_graph_state)

			elseif co_create_params.aom_type.is_equal (bare_type_name(({C_INTEGER}).name)) then
				create c_int.make_example
				if ui_graph_state.ref_model.is_enumerated_type (co_create_params.rm_type) then
					c_int.set_enumerated_type_constraint
					c_int.set_rm_type_name (co_create_params.rm_type)
				end
				create {C_INTEGER_UI_NODE} Result.make (c_int, ui_graph_state)

			elseif co_create_params.aom_type.is_equal (bare_type_name(({C_REAL}).name)) then
				create {C_REAL_UI_NODE} Result.make (create {C_REAL}.make_example, ui_graph_state)

			elseif co_create_params.aom_type.is_equal (bare_type_name(({C_DATE}).name)) then
				create {C_DATE_UI_NODE} Result.make (create {C_DATE}.make_example, ui_graph_state)

			elseif co_create_params.aom_type.is_equal (bare_type_name(({C_DATE_TIME}).name)) then
				create {C_DATE_TIME_UI_NODE} Result.make (create {C_DATE_TIME}.make_example, ui_graph_state)

			elseif co_create_params.aom_type.is_equal (bare_type_name(({C_TIME}).name)) then
				create {C_TIME_UI_NODE} Result.make (create {C_TIME}.make_example, ui_graph_state)

			elseif co_create_params.aom_type.is_equal (bare_type_name(({C_DURATION}).name)) then
				create {C_DURATION_UI_NODE} Result.make (create {C_DURATION}.make_example, ui_graph_state)

			elseif co_create_params.aom_type.is_equal (bare_type_name(({C_STRING}).name)) then
				create c_str.make_example
				if ui_graph_state.ref_model.is_enumerated_type (co_create_params.rm_type) then
					c_str.set_enumerated_type_constraint
					c_str.set_rm_type_name (co_create_params.rm_type)
				end
				create {C_STRING_UI_NODE} Result.make (c_str, ui_graph_state)

			elseif co_create_params.aom_type.is_equal (bare_type_name(({C_TERMINOLOGY_CODE}).name)) then
				create {C_TERMINOLOGY_CODE_UI_NODE} Result.make (create {C_TERMINOLOGY_CODE}.make_example, ui_graph_state)

			elseif co_create_params.aom_type.is_equal (bare_type_name(({C_COMPLEX_OBJECT}).name)) then
				create cco.make (rm_type_name, new_code)
				create {C_COMPLEX_OBJECT_UI_NODE} Result.make (cco, ui_graph_state)

			elseif co_create_params.aom_type.is_equal (bare_type_name(({C_ARCHETYPE_ROOT}).name)) then
				-- FIXME: not yet dealing with slot filler or use_archetype redefinition, which needs
				-- a redefined code, not a new code
				check attached co_create_params.ext_ref as arch_id then
					create car.make (rm_type_name, new_code, arch_id)
				end
				create {C_ARCHETYPE_ROOT_UI_NODE} Result.make (car, ui_graph_state)

			elseif co_create_params.aom_type.is_equal (bare_type_name(({ARCHETYPE_SLOT}).name)) then
				create arch_slot.make (rm_type_name, new_code)
				create {ARCHETYPE_SLOT_UI_NODE} Result.make (arch_slot, ui_graph_state)

			elseif co_create_params.aom_type.is_equal (bare_type_name(({C_COMPLEX_OBJECT_PROXY}).name)) then
				check attached co_create_params.path_ref as pr then
					create air.make (rm_type_name, new_code, pr)
					create {C_COMPLEX_OBJECT_PROXY_UI_NODE} Result.make (air, ui_graph_state)
				end
			else
				-- Should never get here
				create {C_STRING_UI_NODE} Result.make (create {C_STRING}.make_regex_any, ui_graph_state)
			end

			-- set occurrences if overridden from default
			create occ.make_from_string (co_create_params.occurrences)
			if not occ.is_equal (default_occurrences) then
				check attached Result.arch_node as a_n then
					a_n.set_occurrences (occ)
				end
			end
		end

	create_rm_child (a_bmm_type: BMM_MODEL_TYPE): C_OBJECT_UI_NODE
			-- make RM object child either as a C_COMPLEX_OBJECT or C_PRIMITIVE_OBJECT node
		require
			is_rm
		local
			rm_type_name, aom_type: STRING
		do
			rm_type_name := a_bmm_type.type_base_name
			if a_bmm_type.is_primitive then

				-- if there is an AOM_PROFILE, use the RM prim type => AOM type mapping found there
				if attached ui_graph_state.aom_profile as att_aom_profile and then
					att_aom_profile.has_aom_primitive_type_mapping_for_rm_type (rm_type_name)
				then
					aom_type := att_aom_profile.aom_primitive_type_mapping_for_rm_type (rm_type_name)
				-- else use standard RM prim type => AOM type mapping
				elseif attached c_primitive_subtypes.item (rm_type_name.as_upper) as att_aom_type then
					aom_type := att_aom_type
				end

				-- now create the appropriate object
				if aom_type.is_equal (bare_type_name(({C_BOOLEAN}).name)) then
					create {C_BOOLEAN_UI_NODE} Result.make_rm (a_bmm_type, ui_graph_state)

				elseif aom_type.is_equal (bare_type_name(({C_INTEGER}).name)) then
					create {C_INTEGER_UI_NODE} Result.make_rm (a_bmm_type, ui_graph_state)

				elseif aom_type.is_equal (bare_type_name(({C_REAL}).name)) then
					create {C_REAL_UI_NODE} Result.make_rm (a_bmm_type, ui_graph_state)

				elseif aom_type.is_equal (bare_type_name(({C_DATE}).name)) then
					create {C_DATE_UI_NODE} Result.make_rm (a_bmm_type, ui_graph_state)

				elseif aom_type.is_equal (bare_type_name(({C_DATE_TIME}).name)) then
					create {C_DATE_TIME_UI_NODE} Result.make_rm (a_bmm_type, ui_graph_state)

				elseif aom_type.is_equal (bare_type_name(({C_TIME}).name)) then
					create {C_TIME_UI_NODE} Result.make_rm (a_bmm_type, ui_graph_state)

				elseif aom_type.is_equal (bare_type_name(({C_DURATION}).name)) then
					create {C_DURATION_UI_NODE} Result.make_rm (a_bmm_type, ui_graph_state)

				elseif aom_type.is_equal (bare_type_name(({C_STRING}).name)) then
					create {C_STRING_UI_NODE} Result.make_rm (a_bmm_type, ui_graph_state)

				elseif aom_type.is_equal (bare_type_name(({C_TERMINOLOGY_CODE}).name)) then
					create {C_TERMINOLOGY_CODE_UI_NODE} Result.make_rm (a_bmm_type, ui_graph_state)
				else
					-- should never get here
					create {C_STRING_UI_NODE} Result.make_rm (a_bmm_type, ui_graph_state)
				end

			-- see if it's an enumerated type
			elseif attached {BMM_SIMPLE_TYPE} a_bmm_type as a_simple_type and then  attached {BMM_ENUMERATION_INTEGER} a_simple_type.defining_class then
				create {C_INTEGER_UI_NODE} Result.make_rm (a_bmm_type, ui_graph_state)
			elseif attached {BMM_SIMPLE_TYPE} a_bmm_type as a_simple_type and then attached {BMM_ENUMERATION_STRING} a_simple_type.defining_class then
				create {C_STRING_UI_NODE} Result.make_rm (a_bmm_type, ui_graph_state)

			-- treat as a C_COMPLEX_OBJECT
			else
				create {C_COMPLEX_OBJECT_UI_NODE} Result.make_rm (a_bmm_type, ui_graph_state)
			end
		end

	add_new_arch_child (co_create_params: C_OBJECT_PROPERTIES)
			-- create and add a new constraint node to archetype and editor tree
			-- for the RM type `a_type_spec'
		do
			add_child (create_arch_child (co_create_params))
		end

feature {NONE} -- Context menu

	context_menu_event_handler (x,y, button: INTEGER)
			-- creates the context menu for a right click action for class node
		do
			if button = {EV_POINTER_CONSTANTS}.right and not context_menu.is_empty then
				ev_grid_row.item (1).enable_select
				context_menu.show
			end
		end

	context_menu: detachable EV_MENU
		note
			option: stable
		attribute
		end

	build_context_menu
		local
			an_mi: EV_MENU_ITEM
			types_sub_menu: EV_MENU
			rm_class_def: BMM_CLASS
		do
			create context_menu

			-- add sub-menu of types to add as children
			if ui_graph_state.editing_enabled then
				-- offer mandate/prohibit options
				if rm_property.existence.is_optional then
					create an_mi.make_with_text_and_action (get_text ({ADL_MESSAGES_IDS}.ec_c_attribute_prohibit), agent ui_do_prohibit)
					context_menu.extend (an_mi)
					create an_mi.make_with_text_and_action (get_text ({ADL_MESSAGES_IDS}.ec_c_attribute_mandate), agent ui_do_mandate)
					context_menu.extend (an_mi)
				end

				-- only offer addition of new nodes if current node existence is not prohibited
				if attached arch_node and then not arch_node.is_prohibited then
					create types_sub_menu.make_with_text (get_text ({ADL_MESSAGES_IDS}.ec_attribute_context_menu_add_child))

					-- make a menu item with the base class of the property
					create an_mi.make_with_text_and_action (rm_property.bmm_type.effective_type.type_base_name,
						agent ui_offer_add_new_arch_child (rm_property.bmm_type.effective_type.type_base_name))
					if rm_property.bmm_type.is_abstract then
						an_mi.set_pixmap (get_icon_pixmap ("rm/generic/class_abstract"))
					else
						an_mi.set_pixmap (get_icon_pixmap ("rm/generic/class_concrete"))
					end
		    		types_sub_menu.extend (an_mi)

					-- add more items for all subtypes
					across ui_graph_state.ref_model.type_substitutions (rm_property.bmm_type.effective_type) as subs_csr loop
						create an_mi.make_with_text_and_action (subs_csr.item, agent ui_offer_add_new_arch_child (subs_csr.item))
						rm_class_def := ui_graph_state.ref_model.class_definition (subs_csr.item)
						if rm_class_def.is_abstract then
							an_mi.set_pixmap (get_icon_pixmap ("rm/generic/class_abstract"))
						else
							an_mi.set_pixmap (get_icon_pixmap ("rm/generic/class_concrete"))
						end
			    		types_sub_menu.extend (an_mi)
					end
					context_menu.extend (types_sub_menu)
				end
			end

			-- add menu item for copying path to clipboard
			if attached arch_node and attached archetype_tool_agents.path_select_action_agent then
				create an_mi.make_with_text_and_action (get_text ({ADL_MESSAGES_IDS}.ec_object_context_menu_copy_path),
					agent (path_str: STRING)
						do
							archetype_tool_agents.path_copy_action_agent.call ([path_str])
						end (arch_node.path)
				)
				context_menu.extend (an_mi)
			end
		end

	ui_offer_add_new_arch_child (a_unitary_type_name: STRING)
			-- create a dialog with appropriate constraint capture fields and then call the actual convert_to_constraint routine
		local
			dialog: GUI_C_OBJECT_DIALOG
			rm_type_substitutions: ARRAYED_SET [STRING]
			aom_type_subs: ARRAYED_SET [STRING]
		do
			create rm_type_substitutions.make (0)
			rm_type_substitutions.compare_objects
			rm_type_substitutions.extend (a_unitary_type_name)
			aom_type_subs := aom_types_for_rm_type (ui_graph_state.ref_model.class_definition (a_unitary_type_name))
			aom_type_subs.start
			create dialog.make (aom_type_subs, rm_type_substitutions, aom_type_subs.item, a_unitary_type_name,
				default_occurrences, ui_graph_state.archetype, Void, display_settings)
			dialog.show_modal_to_window (proximate_ev_window (evx_grid.ev_grid))

			if dialog.is_valid then
				ui_do_add_new_arch_child (dialog.new_params)
			end
		end

	ui_do_add_new_arch_child (co_create_params: C_OBJECT_PROPERTIES)
		require
			not is_rm
		local
			added_child: C_OBJECT_UI_NODE
		do
			add_new_arch_child (co_create_params)
			added_child := children.last

			-- set up undo / redo
			ui_graph_state.undo_redo_chain.add_link_simple (evx_grid.ev_grid,
				agent (an_added_child: C_OBJECT_UI_NODE)
					do
						remove_child (an_added_child)
					end (added_child),
				agent (an_added_child: C_OBJECT_UI_NODE)
					do
						add_child (an_added_child)
					end (added_child)
			)
		end

	ui_do_prohibit
			-- prohibit this C_ATTRIBUTE, i.e. set existence to {0} and set up
			-- UI commit, undo/redo
		local
			was_rm: BOOLEAN
		do
			was_rm := is_rm
			set_prohibited

			-- set up undo / redo
			ui_graph_state.undo_redo_chain.add_link_simple (evx_grid.ev_grid,
				agent (was_rm_flag: BOOLEAN)
					do
						if was_rm_flag then
							convert_to_rm
						else
							set_optional
						end
					end (was_rm),
				agent set_prohibited
			)
		end

	ui_do_mandate
			-- mandate this C_ATTRIBUTE, i.e. set existence to {1} and set up
			-- UI commit, undo/redo
		local
			was_rm: BOOLEAN
		do
			was_rm := is_rm
			set_mandated

			-- set up undo / redo
			ui_graph_state.undo_redo_chain.add_link_simple (evx_grid.ev_grid,
				agent (was_rm_flag: BOOLEAN)
					do
						if was_rm_flag then
							convert_to_rm
						else
							set_optional
						end
					end (was_rm),
				agent set_mandated
			)
		end

feature {NONE} -- Implementation

	set_arch_node_in_ancestor
		local
			apa: ARCHETYPE_PATH_ANALYSER
			ca_path_in_flat: STRING
		do
			if attached arch_node and attached ui_graph_state.parent_archetype as parent_arch then
				create apa.make (arch_node.og_path)
				if not apa.is_phantom_path_at_level (parent_arch.specialisation_depth) then
					ca_path_in_flat := apa.path_at_level (parent_arch.specialisation_depth)
					if parent_arch.has_attribute_path (ca_path_in_flat) then
						arch_node_in_ancestor := parent_arch.attribute_at_path (ca_path_in_flat)
					end
				end
			end
		end

	node_documentation: STRING
		do
			-- documentation, if there is any
			if attached rm_property.documentation as bmm_node_doc then
				Result := bmm_node_doc
			else
				create Result.make (0)
			end
		end

end


