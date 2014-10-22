note
	component:   "openEHR ADL Tools"
	description: "UI visualisation node for an EXPR_BINARY_OPERATOR"
	keywords:    "archetype, editing"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2012 Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class EXPR_BINARY_OP_UI_NODE

inherit
	EXPR_OPERATOR_UI_NODE
		redefine
			arch_node, display_in_grid
		end

create
	make

feature -- Access

	arch_node: detachable EXPR_BINARY_OPERATOR

	left_operand_ed_context: detachable EXPR_ITEM_UI_NODE

	right_operand_ed_context: detachable EXPR_ITEM_UI_NODE

feature -- Display

	prepare_display_in_grid (a_gui_grid: EVX_GRID)
		do
			evx_grid := a_gui_grid
			check attached parent.ev_grid_row as parent_gr then
				evx_grid.add_sub_row (parent_gr, arch_node)
			end
			check attached evx_grid.last_row as lr then
				ev_grid_row := lr
			end

			left_operand_ed_context.prepare_display_in_grid (evx_grid)
			right_operand_ed_context.prepare_display_in_grid (evx_grid)
		end

	display_in_grid (ui_settings: GUI_DEFINITION_SETTINGS)
		do
			precursor (ui_settings)
			left_operand_ed_context.display_in_grid (ui_settings)
			right_operand_ed_context.display_in_grid (ui_settings)

			check attached ev_grid_row as gr then
				evx_grid.set_last_row (gr)
			end
			evx_grid.set_last_row_label_col (Rules_grid_col_expr_type, Void, Void, Void, c_pixmap)
		end

feature -- Modification

	set_left_operand_ed_context (an_ed_context: EXPR_ITEM_UI_NODE)
		do
			left_operand_ed_context := an_ed_context
			an_ed_context.set_parent (Current)
		end

	set_right_operand_ed_context (an_ed_context: EXPR_ITEM_UI_NODE)
		do
			right_operand_ed_context := an_ed_context
			an_ed_context.set_parent (Current)
		end

feature {EXPR_ITEM_UI_NODE} -- Implementation

	meaning: STRING
			-- generate useful string representatoin for meaning column
		local
			precedence_overridden: BOOLEAN
		do
			create Result.make_empty
			if attached arch_node as a_n then
				if attached {EXPR_OPERATOR} a_n.parent as parent_op then
					precedence_overridden := parent_op.precedence_overrides (a_n)
				end
				if precedence_overridden then
					Result.append_character ('(')
				end
				Result.append (left_operand_ed_context.meaning)
				Result.append (" " + a_n.operator.out + " ")
				Result.append (right_operand_ed_context.meaning)
				if precedence_overridden then
					Result.append_character (')')
				end
			end
		end

end


