note
	component:   "openEHR ADL Tools"
	description: "UI visualisation node for a C_ATTRIBUTE_TUPLE"
	keywords:    "archetype, editing"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2012- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class C_ATTRIBUTE_TUPLE_UI_NODE

inherit
	ANY_UI_NODE
		redefine
			arch_node, display_in_grid
		end

create
	make

feature -- Access

	arch_node: detachable C_ATTRIBUTE_TUPLE

	parent: detachable ARCHETYPE_CONSTRAINT_UI_NODE
			-- parent node in tree

feature -- Display

	prepare_display_in_grid (a_gui_grid: EVX_GRID)
		do
			evx_grid := a_gui_grid

			-- create a new row
			check attached parent as p and then attached p.ev_grid_row as parent_gr then
				a_gui_grid.add_sub_row (parent_gr, Current)
			end
			check attached a_gui_grid.last_row as lr then
				ev_grid_row := lr
			end

			-- rm_name col
			a_gui_grid.set_last_row_label_col_multi_line (Definition_grid_col_rm_name, rm_string, node_tooltip_str, Void, c_attribute_colour,
				get_icon_pixmap ("rm/generic/c_attribute"))

			-- set meaning column empty
			a_gui_grid.set_last_row_label_col (Definition_grid_col_meaning, "", Void, Void, Void, Void)

			-- update tooltip in RM column
		--	a_gui_grid.update_last_row_label_col_multi_line (Definition_grid_col_rm_name, Void, node_tooltip_str, Void, Void)

			-- set constraint column
			a_gui_grid.set_last_row_label_col_multi_line (Definition_grid_col_constraint, constraint_str, Void, Void, c_constraint_colour, Void)
		end

	display_in_grid (ui_settings: GUI_DEFINITION_SETTINGS)
		do
			precursor (ui_settings)

			check attached evx_grid end

			-- RM name col - if in technical mode, show primitive data type
			evx_grid.update_last_row_label_col_multi_line (Definition_grid_col_rm_name, rm_string, node_tooltip_str, Void,  Void, Void)

			-- update tooltip in RM column
		--	evx_grid.update_last_row_label_col_multi_line (Definition_grid_col_rm_name, Void, node_tooltip_str, Void, Void)

			-- set constraint column
			evx_grid.update_last_row_label_col_multi_line (Definition_grid_col_constraint, constraint_str, Void, Void, c_constraint_colour, Void)
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
			p, annots: STRING
		do
			create Result.make_empty

			if attached arch_node as c_attr_tuple and attached {AUTHORED_ARCHETYPE} ui_graph_state.archetype as auth_arch then
				across c_attr_tuple.members as c_attrs_csr loop
					p := c_attrs_csr.item.path

					-- append the path, optionally with inheritance status
					Result.append (ui_graph_state.flattened_archetype.annotated_path (p, display_settings.language, True))
					Result.append ("%N")
					if display_settings.show_rm_inheritance then
						Result.append (get_text ({ADL_MESSAGES_IDS}.ec_inheritance_status_text) + specialisation_status_name (specialisation_status) + "%N")
					end

					-- append any annotations
					if auth_arch.has_annotations_at_path (display_settings.language, p) and then
						attached auth_arch.annotations_at_path (display_settings.language, p) as att_ann
					then
						Result.append (get_text ({ADL_MESSAGES_IDS}.ec_annotations_text) + ":%N")

						create annots.make_empty
						across att_ann as ann_vals_csr loop
							annots.append (ann_vals_csr.key + ": " + ann_vals_csr.item + "%N")
						end
						Result.append ("%T" + annots)
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
		do
			create Result.make_empty
			if attached arch_node as c_attr_tuple then
				across c_attr_tuple.tuples as c_prim_tuples_csr loop
					across c_prim_tuples_csr.item.members as cpo_csr loop
						if attached {C_TERMINOLOGY_CODE} cpo_csr.item as ctc then
							Result.append (c_terminology_code_str (ctc))
						else
							Result.append (cpo_csr.item.out)
						end
						if not cpo_csr.is_last then
							Result.append (", ")
						end
					end
					if not c_prim_tuples_csr.is_last then
						Result.append ("%N")
					end
				end
			end
		end

end


