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

	prepare_display_in_grid (a_gui_grid: EVX_GRID)
		do
			gui_grid := a_gui_grid
			gui_grid.add_sub_row (parent.gui_grid_row, arch_node)
			gui_grid_row := gui_grid.last_row
		end

	display_in_grid (ui_settings: GUI_DEFINITION_SETTINGS)
		do
			precursor (ui_settings)
			gui_grid.set_last_row_label_col (Rules_grid_col_expr_type, meaning, Void, c_meaning_colour, c_pixmap)
		end

feature {NONE} -- Implementation

	meaning: STRING
			-- generate useful string representatoin for meaning column
		local
			last_node_id: STRING
			og_path: OG_PATH
		do
			create Result.make_empty
			if arch_node.is_archetype_definition_ref then
				create og_path.make_from_string (arch_node.item.out)
				last_node_id := og_path.last_object_node_id
				if not last_node_id.is_empty then
					Result.append (ed_context.flat_ontology.term_definition (display_settings.language, last_node_id).text)
				else
					Result.append (arch_node.item.out)
				end
			elseif arch_node.is_constraint and attached {C_CODE_PHRASE} arch_node.item as c_cp then
				Result.append (c_code_phrase_str (c_cp))
			else
				Result.append (arch_node.as_string)
			end
		end

	c_pixmap: EV_PIXMAP
		local
			pixmap_name: STRING
		do
			pixmap_name := Pixmap_path + "operands" + resource_path_separator + arch_node.type
			if has_icon_pixmap (pixmap_name) then
				Result := get_icon_pixmap (pixmap_name)
			else
				pixmap_name := rm_icon_dir + resource_path_separator + ed_context.rm_schema.rm_publisher + resource_path_separator + arch_node.type
				if has_icon_pixmap (pixmap_name) then
					Result := get_icon_pixmap (pixmap_name)
				else
					pixmap_name := "am" + resource_path_separator + "added" + resource_path_separator + arch_node.type
					if has_icon_pixmap (pixmap_name) then
						Result := get_icon_pixmap (pixmap_name)
					end
				end
			end
		end

end


