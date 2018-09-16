note
	component:   "openEHR ADL Tools"
	description: "UI visualisation node for a C_COMPLEX_OBJECT"
	keywords:    "archetype, editing"
	author:      "Thomas Beale <thomas.beale@openehr.org>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2012- The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class C_COMPLEX_OBJECT_UI_NODE

inherit
	C_OBJECT_UI_NODE
		redefine
			arch_node, make, make_rm, prepare_display_in_grid, display_in_grid, display_constraint
		end

create
	make, make_rm

feature -- Initialisation

	make (an_arch_node: attached like arch_node; a_ui_graph_state: ARCHETYPE_UI_GRAPH_STATE)
		do
			precursor (an_arch_node, a_ui_graph_state)
			create c_attributes.make (0)
			create c_attribute_tuples.make (0)
			create rm_attributes.make (0)
		end

	make_rm (an_rm_type: BMM_TYPE; a_ui_graph_state: ARCHETYPE_UI_GRAPH_STATE)
		do
			precursor (an_rm_type, a_ui_graph_state)
			create c_attributes.make (0)
			create c_attribute_tuples.make (0)
			create rm_attributes.make (0)
		end

feature -- Access

	arch_node: detachable C_COMPLEX_OBJECT
			-- archetype node being edited

	c_attributes: STRING_TABLE [C_ATTRIBUTE_UI_NODE]
			-- editor nodes for real C_ATTRIBUTEs that are found in C_COMPLEX_OBJECT.attributes

	c_attribute_tuples: ARRAYED_LIST [C_ATTRIBUTE_TUPLE_UI_NODE]
			-- editor nodes for C_ATTRIBUTE_TUPLEs that are found in C_COMPLEX_OBJECT.attribute_tuples

	rm_attributes: STRING_TABLE [C_ATTRIBUTE_UI_NODE]
			-- Editor nodes for unconstrained RM attributes that have been lazy-requested for viewing
			-- Once created, they don't leave, they are just displayed or hidden in the EV_GRID tree

	rm_properties: STRING_TABLE [BMM_PROPERTY]
		do
			if ui_graph_state.in_differential_view and not ui_graph_state.editing_enabled then
				Result := rm_type.base_class.properties
			else
				Result := rm_type.base_class.flat_properties
			end
		end

feature -- Status Report

	context_property_not_in_archetype (a_property_context: C_ATTRIBUTE_UI_NODE): BOOLEAN
			-- true if `a_property_context' arch_node is under current node's arch_node
		do
			Result := attached arch_node as a_n and then attached a_property_context.arch_node as prop_a_n and then not a_n.has_attribute (prop_a_n.rm_attribute_name)
		end

	context_property_in_archetype (a_property_context: C_ATTRIBUTE_UI_NODE): BOOLEAN
			-- true if `a_property_context' arch_node is not under current node's arch_node
		do
			Result := attached arch_node as a_n and then attached a_property_context.arch_node as prop_a_n and then a_n.has_attribute (prop_a_n.rm_attribute_name)
		end

feature -- Display

	prepare_display_in_grid (a_gui_grid: EVX_GRID)
		do
			-- set up this node in grid
			precursor (a_gui_grid)

			prepare_children_display_in_grid (a_gui_grid)
		end

	display_in_grid (ui_settings: GUI_DEFINITION_SETTINGS)
		do
			precursor (ui_settings)

			across c_attributes as c_attrs_csr loop
				c_attrs_csr.item.display_in_grid (ui_settings)
			end

			across c_attribute_tuples as c_attr_tuples_csr loop
				c_attr_tuples_csr.item.display_in_grid (ui_settings)
			end

			if not rm_properties.is_empty then
				expand_to_rm (ui_settings)
			end
		end

