note
	component:   "openEHR ADL Tools"
	description: "UI visualisation node for a ARCHETYPE_INTERNAL_REF"
	keywords:    "archetype, editing"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2012- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class C_COMPLEX_OBJECT_PROXY_UI_NODE

inherit
	C_OBJECT_UI_NODE
		redefine
			arch_node, display_in_grid
		end

create
	make

feature -- Access

	arch_node: detachable C_COMPLEX_OBJECT_PROXY
			-- archetype node being edited

feature -- Display

	display_in_grid (ui_settings: GUI_DEFINITION_SETTINGS)
		local
			p, s: STRING
		do
			precursor (ui_settings)

			-- set constraint column to referenced path
			if attached arch_node as a_n then
				create s.make_empty
				s.append ("use ")
				if display_settings.show_technical_view then
					p := a_n.target_path.twin
				else
					p := ui_graph_state.flat_archetype.annotated_path (a_n.target_path, display_settings.language, True)
				end
				p.replace_substring_all ({OG_PATH}.segment_separator_string, "%N" + {OG_PATH}.segment_separator_string)
				p.remove_head (1)
				s.append (p)

				evx_grid.update_last_row_label_col_multi_line (Definition_grid_col_constraint, s, Void, Void, c_attribute_colour, Void)
			end
		end


end

