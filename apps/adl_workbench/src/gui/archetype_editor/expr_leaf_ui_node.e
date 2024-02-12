note
	component:   "openEHR ADL Tools"
	description: "UI visualisation node for EXPR_LEAF node"
	keywords:    "archetype, editing"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2012- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class EXPR_LEAF_UI_NODE

inherit
	EXPR_ITEM_UI_NODE
		redefine
			arch_node, display_in_grid
		end

create
	make

feature -- Access

	arch_node: detachable EXPR_LEAF

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
		end

	display_in_grid (ui_settings: GUI_DEFINITION_SETTINGS)
		do
			precursor (ui_settings)
			evx_grid.set_last_row_label_col (Rules_grid_col_expr_type, meaning, Void, Void, c_meaning_colour, c_pixmap)
		end

feature {NONE} -- Implementation

	meaning: STRING
			-- generate useful string representation for meaning column
		do
			create Result.make_empty
			if attached {EXPR_LEAF} arch_node as a_n then
				if attached {EXPR_ARCHETYPE_REF} a_n as aref and then aref.is_archetype_definition_ref then
					if attached ui_graph_state.flat_terminology.deepest_definition_for_path (aref.path, display_settings.language) as att_term_def then
						Result.append (att_term_def.text)
					else
						Result.append (aref.path)
					end
				elseif attached {EXPR_CONSTRAINT} a_n as acon and then attached {C_TERMINOLOGY_CODE} acon.item as c_cp then
					Result.append (c_terminology_code_str (c_cp))
				else
					Result.append (a_n.as_string)
				end
			end
		end

	c_pixmap: EV_PIXMAP
		local
			pixmap_name: STRING
		do
			if attached arch_node as a_n then
				pixmap_name := Pixmap_path + "operands" + resource_path_separator + a_n.type
				if has_icon_pixmap (pixmap_name) then
					Result := get_icon_pixmap (pixmap_name)
				else
					pixmap_name := Icon_rm_dir + resource_path_separator + ui_graph_state.ref_model.rm_publisher + resource_path_separator + a_n.type
					if has_icon_pixmap (pixmap_name) then
						Result := get_icon_pixmap (pixmap_name)
					else
						pixmap_name := "am" + resource_path_separator + "added" + resource_path_separator + a_n.type
						if has_icon_pixmap (pixmap_name) then
							Result := get_icon_pixmap (pixmap_name)
						else
							create Result.default_create
						end
					end
				end
			else
				create Result.default_create
			end
		end

end


