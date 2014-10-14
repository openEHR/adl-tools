note
	component:   "openEHR ADL Tools"
	description: "Composite control for viewing templates"
	keywords:    "ADL, archetype, template, UI"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2010-2012 Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class GUI_TEMPLATE_EXPLORER

inherit
	GUI_ARTEFACT_EXPLORER
		rename
			make as make_tree_control
		redefine
			do_select_archetype
		end

	STRING_UTILITIES
		export
			{NONE} all
		end

create
	make

feature {NONE} -- Initialisation

	make
		do
			make_tree_control
			artefact_types := <<{ARTEFACT_TYPE}.template>>

			clear

			ev_root_container.set_data (Current)
		end

feature -- Commands

	update_tree_node_for_archetype (ara: ARCH_LIB_ARCHETYPE)
			-- update Explorer tree node with changes in compilation status
		local
			an_id: STRING
		do
			an_id := ara.id.as_string
--			if gui_node_descriptor_map.has (an_id) then
				ev_tree_node_populate (ara)
--			elseif attached ara.old_id then
--				if gui_node_descriptor_map.has (ara.old_id.as_string) then
--					gui_node_descriptor_map.replace_key (ara.id.as_string, ara.old_id.as_string)
--					populate_template_nodes (gui_node_descriptor_map.item (ara.id.as_string))
--				end
--			end
		end

