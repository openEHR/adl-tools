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
		do
			evx_grid := a_gui_grid

			-- create a new row
			check attached parent.ev_grid_row as parent_gr then
				evx_grid.add_sub_row (parent_gr, Current)
			end
			check attached evx_grid.last_row as lr then
				ev_grid_row := lr
			end

			-- rm_name col
			evx_grid.set_last_row_label_col_multi_line (Definition_grid_col_rm_name, rm_string, node_tooltip_str, c_attribute_colour,
				get_icon_pixmap ("rm/generic/c_attribute"))

			-- set meaning column empty
			evx_grid.set_last_row_label_col (Definition_grid_col_meaning, "", Void, Void, Void)

			-- update tooltip in RM column
		--	evx_grid.update_last_row_label_col_multi_line (Definition_grid_col_rm_name, Void, node_tooltip_str, Void, Void)

			-- set constraint column
			evx_grid.set_last_row_label_col_multi_line (Definition_grid_col_constraint, constraint_str, Void, c_constraint_colour, Void)
		end

	display_in_grid (ui_settings: GUI_DEFINITION_SETTINGS)
		do
			precursor (ui_settings)

			-- RM name col - if in technical mode, show primitive data type
			evx_grid.update_last_row_label_col_multi_line (Definition_grid_col_rm_name, rm_string, node_tooltip_str, Void, Void)

			-- update tooltip in RM column
		--	evx_grid.update_last_row_label_col_multi_line (Definition_grid_col_rm_name, Void, node_tooltip_str, Void, Void)

			-- set constraint column
			evx_grid.update_last_row_label_col_multi_line (Definition_grid_col_constraint, constraint_str, Void, c_constraint_colour, Void)
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
					Result.append (ed_context.flat_terminology.physical_to_logical_path (p, display_settings.language, True))
					Result.append ("%N")
					if display_settings.show_rm_inheritance and attached specialisation_status_names.item (specialisation_status) as nss then
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

	specialisation_status: INTEGER
		do
			if attached arch_node as c_attr_tuple then
				Result := c_attr_tuple.members.first.specialisation_status
			end
		end

	rm_string: STRING
			-- generate a set of attribute names in two possible forms:
			-- If not technical_mode:
			--	attr1, attr2, attr3
			-- If technical_mode:
			--	attr1: TYPE1
			--	attr2: TYPE2
			--	attr3: TYPE3
		local
			ca_rm_type: STRING
		do
			create Result.make_empty
			if attached arch_node as c_attr_tuple then
				across c_attr_tuple.members as c_attrs_csr loop
					check attached c_attrs_csr.item.children.first as cpo then
						ca_rm_type := cpo.rm_type_name
					end

					-- if in technical mode, show primitive data type
					if display_settings.show_technical_view then
						Result.append (c_attrs_csr.item.rm_attribute_name + ": " + ca_rm_type)
					else
						Result.append (c_attrs_csr.item.rm_attribute_name)
					end

					if not c_attrs_csr.is_last then
						Result.append (", ")
						if display_settings.show_technical_view then
							Result.append ("%N")
						end
					end
				end
			end
		end

	constraint_str: STRING
		local
			tuple_count, tuple_idx: INTEGER
			att_cpo: C_PRIMITIVE_OBJECT
		do
			create Result.make_empty
			if attached arch_node as c_attr_tuple then
				tuple_count := c_attr_tuple.tuple_count
				from tuple_idx := 1 until tuple_idx > tuple_count loop
					across c_attr_tuple.members as ca_csr loop
						check attached {C_PRIMITIVE_OBJECT} ca_csr.item.children.first as cpo then
							att_cpo := cpo
						end
						if attached {C_TERMINOLOGY_CODE} att_cpo as ctc then
							Result.append (c_terminology_code_str (ctc.i_th_constraint (tuple_idx)))
						else
							Result.append (att_cpo.i_th_constraint (tuple_idx).out)
						end
						if not ca_csr.is_last then
							Result.append (", ")
						end
					end
					if tuple_idx < tuple_count then
						Result.append ("%N")
					end
					tuple_idx := tuple_idx + 1
				end
			end
		end

end


