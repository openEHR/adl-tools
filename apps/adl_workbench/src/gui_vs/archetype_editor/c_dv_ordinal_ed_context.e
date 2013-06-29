note
	component:   "openEHR ADL Tools"
	description: "Editor context for a C_PRMITIVE_OBJECT"
	keywords:    "archetype, editing"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2012 Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class C_DV_ORDINAL_ED_CONTEXT

inherit
	C_OBJECT_ED_CONTEXT
		redefine
			arch_node, prepare_display_in_grid, display_in_grid
		end

create
	make

feature -- Access

	arch_node: detachable C_DV_ORDINAL
			-- archetype node being edited

feature -- Display

	prepare_display_in_grid (a_gui_grid: EVX_GRID)
		do
			precursor (a_gui_grid)
			if attached arch_node as a_n and then not a_n.any_allowed then
				-- build the grid row
				bmm_prop_value := ed_context.rm_schema.property_definition (a_n.rm_type_name, a_n.rm_property_name ("value"))
				bmm_prop_symbol := ed_context.rm_schema.property_definition (a_n.rm_type_name, a_n.rm_property_name ("symbol"))
				bmm_prop_key := bmm_prop_value.name + " - " + bmm_prop_symbol.name

				check attached  ev_grid_row as gr then
					evx_grid.add_sub_row (gr, bmm_prop_key)
				end
				evx_grid.set_last_row_label_col (Definition_grid_col_rm_name, bmm_prop_key, Void, c_attribute_colour,
					get_icon_pixmap ("rm/generic/" + bmm_prop_value.multiplicity_key_string))
				evx_grid.set_last_row_label_col_multi_line (Definition_grid_col_constraint, "", Void, c_constraint_colour, Void)
				check attached evx_grid.last_row as lr then
					value_symbol_subrow := lr
				end
			end
		end

	display_in_grid (ui_settings: GUI_DEFINITION_SETTINGS)
		do
			precursor (ui_settings)
			if attached arch_node as a_n and then not a_n.any_allowed then
				check attached value_symbol_subrow as sr then
					evx_grid.set_last_row (sr)
				end
				evx_grid.update_last_row_label_col_multi_line (Definition_grid_col_constraint, constraint_str, Void, Void, Void)
			end
		end

feature -- Modification

feature {NONE} -- Implementation

	value_symbol_subrow: detachable EV_GRID_ROW
		note
			option: stable
		attribute
		end

	object_ordinal_item_string (an_ordinal: ORDINAL; assumed_flag: BOOLEAN): STRING
			-- generate string form of node or object for use in tree node
		do
			create Result.make_empty
			Result.append (an_ordinal.value.out)
			Result.append (" - ")
			Result.append (term_string (an_ordinal.symbol.terminology_id.value, an_ordinal.symbol.code_string))
			if assumed_flag then
				Result.append (" (" + get_text (ec_assumed_text) + ")")
			end
		end

	constraint_str: STRING
			-- string to go in constraint column
		local
			assumed_flag: BOOLEAN
		do
			create Result.make_empty
			if attached arch_node as a_n then
				across a_n.items as ord_items_csr loop
					assumed_flag := a_n.has_assumed_value and then a_n.assumed_value.value = ord_items_csr.item.value
					Result.append_string (object_ordinal_item_string (ord_items_csr.item, assumed_flag))
					if ord_items_csr.cursor_index < a_n.items.count then
						Result.append_string ("%N")
					end
				end
			end
		end

	bmm_prop_key: detachable STRING
		note
			option: stable
		attribute
		end

	bmm_prop_value: detachable BMM_PROPERTY_DEFINITION
		note
			option: stable
		attribute
		end

	bmm_prop_symbol: detachable BMM_PROPERTY_DEFINITION
		note
			option: stable
		attribute
		end

end


