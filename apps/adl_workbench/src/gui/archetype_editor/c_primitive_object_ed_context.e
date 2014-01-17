note
	component:   "openEHR ADL Tools"
	description: "Editor context for a C_PRMITIVE_OBJECT"
	keywords:    "archetype, editing"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2012- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class C_PRIMITIVE_OBJECT_ED_CONTEXT

inherit
	C_OBJECT_ED_CONTEXT
		redefine
			arch_node, prepare_display_in_grid, is_prepared, display_in_grid, rm_type_text, display_constraint
		end

create
	make, make_rm

feature -- Access

	arch_node: detachable C_PRIMITIVE_OBJECT
			-- archetype node being edited

feature -- Display

	prepare_display_in_grid (a_gui_grid: EVX_GRID)
		do
			evx_grid := a_gui_grid

			-- re-use parent row
			check attached parent as p and then attached p.ev_grid_row as lr then
				ev_grid_row := lr
			end
		end

	display_in_grid (ui_settings: GUI_DEFINITION_SETTINGS)
		local
			s, attr_name: STRING
		do
			display_settings := ui_settings
			check attached ev_grid_row as gr then
				evx_grid.set_last_row (gr)
			end
			is_displayed := True

			if attached arch_node as a_n and then attached a_n.parent as parent_ca then
				-- if in technical mode, show primitive data type
				if display_settings.show_technical_view then
					attr_name := parent_ca.rm_attribute_name + ": " + a_n.rm_type_name
				else
					attr_name := parent_ca.rm_attribute_name
				end
				evx_grid.update_last_row_label_col_multi_line (Definition_grid_col_rm_name, attr_name, Void, Void, Void)

				-- constraint value
				display_constraint
			end
		end

feature -- _status Report

	is_prepared: BOOLEAN
			-- True if grid row connections are valid - in this case, the grid row is the same
			-- one as the parent
		do
			Result := attached evx_grid and attached ev_grid_row as gr and then
				(attached parent as p implies (gr = p.ev_grid_row))
		end

feature {NONE} -- Implementation

	display_constraint
		local
			s: STRING
		do
			if attached arch_node as a_n then
				if attached {C_TERMINOLOGY_CODE} a_n as ctc then
					s := c_terminology_code_str (ctc)
				else
					s := a_n.as_string
				end
				evx_grid.set_last_row_label_col_multi_line (Definition_grid_col_constraint, s, Void, c_constraint_colour, Void)
			end
		end

	rm_type_text: STRING
		do
			Result := rm_type.as_type_string
		end

end


