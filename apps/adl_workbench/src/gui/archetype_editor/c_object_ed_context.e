note
	component:   "openEHR Archetype Project"
	description: "Editor context for any kind of C_OBJECT"
	keywords:    "archetype, editing"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2012- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "See notice at bottom of class"

deferred class C_OBJECT_ED_CONTEXT

inherit
	ARCHETYPE_CONSTRAINT_ED_CONTEXT
		rename
			rm_element as rm_type
		redefine
			make, rm_type, arch_node, parent, prepare_display_in_grid, display_in_grid
		end

	SHARED_ARCHETYPE_CATALOGUES
		export
			{NONE} all
		end

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

	make (an_arch_node: attached like arch_node; an_ed_context: ARCH_ED_CONTEXT_STATE)
		do
			precursor (an_arch_node, an_ed_context)
			rm_type := ed_context.rm_schema.class_definition (arch_node.rm_type_name)
		end

feature -- Access

	arch_node: detachable C_OBJECT
			-- archetype node being edited

	rm_type: BMM_TYPE_SPECIFIER
			-- RM class of node being edited

	parent: detachable C_ATTRIBUTE_ED_CONTEXT

	path: STRING
			-- path of this node with respect to top of archetype
		do
			if attached arch_node as an then
				Result := an.path
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

				-- add 'power expander' action to logical C_OBJECT leaf nodes
				if attached ed_context.rm_schema.archetype_parent_class then
					visualise_descendants_class := ed_context.rm_schema.archetype_parent_class
				elseif attached ed_context.rm_schema.archetype_visualise_descendants_of then
					visualise_descendants_class := ed_context.rm_schema.archetype_visualise_descendants_of
				end
				if attached visualise_descendants_class as vdc and then ed_context.rm_schema.is_descendant_of (arch_node.rm_type_name, vdc) then
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
				gui_grid.set_last_row_label_col (Definition_grid_col_rm_name, rm_type_text, path, parent.rm_attribute_colour, rm_type_pixmap (rm_type, ed_context.rm_schema.rm_publisher.as_lower))
			end
			gui_grid.set_last_row_label_col (Definition_grid_col_meaning, "", Void, Void, Void)

			-- add context menu
			build_context_menu
			gui_grid.add_last_row_pointer_button_press_actions (Definition_grid_col_rm_name, agent context_menu_event_handler)
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
					if display_settings.show_technical_view then
						gui_grid.update_last_row_label_col (Definition_grid_col_rm_name, arch_node.rm_type_name, node_tooltip_str, c_object_colour, c_pixmap)
						gui_grid.update_last_row_label_col (Definition_grid_col_meaning, node_id_text, node_tooltip_str, c_meaning_colour, Void)
			 		else
						gui_grid.update_last_row_label_col (Definition_grid_col_rm_name, node_id_text, node_tooltip_str, c_meaning_colour, c_pixmap)
						gui_grid.update_last_row_label_col (Definition_grid_col_meaning, "", Void, Void, Void)
					end
				else
					if display_settings.show_technical_view then
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
						s.append (get_text (ec_occurrences_removed_text))
					end
				end
				gui_grid.set_last_row_label_col (Definition_grid_col_card_occ, s, Void, c_constraint_colour, Void)

				-- constraint column
				if attached {C_DEFINED_OBJECT} arch_node as c_do and then c_do.any_allowed then
					gui_grid.set_last_row_label_col (Definition_grid_col_constraint, Archetype_any_constraint, Void, c_constraint_colour, Void)
				end

				-- sibling order column
				if ed_context.in_differential_view then
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

feature -- Modification

	convert_to_constraint
			-- convert to constrained C_OBJECT form
		do

		end