feature {NONE} -- Implementation

	rm_schema: detachable BMM_SCHEMA
			-- schema of root template
		note
			option: stable
		attribute
		end

	do_select_archetype
		do
			precursor
			tool_agents.archetype_explorer_select_in_tree_agent.call ([selected_archetype_node.global_artefact_identifier])
		end

	do_populate
		do
			ev_node_is_root_flag := False
 			source.do_all_archetypes (agent ev_tree_node_populate)
			gui_semantic_grid.resize_columns_to_content
		end

   	ev_tree_node_populate (ara: ARCH_LIB_ARCHETYPE)
   			-- Add a node representing `an_item' to `gui_file_tree'.
   		local
			og_iterator: OG_ITERATOR
			root_og_node: OG_OBJECT_NODE
		do
			rm_schema := ara.rm_schema

			-- make sure it is a template of some kind
			if artefact_types.has (ara.artefact_type.value) then
				-- if it is compiled & valid, display its flat filler structure
				if semantic_grid_row_map.has (ara.qualified_name) and then attached semantic_grid_row_map.item (ara.qualified_name) as gr then
					if ara.is_valid then
						-- get rid of any sub-structure due to previous compile attempt
						gui_semantic_grid.remove_sub_rows (gr)

						-- update pixmap to indicate compiled / failed status
						if attached {EV_GRID_LABEL_ITEM} gr.item (1) as gli then
							gli.set_pixmap (catalogue_node_pixmap (ara))
						end

						-- add slot filler / ext ref structure below this row
						ev_tree_item_stack.extend (gr)
						root_og_node := ara.flat_archetype.definition.representation
						create og_iterator.make (root_og_node)
						og_iterator.do_until_surface (agent ev_node_build_action, agent ev_node_test)
						ev_tree_item_stack.remove
					else
						if attached {EV_GRID_LABEL_ITEM} semantic_grid_row_map.item (ara.qualified_name).item (1) as gli then
							gli.set_pixmap (catalogue_node_pixmap (ara))
						end
					end
				else -- otherwise not yet compiled: just display the template root
					attach_node (ara.id.rm_class + "." + ara.semantic_id, catalogue_node_pixmap (ara), ara)
					semantic_grid_row_map.force (ev_tree_item_stack.item, ara.qualified_name)
					ev_tree_item_stack.remove
				end
			end
		end

	ev_node_build_action (an_og_node: OG_ITEM; indent_level: INTEGER)
		local
			ca_path: detachable STRING
			csr: detachable ARCHETYPE_CONSTRAINT
			ca_node_created: BOOLEAN
		do
			check attached source end
			if attached {C_ATTRIBUTE} an_og_node.content_item as c_attr then
				-- first see if it is an atribute containing as immediate children, any ext ref nodes;
				-- if there are none, we don't include it in the explorer map of the template
				across c_attr.children as c_attr_child_csr loop
					if attached {C_ARCHETYPE_ROOT} c_attr_child_csr.item as car then

						-- create a CA node just once
						if not ca_node_created then
							-- now compute the path from this attr node back to the nearest C_ARCHETYPE_ROOT
							from csr := c_attr until csr = Void loop
								if attached {C_ARCHETYPE_ROOT} csr as root_car then
									ca_path := c_attr.path_to_node (root_car)
								end
								csr := csr.parent
							end

							-- if we never got back to a C_ARCHETYPE_ROOT, just use the normal path right to the top
							if not attached ca_path then
								ca_path := c_attr.path
							end

							-- add a grid row representing this C_ATTRIBUTE, with its path
							gui_semantic_grid.add_sub_row (ev_tree_item_stack.item, c_attr)
							check attached gui_semantic_grid.last_row as lr then
								ev_tree_item_stack.extend (lr)
								gui_semantic_grid.set_last_row_label_col (1, ca_path, Void, Void, get_icon_pixmap ("archetype/" +
									rm_schema.property_definition (c_attr.parent.rm_type_name, c_attr.rm_attribute_name).multiplicity_key_string))
							end
							ca_node_created := True
						end

						-- now add a node for the C_ARCH_ROOT child
						if attached source.matching_archetype (car.archetype_ref) as ara then
							attach_node (ara.id.rm_class + "." + ara.semantic_id, catalogue_node_pixmap (ara), ara)

							-- add tree expand handler to this node
							gui_semantic_grid.last_row.expand_actions.force_extend (agent node_expand_handler (ev_tree_item_stack.item, car.representation, indent_level))

							ev_tree_item_stack.remove
						end
					end
				end
				if ca_node_created then
					ev_tree_item_stack.remove
				end
			end
			ev_node_is_root_flag := False
		end

	ev_node_test (og_item: OG_ITEM): BOOLEAN
			-- True for non archetype root nodes
		do
			Result := not attached {C_ARCHETYPE_ROOT} og_item.content_item or else ev_node_is_root_flag
		end

	ev_node_is_root_flag: BOOLEAN
			-- set true prior to each sub-tree traverse, to catch root node

	node_expand_handler (an_ev_row: EV_GRID_ROW; an_og_item: OG_ITEM; indent_level: INTEGER)
   		local
			og_iterator: OG_ITERATOR
		do
			ev_tree_item_stack.extend (an_ev_row)
			if attached {OG_OBJECT_NODE} an_og_item as an_og_node then
				ev_node_is_root_flag := True
				create og_iterator.make (an_og_node)
				og_iterator.do_until_surface (agent ev_node_build_action, agent ev_node_test)
			end
			ev_tree_item_stack.remove
		end

	attach_node (str: STRING; pixmap: EV_PIXMAP; aca: ARCH_LIB_ARCHETYPE)
			-- attach a archetype/template node into the tree
		local
			tooltip: STRING
		do
			-- add row to grid
			if ev_tree_item_stack.is_empty then
				gui_semantic_grid.add_row (aca)
			else
				gui_semantic_grid.add_sub_row (ev_tree_item_stack.item, aca)
			end
			check attached gui_semantic_grid.last_row as lr then
				ev_tree_item_stack.extend (lr)
				semantic_grid_row_map.force (lr, aca.qualified_name)
			end

			-- tooltip		
			create tooltip.make_empty
			tooltip.append (aca.source_file_path)
			if aca.file_mgr.has_legacy_flat_file and aca.file_mgr.is_source_generated then
				tooltip.append ("%N" + get_text (ec_archetype_tree_node_tooltip))
			end

			gui_semantic_grid.set_last_row_label_col (1, str, tooltip, Void, pixmap)
		end

   	semantic_grid_update_row (ev_grid_row: EV_GRID_ROW; update_flag: BOOLEAN)
   			-- Set the icon appropriate to the item attached to `node'.
		do
 			if attached {ARCH_LIB_CLASS_NODE} ev_grid_row.data as acc and attached {EV_GRID_LABEL_ITEM} ev_grid_row.item (1) as gli then
				gli.set_pixmap (catalogue_node_pixmap (acc))
			end
		end

end


