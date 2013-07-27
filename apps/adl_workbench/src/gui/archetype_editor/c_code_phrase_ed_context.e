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

			if attached arch_node as a_n and attached ev_grid_row as gr then
				-- build the grid row for terminology id
				if attached a_n.terminology_id as a_n_tid then
					bmm_prop := ed_context.rm_schema.property_definition (a_n.rm_type_name, a_n.rm_property_name ("terminology_id"))
					evx_grid.add_sub_row (gr, bmm_prop.name)
					evx_grid.set_last_row_label_col (Definition_grid_col_rm_name, bmm_prop.name, Void, c_attribute_colour, get_icon_pixmap ("rm/generic/" + bmm_prop.multiplicity_key_string))
					evx_grid.set_last_row_label_col (Definition_grid_col_constraint, a_n_tid.value, Void, c_constraint_colour, Void)
				end

				-- code_string field
				if attached a_n.code_list then
					bmm_code_string_prop := ed_context.rm_schema.property_definition (a_n.rm_type_name, a_n.rm_property_name ("code_string"))
					evx_grid.add_sub_row (gr, bmm_code_string_prop.name)
					evx_grid.set_last_row_label_col (Definition_grid_col_rm_name, bmm_code_string_prop.name, Void, c_attribute_colour,
						get_icon_pixmap ("rm/generic/" + bmm_code_string_prop.multiplicity_key_string))
					evx_grid.set_last_row_label_col_multi_line (Definition_grid_col_constraint, "", Void, c_constraint_colour, Void)

					-- remember the code_string ev row
					check attached evx_grid.last_row as lr then
						code_string_row := lr
					end
				end
			end
		end

	display_in_grid (ui_settings: GUI_DEFINITION_SETTINGS)
		do
			precursor (ui_settings)

			-- code_string field update
			if attached arch_node as a_n and then attached a_n.code_list and attached code_string_row as csr then
				evx_grid.set_last_row (csr)
				evx_grid.update_last_row_label_col_multi_line (Definition_grid_col_constraint, c_code_phrase_str (a_n), Void, Void, Void)
			end
		end

feature -- Modification

feature {NONE} -- Implementation

	bmm_code_string_prop: detachable BMM_PROPERTY_DEFINITION
		note
			option: stable
		attribute
		end

	code_string_row: detachable EV_GRID_ROW
		note
			option: stable
		attribute
		end

end


