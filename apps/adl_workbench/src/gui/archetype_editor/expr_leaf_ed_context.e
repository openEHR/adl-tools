note
	component:   "openEHR ADL Tools"
	description: "Editor context interface for EXPR_LEAF node"
	keywords:    "archetype, editing"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2012- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class EXPR_LEAF_ED_CONTEXT

inherit
	EXPR_ITEM_ED_CONTEXT
		redefine
			arch_node, prepare_display_in_grid, display_in_grid
		end

create
	make

feature -- Access

	arch_node: detachable EXPR_LEAF

feature -- Display

	prepare_display_in_grid (a_gui_grid: attached EVX_GRID)
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
			evx_grid.set_last_row_label_col (Rules_grid_col_expr_type, meaning, Void, c_meaning_colour, c_pixmap)
		end

feature {NONE} -- Implementation

	meaning: STRING
			-- generate useful string representation for meaning column
		local
			last_node_id: STRING
			og_path: OG_PATH
		do
			create Result.make_empty
			if attached arch_node as a_n then
				if a_n.is_archetype_definition_ref then
					create og_path.make_from_string (a_n.item.out)
					last_node_id := og_path.last_object_node_id
					if not last_node_id.is_empty and then ed_context.flat_terminology.has_term_definition (display_settings.language, last_node_id) then
						Result.append (ed_context.flat_terminology.term_definition (display_settings.language, last_node_id).text)
					else
						Result.append (a_n.item.out)
					end
				elseif a_n.is_constraint and attached {C_TERMINOLOGY_CODE} a_n.item as c_cp then
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
					pixmap_name := rm_icon_dir + resource_path_separator + ed_context.rm_schema.rm_publisher + resource_path_separator + a_n.type
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


