note
	component:   "openEHR ADL Tools"
	description: "Editor context for any kind of C_ATTRIBUTE"
	keywords:    "archetype, editing"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2012 Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class C_ATTRIBUTE_ED_CONTEXT

inherit
	ARCHETYPE_CONSTRAINT_ED_CONTEXT
		rename
			rm_element as rm_property
		redefine
			make, make_rm, rm_property, arch_node, arch_node_in_ancestor, parent, prepare_display_in_grid, display_in_grid, c_attribute_colour
		end

	C_PRIMITIVE_FACTORY
		export
			{NONE} all
		end

create
	make, make_rm

feature -- Initialisation

	make (an_arch_node: attached like arch_node; an_ed_context: ARCH_ED_CONTEXT_STATE)
		do
			precursor (an_arch_node, an_ed_context)
			set_arch_node_in_ancestor
			if an_arch_node.has_differential_path then
				rm_property := ed_context.rm_schema.property_definition_at_path (an_arch_node.parent.rm_type_name, an_arch_node.rm_attribute_path)
			else
				rm_property := ed_context.rm_schema.property_definition (an_arch_node.parent.rm_type_name, an_arch_node.rm_attribute_name)
			end
			create children.make(0)
		end

	make_rm (an_rm_prop: BMM_PROPERTY_DEFINITION; an_ed_context: ARCH_ED_CONTEXT_STATE)
			-- make with a C_ATTRIBUTE created based on `an_rm_prop'
		do
			precursor (an_rm_prop, an_ed_context)
			create children.make(0)
			pre_attach_child_context (create_rm_child (rm_property.type))
		end

feature -- Access

	arch_node: detachable C_ATTRIBUTE
			-- archetype node being edited

	arch_node_in_ancestor: detachable C_ATTRIBUTE
			-- corresponding archetype node in specialisation parent, if applicable

	rm_property: BMM_PROPERTY_DEFINITION
			-- RM property of node being edited

	children: ARRAYED_LIST [C_OBJECT_ED_CONTEXT]
			-- child objects

	parent: detachable C_COMPLEX_OBJECT_ED_CONTEXT

	path: STRING
			-- path of this node with respect to top of archetype
		do
			if attached arch_node as a_n then
				Result := a_n.path
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

	has_child (a_node: C_OBJECT_ED_CONTEXT): BOOLEAN
		do
			Result := children.has (a_node)
		end

	has_constraint_children: BOOLEAN
			-- True if there are any constraint children
		do
			Result := across children as child_csr some not child_csr.item.is_rm end
		end

	child_node_id_required (an_rm_type_name: STRING): BOOLEAN
		do
			Result := rm_property.is_container or else
				attached arch_node as a_n and then (a_n.candidate_child_requires_id (an_rm_type_name))
		end

feature -- Display

	prepare_display_in_grid (a_gui_grid: EVX_GRID)
		do
			precursor (a_gui_grid)

			-- set an empty string in the rm_name column, so later updates have an object to modify
			evx_grid.set_last_row_label_col_multi_line (Definition_grid_col_rm_name, "", Void, Void, c_pixmap)

			-- constraints
			evx_grid.set_last_row_label_col (Definition_grid_col_existence, "", Void, Void, Void)
			evx_grid.set_last_row_label_col (Definition_grid_col_card_occ, "", Void, Void, Void)
			evx_grid.set_last_row_label_col (Definition_grid_col_constraint, "", Void, Void, Void)

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
			attr_str: STRING
		do
			precursor (ui_settings)

			if attached arch_node as a_n then
				-- RM attr name / path
				if a_n.has_differential_path then
					create attr_str.make_empty
					if display_settings.show_technical_view then
						attr_str.append (a_n.rm_attribute_path)
					else
						attr_str.append (ed_context.flat_ontology.physical_to_logical_path (a_n.rm_attribute_path, display_settings.language, True))
					end
					attr_str.replace_substring_all ({OG_PATH}.segment_separator_string, "%N" + {OG_PATH}.segment_separator_string)
					attr_str.remove_head (1)
					evx_grid.update_last_row_label_col_multi_line (Definition_grid_col_rm_name, attr_str, node_tooltip_str, c_attribute_colour, c_pixmap)
				else
					evx_grid.update_last_row_label_col (Definition_grid_col_rm_name, a_n.rm_attribute_name, node_tooltip_str, c_attribute_colour, c_pixmap)
				end

				-- constraints
				if attached a_n.existence then
					evx_grid.update_last_row_label_col (Definition_grid_col_existence, a_n.existence.as_string, Void, c_constraint_colour, Void)
				end
				if attached a_n.cardinality then
					evx_grid.update_last_row_label_col (Definition_grid_col_card_occ, a_n.cardinality.as_string, Void, c_constraint_colour, Void)
				end
				if a_n.any_allowed then
					evx_grid.update_last_row_label_col (Definition_grid_col_constraint, Archetype_any_constraint, Void, c_constraint_colour, Void)
				end

			else
				-- RM name
				evx_grid.update_last_row_label_col (Definition_grid_col_rm_name, rm_property.display_name, node_tooltip_str, c_attribute_colour, c_pixmap)

				-- existence
				evx_grid.update_last_row_label_col (Definition_grid_col_existence, rm_property.existence.as_string, Void, c_attribute_colour, Void)

				-- cardinality
				if attached {BMM_CONTAINER_PROPERTY} rm_property as bmm_cont_prop then
					evx_grid.update_last_row_label_col (Definition_grid_col_card_occ, bmm_cont_prop.cardinality.as_string, Void, c_attribute_colour, Void)
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

	pre_attach_child_context (a_context_node: C_OBJECT_ED_CONTEXT)
			-- add `a_context_node' to editor structure only;
			-- used when attaching editor structure to an existing archetype
		require
			Not_already_has_node: not has_child (a_context_node)
			Not_grid_prepared: not is_prepared
		do
			children.extend (a_context_node)
			a_context_node.set_parent (Current)
		ensure
			Has_child: has_child (a_context_node)
		end

	attach_child_context (a_context_node: C_OBJECT_ED_CONTEXT)
			-- add `a_context_node' to editor structure only;
		require
			Not_already_has_node: not has_child (a_context_node)
			Grid_prepared: is_prepared
		do
			children.extend (a_context_node)
			a_context_node.set_parent (Current)
			check attached evx_grid as gg then
				a_context_node.prepare_display_in_grid (gg)
				if is_displayed then
					a_context_node.display_in_grid (display_settings)
					a_context_node.show_in_grid
				end
			end
		ensure
			Has_child: has_child (a_context_node)
			Grid_row_attached: a_context_node.ev_grid_row.parent_row = ev_grid_row
		end

	remove_child (a_context_node: C_OBJECT_ED_CONTEXT)
			-- remove context node `a_context_node' and its `arch_node' completely,
			-- including from the grid
		require
			Child_valid: has_child (a_context_node)
			Grid_row_included: is_prepared implies a_context_node.ev_grid_row.parent_row = ev_grid_row
		do
			children.prune_all (a_context_node)
			if is_prepared then
				evx_grid.ev_grid.remove_row (a_context_node.ev_grid_row.index)
				if is_displayed then
					display_in_grid (display_settings)
				end
			end
			if attached arch_node as a_n and then attached a_context_node.arch_node as child_a_n then
				a_n.remove_child (child_a_n)
			end
		ensure
			Child_removed: not has_child (a_context_node)
			Grid_row_removed: is_prepared implies attached a_context_node.ev_grid_row as cgr and then not ev_grid_row.has_subrow (cgr)
		end

	add_child (a_context_node: C_OBJECT_ED_CONTEXT)
			-- add an editor context node and if it is a constraint node,
			-- add its arch_node to the archetype
		require
			Not_already_child: not has_child (a_context_node)
			Coherence: not a_context_node.is_rm implies not is_rm
		do
			if attached arch_node as a_n and attached a_context_node.arch_node as child_a_n then
				a_n.put_child (child_a_n)
			end
			attach_child_context (a_context_node)
		ensure
			Has_child: has_child (a_context_node)
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

