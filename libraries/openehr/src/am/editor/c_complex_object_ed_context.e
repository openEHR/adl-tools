note
	component:   "openEHR Archetype Project"
	description: "Editor context for a C_COMPLEX_OBJECT"
	keywords:    "archetype, editing"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2012 Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "See notice at bottom of class"
	void_safety: "initial"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class C_COMPLEX_OBJECT_ED_CONTEXT

inherit
	C_OBJECT_ED_CONTEXT
		redefine
			arch_node, make, prepare_display_in_grid, display_in_grid
		end

create
	make

feature -- Initialisation

	make (an_arch_node: like arch_node; an_archetype: ARCHETYPE; a_flat_ontology: FLAT_ARCHETYPE_ONTOLOGY; an_rm_schema: BMM_SCHEMA)
		do
			precursor (an_arch_node, an_archetype, a_flat_ontology, an_rm_schema)
			create attributes.make (0)
		end

feature -- Access

	arch_node: C_COMPLEX_OBJECT
			-- archetype node being edited

	attributes: ARRAYED_LIST [C_ATTRIBUTE_ED_CONTEXT]

feature -- Display

	prepare_display_in_grid (a_gui_grid: EVX_GRID)
		do
			precursor (a_gui_grid)
			across attributes as attr_csr loop
				attr_csr.item.prepare_display_in_grid (a_gui_grid)
			end
		end

	display_in_grid (ui_settings: GUI_DEFINITION_SETTINGS)
		do
			precursor (ui_settings)
			across attributes as attr_csr loop
				attr_csr.item.display_in_grid (ui_settings)
			end
		end

	expand_to_rm
		local
			props: HASH_TABLE [BMM_PROPERTY_DEFINITION, STRING]
		do
			if in_differential_view then
				props := rm_class.properties
			else
				props := rm_class.flat_properties
			end

			create ev_grid_rm_row_stack.make (0)
			create ev_grid_rm_row_removals_stack.make (0)

			across props as props_csr loop
				do_rm_property (props.item_for_iteration)
			end
		end

feature -- Modification

	add_attribute (a_node: C_ATTRIBUTE_ED_CONTEXT)
			-- add a new attribute node
		do
			attributes.extend (a_node)
			a_node.set_parent (Current)
		end

feature {NONE} -- Implementation

	ev_grid_rm_row_stack: ARRAYED_STACK [EV_GRID_ROW]
			-- stack for building the RM node trees

	ev_grid_rm_row_removals_stack: detachable ARRAYED_STACK [BOOLEAN]
			-- stack for tracking removals

	rm_node_path: detachable OG_PATH

	last_property_grid_row: EV_GRID_ROW

	do_rm_property (a_bmm_prop: BMM_PROPERTY_DEFINITION)
			-- enter a BMM_PROPERTY_DEFINITION
		local
			bmm_class_def: BMM_CLASS_DEFINITION
		do
			-- first of all work out whether we want this property
			if not arch_node.has_attribute (a_bmm_prop.name) then
--				ev_grid_rm_row_stack.extend (gui_grid_row)
--				ev_grid_rm_row_removals_stack.extend (False)
--				create rm_node_path.make_from_string (arch_node.path)

--				-- do this property
--				enter_rm_property (a_bmm_prop, depth)

--				-- if it wasn't removed, do its children, to a certain depth
--				if not ev_grid_rm_row_removals_stack.item then
--					rm_class.do_supplier_closure (not in_differential_view, agent continue_rm_property, agent enter_rm_property, agent exit_rm_property)
--				end

--				exit_rm_property (a_bmm_prop)

--				ev_grid_rm_row_stack.remove
--				ev_grid_rm_row_removals_stack.remove
			end
		end

	continue_rm_property (a_bmm_prop: BMM_PROPERTY_DEFINITION; depth: INTEGER): BOOLEAN
			-- detrmine whether to continue a BMM_PROPERTY_DEFINITION
		do
--			if attached last_property_grid_row then
--				if last_property_grid_row.subrow (1).subrow_count > 0 then
--					Result := True
--				else
--					Result := depth < 2
--				end
--			end
		end

	enter_rm_property (a_bmm_prop: BMM_PROPERTY_DEFINITION; depth: INTEGER)
			-- enter a BMM_PROPERTY_DEFINITION
		local
			parent_class_row: EV_GRID_ROW
			prop_str, type_str: STRING
			has_type_subs: BOOLEAN
			type_spec: BMM_TYPE_SPECIFIER
			col: EV_COLOR
			show_prop: BOOLEAN
			ignore: BOOLEAN
		do
--			if not ev_grid_rm_row_removals_stack.item then -- don't do anything if descending into a removed subtree
--				-- first of all work out whether we want this property
--				show_prop := show_rm_data_properties
--					and (not a_bmm_prop.is_im_runtime or else show_rm_runtime_properties)
--					and (not a_bmm_prop.is_im_infrastructure or else show_rm_infrastructure_properties)

