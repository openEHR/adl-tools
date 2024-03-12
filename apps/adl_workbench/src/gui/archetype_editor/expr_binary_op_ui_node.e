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
			
			check attached parent as att_parent and then attached att_parent.ev_grid_row as parent_gr then
				a_gui_grid.add_sub_row (parent_gr, arch_node)
			end
			check attached a_gui_grid.last_row as lr then
				ev_grid_row := lr
			end

			if attached left_operand_ed_context as l_ctx then
				l_ctx.prepare_display_in_grid (a_gui_grid)
			end
			if attached right_operand_ed_context as r_ctx then
				r_ctx.prepare_display_in_grid (a_gui_grid)
			end
		end

	display_in_grid (ui_settings: GUI_DEFINITION_SETTINGS)
		do
			precursor (ui_settings)

			check attached evx_grid end

			if attached left_operand_ed_context as l_ctx then
				l_ctx.display_in_grid (ui_settings)
			end

			if attached right_operand_ed_context as r_ctx then
				r_ctx.display_in_grid (ui_settings)
			end

			check attached ev_grid_row as gr then
				evx_grid.set_last_row (gr)
			end
			evx_grid.set_last_row_label_col (Rules_grid_col_expr_type, Void, Void, Void, Void, c_pixmap)
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
			-- generate useful string representation for meaning column
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
				if attached left_operand_ed_context as l_ctx then
					Result.append (l_ctx.meaning)
				end
				Result.append (" " + a_n.operator.out + " ")
				if attached right_operand_ed_context as r_ctx then
					Result.append (r_ctx.meaning)
				end
				if precedence_overridden then
					Result.append_character (')')
				end
			end
		end

end


