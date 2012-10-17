note
	component:   "openEHR Archetype Project"
	description: "Editor context for any kind of C_OBJECT"
	keywords:    "archetype, editing"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2012 Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "See notice at bottom of class"
	void_safety: "initial"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class C_OBJECT_ED_CONTEXT

inherit
	ARCHETYPE_CONSTRAINT_ED_CONTEXT
		rename
			rm_element as rm_type
		redefine
			make, rm_type, arch_node, parent, prepare_display_in_grid, display_in_grid
		end

create
	make, make_rm

feature -- Definition

	c_object_colours: HASH_TABLE [EV_COLOR, INTEGER]
			-- foreground colours for RM type representing inheritance status
		once
			create Result.make(0)
			Result.put (archetype_rm_type_color, ss_added)
			Result.put (archetype_rm_type_redefined_color, ss_redefined)
			Result.put (archetype_rm_type_redefined_color, ss_id_redefined)
			Result.put (archetype_rm_type_inherited_color, ss_inherited)
		end

	openehr_dv_type_name_leader: STRING = "DV_"

feature -- Initialisation

	make (an_arch_node: like arch_node; an_archetype: ARCHETYPE; a_flat_ontology: FLAT_ARCHETYPE_ONTOLOGY; an_rm_schema: BMM_SCHEMA)
		do
			precursor (an_arch_node, an_archetype, a_flat_ontology, an_rm_schema)
			rm_type := rm_schema.class_definition (arch_node.rm_type_name)
		end

feature -- Access

	arch_node: C_OBJECT
			-- archetype node being edited

	rm_type: BMM_TYPE_SPECIFIER
			-- RM class of node being edited

	parent: C_ATTRIBUTE_ED_CONTEXT

	path: STRING
			-- path of this node with respect to top of archetype
		do
			if attached arch_node then
				Result := arch_node.path
			else
				Result := parent.path
			end
		end

	rm_depth: INTEGER
			-- depth of this node with respect to its top-most RM (non-constrained) node
			-- note that this will always be intermediate in the structure, since it has
			-- to be the child of some archetyped node
		do
			Result := parent.rm_depth + 1
		end

