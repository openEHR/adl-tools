note
	component:   "openEHR ADL Tools"
	description: "Editor context for a C_PRMITIVE_OBJECT"
	keywords:    "archetype, editing"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2012- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class C_DV_QUANTITY_ED_CONTEXT

inherit
	C_OBJECT_ED_CONTEXT
		redefine
			arch_node, prepare_display_in_grid, display_in_grid
		end

create
	make

feature -- Access

	arch_node: detachable C_DV_QUANTITY
			-- archetype node being edited

feature -- Display

	prepare_display_in_grid (a_gui_grid: EVX_GRID)
		local
			bmm_prop_key: STRING
			bmm_prop_magnitude, bmm_prop_units, bmm_prop_precision: BMM_PROPERTY_DEFINITION
		do
			precursor (a_gui_grid)

			-- property constraint
			if attached arch_node as a_n and attached ev_grid_row as gr then
				if attached a_n.property then
					evx_grid.add_sub_row (gr, "property")
					evx_grid.set_last_row_label_col (Definition_grid_col_rm_name, a_n.rm_property_name ("property"), Void, c_constraint_colour,
						get_icon_pixmap ("rm/generic/c_meta_attribute"))
					evx_grid.set_last_row_label_col (Definition_grid_col_constraint, "", Void, c_constraint_colour, Void)

					-- remember the grid row
					check attached evx_grid.last_row as lr then
						property_grid_row := lr
					end
				end

				-- magnitude / units / precision constraint
				if attached a_n.list then
					-- build the grid row
					bmm_prop_magnitude := ed_context.rm_schema.property_definition (a_n.rm_type_name, a_n.rm_property_name ("magnitude"))
					bmm_prop_units := ed_context.rm_schema.property_definition (a_n.rm_type_name, a_n.rm_property_name ("units"))
					bmm_prop_precision := ed_context.rm_schema.property_definition (a_n.rm_type_name, a_n.rm_property_name ("precision"))
					bmm_prop_key := bmm_prop_magnitude.name + " | " + bmm_prop_units.name + " | " + bmm_prop_precision.name

					evx_grid.add_sub_row (gr, Void)
					evx_grid.set_last_row_label_col (Definition_grid_col_rm_name, bmm_prop_key, Void, c_attribute_colour,
						get_icon_pixmap ("rm/generic/" + bmm_prop_magnitude.multiplicity_key_string))
					evx_grid.set_last_row_label_col_multi_line (Definition_grid_col_constraint, constraint_str, Void, c_constraint_colour, Void)
				end
			end
		end

	display_in_grid (ui_settings: GUI_DEFINITION_SETTINGS)
		do
			precursor (ui_settings)
			if attached arch_node as a_n and then attached a_n.property as a_n_property and attached property_grid_row as pgr then
				evx_grid.set_last_row (pgr)
				evx_grid.update_last_row_label_col (Definition_grid_col_constraint, term_string (a_n.property.terminology_id.value,
							a_n_property.code_string), Void, Void, Void)
			end
		end

feature {NONE} -- Implementation

	constraint_str: STRING
		do
			create Result.make_empty
			if attached arch_node as a_n then
				across a_n.list as qty_items_csr loop
					Result.append_string (c_quantity_item_string (qty_items_csr.item))
					if qty_items_csr.cursor_index < a_n.list.count then
						Result.append_string ("%N")
					end
				end
				-- assumed value
				if a_n.has_assumed_value then
					Result.append ("%N" + a_n.assumed_value.magnitude_as_string + " (" + get_text (ec_assumed_text) + ")")
				end
			end
		end

	c_quantity_item_string (a_node: C_QUANTITY_ITEM): STRING
			-- generate string form of node or object for use in tree node
		do
			create Result.make_empty
			if a_node.magnitude /= Void then
				Result.append (a_node.magnitude.as_string)
			end
			Result.append (" | ")
			if a_node.units /= Void then
				Result.append (a_node.units)
			end
			Result.append (" | ")
			if a_node.precision /= Void then
				Result.append (a_node.precision.as_string)
			end
		end

	property_grid_row: detachable EV_GRID_ROW

end


