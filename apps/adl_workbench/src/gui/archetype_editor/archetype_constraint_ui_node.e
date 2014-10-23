note
	component:   "openEHR ADL Tools"
	description: "UI visualisation node corresponding to ARCHETYPE_CONSTRAINT"
	keywords:    "archetype, editing"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2012- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

deferred class ARCHETYPE_CONSTRAINT_UI_NODE

inherit
	ANY_UI_NODE
		redefine
			arch_node, is_prepared
		end

	SHARED_ARCHETYPE_LIBRARIES
		export
			{NONE} all
		end

feature -- Initialisation

	make_rm (an_rm_element: like rm_element; a_ui_graph_state: ARCHETYPE_UI_GRAPH_STATE)
		do
			ui_graph_state := a_ui_graph_state
			rm_element := an_rm_element
			create display_settings.make_default
			create internal_ref_for_rm_type.make (0)
		ensure
			Is_rm: is_rm
			Not_in_grid: not is_prepared
		end

feature -- Access

	rm_element: BMM_MODEL_ELEMENT

	arch_node: detachable ARCHETYPE_CONSTRAINT
			-- archetype node being edited

	arch_node_in_ancestor: detachable ARCHETYPE_CONSTRAINT
			-- corresponding archetype node in specialisation parent, if applicable

	parent: detachable ARCHETYPE_CONSTRAINT_UI_NODE
			-- parent node in tree

	path: STRING
			-- path of this node with respect to top of archetype
		deferred
		end

	rm_depth: INTEGER
			-- depth of this node with respect to its top-most RM (non-constrained) node
			-- note that this will always be intermediate in the structure, since it has
			-- to be the child of some archetyped node
		require
			is_rm
		deferred
		end

feature -- Status Report

	is_root: BOOLEAN
			-- True if this node is the top of tree structure
		do
			Result := not attached parent
		end

	is_specialised: BOOLEAN
			-- True if this node exists in specialised child archetype
		do
			Result := ui_graph_state.archetype.is_specialised
		end

	is_prepared: BOOLEAN
			-- True if grid row connections are valid
		do
			Result := attached evx_grid and attached ev_grid_row as gr and then
				(attached parent as p implies (gr.parent_row = p.ev_grid_row))
		end

feature -- Display

	prepare_display_in_grid (a_gui_grid: EVX_GRID)
		do
			evx_grid := a_gui_grid

			-- create a new row
			if attached arch_node as a_n and then a_n.is_root then
				evx_grid.add_row (Current)
			else
				check attached parent.ev_grid_row as parent_gr then
					evx_grid.add_sub_row (parent_gr, Current)
				end
			end
			check attached evx_grid.last_row as lr then
				ev_grid_row := lr
			end
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
			bindings: HASH_TABLE [URI, STRING]
		do
			if not is_rm then
				p := arch_node.path
				Result := ui_graph_state.flat_archetype.annotated_path (p, display_settings.language, True)
				if display_settings.show_rm_inheritance and attached specialisation_status_names.item (specialisation_status) as nss then
					Result.append ("%N%N" + get_text (ec_inheritance_status_text) +  nss)
				end

				-- node-based bindings
				if attached {C_OBJECT} arch_node as co and then ui_graph_state.flat_terminology.has_any_term_binding (co.node_id) then
					Result.append ("%N%N" + get_text (ec_node_term_bindings_tooltip_text) + "%N")
					bindings := ui_graph_state.flat_terminology.term_bindings_for_key (co.node_id)
					across bindings as bindings_csr loop
						Result.append ("  " + bindings_csr.key + ": " + bindings_csr.item.as_string + "%N")
					end
				end

				-- path-based bindings
				if ui_graph_state.flat_terminology.has_any_term_binding (p) then
					Result.append ("%N%N" + get_text (ec_path_term_bindings_tooltip_text) + "%N")
					bindings := ui_graph_state.flat_terminology.term_bindings_for_key (p)
					across bindings as bindings_csr loop
						Result.append ("  " + bindings_csr.key + ": " + bindings_csr.item.as_string + "%N")
					end
				end

				if attached arch_node as a_n and then ui_graph_state.archetype.has_annotation_at_path (display_settings.language, a_n.path) then
					Result.append ("%N%N" + get_text (ec_annotations_text) + ":%N")
					Result.append (ui_graph_state.archetype.annotations.annotations_at_path (display_settings.language, a_n.path).as_string)
				end
			else
				Result := path
			end
		end

	specialisation_status: INTEGER
			-- specialisation status of archetype node in this context object
		do
			if attached arch_node as a_n then
				Result := a_n.specialisation_status
			end
		end

	rolled_up_specialisation_status: INTEGER
			-- rolled up specialisation status of archetype node in this context object
		do
			check attached arch_node as a_n then
				Result := a_n.rolled_up_specialisation_status
			end
		end

	aom_types_for_rm_type (an_rm_type: BMM_CLASSIFIER): ARRAYED_SET [STRING]
			-- list of possible C_OBJECT concrete descendants that can be used on a node of type `an_rm_type'
		local
			rm_class_name: STRING
		do
			rm_class_name := an_rm_type.base_class.name

			-- add AOM constraint types for RM primitive types
			-- FIXME: in Eiffel 7.3 replace with reflection generated set of C_PRIMITIVE_OBJECT descendant type names
			if an_rm_type.base_class.is_primitive_type then
				Result := c_primitive_subtypes

			-- deal with mapped types in AOM profile
--			elseif  then

			else
				create Result.make (0)
				Result.compare_objects
				Result.extend (bare_type_name(({C_COMPLEX_OBJECT}).name))
				Result.extend (bare_type_name(({ARCHETYPE_SLOT}).name))
				Result.extend (bare_type_name(({C_ARCHETYPE_ROOT}).name))

				-- figure out whether C_COMPLEX_OBJECT_PROXYs would be valid for this RM type (i.e. are there any other
				-- nodes of this type in the archetype?); if so add C_COMPLEX_OBJECT_PROXY
				if not internal_ref_for_rm_type.has (rm_class_name) then
					if not ui_graph_state.archetype.rm_type_paths_annotated (display_settings.language, an_rm_type.base_class.name).is_empty then
						internal_ref_for_rm_type.put (True, an_rm_type.base_class.name)
					else
						internal_ref_for_rm_type.put (False, an_rm_type.base_class.name)
					end
				end
				if internal_ref_for_rm_type.item (rm_class_name) then
					Result.extend (bare_type_name(({C_COMPLEX_OBJECT_PROXY}).name))
				end
			end
		end

	internal_ref_for_rm_type: HASH_TABLE [BOOLEAN, STRING]

invariant
	Parent_link_valid: attached arch_node as a_n implies (attached parent as p implies (attached p.arch_node as parent_a_n and then a_n.parent = parent_a_n))

end


