note
	component:   "openEHR ADL Tools"
	description: "Root of UI visualisation graph for an archetype."
	keywords:    "archetype, editing"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2012- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class ARCHETYPE_UI_GRAPH_ROOT

create
	make, make_editable

feature -- Initialisation

	make (aca: ARCH_LIB_ARCHETYPE_EDITABLE; an_rm_schema: BMM_SCHEMA; differential_view_flag: BOOLEAN)
		do
			source := aca
			create ui_graph_state.make (source, an_rm_schema, differential_view_flag)
			build_ui_graph
		end

	make_editable (aca: ARCH_LIB_ARCHETYPE_EDITABLE; an_rm_schema: BMM_SCHEMA; an_undo_redo_chain: UNDO_REDO_CHAIN)
		do
			source := aca
			create ui_graph_state.make_editable (source, an_rm_schema, an_undo_redo_chain)
			build_ui_graph
		end

feature -- Access

	source: ARCH_LIB_ARCHETYPE_EDITABLE

	ui_graph_state: ARCHETYPE_UI_GRAPH_STATE

	definition_ui_graph: C_COMPLEX_OBJECT_UI_NODE
			-- definition editing context

	assertion_ui_graphs: ARRAYED_LIST [ASSERTION_UI_NODE]
			-- assertion editing contexts

feature -- Modification

	prepare_display_in_grid (an_evx_grid: EVX_GRID)
		require
			Grid_empty: an_evx_grid.row_count = 0
		do
			definition_ui_graph.prepare_display_in_grid (an_evx_grid)
		end

feature {C_ARCHETYPE_ROOT_UI_NODE} -- Implementation

	build_ui_graph
		do
			definition_ui_graph := c_object_ui_graph (ui_graph_state.archetype.definition.representation)
			create assertion_ui_graphs.make (0)
			build_assertion_ui_graphs
		end

	c_object_ui_graph (og_root: OG_OBJECT_NODE): C_COMPLEX_OBJECT_UI_NODE
			-- build a C_COMPLEX_OBJECT_UI_NODE from any part of an archetype definition tree
		local
			a_c_iterator: OG_CONTENT_ITERATOR
			c_ui_graph_builder: ARCHETYPE_UI_GRAPH_BUILDER
		do
			create c_ui_graph_builder.make (ui_graph_state)
			create a_c_iterator.make (og_root, c_ui_graph_builder)
			a_c_iterator.do_until_surface_plus_one (
				agent (an_og_node: OG_NODE): BOOLEAN
					do
						Result := not attached {C_ARCHETYPE_ROOT} an_og_node.content_item
					end,
				False
			)
			check attached c_ui_graph_builder.root_node as rn then
				Result := rn
			end
		end

	c_object_ui_graph_test (an_og_node: OG_NODE): BOOLEAN
		do
			Result := not attached {C_ARCHETYPE_ROOT} an_og_node.content_item
		end

	build_assertion_ui_graphs
			-- build `assertion_ui_graphs'
		local
			assn_iterator: EXPR_VISITOR_ITERATOR
			assn_ui_graph_builder: ASSERTION_UI_GRAPH_BUILDER
		do
			if ui_graph_state.archetype.has_rules then
				create assn_ui_graph_builder.make (ui_graph_state)
				across ui_graph_state.archetype.rules as inv_csr loop
					create assn_iterator.make (inv_csr.item, assn_ui_graph_builder)
					assn_iterator.do_all
					check attached assn_ui_graph_builder.root_node as rn then
						assertion_ui_graphs.extend (rn)
					end
				end
			end
		end

end


