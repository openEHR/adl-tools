note
	component:   "openEHR Archetype Project"
	description: "Editor context for any kind of C_ATTRIBUTE"
	keywords:    "archetype, editing"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2012 Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "See notice at bottom of class"
	void_safety: "initial"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class C_ATTRIBUTE_ED_CONTEXT

inherit
	ARCHETYPE_CONSTRAINT_ED_CONTEXT
		rename
			rm_element as rm_property
		redefine
			make, make_rm, rm_property, arch_node, parent, prepare_display_in_grid, display_in_grid, c_attribute_colour
		end

create
	make, make_rm

feature -- Initialisation

	make (an_arch_node: like arch_node; an_ed_context: ARCH_ED_CONTEXT_STATE)
		do
			precursor (an_arch_node, an_ed_context)
			if arch_node.has_differential_path then
				rm_property := ed_context.rm_schema.property_definition_at_path (arch_node.parent.rm_type_name, arch_node.rm_attribute_path)
			else
				rm_property := ed_context.rm_schema.property_definition (arch_node.parent.rm_type_name, arch_node.rm_attribute_name)
			end
			create children.make(0)
		end

	make_rm (an_rm_prop: BMM_PROPERTY_DEFINITION; an_ed_context: ARCH_ED_CONTEXT_STATE)
			-- make with a C_ATTRIBUTE created based on `an_rm_prop'
		do
			precursor (an_rm_prop, an_ed_context)
			create children.make(0)

			add_child_rm_node (rm_property.type)
		end

feature -- Access

	arch_node: detachable C_ATTRIBUTE
			-- archetype node being edited

	rm_property: BMM_PROPERTY_DEFINITION
			-- RM property of node being edited

	children: ARRAYED_LIST [C_OBJECT_ED_CONTEXT]
			-- child objects

	parent: C_COMPLEX_OBJECT_ED_CONTEXT

	path: STRING
			-- path of this node with respect to top of archetype
		do
			if attached arch_node then
				Result := arch_node.path
			elseif parent.is_root then
				Result := parent.path + rm_property.name
			else
				Result := parent.path + {OG_PATH}.segment_separator_string + rm_property.name
			end
		end

	rm_depth: INTEGER
			-- depth of this node with respect to its top-most RM (non-constrained) node
			-- note that this will always be intermediate in the structure, since it has
			-- to be the child of some archetyped node
		do
			if parent.is_rm then
				Result := parent.rm_depth + 1
			else
				Result := 1
			end
		end

feature -- Status Report

	has_child (a_node: C_OBJECT_ED_CONTEXT): BOOLEAN
		do
			Result := children.has (a_node)
		end

feature -- Display

	prepare_display_in_grid (a_gui_grid: EVX_GRID)
		do
			precursor (a_gui_grid)

			-- set an empty string in the meaning column, so later updates have an object to modify
			gui_grid.set_last_row_label_col_multi_line (Definition_grid_col_rm_name, "", Void, Void, c_pixmap)

			-- constraints
			gui_grid.set_last_row_label_col (Definition_grid_col_existence, "", Void, Void, Void)
			gui_grid.set_last_row_label_col (Definition_grid_col_card_occ, "", Void, Void, Void)
			gui_grid.set_last_row_label_col (Definition_grid_col_constraint, "", Void, Void, Void)

			-- add context menu
			build_context_menu
			gui_grid.add_last_row_pointer_button_press_actions (Definition_grid_col_rm_name, agent context_menu_event_handler)

			-- build out child nodes
			across children as children_csr loop
				children_csr.item.prepare_display_in_grid (gui_grid)
			end
		end

	display_in_grid (ui_settings: GUI_DEFINITION_SETTINGS)
		local
			attr_str: STRING
		do
			precursor (ui_settings)

			if not is_rm then
				-- RM attr name / path
				if arch_node.has_differential_path then
					create attr_str.make_empty
					if display_settings.show_technical_view then
						attr_str.append (arch_node.rm_attribute_path)
					else
						attr_str.append (ed_context.flat_ontology.physical_to_logical_path (arch_node.rm_attribute_path, display_settings.language, True))
					end
					attr_str.replace_substring_all ({OG_PATH}.segment_separator_string, "%N" + {OG_PATH}.segment_separator_string)
					attr_str.remove_head (1)
					gui_grid.update_last_row_label_col_multi_line (Definition_grid_col_rm_name, attr_str, node_tooltip_str, c_attribute_colour, c_pixmap)
				else
					gui_grid.update_last_row_label_col (Definition_grid_col_rm_name, arch_node.rm_attribute_name, node_tooltip_str, c_attribute_colour, c_pixmap)
				end

				-- constraints
				if attached arch_node.existence then
					gui_grid.update_last_row_label_col (Definition_grid_col_existence, arch_node.existence.as_string, Void, c_constraint_colour, Void)
				end
				if attached arch_node.cardinality then
					gui_grid.update_last_row_label_col (Definition_grid_col_card_occ, arch_node.cardinality.as_string, Void, c_constraint_colour, Void)
				end
				if arch_node.any_allowed then
					gui_grid.update_last_row_label_col (Definition_grid_col_constraint, Archetype_any_constraint, Void, c_constraint_colour, Void)
				end

			else
				-- RM name
				gui_grid.update_last_row_label_col (Definition_grid_col_rm_name, rm_property.display_name, node_tooltip_str, c_attribute_colour, c_pixmap)

				-- existence
				gui_grid.update_last_row_label_col (Definition_grid_col_existence, rm_property.existence.as_string, Void, c_attribute_colour, Void)

				-- cardinality
				if attached {BMM_CONTAINER_PROPERTY} rm_property as bmm_cont_prop then
					gui_grid.update_last_row_label_col (Definition_grid_col_card_occ, bmm_cont_prop.cardinality.as_string, Void, c_attribute_colour, Void)
				end
			end

			if not gui_grid_row.is_displayed then
				gui_grid_row.show
			end

			across children as children_csr loop
				children_csr.item.display_in_grid (ui_settings)
			end
		end

feature -- Modification

	put_child_context (a_node: C_OBJECT_ED_CONTEXT)
			-- add `a_node' to end of children
		do
			children.extend (a_node)
			a_node.set_parent (Current)
			if is_prepared then
				a_node.prepare_display_in_grid (gui_grid)
				if is_displayed then
					a_node.display_in_grid (display_settings)
				end
			end
		end

	remove_child_context (a_node: C_OBJECT_ED_CONTEXT)
		require
			has_child (a_node)
		do
			children.prune (a_node)
			if is_prepared then
				gui_grid.ev_grid.remove_row (a_node.gui_grid_row.index)
				if is_displayed then
					display_in_grid (display_settings)
				end
			end
		end

	detach_child_context (a_node: C_OBJECT_ED_CONTEXT)
			-- reattach a context node whose arch_node is also detached
		require
			has_child (a_node)
		do
			remove_child_context (a_node)
			if is_rm then
				arch_node.remove_child (a_node.arch_node)
			end
		end

	reattach_child_context (a_node: C_OBJECT_ED_CONTEXT)
			-- reattach a context node whose arch_node is also detached
		require
			not has_child (a_node)
		do
			if is_rm then
				arch_node.put_child (a_node.arch_node)
			end
			put_child_context (a_node)
		end

	convert_to_constraint
			-- convert to constrained form with a C_ATTRIBUTE created based on `an_rm_prop'
		require
			not parent.is_rm
		do
			if rm_property.is_container then
				create arch_node.make_multiple (rm_property.name, Void, Void)
			else
				create arch_node.make_single (rm_property.name, Void)
			end
			parent.convert_rm_property_to_constraint (Current)
		end

feature {ANY_ED_CONTEXT} -- Implementation

	c_attribute_colour: EV_COLOR
			-- generate a foreground colour for RM attribute representing inheritance status
		do
			if not is_rm then
				Result := precursor
			else
				Result := rm_attribute_colour
			end
		end

	rm_attribute_colour: EV_COLOR
			-- foreground colours for RM type to visualise BMM attribute classification, i.e.
			-- 'runtime', 'infrastructure' etc
		do
			if rm_property.is_im_infrastructure then
				Result := rm_infrastructure_attribute_colour
			elseif rm_property.is_im_runtime then
				Result := rm_runtime_attribute_colour
			else
				Result := rm_attribute_color
			end
		end

	c_pixmap: EV_PIXMAP
		do
			Result := get_icon_pixmap ("am" + resource_path_separator + "added" + resource_path_separator + rm_property.multiplicity_key_string)
		end

	add_child_node (a_type_spec: BMM_TYPE_SPECIFIER)
			-- make C_OBJECT child either as a C_COMPLEX_OBJECT or C_PRIMITIVE_OBJECT node
		require
			not is_rm
		local
			cpo: C_PRIMITIVE_OBJECT
			cco: C_COMPLEX_OBJECT
		do
			if a_type_spec.semantic_class.is_primitive_type then
				create cpo.make_any (a_type_spec.semantic_class.name)
				arch_node.put_child (cpo)
				create {C_PRIMITIVE_OBJECT_ED_CONTEXT} added_co_ed_node.make (cpo, ed_context)
			else
				if arch_node.is_multiple or arch_node.has_children then
					ed_context.archetype.ontology.add_new_non_refined_term_definition
					create cco.make_identified (a_type_spec.semantic_class.name, ed_context.archetype.ontology.last_added_term_definition_code)
				else
					create cco.make_anonymous (a_type_spec.semantic_class.name)
				end
				arch_node.put_child (cco)
				create {C_COMPLEX_OBJECT_ED_CONTEXT} added_co_ed_node.make (cco, ed_context)
			end
			put_child_context (added_co_ed_node)
		end

	add_child_rm_node (a_type_spec: BMM_TYPE_SPECIFIER)
			-- make RM object child either as a C_COMPLEX_OBJECT or C_PRIMITIVE_OBJECT node
		require
			is_rm
		do
			if a_type_spec.semantic_class.is_primitive_type then
				create {C_PRIMITIVE_OBJECT_ED_CONTEXT} added_co_ed_node.make_rm (a_type_spec, ed_context)
			else
				create {C_COMPLEX_OBJECT_ED_CONTEXT} added_co_ed_node.make_rm (a_type_spec, ed_context)
			end
			put_child_context (added_co_ed_node)
		end

feature {NONE} -- Context menu

	context_menu_event_handler (x,y, button: INTEGER)
			-- creates the context menu for a right click action for class node
		do
			if button = {EV_POINTER_CONSTANTS}.right and not context_menu.is_empty then
				gui_grid_row.item (1).enable_select
				context_menu.show
			end
		end

	context_menu: EV_MENU

	build_context_menu
		local
			an_mi: EV_MENU_ITEM
			types_sub_menu: EV_MENU
			subtype_class_def: BMM_CLASS_DEFINITION
		do
			create context_menu

			-- add sub-menu of types to add as children
			if not is_rm and ed_context.editing_enabled then
				create types_sub_menu.make_with_text (get_text ("attribute_context_menu_add_child"))
				create an_mi.make_with_text_and_action (rm_property.type.semantic_class.name, agent do_edit_add_child_node (rm_property.type.semantic_class))
				if rm_property.type.semantic_class.is_abstract then
					an_mi.set_pixmap (get_icon_pixmap ("rm/generic/class_abstract"))
				else
					an_mi.set_pixmap (get_icon_pixmap ("rm/generic/class_concrete"))
				end
	    		types_sub_menu.extend (an_mi)
				across rm_property.type.semantic_class.type_substitutions as subs_csr loop
					subtype_class_def := ed_context.rm_schema.class_definition (subs_csr.item)
					create an_mi.make_with_text_and_action (subs_csr.item, agent do_edit_add_child_node (subtype_class_def))
					if subtype_class_def.is_abstract then
						an_mi.set_pixmap (get_icon_pixmap ("rm/generic/class_abstract"))
					else
						an_mi.set_pixmap (get_icon_pixmap ("rm/generic/class_concrete"))
					end
		    		types_sub_menu.extend (an_mi)
				end
				context_menu.extend (types_sub_menu)
			end
		end

	do_edit_add_child_node (a_type_spec: BMM_TYPE_SPECIFIER)
		require
			not is_rm
		do
			add_child_node (a_type_spec)
			ed_context.undo_redo_chain.add_link_simple (agent detach_child_context (added_co_ed_node), agent reattach_child_context (added_co_ed_node))
		end

	added_co_ed_node: C_OBJECT_ED_CONTEXT

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
