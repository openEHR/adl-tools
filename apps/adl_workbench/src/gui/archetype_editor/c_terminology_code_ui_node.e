note
	component:   "openEHR ADL Tools"
	description: "UI visualisation node for a C_TERMINOLOGY_CODE"
	keywords:    "archetype, editing"
	author:      "Thomas Beale <thomas.beale@openehr.org>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2016- openEHR Foundation <http://www.openehr.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class C_TERMINOLOGY_CODE_UI_NODE

inherit
	C_PRIMITIVE_OBJECT_UI_NODE
		redefine
			arch_node, display_constraint
		end

create
	make, make_rm

feature -- Access

	arch_node: detachable C_TERMINOLOGY_CODE

feature {NONE} -- Implementation

	display_constraint
		local
			s: STRING
		do
			if attached evx_grid as att_evx_grid then
				if attached arch_node as a_n then
					s := c_terminology_code_str (a_n)
					att_evx_grid.update_last_row_label_col_multi_line (Definition_grid_col_constraint, s, Void, Void, c_constraint_colour, Void)
				else
					att_evx_grid.update_last_row_label_col_multi_line (Definition_grid_col_constraint, "(" + rm_type_text + ")", Void, Void, parent.rm_attribute_colour, Void)
				end
			end
		end

end


