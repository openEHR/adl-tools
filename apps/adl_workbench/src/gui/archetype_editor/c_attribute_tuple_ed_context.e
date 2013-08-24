note
	component:   "openEHR ADL Tools"
	description: "Editor context for a C_ATTRIBUTE_TUPLE"
	keywords:    "archetype, editing"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2012- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class C_ATTRIBUTE_TUPLE_ED_CONTEXT

inherit
	ANY_ED_CONTEXT
		redefine
			arch_node, display_in_grid
		end

create
	make

feature -- Access

	arch_node: detachable C_ATTRIBUTE_TUPLE

	parent: detachable ARCHETYPE_CONSTRAINT_ED_CONTEXT
			-- parent node in tree

feature -- Display

	prepare_display_in_grid (a_gui_grid: EVX_GRID)
		local
			bmm_prop_key: STRING
		do
			evx_grid := a_gui_grid

			-- create a new row
			check attached parent.ev_grid_row as parent_gr then
				evx_grid.add_sub_row (parent_gr, Current)
			end
			check attached evx_grid.last_row as lr then
				ev_grid_row := lr
			end

			if attached arch_node as c_attr_tuple then
				create bmm_prop_key.make_empty
				across c_attr_tuple.members as c_attrs_csr loop
					bmm_prop_key.append (c_attrs_csr.item.rm_attribute_name)
					if not c_attrs_csr.is_last then
						bmm_prop_key.append (", ")
					end
				end

				-- rm_name col
				evx_grid.set_last_row_label_col (Definition_grid_col_rm_name, bmm_prop_key, Void, c_attribute_colour,
					get_icon_pixmap ("rm/generic/c_attribute"))

				-- set meaning column empty
				evx_grid.set_last_row_label_col (Definition_grid_col_meaning, "", Void, Void, Void)

				-- update tooltip in RM column
				evx_grid.update_last_row_label_col_multi_line (Definition_grid_col_rm_name, Void, node_tooltip_str, Void, Void)

				-- set constraint column
				evx_grid.set_last_row_label_col_multi_line (Definition_grid_col_constraint, constraint_str, Void, c_constraint_colour, Void)
			end
		end

	display_in_grid (ui_settings: GUI_DEFINITION_SETTINGS)
		do
			precursor (ui_settings)
			-- update tooltip in RM column
			evx_grid.update_last_row_label_col_multi_line (Definition_grid_col_rm_name, Void, node_tooltip_str, Void, Void)

			-- set constraint column
			evx_grid.set_last_row_label_col_multi_line (Definition_grid_col_constraint, constraint_str, Void, c_constraint_colour, Void)
		end

feature -- Modification

	set_parent (an_attr_ed_node: like parent)
		do
			parent := an_attr_ed_node
		end

feature {NONE} -- Implementation

	node_tooltip_str: STRING
			-- generate a tooltip for this node
		local
			p: STRING
		do
			create Result.make_empty

			if attached arch_node as c_attr_tuple then
				across c_attr_tuple.members as c_attrs_csr loop
					p := c_attrs_csr.item.path

					-- append the path, optionally with inheritance status
					Result.append (ed_context.flat_ontology.physical_to_logical_path (p, display_settings.language, True))
					Result.append ("%N")
					if display_settings.show_rm_inheritance and attached specialisation_status_names.item (node_specialisation_status) as nss then
						Result.append (get_text (ec_inheritance_status_text) +  nss + "%N")
					end

					-- append any annotations
					if ed_context.archetype.has_annotation_at_path (display_settings.language, p) then
						Result.append (get_text (ec_annotations_text) + ":%N")
						Result.append ("%T")
						Result.append (ed_context.archetype.annotations.annotations_at_path (display_settings.language, p).as_string)
					end

					if not c_attrs_csr.is_last then
						Result.append ("%N")
					end
				end
			end
		end

	c_pixmap: EV_PIXMAP
		do
			Result := get_icon_pixmap ("am" + resource_path_separator + "added" + resource_path_separator + "c_attribute")
		end

	node_specialisation_status: INTEGER
		do
			if attached arch_node as c_attr_tuple then
				Result := c_attr_tuple.members.first.specialisation_status
			end
		end

	constraint_str: STRING
		local
			s: STRING
		do
			create Result.make_empty
			if attached arch_node as c_attr_tuple then
				across c_attr_tuple.children as c_obj_tuples_csr loop
					across c_obj_tuples_csr.item.members as c_prim_objs_csr loop
						if attached {C_TERMINOLOGY_CODE} c_prim_objs_csr.item as ctc then
							s := c_terminology_code_str (ctc)
						else
							s := c_prim_objs_csr.item.as_string
						end
						Result.append (s)
						if not c_prim_objs_csr.is_last then
							Result.append (", ")
						end
					end
					if not c_obj_tuples_csr.is_last then
						Result.append ("%N")
					end
				end
			end
		end

end


