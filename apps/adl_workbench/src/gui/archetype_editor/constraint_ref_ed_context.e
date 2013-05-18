note
	component:   "openEHR ADL Tools"
	description: "Editor context for a C_PRMITIVE_OBJECT"
	keywords:    "archetype, editing"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2012- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class CONSTRAINT_REF_ED_CONTEXT

inherit
	C_OBJECT_ED_CONTEXT
		redefine
			arch_node, prepare_display_in_grid, display_in_grid
		end

create
	make

feature -- Access

	arch_node: detachable CONSTRAINT_REF
			-- archetype node being edited

feature -- Display

	prepare_display_in_grid (a_gui_grid: EVX_GRID)
		do
			precursor (a_gui_grid)

			-- add select event
 	--		gui_grid_row.item (Node_grid_col_meaning).pointer_button_press_actions.force_extend (agent add_code_select_context_menu (arch_node.target, ?, ?, ?))
		end

	display_in_grid (ui_settings: GUI_DEFINITION_SETTINGS)
		local
			s: STRING
		do
			precursor (ui_settings)

			-- set meaning column to referenced path
			create s.make_empty
			s.append (local_term_string (arch_node.target))
			gui_grid_row.set_item (Definition_grid_col_meaning, create {EV_GRID_LABEL_ITEM}.make_with_text (utf8_to_utf32 (s)))
		end

feature -- Modification


end


