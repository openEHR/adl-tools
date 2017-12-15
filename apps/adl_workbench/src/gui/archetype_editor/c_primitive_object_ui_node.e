note
	component:   "openEHR ADL Tools"
	description: "UI visualisation node for a C_PRMITIVE_OBJECT"
	keywords:    "archetype, editing"
	author:      "Thomas Beale <thomas.beale@openehr.org>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2012- The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

deferred class C_PRIMITIVE_OBJECT_UI_NODE

inherit
	C_OBJECT_UI_NODE
		redefine
			arch_node, rm_type_text, prepare_constraint, display_constraint
		end

feature -- Access

	arch_node: detachable C_PRIMITIVE_OBJECT
			-- archetype node being edited

feature {NONE} -- Implementation

	prepare_constraint
		local
			s: STRING
		do
			if attached evx_grid as att_evx_grid then
				if attached arch_node as a_n then
					if a_n.is_enumerated_type_constraint then
						s := a_n.as_enumeration_string (ui_graph_state.ref_model.enumeration_definition (a_n.rm_type_name).name_map)
					else
						s := a_n.as_string
					end
					if ui_graph_state.editing_enabled then
						att_evx_grid.set_last_row_label_col_multi_line_editable (Definition_grid_col_constraint, s, Void, Void, c_constraint_colour, Void, agent update_constraint (s, ev_grid_row))
					else
						att_evx_grid.set_last_row_label_col_multi_line (Definition_grid_col_constraint, s, Void, Void, c_constraint_colour, Void)
					end
				else
					att_evx_grid.set_last_row_label_col_multi_line (Definition_grid_col_constraint, "(" + rm_type_text + ")", Void, Void, parent.rm_attribute_colour, Void)
				end
			end
		end

	display_constraint
		local
			s: STRING
		do
			if attached evx_grid as att_evx_grid then
				if attached arch_node as a_n then
					if a_n.is_enumerated_type_constraint then
						s := a_n.as_enumeration_string (ui_graph_state.ref_model.enumeration_definition (a_n.rm_type_name).name_map)
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
			Result := rm_type.type_name
		end

feature -- Editing

	update_constraint (orig_text: STRING; an_ev_row: detachable EV_GRID_ROW)
			-- action to perform if constraint is edited by user
		do
		end

end

