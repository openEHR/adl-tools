note
	component:   "openEHR ADL Tools"
	description: "Editor context for a C_PRMITIVE_OBJECT"
	keywords:    "archetype, editing"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2012- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class C_CODE_PHRASE_ED_CONTEXT

inherit
	C_OBJECT_ED_CONTEXT
		redefine
			arch_node, prepare_display_in_grid, display_in_grid
		end

create
	make

feature -- Access

	arch_node: detachable C_CODE_PHRASE
			-- archetype node being edited

feature -- Display

	prepare_display_in_grid (a_gui_grid: EVX_GRID)
		local
			bmm_prop: BMM_PROPERTY_DEFINITION
		do
			precursor (a_gui_grid)

			-- build the grid row for terminology id
			if attached arch_node.terminology_id then
				bmm_prop := ed_context.rm_schema.property_definition (arch_node.rm_type_name, arch_node.rm_property_name ("terminology_id"))
				gui_grid.add_sub_row (gui_grid_row, bmm_prop.name)
				gui_grid.set_last_row_label_col (Definition_grid_col_rm_name, bmm_prop.name, Void, c_attribute_colour, get_icon_pixmap ("rm/generic/" + bmm_prop.multiplicity_key_string))
				gui_grid.set_last_row_label_col (Definition_grid_col_constraint, arch_node.terminology_id.value, Void, c_constraint_colour, Void)
			end

			-- code_string field
			if attached arch_node.code_list then
				bmm_code_string_prop := ed_context.rm_schema.property_definition (arch_node.rm_type_name, arch_node.rm_property_name ("code_string"))
				gui_grid.add_sub_row (gui_grid_row, bmm_code_string_prop.name)
				gui_grid.set_last_row_label_col (Definition_grid_col_rm_name, bmm_code_string_prop.name, Void, c_attribute_colour,
					get_icon_pixmap ("rm/generic/" + bmm_code_string_prop.multiplicity_key_string))
				gui_grid.set_last_row_label_col_multi_line (Definition_grid_col_constraint, "", Void, c_constraint_colour, Void)

				-- remember the code_string ev row
				code_string_row := gui_grid.last_row
			end
		end

	display_in_grid (ui_settings: GUI_DEFINITION_SETTINGS)
		do
			precursor (ui_settings)

			-- code_string field update
			if attached arch_node.code_list then
				gui_grid.set_last_row (code_string_row)
				gui_grid.update_last_row_label_col_multi_line (Definition_grid_col_constraint, c_code_phrase_str (arch_node), Void, Void, Void)
			end
		end

feature -- Modification

feature {NONE} -- Implementation

	bmm_code_string_prop: BMM_PROPERTY_DEFINITION

	code_string_row: EV_GRID_ROW

end


