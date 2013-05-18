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
			if attached arch_node.property then
				gui_grid.add_sub_row (gui_grid_row, "property")
				gui_grid.set_last_row_label_col (Definition_grid_col_rm_name, arch_node.rm_property_name ("property"), Void, c_constraint_colour,
					get_icon_pixmap ("rm/generic/c_meta_attribute"))
				gui_grid.set_last_row_label_col (Definition_grid_col_constraint, "", Void, c_constraint_colour, Void)

				-- remember the grid row
				property_grid_row := gui_grid.last_row
			end

			-- magnitude / units / precision constraint
			if attached arch_node.list then
				-- build the grid row
				bmm_prop_magnitude := ed_context.rm_schema.property_definition (arch_node.rm_type_name, arch_node.rm_property_name ("magnitude"))
				bmm_prop_units := ed_context.rm_schema.property_definition (arch_node.rm_type_name, arch_node.rm_property_name ("units"))
				bmm_prop_precision := ed_context.rm_schema.property_definition (arch_node.rm_type_name, arch_node.rm_property_name ("precision"))
				bmm_prop_key := bmm_prop_magnitude.name + " | " + bmm_prop_units.name + " | " + bmm_prop_precision.name

				gui_grid.add_sub_row (gui_grid_row, Void)
				gui_grid.set_last_row_label_col (Definition_grid_col_rm_name, bmm_prop_key, Void, c_attribute_colour,
					get_icon_pixmap ("rm/generic/" + bmm_prop_magnitude.multiplicity_key_string))
				gui_grid.set_last_row_label_col_multi_line (Definition_grid_col_constraint, constraint_str, Void, c_constraint_colour, Void)
			end
		end

	display_in_grid (ui_settings: GUI_DEFINITION_SETTINGS)
		do
			precursor (ui_settings)
			if attached arch_node.property then
				gui_grid.set_last_row (property_grid_row)
				gui_grid.update_last_row_label_col (Definition_grid_col_constraint, term_string (arch_node.property.terminology_id.value,
							arch_node.property.code_string), Void, Void, Void)
			end
		end

feature {NONE} -- Implementation

	constraint_str: STRING
		do
			create Result.make_empty
			across arch_node.list as qty_items_csr loop
				Result.append_string (c_quantity_item_string (qty_items_csr.item))
				if qty_items_csr.cursor_index < arch_node.list.count then
					Result.append_string ("%N")
				end
			end
			-- assumed value
			if arch_node.has_assumed_value then
				Result.append ("%N" + arch_node.assumed_value.magnitude_as_string + " (" + get_text (ec_assumed_text) + ")")
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

	property_grid_row: EV_GRID_ROW

end


