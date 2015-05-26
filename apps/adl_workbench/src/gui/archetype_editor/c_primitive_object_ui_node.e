note
	component:   "openEHR ADL Tools"
	description: "UI visualisation node for a C_PRMITIVE_OBJECT"
	keywords:    "archetype, editing"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2012- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class C_PRIMITIVE_OBJECT_UI_NODE

inherit
	C_OBJECT_UI_NODE
		redefine
			arch_node, prepare_display_in_grid, is_prepared, rm_type_text, display_constraint
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
			if attached evx_grid as att_evx_grid then
				if attached arch_node as a_n then
					if attached {C_TERMINOLOGY_CODE} a_n as ctc then
						s := c_terminology_code_str (ctc)
					elseif a_n.is_enumerated_type_constraint then
						s := a_n.as_enumeration_string (ui_graph_state.rm_schema.enumeration_definition (a_n.rm_type_name).name_map)
					else
						s := a_n.as_string
					end
					att_evx_grid.update_last_row_label_col_multi_line (Definition_grid_col_constraint, s, Void, Void, c_constraint_colour, Void)
				else
					att_evx_grid.update_last_row_label_col_multi_line (Definition_grid_col_constraint, "(" + rm_type_text + ")", Void, Void, parent.rm_attribute_colour, Void)
				end
			end
		end

	rm_type_text: STRING
		do
			Result := rm_type.as_type_string
		end

end