feature {ANY_ED_CONTEXT} -- Implementation

	c_attribute_colour: EV_COLOR
			-- generate a foreground colour for RM attribute representing inheritance status
		do
			if not is_rm then
				Result := precursor
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
			Result := get_icon_pixmap ("am" + resource_path_separator + "added" + resource_path_separator + rm_property.multiplicity_key_string)
		end

	default_occurrences: MULTIPLICITY_INTERVAL
			-- generate a reasonable default occurrences for child C_objects of this C_attribute
		do
			if attached {BMM_CONTAINER_PROPERTY} rm_property as bmm_cont_prop and then attached bmm_cont_prop.cardinality as card then
				Result := card.deep_twin
				Result.set_lower (0)
			else
				Result := rm_property.existence.deep_twin
			end
		end

	create_arch_child (co_create_params: C_OBJECT_PROPERTIES): C_OBJECT_ED_CONTEXT
			-- make new C_OBJECT child
		require
			not is_rm
		local
			cpo: C_PRIMITIVE_OBJECT
			cco: C_COMPLEX_OBJECT
			car: C_ARCHETYPE_ROOT
			air: ARCHETYPE_INTERNAL_REF
			arch_slot: ARCHETYPE_SLOT
			cref: CONSTRAINT_REF
			new_code: detachable STRING
			rm_type_name: STRING
			occ: MULTIPLICITY_INTERVAL
			rm_type_spec: BMM_TYPE_SPECIFIER
		do
			rm_type_spec := ed_context.rm_schema.class_definition (co_create_params.rm_type)
			rm_type_name := co_create_params.rm_type

			-- first figure out if a new code is needed
			if child_node_id_required (rm_type_name) then
				ed_context.archetype.ontology.add_new_non_refined_term_definition (co_create_params.node_id_text, co_create_params.node_id_description)
				new_code := ed_context.archetype.ontology.last_added_term_definition_code
			end

			if co_create_params.aom_type.is_equal (bare_type_name(({C_PRIMITIVE_OBJECT}).name)) then
				create cpo.make (create_default_c_primitive (rm_type_name.as_upper))
				create {C_PRIMITIVE_OBJECT_ED_CONTEXT} Result.make (cpo, ed_context)

			elseif co_create_params.aom_type.is_equal (bare_type_name(({C_COMPLEX_OBJECT}).name)) then
				if attached new_code as nc then
					create cco.make_identified (rm_type_name, nc)
				else
					create cco.make_anonymous (rm_type_name)
				end
				create {C_COMPLEX_OBJECT_ED_CONTEXT} Result.make (cco, ed_context)

			elseif co_create_params.aom_type.is_equal (bare_type_name(({C_ARCHETYPE_ROOT}).name)) then
				check attached co_create_params.ext_ref as arch_id then
					create car.make_external_ref (rm_type_name, arch_id)
				end
				create {C_ARCHETYPE_ROOT_ED_CONTEXT} Result.make (car, ed_context)

			elseif co_create_params.aom_type.is_equal (bare_type_name(({ARCHETYPE_SLOT}).name)) then
				if attached new_code as nc then
					create arch_slot.make_identified (rm_type_name, nc)
				else
					create arch_slot.make_anonymous (rm_type_name)
				end
				create {ARCHETYPE_SLOT_ED_CONTEXT} Result.make (arch_slot, ed_context)

			elseif co_create_params.aom_type.is_equal (bare_type_name(({ARCHETYPE_INTERNAL_REF}).name)) then
				check attached co_create_params.path_ref as pr then
					if attached new_code as nc then
						create air.make_identified (rm_type_name, nc, pr)
					else
						create air.make (rm_type_name, pr)
					end
					create {ARCHETYPE_INTERNAL_REF_ED_CONTEXT} Result.make (air, ed_context)
				end

			elseif co_create_params.aom_type.is_equal (bare_type_name(({CONSTRAINT_REF}).name)) then
				ed_context.archetype.ontology.add_new_non_refined_constraint_definition ("-", "-")
				check attached ed_context.archetype.ontology.last_added_constraint_definition_code as new_ac_code then
					create cref.make (new_ac_code)
				end
				create {CONSTRAINT_REF_ED_CONTEXT} Result.make (cref, ed_context)

			else
				create cpo.make_any (rm_type_name)
				create {C_PRIMITIVE_OBJECT_ED_CONTEXT} Result.make (cpo, ed_context)

			end

			-- set occurrences if overridden from default
			create occ.make_from_string (co_create_params.occurrences)
			if not occ.equal_interval (default_occurrences) then
				check attached Result.arch_node as a_n then
					a_n.set_occurrences (occ)
				end
			end
		end

	create_rm_child (a_type_spec: BMM_TYPE_SPECIFIER): C_OBJECT_ED_CONTEXT
			-- make RM object child either as a C_COMPLEX_OBJECT or C_PRIMITIVE_OBJECT node
		require
			is_rm
		do
			if a_type_spec.semantic_class.is_primitive_type then
				create {C_PRIMITIVE_OBJECT_ED_CONTEXT} Result.make_rm (a_type_spec, ed_context)
			else
				create {C_COMPLEX_OBJECT_ED_CONTEXT} Result.make_rm (a_type_spec, ed_context)
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
			rm_class_def: BMM_CLASS_DEFINITION
		do
			create context_menu

			-- add sub-menu of types to add as children
			if not is_rm and ed_context.editing_enabled then
				create types_sub_menu.make_with_text (get_text (ec_attribute_context_menu_add_child))
				create an_mi.make_with_text_and_action (rm_property.type.semantic_class.name, agent ui_offer_add_new_arch_child (rm_property.type.semantic_class))
				if rm_property.type.semantic_class.is_abstract then
					an_mi.set_pixmap (get_icon_pixmap ("rm/generic/class_abstract"))
				else
					an_mi.set_pixmap (get_icon_pixmap ("rm/generic/class_concrete"))
				end
				across rm_property.type.semantic_class.type_substitutions as subs_csr loop
					rm_class_def := ed_context.rm_schema.class_definition (subs_csr.item)
					create an_mi.make_with_text_and_action (subs_csr.item, agent ui_offer_add_new_arch_child (rm_class_def))
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

	ui_offer_add_new_arch_child (rm_class_def: BMM_CLASS_DEFINITION)
			-- create a dialog with appropriate constraint capture fields and then call the actual convert_to_constraint routine
		local
			dialog: GUI_C_OBJECT_DIALOG
			rm_type_substitutions: ARRAYED_SET [STRING]
			aom_type_subs: ARRAYED_SET [STRING]
		do
			create rm_type_substitutions.make (0)
			rm_type_substitutions.compare_objects
			rm_type_substitutions.extend (rm_class_def.name)
			aom_type_subs := aom_types_for_rm_type (rm_class_def)
			aom_type_subs.start
			create dialog.make (aom_type_subs, rm_type_substitutions, aom_type_subs.item, rm_class_def.name,
				default_occurrences, ed_context.archetype, child_node_id_required (rm_class_def.name), display_settings)
			dialog.show_modal_to_window (proximate_ev_window (evx_grid.ev_grid))

			if dialog.is_valid then
				do_add_new_arch_child (dialog.new_params)
			end
		end

	do_add_new_arch_child (co_create_params: C_OBJECT_PROPERTIES)
		require
			not is_rm
		local
			added_child: C_OBJECT_ED_CONTEXT
		do
			add_new_arch_child (co_create_params)
			added_child := children.last

			-- set up undo / redo
			ed_context.undo_redo_chain.add_link_simple (evx_grid.ev_grid,
				agent (an_added_child: C_OBJECT_ED_CONTEXT)
					do
						remove_child (an_added_child)
					end (added_child),
				agent (an_added_child: C_OBJECT_ED_CONTEXT)
					do
						add_child (an_added_child)
					end (added_child)
			)
		end

	set_arch_node_in_ancestor
		local
			apa: ARCHETYPE_PATH_ANALYSER
			ca_path_in_flat: STRING
		do
			if attached arch_node as a_n and attached ed_context.parent_archetype as parent_arch then
				create apa.make_from_string (a_n.path)
				ca_path_in_flat := apa.path_at_level (parent_arch.specialisation_depth)
				if parent_arch.definition.has_attribute_path (ca_path_in_flat) then
					check attached parent_arch.definition.c_attribute_at_path (ca_path_in_flat) as ca then
						arch_node_in_ancestor := ca
					end
				end
			end
		end

end


