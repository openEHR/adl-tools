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
		redefine
			make, arch_node, parent, prepare_display_in_grid, display_in_grid
		end

create
	make

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
			rm_class := rm_schema.class_definition (arch_node.rm_type_name)
		end

feature -- Access

	arch_node: C_OBJECT
			-- archetype node being edited

	rm_class: BMM_CLASS_DEFINITION
			-- RM class of node being edited

	parent: C_ATTRIBUTE_ED_CONTEXT

feature -- Display

	prepare_display_in_grid (a_gui_grid: EVX_GRID)
		do
			precursor (a_gui_grid)
			gui_grid.set_last_row_label_col (Definition_grid_col_rm_name, "", Void, Void, c_pixmap)
			gui_grid.set_last_row_label_col (Definition_grid_col_meaning, "", Void, Void, Void)

			build_arch_node_context_menu
			gui_grid.add_last_row_pointer_button_press_actions (Definition_grid_col_rm_name, agent arch_class_node_handler (?, ?, ?))
		end

	display_in_grid (ui_settings: GUI_DEFINITION_SETTINGS)
		local
			s: STRING
			lpos: INTEGER
		do
			precursor (ui_settings)

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

	class_node_context_menu: EV_MENU

	display_context_selected_class_in_new_tool (a_class_def: BMM_CLASS_DEFINITION)
		do
			gui_agents.select_class_in_new_tool_agent.call ([a_class_def])
		end

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