--				-- if the row already exists then refresh it or remove it depending on settings; otherwise create it or do nothing
--				parent_class_row := ev_grid_rm_row_stack.item
--				last_property_grid_row := Void
--				if attached gui_grid.matching_sub_row (parent_class_row,
--					agent (a_row: EV_GRID_ROW; match_bmm_prop: BMM_PROPERTY_DEFINITION): BOOLEAN
--						do
--							Result := attached {BMM_PROPERTY_DEFINITION} a_row.data as bmm_prop and then bmm_prop = match_bmm_prop
--						end (?, a_bmm_prop)) as a_prop_row
--				then
--					-- put something on the stack to match stack removal in exit routine
--					if show_prop then
--						last_property_grid_row := a_prop_row
--						-- refresh its object rows
--						refresh_row (a_prop_row.subrow (1))
--						rm_node_path.append_segment (create {OG_PATH_ITEM}.make (a_bmm_prop.name))
--						ev_grid_rm_row_stack.extend (a_prop_row.subrow (1))
--					else
--						gui_grid.ev_grid.remove_row (a_prop_row.index)
--						ignore := True
--					end

--				else
--					if show_prop then
--						-- determine data for property and one or more (in the case of generics with > 1 param) class nodes
--						prop_str := a_bmm_prop.name.twin
--						if attached {BMM_CLASS_DEFINITION} a_bmm_prop.type as bmm_class_def then
--							type_str := bmm_class_def.name
--							has_type_subs := bmm_class_def.has_type_substitutions
--							type_spec := bmm_class_def

--						elseif attached {BMM_CONTAINER_TYPE_REFERENCE} a_bmm_prop.type as bmm_cont_type_ref then
--							prop_str.append (": " + bmm_cont_type_ref.container_type.name + Generic_left_delim.out + Generic_right_delim.out)
--							type_str := bmm_cont_type_ref.type.name
--							has_type_subs := bmm_cont_type_ref.type.has_type_substitutions
--							type_spec := bmm_cont_type_ref.type

--						elseif attached {BMM_GENERIC_TYPE_REFERENCE} a_bmm_prop.type as bmm_gen_type_ref then
--							type_str := bmm_gen_type_ref.as_type_string
--							has_type_subs := bmm_gen_type_ref.has_type_substitutions
--							type_spec := bmm_gen_type_ref.root_type

--						elseif attached {BMM_GENERIC_PARAMETER_DEFINITION} a_bmm_prop.type as bmm_gen_parm_def then -- type is T, U etc
--							type_str := bmm_gen_parm_def.as_type_string
--							has_type_subs := bmm_gen_parm_def.has_type_substitutions
--							type_spec := a_bmm_prop.type
--						end

--						-- ======== property node =========
--						gui_grid.add_sub_row (parent_class_row, a_bmm_prop)
--						last_property_grid_row := gui_grid.last_row

--						if a_bmm_prop.is_im_infrastructure then
--							col := rm_infrastructure_attribute_colour
--						elseif a_bmm_prop.is_im_runtime then
--							col := rm_runtime_attribute_colour
--						else
--							col := rm_attribute_color
--						end
--						rm_node_path.append_segment (create {OG_PATH_ITEM}.make (a_bmm_prop.name))
--						gui_grid.set_last_row_label_col (Definition_grid_col_rm_name, prop_str, rm_node_path.as_string,
--							col, get_icon_pixmap ("rm/generic/" + a_bmm_prop.multiplicity_key_string))

--						-- existence
--						gui_grid.set_last_row_label_col (Definition_grid_col_existence, a_bmm_prop.existence.as_string, Void, col, Void)

--						-- cardinality
--						if attached {BMM_CONTAINER_PROPERTY} a_bmm_prop as bmm_cont_prop then
--							gui_grid.set_last_row_label_col (Definition_grid_col_card_occ, bmm_cont_prop.cardinality.as_string, Void, col, Void)
--						end

--						-- add tree expand handler to this node
--						gui_grid.last_row.expand_actions.force_extend (agent property_node_expand_handler (gui_grid.last_row))

--						-- add right-click menu to property node for removal etc
--			--			if attached {EV_GRID_LABEL_ITEM} gui_grid.last_row.item (Node_grid_col_rm_name) as gli then
--			--		 		gli.pointer_button_press_actions.force_extend (agent property_node_handler (a_ti, ?, ?, ?))
--			--			end

--						-- ======== type node =========
--						gui_grid.add_sub_row (gui_grid.last_row, type_spec)
--						ev_grid_rm_row_stack.extend (gui_grid.last_row)
--						gui_grid.set_last_row_label_col (Definition_grid_col_rm_name, type_str, rm_node_path.as_string, archetype_rm_type_color, rm_type_pixmap (type_spec, rm_publisher))
--						gui_grid.add_last_row_pointer_button_press_actions (Definition_grid_col_rm_name, agent class_node_handler (gui_grid.last_row, ?, ?, ?))
--				 	else
--						ignore := True
--				 	end
--			 	end
--			else
--				ignore := True
--			end
--		 	ev_grid_rm_row_removals_stack.extend (ignore)
		end

	exit_rm_property (a_bmm_prop: BMM_PROPERTY_DEFINITION)
			-- exit a BMM_PROPERTY_DEFINITION
		do
--			if not ev_grid_rm_row_removals_stack.item then
--				rm_node_path.remove_last
--				ev_grid_rm_row_stack.remove
--			end
--		 	ev_grid_rm_row_removals_stack.remove
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
