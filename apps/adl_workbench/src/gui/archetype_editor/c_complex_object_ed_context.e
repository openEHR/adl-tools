note
	component:   "openEHR ADL Tools"
	description: "Editor context for a C_COMPLEX_OBJECT"
	keywords:    "archetype, editing"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2012 Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class C_COMPLEX_OBJECT_ED_CONTEXT

inherit
	C_OBJECT_ED_CONTEXT
		redefine
			arch_node, make, make_rm, prepare_display_in_grid, display_in_grid
		end

create
	make, make_rm

feature -- Initialisation

	make (an_arch_node: attached like arch_node; an_ed_context: ARCH_ED_CONTEXT_STATE)
		do
			precursor (an_arch_node, an_ed_context)
			create c_attributes.make (0)
			create rm_attributes.make (0)
		end

	make_rm (an_rm_type: BMM_TYPE_SPECIFIER; an_ed_context: ARCH_ED_CONTEXT_STATE)
		do
			precursor (an_rm_type, an_ed_context)
			create c_attributes.make (0)
			create rm_attributes.make (0)
		end

feature -- Access

	arch_node: detachable C_COMPLEX_OBJECT
			-- archetype node being edited

	c_attributes: HASH_TABLE [C_ATTRIBUTE_ED_CONTEXT, STRING]
			-- editor nodes for real C_ATTRIBUTEs that are found in C_COMPLEX_OBJECT.attributes

	rm_attributes: HASH_TABLE [C_ATTRIBUTE_ED_CONTEXT, STRING]
			-- Editor nodes for unconstrained RM attributes that have been lazy-requested for viewing
			-- Once created, they don't leave, they are just displayed or hidden in the EV_GRID tree

	rm_properties: HASH_TABLE [BMM_PROPERTY_DEFINITION, STRING]
		do
			if ed_context.in_differential_view and not ed_context.editing_enabled then
				Result := rm_type.semantic_class.properties
			else
				Result := rm_type.semantic_class.flat_properties
			end
		end

feature -- Display

	prepare_display_in_grid (a_gui_grid: EVX_GRID)
		do
			-- set up this node in grid
			precursor (a_gui_grid)

			-- set up child property nodes in grid
			across c_attributes as attr_csr loop
				attr_csr.item.prepare_display_in_grid (gui_grid)
			end

			-- set up child property rm nodes in grid
			across rm_attributes as attr_csr loop
				attr_csr.item.prepare_display_in_grid (gui_grid)
			end
		end

	display_in_grid (ui_settings: GUI_DEFINITION_SETTINGS)
		do
			precursor (ui_settings)

			across c_attributes as attr_csr loop
				attr_csr.item.display_in_grid (ui_settings)
			end

			if not rm_properties.is_empty then
				expand_to_rm (ui_settings)
			end
		end

feature -- Modification

	put_c_attribute (a_node: C_ATTRIBUTE_ED_CONTEXT)
			-- add a new attribute node
		require
			not a_node.is_rm and not c_attributes.has (a_node.arch_node.rm_attribute_path)
		do
			c_attributes.put (a_node, a_node.arch_node.rm_attribute_path)
			a_node.set_parent (Current)
		end

	convert_rm_property_to_constraint (a_child_node: C_ATTRIBUTE_ED_CONTEXT)
			-- move RM property `a_child_node' to `c_attributes'
		require
			Valid_child: rm_attributes.has (a_child_node.rm_property.name) and not a_child_node.is_rm
			C_attributes_valid: not c_attributes.has (a_child_node.rm_property.name)
		do
			c_attributes.force (a_child_node, a_child_node.rm_property.name)
			rm_attributes.remove (a_child_node.rm_property.name)
		ensure
			Converted: c_attributes.item (a_child_node.rm_property.name) = a_child_node
			Removed_from_rm: not rm_attributes.has (a_child_node.rm_property.name)
		end

feature {NONE} -- Implementation

	put_rm_attribute (a_node: C_ATTRIBUTE_ED_CONTEXT)
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
			if is_rm and gui_grid_row.subrow_count = 0 then
				-- if there are any candidate properties to be displayed given the current UI settings,
				-- then set an expand-actions event; if not, get rid of any previously set event
				if can_show_rm_properties then
					gui_grid_row.expand_actions.force_extend (agent process_rm_properties (ui_settings))
					gui_grid_row.ensure_expandable
				else
					gui_grid_row.expand_actions.wipe_out
					gui_grid_row.ensure_non_expandable
				end
			else
				process_rm_properties (ui_settings)
			end
		end

	process_rm_properties (ui_settings: GUI_DEFINITION_SETTINGS)
		do
			-- if we entered here due to lazy load event, get rid of the lazy load
			-- for previously expanded RM nodes, remove lazy-expand event
			if is_rm and gui_grid_row.subrow_count = 0 then
				gui_grid_row.expand_actions.wipe_out
				gui_grid_row.ensure_non_expandable
			end

			-- process the properties, which may involve simply hiding ones that are currently visible
			across rm_properties as props_csr loop
				if not c_attributes.has (props_csr.item.name) then
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

	can_show_rm_property (an_rm_prop: BMM_PROPERTY_DEFINITION): BOOLEAN
			-- True if `an_rm_prop' should be shown below current object node given current UI settings
		do
			Result := show_rm_data_properties
				and (not an_rm_prop.is_im_runtime or else show_rm_runtime_properties)
				and (not an_rm_prop.is_im_infrastructure or else show_rm_infrastructure_properties)
		end

	prepare_rm_property (an_rm_prop: BMM_PROPERTY_DEFINITION; ui_settings: GUI_DEFINITION_SETTINGS)
			-- enter a BMM_PROPERTY_DEFINITION
		local
			c_attr_ed_node: C_ATTRIBUTE_ED_CONTEXT
		do
			-- see if this property should be shown; if not, leave it for now
			if can_show_rm_property (an_rm_prop) then
				-- see if the property was created previously; if not create it new
				if not rm_attributes.has (an_rm_prop.name) then
					-- first time creation
					create c_attr_ed_node.make_rm (an_rm_prop, ed_context)
					put_rm_attribute (c_attr_ed_node)

					-- once-only prepare step
					c_attr_ed_node.prepare_display_in_grid (gui_grid)

					-- first-time display step
					c_attr_ed_node.display_in_grid (ui_settings)
				else
					c_attr_ed_node := rm_attributes.item (an_rm_prop.name)
				end

				-- display it (even if it has already been displayed, and can't change,
				-- because there may be changes deeper under the node
				c_attr_ed_node.display_in_grid (ui_settings)

			elseif rm_attributes.has (an_rm_prop.name) then
				rm_attributes.item (an_rm_prop.name).hide_in_grid
			end
		end

end


