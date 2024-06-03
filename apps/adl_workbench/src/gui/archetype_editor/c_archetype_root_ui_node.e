note
	component:   "openEHR ADL Tools"
	description: "UI visualisation node for a C_ARCHETYPE_ROOT"
	keywords:    "archetype, editing"
	author:      "Thomas Beale <thomas.beale@openehr.org>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2012- The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class C_ARCHETYPE_ROOT_UI_NODE

inherit
	C_COMPLEX_OBJECT_UI_NODE
		redefine
			arch_node, rm_properties, display_constraint, c_pixmap, build_context_menu,
			attach_other_ui_node_agents, node_id_text, loinc_code
		end

create
	make

feature -- Access

	arch_node: detachable C_ARCHETYPE_ROOT
			-- archetype node being edited

	rm_properties: STRING_TABLE [BMM_PROPERTY]
			-- don't produce any RM properties, since node is another archetype
		do
			if attached {OPERATIONAL_TEMPLATE} ui_graph_state.archetype and not c_attributes.is_empty then
				Result := rm_type.flat_properties
			else
				create Result.make_caseless (0)
			end
		end

feature {NONE} -- Implementation

	c_pixmap: EV_PIXMAP
			-- find a pixmap for an ARCHETYPE_SLOT node if using RM pixmaps
		local
			base_pixmap_name, ref_pixmap_name: STRING
		do
			if not display_settings.show_technical_view and attached arch_node then
				base_pixmap_name := Icon_rm_dir + resource_path_separator + ui_graph_state.ref_model.rm_publisher.as_lower + resource_path_separator + arch_node.rm_type_name
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

	node_id_text: STRING
			-- For C_ARCHETYPE_ROOT in a source template,
			--     archetype_ref carries the filler archetype ref
			-- For C_ARCHETYPE_ROOT in an OPT,
			-- 	   archetype_ref carries the resolved filler archetype id
		do
			create Result.make_empty
			if attached arch_node then

				Result := owning_archetype_flat_terminology.term_definition (display_settings.language, arch_node.node_id).text.twin

				if display_settings.show_codes then
					Result := annotated_code (arch_node.node_id, Result, " ")
				end

				if display_settings.show_technical_view then
					Result.append (" [" + arch_node.archetype_ref + "]")
				end
			end
		end

	display_constraint
		do
			if attached arch_node as car then
				if attached {OPERATIONAL_TEMPLATE} ui_graph_state.archetype then
					evx_grid.set_last_row_label_col (Definition_grid_col_constraint, car.archetype_ref, Void, Void, c_object_colour, Void)
				else
					evx_grid.set_last_row_label_col (Definition_grid_col_constraint, car.archetype_ref, Void, Void, c_constraint_colour, Void)
				end
			end
		end

	loinc_code: STRING
		do
			Create Result.make(0)
			-- First see if there is a LOINC code on the original node in the parent archetype; if there is,
			-- it will be the more specific one;
			if owning_archetype_flat_terminology.has_term_binding (Loinc_terminology_id, arch_node.node_id) then
				Result := owning_archetype_flat_terminology.term_binding (Loinc_terminology_id, arch_node.node_id).as_string

			-- otherwise we look for the LOINC code for the defining concept & root node of the referenced archetype
			-- In this case, the id-code is the id1, id1.1 etc code from the included archetype
			else
				Result := ui_graph_state.flat_terminology.term_binding_for_concept_code (Loinc_terminology_id)
			end
		end

	build_context_menu
		local
			an_mi: EV_MENU_ITEM
		do
			precursor
			if attached arch_node as car then
				-- menu option to display the archetype for this reference in a new tab
				if attached current_library.archetype_matching_ref (car.archetype_ref) as ext_ref_node then
					create an_mi.make_with_text_and_action (get_text ({ADL_MESSAGES_IDS}.ec_open_target_in_new_tab),
						agent gui_agents.call_select_archetype_in_new_tool_agent (ext_ref_node))
					an_mi.set_pixmap (get_icon_pixmap ("archetype/" + ext_ref_node.group_name))
					context_menu.extend (an_mi)
				end
			end
		end

	attach_other_ui_node_agents
		do
			if c_attributes.is_empty and attached ev_grid_row as gr and attached {OPERATIONAL_TEMPLATE} ui_graph_state.archetype as opt then
				gr.expand_actions.force_extend (agent lazy_build_ui_graph)
				gr.ensure_expandable
			end
		end

	lazy_build_ui_graph
			-- build some more UI graph from the current node, out to the next layer of C_ARCHEYTYPE_ROOT UI nodes
		local
			false_root_ui_node: C_COMPLEX_OBJECT_UI_NODE
			og_iterator: OG_CONTENT_ITERATOR
			c_ui_graph_builder: ARCHETYPE_UI_GRAPH_BUILDER
		do
			if c_attributes.is_empty and then attached arch_node as car and attached evx_grid as att_evx_grid then
				-- build more UI graph down to and including the next reachable C_ARCHETYPE_ROOTs
				create c_ui_graph_builder.make (ui_graph_state)
				create og_iterator.make (car.representation, c_ui_graph_builder)
				og_iterator.do_until_surface_plus_one (
					agent (an_og_node: OG_NODE): BOOLEAN
						do
							Result := not attached {C_ARCHETYPE_ROOT} an_og_node.content_item
						end,
					True
				)

				-- graft the children of the build graph root node to this node
				check attached c_ui_graph_builder.root_node as rn then
					false_root_ui_node := rn
				end
				across false_root_ui_node.c_attributes as c_attr_ui_node_csr loop
					put_c_attribute (c_attr_ui_node_csr.item)
				end

				-- now do the prepare and display
				prepare_children_display_in_grid (att_evx_grid)
				display_in_grid (display_settings)
			end
		end

	owning_archetype_flat_terminology: ARCHETYPE_TERMINOLOGY
			-- For C_ARCHETYPE_ROOT in a source template,
			--     use the directly attached terminology, which is from the owner archetype
			-- For C_ARCHETYPE_ROOT in an OPT,
			-- 	   use the terminology from the owning object, which is from the owner archetype
		do
			if attached {OPERATIONAL_TEMPLATE} ui_graph_state.archetype then
				check attached parent as ca_ui and then attached ca_ui.parent as parent_co_ui then
					Result := parent_co_ui.ui_graph_state.flat_terminology
				end
			else
				Result := ui_graph_state.flat_terminology
			end
		end

end


