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

	make (an_arch_node: like arch_node; an_archetype: ARCHETYPE; a_flat_ontology: FLAT_ARCHETYPE_ONTOLOGY; an_rm_schema: BMM_SCHEMA)
		do
			precursor (an_arch_node, an_archetype, a_flat_ontology, an_rm_schema)
			if arch_node.has_differential_path then
				rm_property := rm_schema.property_definition_at_path (arch_node.parent.rm_type_name, arch_node.rm_attribute_path)
			else
				rm_property := rm_schema.property_definition (arch_node.parent.rm_type_name, arch_node.rm_attribute_name)
			end
			create children.make(0)
		end

	make_rm (an_rm_prop: BMM_PROPERTY_DEFINITION; an_archetype: ARCHETYPE; a_flat_ontology: FLAT_ARCHETYPE_ONTOLOGY; an_rm_schema: BMM_SCHEMA)
			-- make with a C_ATTRIBUTE created based on `an_rm_prop'
		local
--			ca: C_ATTRIBUTE
			co_ed_node: C_OBJECT_ED_CONTEXT
			sem_type_class: BMM_CLASS_DEFINITION
		do
			precursor (an_rm_prop, an_archetype, a_flat_ontology, an_rm_schema)
--			if rm_property.is_container then
--				create ca.make_multiple (rm_property.name, Void, Void)
--			else
--				create ca.make_single (rm_property.name, Void)
--			end
			create children.make(0)

			-- make RM object child either as a C_COMPLEX_OBJECT or C_PRIMITIVE_OBJECT node
			sem_type_class := rm_schema.class_definition (an_rm_prop.semantic_type.root_class)
			if rm_schema.is_primitive_type (an_rm_prop.semantic_type.root_class) then
				create {C_PRIMITIVE_OBJECT_ED_CONTEXT}  co_ed_node.make_rm (sem_type_class, an_archetype, a_flat_ontology, an_rm_schema)
			else
				create {C_COMPLEX_OBJECT_ED_CONTEXT} co_ed_node.make_rm (sem_type_class, an_archetype, a_flat_ontology, an_rm_schema)
			end
			add_child (co_ed_node)
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
					if in_technical_view then
						attr_str.append (arch_node.rm_attribute_path)
					else
						attr_str.append (flat_ontology.physical_to_logical_path (arch_node.rm_attribute_path, language, True))
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

	add_child (a_node: C_OBJECT_ED_CONTEXT)
			-- add a new child
		do
			children.extend (a_node)
			a_node.set_parent (Current)
		end

feature {NONE} -- Implementation

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
