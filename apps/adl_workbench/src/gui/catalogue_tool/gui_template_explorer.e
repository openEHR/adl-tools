note
	component:   "openEHR Archetype Project"
	description: "Composite control for viewing templates"
	keywords:    "ADL, archetype, template, UI"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2010-2012 Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "See notice at bottom of class"

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

			ev_root_container.set_data (Current)
		end

feature -- Commands

	update_tree_node_for_archetype (ara: attached ARCH_CAT_ARCHETYPE)
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

	rm_schema: BMM_SCHEMA
			-- schema of root template

	do_select_archetype
		do
			precursor
			tool_agents.archetype_explorer_select_in_tree_agent.call ([selected_archetype_node.global_artefact_identifier])
		end

	do_populate
		do
 			source.do_all_archetypes (agent ev_tree_node_populate)
			gui_semantic_grid.resize_columns_to_content
		end

   	ev_tree_node_populate (ara: attached ARCH_CAT_ARCHETYPE)
   			-- Add a node representing `an_item' to `gui_file_tree'.
   		local
			og_iterator: OG_ITERATOR
		do
			rm_schema := ara.rm_schema

			-- make sure it is a template of some kind
			if artefact_types.has (ara.artefact_type) then
				-- if it is compiled & valid, display its flat filler structure
				if semantic_grid_row_map.has (ara.qualified_name) then
					if ara.is_valid then
						ev_tree_item_stack.extend (semantic_grid_row_map.item (ara.qualified_name))
						gui_semantic_grid.remove_sub_rows (ev_tree_item_stack.item)
						if attached {EV_GRID_LABEL_ITEM} ev_tree_item_stack.item.item (1) as gli then
							gli.set_pixmap (catalogue_node_pixmap (ara))
						end

						-- add slot filler structure below this row
						create og_iterator.make (ara.flat_archetype.definition.representation)
						og_iterator.do_all (agent ev_node_build_enter_action, agent ev_node_build_exit_action)
						ev_tree_item_stack.remove
					else
						if attached {EV_GRID_LABEL_ITEM} semantic_grid_row_map.item (ara.qualified_name).item (1) as gli then
							gli.set_pixmap (catalogue_node_pixmap (ara))
						end
					end
				else -- otherwise just display the template root
					attach_node (ara.id.rm_entity + "." + ara.name, catalogue_node_pixmap (ara), ara)
					semantic_grid_row_map.force (ev_tree_item_stack.item, ara.qualified_name)
					ev_tree_item_stack.remove
				end
			end
		end

	ev_node_build_enter_action (an_og_node: attached OG_ITEM; indent_level: INTEGER)
		local
			ara: ARCH_CAT_ARCHETYPE
			ca_path: STRING
			csr: ARCHETYPE_CONSTRAINT
		do
			if attached {ARCHETYPE_CONSTRAINT} an_og_node.content_item as ca then
				if attached {C_ATTRIBUTE} ca as c_attr then
					-- first see if it is an atribute containing any ext ref nodes
					from c_attr.children.start until c_attr.children.off or attached {C_ARCHETYPE_ROOT} c_attr.children.item loop
						c_attr.children.forth
					end

					-- now compute the path from this attr node back to the nearest C_ARCHETYPE_ROOT
					from csr := c_attr until csr.parent = Void loop
						if attached {C_ARCHETYPE_ROOT} csr as car then
							ca_path := c_attr.path_to_node(car)
						end
						csr := csr.parent
					end
					if not attached ca_path then
						ca_path := c_attr.path
					end
					if not c_attr.children.off then
						gui_semantic_grid.add_sub_row (ev_tree_item_stack.item, c_attr)
						ev_tree_item_stack.extend (gui_semantic_grid.last_row)
						gui_semantic_grid.set_last_row_label_col (1, ca_path, Void, Void, get_icon_pixmap ("archetype/" +
							rm_schema.property_definition (c_attr.parent.rm_type_name, c_attr.rm_attribute_name).multiplicity_key_string))
					end
				elseif attached {C_ARCHETYPE_ROOT} ca as car and attached source as dir then
					ara := dir.archetype_index.item (car.archetype_id)
					attach_node (ara.id.rm_entity + "." + ara.name, catalogue_node_pixmap (ara), ara)
				end
			end
		end

	ev_node_build_exit_action (an_og_node: attached OG_ITEM; indent_level: INTEGER)
		do
			if attached {C_ATTRIBUTE} an_og_node.content_item as c_attr then
				from c_attr.children.start until c_attr.children.off or attached {C_ARCHETYPE_ROOT} c_attr.children.item as car loop
					c_attr.children.forth
				end
				if not c_attr.children.off then
					ev_tree_item_stack.remove
				end
			elseif attached {C_ARCHETYPE_ROOT} an_og_node.content_item as car then
				ev_tree_item_stack.remove
			end
		end

	attach_node (str: STRING; pixmap: EV_PIXMAP; aca: ARCH_CAT_ARCHETYPE)
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
			ev_tree_item_stack.extend (gui_semantic_grid.last_row)

			-- tooltip		
			create tooltip.make_empty
			tooltip.append (aca.full_path)
			if aca.has_legacy_flat_file and aca.differential_generated then
				tooltip.append ("%N" + get_text (ec_archetype_tree_node_tooltip))
			end

			gui_semantic_grid.set_last_row_label_col (1, str, tooltip, Void, pixmap)

			semantic_grid_row_map.force (gui_semantic_grid.last_row, aca.qualified_name)
		end

   	semantic_grid_update_row (ev_grid_row: EV_GRID_ROW; update_flag: BOOLEAN)
   			-- Set the icon appropriate to the item attached to `node'.
		do
 			if attached {ARCH_CAT_CLASS_NODE} ev_grid_row.data as acc and attached {EV_GRID_LABEL_ITEM} ev_grid_row.item (1) as gli then
				gli.set_pixmap (catalogue_node_pixmap (acc))
			end
		end

end


--|
--| ***** BEGIN LICENSE BLOCK *****
--| Version: MPL 1.1/GPL 2.0/LGPL 2.1
--|
--| The contents of this file are subject to the Mozilla Public License Version
--| 1.1 (the 'License'); you may not use this file except in compliance with
--| the License. You may obtain a copy of the License at
--| http://www.mozilla.org/MPL/
--|
--| Software distributed under the License is distributed on an 'AS IS' basis,
--| WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License
--| for the specific language governing rights and limitations under the
--| License.
--|
--| The Original Code is adl_node_control.e.
--|
--| The Initial Developer of the Original Code is Thomas Beale.
--| Portions created by the Initial Developer are Copyright (C) 2003-2004
--| the Initial Developer. All Rights Reserved.
--|
--| Contributor(s):
--|
--| Alternatively, the contents of this file may be used under the terms of
--| either the GNU General Public License Version 2 or later (the 'GPL'), or
--| the GNU Lesser General Public License Version 2.1 or later (the 'LGPL'),
--| in which case the provisions of the GPL or the LGPL are applicable instead
--| of those above. If you wish to allow use of your version of this file only
--| under the terms of either the GPL or the LGPL, and not to allow others to
--| use your version of this file under the terms of the MPL, indicate your
--| decision by deleting the provisions above and replace them with the notice
--| and other provisions required by the GPL or the LGPL. If you do not delete
--| the provisions above, a recipient may use your version of this file under
--| the terms of any one of the MPL, the GPL or the LGPL.
--|
--| ***** END LICENSE BLOCK *****
--|