feature -- Display

	prepare_display_in_grid (a_gui_grid: EVX_GRID)
		local
			visualise_descendants_class: detachable STRING
		do
			precursor (a_gui_grid)
			if not is_rm then
				gui_grid.set_last_row_label_col (Definition_grid_col_rm_name, "", Void, Void, c_pixmap)

				-- add archetype C_OBJECT node context menu
				build_arch_node_context_menu
				gui_grid.add_last_row_pointer_button_press_actions (Definition_grid_col_rm_name, agent arch_class_node_handler)

				-- add 'power expander' action to logical C_OBJECT leaf nodes
				if attached rm_schema.archetype_parent_class then
					visualise_descendants_class := rm_schema.archetype_parent_class
				elseif attached rm_schema.archetype_visualise_descendants_of then
					visualise_descendants_class := rm_schema.archetype_visualise_descendants_of
				end
				if rm_schema.is_descendant_of (arch_node.rm_type_name, visualise_descendants_class) then
					gui_grid_row.expand_actions.force_extend (agent (gui_grid.ev_grid).expand_tree (gui_grid_row,
						agent (a_row: EV_GRID_ROW): BOOLEAN
							do
								if attached {ARCHETYPE_CONSTRAINT_ED_CONTEXT} a_row.data as ac_ed_ctxt then
									Result := attached ac_ed_ctxt.arch_node
								end
							end
						)
					)
				end
			else
				gui_grid.set_last_row_label_col (Definition_grid_col_rm_name, rm_type_text, path, archetype_rm_type_color, rm_type_pixmap (rm_type, rm_schema.rm_publisher.as_lower))

				-- add RM class node context menu
				build_class_node_context_menu
				gui_grid.add_last_row_pointer_button_press_actions (Definition_grid_col_rm_name, agent class_node_handler)
			end
			gui_grid.set_last_row_label_col (Definition_grid_col_meaning, "", Void, Void, Void)
		end

	display_in_grid (ui_settings: GUI_DEFINITION_SETTINGS)
		local
			s: STRING
			lpos: INTEGER
		do
			precursor (ui_settings)

			if not is_rm then
				-- RM name & meaning columns
				if arch_node.is_addressable then
					if in_technical_view then
						gui_grid.update_last_row_label_col (Definition_grid_col_rm_name, arch_node.rm_type_name, node_tooltip_str, c_object_colour, c_pixmap)
						gui_grid.update_last_row_label_col (Definition_grid_col_meaning, node_id_text, node_tooltip_str, c_meaning_colour, Void)
			 		else
						gui_grid.update_last_row_label_col (Definition_grid_col_rm_name, node_id_text, node_tooltip_str, c_meaning_colour, c_pixmap)
						gui_grid.update_last_row_label_col (Definition_grid_col_meaning, "", Void, Void, Void)
					end
				else
					if in_technical_view then
						gui_grid.update_last_row_label_col (Definition_grid_col_rm_name, arch_node.rm_type_name, node_tooltip_str , c_object_colour, c_pixmap)
						gui_grid.update_last_row_label_col (Definition_grid_col_meaning, "", Void, Void, Void)
					else -- in non-technical view, display a friendly type name; for openEHR data types, remove the "DV_"
						create s.make_empty
						s.append_character ('[')
						-- FIXME: openEHR specific "DV_" leader processing
						lpos := 1
						if arch_node.rm_type_name.starts_with (openehr_dv_type_name_leader) then
							lpos := lpos + openehr_dv_type_name_leader.count
						end
						s.append_character (arch_node.rm_type_name.item (lpos))
						s.append (arch_node.rm_type_name.substring (lpos+1, arch_node.rm_type_name.count).as_lower)
						s.append_character (']')
						s.to_lower
						gui_grid.update_last_row_label_col (Definition_grid_col_rm_name, s, node_tooltip_str, c_object_colour, c_pixmap)
					end
				end

				-- card/occ column
				create s.make_empty
				if attached arch_node.occurrences then
					if not arch_node.occurrences.is_prohibited then
						s.append (arch_node.occurrences_as_string)
					else
						s.append (get_text ("occurrences_removed_text"))
					end
				end
				gui_grid.set_last_row_label_col (Definition_grid_col_card_occ, s, Void, c_constraint_colour, Void)

				-- constraint column
				if attached {C_DEFINED_OBJECT} arch_node as c_do and then c_do.any_allowed then
					gui_grid.set_last_row_label_col (Definition_grid_col_constraint, Archetype_any_constraint, Void, c_constraint_colour, Void)
				end

				-- sibling order column
				if in_differential_view then
					if arch_node.is_addressable and then attached arch_node.sibling_order then
						create s.make_empty
						if arch_node.sibling_order.is_after then
							s.append ("after")
						else
							s.append ("before")
						end
						s.append ("%N" + local_term_string (arch_node.sibling_order.sibling_node_id))
						gui_grid.set_last_row_label_col_multi_line (Definition_grid_col_sibling_order, s, Void, c_constraint_colour, Void)
					end
				end
			end
		end

