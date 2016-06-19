note
	component:   "openEHR ADL Tools"
	description: "UI visualisation node for a C_PRMITIVE_OBJECT"
	keywords:    "archetype, editing"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2012- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

deferred class C_PRIMITIVE_OBJECT_UI_NODE

inherit
	C_OBJECT_UI_NODE
		redefine
			arch_node, rm_type_text, display_constraint
		end

feature -- Access

	arch_node: detachable C_PRIMITIVE_OBJECT
			-- archetype node being edited

feature {NONE} -- Implementation

	display_constraint
		local
			s: STRING
		do
			if attached evx_grid as att_evx_grid then
				if attached arch_node as a_n then
					if a_n.is_enumerated_type_constraint then
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
			Result := rm_type.type_name
		end

end