feature -- Modification

	put_c_attribute (ca_ui_node: C_ATTRIBUTE_UI_NODE)
			-- add a new attribute node
		require
			attached ca_ui_node.arch_node as child_a_n and then not c_attributes.has (child_a_n.rm_attribute_path)
		do
			if attached ca_ui_node.arch_node as child_a_n then
				c_attributes.put (ca_ui_node, child_a_n.rm_attribute_path)
				ca_ui_node.set_parent (Current)
			end
		end

	put_c_attribute_tuple (ca_tuple_ui_node: C_ATTRIBUTE_TUPLE_UI_NODE)
			-- add a new attribute_tuple node
		do
			c_attribute_tuples.extend (ca_tuple_ui_node)
			ca_tuple_ui_node.set_parent (Current)
		end

feature {C_ATTRIBUTE_UI_NODE} -- Modification

	convert_rm_property_to_constraint (ca_ui_node: C_ATTRIBUTE_UI_NODE)
			-- move RM property `ca_ui_node' to `c_attributes'
			-- and add its archetype node as a child attribute of the current archetype node
		require
			Context_is_constraint: not ca_ui_node.is_rm
			Rm_attributes_validity: rm_attributes.has (ca_ui_node.rm_property.name)
			C_attributes_valid: not c_attributes.has (ca_ui_node.rm_property.name)
			Not_already_in_archetype: context_property_not_in_archetype (ca_ui_node)
		do
			c_attributes.force (ca_ui_node, ca_ui_node.rm_property.name)
			rm_attributes.remove (ca_ui_node.rm_property.name)
			check attached arch_node as a_n and attached ca_ui_node.arch_node as prop_a_n then
				a_n.put_attribute (prop_a_n)
			end
		ensure
			Moved_to_c_attributes: c_attributes.item (ca_ui_node.rm_property.name) = ca_ui_node
			Removed_from_rm_properties: not rm_attributes.has (ca_ui_node.rm_property.name)
			Added_to_archetpe: context_property_in_archetype (ca_ui_node)
		end

	convert_constraint_to_rm_property (ca_ui_node: C_ATTRIBUTE_UI_NODE)
			-- move constraint property `ca_ui_node' to `rm_attributes'
		require
			Context_is_constraint: not ca_ui_node.is_rm
			Rm_attributes_validity: not rm_attributes.has (ca_ui_node.rm_property.name)
			C_attributes_validity: c_attributes.has (ca_ui_node.rm_property.name)
			Exists_in_archetype: context_property_in_archetype (ca_ui_node)
		do
			rm_attributes.force (ca_ui_node, ca_ui_node.rm_property.name)
			c_attributes.remove (ca_ui_node.rm_property.name)
			check attached arch_node as a_n and attached ca_ui_node.arch_node as prop_a_n then
				a_n.remove_attribute (prop_a_n)
			end
		ensure
			Moved_to_rm_attributes: rm_attributes.item (ca_ui_node.rm_property.name) = ca_ui_node
			Removed_from_c_attributes: not c_attributes.has (ca_ui_node.rm_property.name)
			Removed_from_archetpe: context_property_not_in_archetype (ca_ui_node)
		end

