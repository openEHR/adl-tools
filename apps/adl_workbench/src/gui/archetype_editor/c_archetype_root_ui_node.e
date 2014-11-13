note
	component:   "openEHR ADL Tools"
	description: "UI visualisation node for a C_ARCHETYPE_ROOT"
	keywords:    "archetype, editing"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2012- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class C_ARCHETYPE_ROOT_UI_NODE

inherit
	C_COMPLEX_OBJECT_UI_NODE
		redefine
			arch_node, rm_properties, display_constraint, c_pixmap, build_context_menu, attach_other_ui_node_agents
		end

create
	make

feature -- Access

	arch_node: detachable C_ARCHETYPE_ROOT
			-- archetype node being edited

	rm_properties: HASH_TABLE [BMM_PROPERTY [BMM_TYPE], STRING]
			-- don't produce any RM properties, since node is another archetype
		do
			if ui_graph_state.in_differential_view and not ui_graph_state.editing_enabled then
				create Result.make (0)
			else
				Result := rm_type.base_class.flat_properties
			end
		end

feature {NONE} -- Implementation

	c_pixmap: EV_PIXMAP
			-- find a pixmap for an ARCHETYPE_SLOT node if using RM pixmaps
		local
			base_pixmap_name, ref_pixmap_name: STRING
		do
			if use_rm_pixmaps and attached arch_node as a_n then
				base_pixmap_name := rm_icon_dir + resource_path_separator + ui_graph_state.rm_schema.rm_publisher.as_lower + resource_path_separator + a_n.rm_type_name
				create ref_pixmap_name.make_empty
				ref_pixmap_name.append (base_pixmap_name)
				ref_pixmap_name.append ("_reference")
				if has_icon_pixmap (ref_pixmap_name) then
					Result := get_icon_pixmap (ref_pixmap_name)
				else
					Result := get_icon_pixmap (base_pixmap_name)
				end
			else
				Result := precursor
			end
		end

	display_constraint
		do
			if attached arch_node as car and not ui_graph_state.archetype.is_template then
				evx_grid.set_last_row_label_col (Definition_grid_col_constraint, car.archetype_ref, Void, Void, c_constraint_colour, Void)
			end
		end

	build_context_menu
		local
			an_mi: EV_MENU_ITEM
		do
			precursor
			if attached arch_node as car then
				if attached {ARCH_LIB_ARCHETYPE_EDITABLE} current_library.archetype_matching_ref (car.archetype_ref) as ext_ref_node then
					create an_mi.make_with_text_and_action (get_text (ec_open_target_in_new_tab), agent (gui_agents.select_archetype_in_new_tool_agent).call ([ext_ref_node]))
					an_mi.set_pixmap (get_icon_pixmap ("archetype/" + ext_ref_node.group_name))
					context_menu.extend (an_mi)
				end
			end
		end

	attach_other_ui_node_agents
		do
			if c_attributes.is_empty and then ui_graph_state.archetype.is_template and attached ev_grid_row as gr then
				gr.expand_actions.force_extend (agent build_ui_graph)
				gr.ensure_expandable
			end
		end

	build_ui_graph
		local
			false_root_ui_node: C_COMPLEX_OBJECT_UI_NODE
			a_c_iterator: OG_CONTENT_ITERATOR
			c_ui_graph_builder: ARCHETYPE_UI_GRAPH_BUILDER
		do
			if c_attributes.is_empty and then attached arch_node as car and attached evx_grid as att_evx_grid then
				create c_ui_graph_builder.make (ui_graph_state)
				create a_c_iterator.make (car.representation, c_ui_graph_builder)
				a_c_iterator.do_until_surface_plus_one (
					agent (an_og_node: OG_NODE): BOOLEAN
						do
							Result := not attached {C_ARCHETYPE_ROOT} an_og_node.content_item
						end,
					True
				)

				check attached c_ui_graph_builder.root_node as rn then
					false_root_ui_node := rn
				end

				across false_root_ui_node.c_attributes as c_attr_ui_node_csr loop
					put_c_attribute (c_attr_ui_node_csr.item)
				end
				prepare_children_display_in_grid (att_evx_grid)
				display_in_grid (display_settings)
			end
		end

end


