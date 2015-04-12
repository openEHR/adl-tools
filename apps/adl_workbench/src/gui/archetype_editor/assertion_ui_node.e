note
	component:   "openEHR ADL Tools"
	description: "UI visualisation node for an ASSERTION. One will be needed for each ASSERTION in an archetype."
	keywords:    "archetype, editing"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2012- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class ASSERTION_UI_NODE

inherit
	RULE_ELEMENT_UI_NODE
		redefine
			arch_node, prepare_display_in_grid, display_in_grid
		end

create
	make

feature -- Access

	arch_node: detachable ASSERTION
			-- assertion being edited

	expression_context: detachable RULE_ELEMENT_UI_NODE
			-- the editor context for `arch_node'.expression

feature -- Display

	prepare_display_in_grid (a_gui_grid: EVX_GRID)
		do
			evx_grid := a_gui_grid

			-- create a new row
			a_gui_grid.add_row (arch_node)
			check attached a_gui_grid.last_row as lr then
				ev_grid_row := lr
			end

			if attached expression_context as att_ec then
				att_ec.prepare_display_in_grid (a_gui_grid)
			end
		end

	display_in_grid (ui_settings: GUI_DEFINITION_SETTINGS)
		local
			s: STRING
		do
			precursor (ui_settings)
			if attached evx_grid as att_evx_grid and attached expression_context as att_ec then
				att_ec.display_in_grid (ui_settings)
				create s.make_empty
				if attached arch_node.tag as a_n_tag then
					s.append (a_n_tag)
				end
				check attached ev_grid_row as gr then
					att_evx_grid.set_last_row (gr)
				end
				att_evx_grid.set_last_row_label_col (rules_grid_col_expr_type, s, Void, Void, c_meaning_colour, c_pixmap)
				att_evx_grid.set_last_row_label_col (rules_grid_col_expr_value, meaning, Void, Void, c_meaning_colour, Void)
			end
		end

feature -- Modification

	set_expression_context (an_ed_context: attached like expression_context)
		do
			expression_context := an_ed_context
			an_ed_context.set_parent (Current)
		end

feature {RULE_ELEMENT_UI_NODE} -- Implementation

	meaning: STRING
			-- generate useful string representatoin for meaning column
		do
			create Result.make_empty
			if attached expression_context as att_ec then
				Result.append (att_ec.meaning)
			end
		end

	c_pixmap: EV_PIXMAP
		do
			Result := get_icon_pixmap (Pixmap_path + "operators" + resource_path_separator + "assertion")
		end

end


