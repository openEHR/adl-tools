note
	component:   "openEHR ADL Tools"
	description: "Editor context interface for EXPR_UNARY_OPERATOR node"
	keywords:    "archetype, editing"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2012- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class EXPR_UNARY_OP_ED_CONTEXT

inherit
	EXPR_OPERATOR_ED_CONTEXT
		redefine
			arch_node, display_in_grid
		end

create
	make

feature -- Access

	arch_node: detachable EXPR_UNARY_OPERATOR

	operand_ed_context: EXPR_ITEM_ED_CONTEXT

feature -- Display

	prepare_display_in_grid (a_gui_grid: EVX_GRID)
		do
			gui_grid := a_gui_grid
			gui_grid.add_sub_row (parent.gui_grid_row, arch_node)
			gui_grid_row := gui_grid.last_row
			operand_ed_context.prepare_display_in_grid (gui_grid)
		end

	display_in_grid (ui_settings: GUI_DEFINITION_SETTINGS)
		do
			precursor (ui_settings)
			operand_ed_context.display_in_grid (ui_settings)

			gui_grid.set_last_row (gui_grid_row)
			gui_grid.set_last_row_label_col (Rules_grid_col_expr_type, Void, Void, Void, c_pixmap)
		end

feature -- Modification

	set_operand_ed_context (an_ed_context: EXPR_ITEM_ED_CONTEXT)
		do
			operand_ed_context := an_ed_context
			an_ed_context.set_parent (Current)
		end

feature {EXPR_ITEM_ED_CONTEXT} -- Implementation

	meaning: STRING
			-- generate useful string representatoin for meaning column
		do
			create Result.make_empty
			Result.append (arch_node.operator.out + " ")
			Result.append (operand_ed_context.meaning)
		end

end


