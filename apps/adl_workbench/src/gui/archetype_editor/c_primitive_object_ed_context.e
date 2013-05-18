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
			arch_node, display_in_grid, rm_type_text
		end

create
	make, make_rm

feature -- Access

	arch_node: detachable C_PRIMITIVE_OBJECT
			-- archetype node being edited

feature -- Display

	display_in_grid (ui_settings: GUI_DEFINITION_SETTINGS)
		local
			gli: EV_GRID_LABEL_ITEM
		do
			precursor (ui_settings)
			if not is_rm and then not arch_node.any_allowed then
				create gli.make_with_text (arch_node.item.as_string)
				gli.set_foreground_color (c_constraint_colour)
				gui_grid_row.set_item (Definition_grid_col_constraint, gli)
			end
		end

feature {NONE} -- Implementation

	rm_type_text: STRING
		do
			Result := rm_type.as_type_string
		end

end