feature {NONE} -- Implementation

	node_id_text: STRING
			-- show node_id text either as just rubric, or as node_id|rubric|, depending on `show_codes' setting
		require
			arch_node.is_addressable
		do
			if is_valid_code (arch_node.node_id) then
				if show_codes then
					Result := arch_node.node_id + "|" + flat_ontology.term_definition (language, arch_node.node_id).text + "|"
				else
					Result := flat_ontology.term_definition (language, arch_node.node_id).text
				end
			else
				Result := arch_node.node_id
			end
		end

	rm_type_text: STRING
		do
			Result := rm_type.semantic_class.name
		end

	c_object_colour: EV_COLOR
			-- generate a foreground colour for RM type representing inheritance status
		do
			if show_rm_inheritance and c_object_colours.has (arch_node.specialisation_status) then
				Result := c_object_colours.item (arch_node.specialisation_status)
			else
				Result := archetype_rm_type_color
			end
		end

	c_pixmap: EV_PIXMAP
			-- find a pixmap for any C_OBJECT node
		local
			pixmap_name, c_type_occ_str: STRING
		do
			pixmap_name := rm_icon_dir + resource_path_separator + rm_schema.rm_publisher.as_lower + resource_path_separator + arch_node.rm_type_name
			if use_rm_pixmaps and then has_icon_pixmap (pixmap_name) then
				Result := get_icon_pixmap (pixmap_name)
			else
				c_type_occ_str := arch_node.generating_type + arch_node.occurrences_key_string
				if has_icon_pixmap (c_type_occ_str) then
					Result := get_icon_pixmap ("am" + resource_path_separator + "added" + resource_path_separator + c_type_occ_str)
				else
					Result := get_icon_pixmap ("am" + resource_path_separator + "added" + resource_path_separator + arch_node.generating_type)
				end
			end
		end

	arch_class_node_handler (x,y, button: INTEGER)
			-- creates the context menu for a right click action for class node
		do
			if button = {EV_POINTER_CONSTANTS}.right then
				gui_grid_row.item (1).enable_select
				arch_node_context_menu.show
			end
		end

	arch_node_context_menu: EV_MENU

	build_arch_node_context_menu
		local
			an_mi: EV_MENU_ITEM
		do
			-- create context menu
			create arch_node_context_menu
			create an_mi.make_with_text_and_action (get_msg ("display_class", Void), agent display_context_selected_class_in_new_tool (rm_schema.class_definition (arch_node.rm_type_name)))
			an_mi.set_pixmap (get_icon_pixmap ("tool/class_tool_new"))
			arch_node_context_menu.extend (an_mi)

			-- if this node is addressable, add menu item to show node_id in ontology
			if arch_node.is_addressable then
				create an_mi.make_with_text_and_action (get_text ("view_node_id_in_ontology"), agent do gui_archetype_tool_agents.code_select_action_agent.call ([arch_node.node_id]) end)
				arch_node_context_menu.extend (an_mi)
			end

			-- add menu item for displaying path in path map
			if attached gui_archetype_tool_agents.path_select_action_agent then
				create an_mi.make_with_text_and_action (get_text ("menu_option_display_path"), agent do gui_archetype_tool_agents.path_select_action_agent.call ([arch_node.path]) end)
				arch_node_context_menu.extend (an_mi)
			end
		end

	class_node_context_menu: EV_MENU

	class_node_handler (x,y, button: INTEGER)
			-- invokes the context menu for a right click action for class node
		do
			if button = {EV_POINTER_CONSTANTS}.right then
				gui_grid_row.item (1).enable_select
				class_node_context_menu.show
			end
		end

	build_class_node_context_menu
			-- creates the context menu for a right click action for class node
		local
			an_mi: EV_MENU_ITEM
		do
			create class_node_context_menu

			-- add menu item for retarget tool to current node / display in new tool
			create an_mi.make_with_text_and_action (get_msg ("display_class", Void), agent display_context_selected_class_in_new_tool (rm_type.semantic_class))
			an_mi.set_pixmap (get_icon_pixmap ("tool/class_tool_new"))
			class_node_context_menu.extend (an_mi)

			-- if there are type substitutions available, add sub-menu for that
			if rm_type.has_type_substitutions then
				add_subtype_context_menu (rm_type.type_substitutions)
			end
		end

	display_context_selected_class_in_new_tool (a_class_def: BMM_CLASS_DEFINITION)
		do
			gui_agents.select_class_in_new_tool_agent.call ([a_class_def])
		end

	add_subtype_context_menu (a_substitutions: ARRAYED_SET[STRING])
			-- dynamically initializes the context menu for this tree
		local
			an_mi: EV_MENU_ITEM
			chg_sub_menu: EV_MENU
		do
			-- create sub menu listing subtypes to change current node into
			create chg_sub_menu.make_with_text (get_text ("context_menu_convert_node_to_subtype"))
			across a_substitutions as subs_csr loop
				create an_mi.make_with_text_and_action (subs_csr.item, agent convert_node_to_subtype (subs_csr.item, True))
				if rm_schema.class_definition (subs_csr.item).is_abstract then
					an_mi.set_pixmap (get_icon_pixmap ("rm/generic/class_abstract"))
				else
					an_mi.set_pixmap (get_icon_pixmap ("rm/generic/class_concrete"))
				end
	    		chg_sub_menu.extend (an_mi)
			end
			class_node_context_menu.extend (chg_sub_menu)

			-- if owning attribute is multiple, allow adding of sibling nodes
--			if attached a_class_grid_row.parent_row and then
--				attached {BMM_PROPERTY_DEFINITION} gui_grid_row.parent_row.data as a_prop_def and then a_prop_def.is_container
--			then
--				-- create sub menu listing subtypes to add to parent node
--				create chg_sub_menu.make_with_text (get_text ("context_menu_add_subtype_mode"))
--				across a_substitutions as subs_csr loop
--					create an_mi.make_with_text_and_action (subs_csr.item, agent convert_node_to_subtype (subs_csr.item, gui_grid_row, False))
--					if rm_schema.class_definition (subs_csr.item).is_abstract then
--						an_mi.set_pixmap (get_icon_pixmap ("rm/generic/class_abstract"))
--					else
--						an_mi.set_pixmap (get_icon_pixmap ("rm/generic/class_concrete"))
--					end
--		    		chg_sub_menu.extend (an_mi)
--				end
--				class_node_context_menu.extend (chg_sub_menu)
--			end
		end

	convert_node_to_subtype (a_subtype: STRING; replace_mode: BOOLEAN)
			-- rebuild EV tree from interior node of class with a new tree of selected subtype
		local
			bmm_subtype_def: BMM_CLASS_DEFINITION
		do
			bmm_subtype_def := rm_schema.class_definition (a_subtype)

--			-- set the RM path from the sibling node; it is the same regardless of whether we are replacing or adding nodes
--			if attached {EV_GRID_LABEL_ITEM} gui_grid_row.item (Definition_grid_col_rm_name) as gli then
--				create rm_node_path.make_from_string (utf32_to_utf8 (gli.tooltip))
--			end
--			if replace_mode then
--				gui_grid.remove_sub_rows (gui_grid_row)
--				gui_grid.set_last_row (gui_grid_row)
--				gui_grid.update_last_row_label_col (Definition_grid_col_rm_name, a_subtype, Void, archetype_rm_type_color,
--					rm_type_pixmap (bmm_subtype_def, rm_publisher))
--				gui_grid.last_row.set_data (bmm_subtype_def)
--				ev_grid_rm_row_stack.extend (gui_grid_row)
--			else
--				gui_grid.add_sub_row (gui_grid_row.parent_row, bmm_subtype_def)
--				gui_grid.set_last_row_label_col (Definition_grid_col_rm_name, a_subtype, rm_node_path.as_string, archetype_rm_type_color,
--					rm_type_pixmap (bmm_subtype_def, rm_publisher))
--				if attached {EV_GRID_LABEL_ITEM} gui_grid.last_row.item (Definition_grid_col_rm_name) as gli then
--	 	 			gli.pointer_button_press_actions.force_extend (agent class_node_handler (gui_grid.last_row, ?, ?, ?))
--					gui_grid.last_row.expand_actions.force_extend (agent property_node_expand_handler (gui_grid.last_row))
--				end
--				ev_grid_rm_row_stack.extend (gui_grid.last_row)
--			end

--			ev_grid_rm_row_removals_stack.extend (False)

--			bmm_subtype_def.do_supplier_closure (not differential_view, agent continue_rm_property, agent enter_rm_property, agent exit_rm_property)

--			ev_grid_rm_row_stack.remove
--			ev_grid_rm_row_removals_stack.remove

--			if a_class_grid_row.is_expandable then
--				a_class_grid_row.expand
--			end
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
--| The Original Code is arch_ed_context.e.
--|
--| The Initial Developer of the Original Code is Thomas Beale.
--| Portions created by the Initial Developer are Copyright (C) 2012
--| the Initial Developer. All Rights Reserved.
--|
--| Contributor(s):
--|	Sam Heard
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