feature {NONE} -- Implementation

	node_id_text: STRING
			-- show node_id text either as just rubric, or as node_id|rubric|, depending on `show_codes' setting
		require
			arch_node.is_addressable
		do
			if is_valid_code (arch_node.node_id) then
				if display_settings.show_codes then
					Result := arch_node.node_id + "|" + ed_context.flat_ontology.term_definition (display_settings.language, arch_node.node_id).text + "|"
				else
					Result := ed_context.flat_ontology.term_definition (display_settings.language, arch_node.node_id).text
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
			if display_settings.show_rm_inheritance and c_object_colours.has (arch_node.specialisation_status) then
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
			pixmap_name := rm_icon_dir + resource_path_separator + ed_context.rm_schema.rm_publisher.as_lower + resource_path_separator + arch_node.rm_type_name
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

feature {NONE} -- Context menu

	context_menu_event_handler (x,y, button: INTEGER)
			-- creates the context menu for a right click action for class node
		do
			if button = {EV_POINTER_CONSTANTS}.right then
				gui_grid_row.item (1).enable_select
				context_menu.show
			end
		end

	context_menu: EV_MENU

	build_context_menu
			-- create context menu
		local
			an_mi: EV_MENU_ITEM
		do
			create context_menu
			create an_mi.make_with_text_and_action (get_msg (ec_display_class, Void), agent display_context_selected_class_in_new_tool (rm_type.semantic_class))
			an_mi.set_pixmap (get_icon_pixmap ("tool/class_tool_new"))
			context_menu.extend (an_mi)

			if not is_rm then
				-- if this node is addressable, add menu item to show node_id in ontology
				if arch_node.is_addressable then
					create an_mi.make_with_text_and_action (get_text (ec_menu_option_display_code), agent do tool_agents.code_select_action_agent.call ([arch_node.node_id]) end)
					context_menu.extend (an_mi)
				end
			end

			if not ed_context.editing_enabled then
				-- add menu item for displaying path in path map
				if not is_rm and attached tool_agents.path_select_action_agent then
					create an_mi.make_with_text_and_action (get_text (ec_object_context_menu_display_path), agent do tool_agents.path_select_action_agent.call ([arch_node.path]) end)
					context_menu.extend (an_mi)
				end
			else
				if not is_rm then
					if not arch_node.is_root then
						-- add menu item for deleting this node
						create an_mi.make_with_text_and_action (get_text (ec_object_context_menu_delete), agent do_edit_remove_node)
						context_menu.extend (an_mi)
					end
				elseif not is_root and then not parent.parent.is_rm and parent.is_rm then
					-- add menu item for 'convert to constraint'
					create an_mi.make_with_text_and_action (get_text (ec_object_context_menu_convert), agent do_edit_convert_to_constraint)
					context_menu.extend (an_mi)
				end
			end
		end

	display_context_selected_class_in_new_tool (a_class_def: BMM_CLASS_DEFINITION)
		do
			gui_agents.select_class_in_new_tool_agent.call ([a_class_def])
		end

	do_edit_remove_node
		do
			parent.detach_child_context (Current)
			ed_context.undo_redo_chain.add_link_simple (agent parent.reattach_child_context (Current), agent parent.detach_child_context (Current))
		end

	do_edit_convert_to_constraint
		local
			dialog: INITIAL_C_OBJECT_DIALOG
			def_occ: MULTIPLICITY_INTERVAL
			rm_type_substitutions: ARRAYED_SET [STRING]
		do
			rm_type_substitutions := rm_type.semantic_class.type_substitutions
			rm_type_substitutions.extend (rm_type.semantic_class.name)
			if attached {BMM_CONTAINER_PROPERTY} parent.rm_property as bmm_cont_prop then
				def_occ := bmm_cont_prop.cardinality
			else
				def_occ := parent.rm_property.existence
			end
			create dialog.make (c_type_substitutions, rm_type_substitutions, arch_node_type, rm_type.semantic_class.name, def_occ, ed_context, display_settings)
			dialog.show_modal_to_window (proximate_ev_window (gui_grid.ev_grid))
			if dialog.is_valid then
				do_convert_to_constraint (dialog.current_rm_type, dialog.current_constraint_type, dialog.current_occurrences)
			end
		end

	do_convert_to_constraint (a_c_object_type, an_rm_type, occ_str: STRING)
		local
			c_obj: C_OBJECT
			rm_type_spec: BMM_CLASS_DEFINITION
		do
			parent.convert_to_constraint
			parent.remove_child_context (Current)
			rm_type_spec := ed_context.rm_schema.class_definition (an_rm_type)
			if a_c_object_type.is_equal ("C_COMPLEX_OBJECT") or a_c_object_type.is_equal ("C_PRIMITIVE_OBJECT") then
				parent.add_child_node (rm_type_spec)
			elseif a_c_object_type.is_equal ("C_ARCHETYPE_ROOT") then
--				parent.add_ext_ref_node (rm_type_spec, an_arch_id)
			elseif a_c_object_type.is_equal ("ARCHETYPE_SLOT") then
--				parent.add_slot_node (rm_type_spec)
			elseif a_c_object_type.is_equal ("CONSTRAINT_REF") then
--				parent.add_constraint_ref_node (rm_type_spec)
			end
		end

	c_type_substitutions: ARRAYED_SET [STRING]
			-- list of possible C_OBJECT concrete descendants that can be used here
		local
			c_dv_type_name: STRING
		do
			create Result.make (0)
			Result.compare_objects
			if rm_type.semantic_class.is_primitive_type then
				Result.extend ("C_PRIMITIVE_OBJECT")
			elseif ed_context.rm_schema.has_archetype_data_value_parent_class and then ed_context.rm_schema.is_archetype_data_value_type (rm_type.root_class) then
				c_dv_type_name := "C_" + rm_type.root_class
				if c_object_constraint_types.has (c_dv_type_name) then
					Result.extend (c_dv_type_name)
					if c_dv_type_name.is_equal ("C_CODE_PHRASE") then
						Result.extend ("CONSTRAINT_REF")
					end
				else
					Result.extend ("C_COMPLEX_OBJECT")
					if not ed_context.archetype.matching_logical_paths (display_settings.language, rm_type.root_class).is_empty then
						Result.extend ("ARCHETYPE_INTERNAL_REF")
					end
				end
			else
				Result.extend ("C_COMPLEX_OBJECT")
				Result.extend ("ARCHETYPE_SLOT")
				if not current_arch_cat.matching_ids (".*", rm_type.root_class, Void).is_empty then
					Result.extend ("C_ARCHETYPE_ROOT")
				end
				if not ed_context.archetype.matching_logical_paths (display_settings.language, rm_type.root_class).is_empty then
					Result.extend ("ARCHETYPE_INTERNAL_REF")
				end
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