feature {NONE} -- Implementation

	display_constraint
		do
			if attached arch_node as cco and then cco.any_allowed then
				evx_grid.set_last_row_label_col (Definition_grid_col_constraint, Archetype_any_constraint, Void, Void, c_constraint_colour, Void)
			end
		end

	put_rm_attribute (a_node: C_ATTRIBUTE_UI_NODE)
			-- add a new attribute node
		require
			Valid_node: a_node.is_rm and not rm_attributes.has (a_node.rm_property.name)
		do
			rm_attributes.put (a_node, a_node.rm_property.name)
			a_node.set_parent (Current)
		end

	expand_to_rm (ui_settings: GUI_DEFINITION_SETTINGS)
			--  (if this is an RM node) or else go do the work
		do
			if is_rm and ev_grid_row /= Void and then ev_grid_row.subrow_count = 0 then
				-- if there are any candidate properties to be displayed given the current UI settings,
				-- then set an expand-actions event; if not, get rid of any previously set event
				if can_show_rm_properties then
					ev_grid_row.expand_actions.force_extend (agent process_rm_properties (ui_settings))
					ev_grid_row.ensure_expandable
				else
					ev_grid_row.expand_actions.wipe_out
					ev_grid_row.ensure_non_expandable
				end
			else
				process_rm_properties (ui_settings)
			end
		end

	process_rm_properties (ui_settings: GUI_DEFINITION_SETTINGS)
		do
			-- if we entered here due to lazy load event, get rid of the lazy load
			-- for previously expanded RM nodes, remove lazy-expand event
			if is_rm and attached ev_grid_row as ev_gr and then ev_gr.subrow_count = 0 then
				ev_gr.expand_actions.wipe_out
				ev_gr.ensure_non_expandable
			end

			-- process the properties, which may involve simply hiding ones that are currently visible
			across rm_properties as props_csr loop
				if not c_attributes.has (props_csr.item.name) and not (attached arch_node as cco and then cco.attribute_is_tuple_constrained (props_csr.item.name)) then
					prepare_rm_property (props_csr.item, ui_settings)
				end
			end
		end

	can_show_rm_properties: BOOLEAN
			-- True if there are any candidate properties to be displayed given the current UI settings
		require
			is_rm
		do
			Result := across rm_properties as props_csr some can_show_rm_property (props_csr.item) end
		end

	can_show_rm_property (an_rm_prop: BMM_PROPERTY): BOOLEAN
			-- True if `an_rm_prop' should be shown below current object node given current UI settings
		do
			Result := display_settings.show_rm_data_properties
				and (not an_rm_prop.is_im_runtime or else display_settings.show_rm_runtime_properties)
				and (not an_rm_prop.is_im_infrastructure or else display_settings.show_rm_infrastructure_properties)
		end

	prepare_rm_property (an_rm_prop: BMM_PROPERTY; ui_settings: GUI_DEFINITION_SETTINGS)
			-- enter a BMM_PROPERTY
		local
			c_attr_ed_node: C_ATTRIBUTE_UI_NODE
			att_gui_grid: EVX_GRID
		do
			check attached evx_grid as gg then
				att_gui_grid := gg
			end

			-- see if this property should be shown; if not, leave it for now
			if can_show_rm_property (an_rm_prop) then
				-- see if the property was created previously; if not create it new
				if not rm_attributes.has (an_rm_prop.name) then
					-- first time creation
					create c_attr_ed_node.make_rm (an_rm_prop, ui_graph_state)
					put_rm_attribute (c_attr_ed_node)

					-- once-only prepare step
					c_attr_ed_node.prepare_display_in_grid (att_gui_grid)

					-- first-time display step
					c_attr_ed_node.display_in_grid (ui_settings)
				else
					check attached rm_attributes.item (an_rm_prop.name) as rm_attr then
						c_attr_ed_node := rm_attr
					end
				end

				-- display it (even if it has already been displayed, and can't change,
				-- because there may be changes deeper under the node
				c_attr_ed_node.display_in_grid (ui_settings)

			elseif attached rm_attributes.item (an_rm_prop.name) as att_rm_attr then
				att_rm_attr.hide_in_grid
			end
		end

	prepare_children_display_in_grid (a_gui_grid: EVX_GRID)
		do
			-- set up child property nodes in grid
			across c_attributes as c_attrs_csr loop
				c_attrs_csr.item.prepare_display_in_grid (a_gui_grid)
			end

			-- set up child property tuple nodes in grid
			across c_attribute_tuples as c_attr_tuples_csr loop
				c_attr_tuples_csr.item.prepare_display_in_grid (a_gui_grid)
			end

			-- set up child property rm nodes in grid
			across rm_attributes as rm_attrs_csr loop
				rm_attrs_csr.item.prepare_display_in_grid (a_gui_grid)
			end
		end

end


