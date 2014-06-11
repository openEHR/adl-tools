note
	component:   "openEHR ADL Tools"
	description: "Editor context for a C_ARCHETYPE_ROOT"
	keywords:    "archetype, editing"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2012- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class C_ARCHETYPE_ROOT_ED_CONTEXT

inherit
	C_COMPLEX_OBJECT_ED_CONTEXT
		redefine
			arch_node, rm_properties, display_constraint
		end

create
	make

feature -- Access

	arch_node: detachable C_ARCHETYPE_ROOT
			-- archetype node being edited

	rm_properties: HASH_TABLE [BMM_PROPERTY [BMM_TYPE], STRING]
			-- don't produce any RM properties, since node is another archetype
		do
			if ed_context.in_differential_view and not ed_context.editing_enabled then
				create Result.make (0)
			else
				Result := rm_type.semantic_class.flat_properties
			end
		end

feature {NONE} -- Implementation

	display_constraint
		do
			if attached arch_node as car and not ed_context.archetype.is_template then
				evx_grid.set_last_row_label_col (Definition_grid_col_constraint, car.node_id, Void, c_constraint_colour, Void)
			end
		end

end


