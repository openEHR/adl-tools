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
			create c_attributes.make (0)
			create rm_attributes.make (0)
		end

feature -- Access

	arch_node: C_COMPLEX_OBJECT
			-- archetype node being edited

	c_attributes: HASH_TABLE [C_ATTRIBUTE_ED_CONTEXT, STRING]
			-- editor nodes for real C_ATTRIBUTEs that are found in C_COMPLEX_OBJECT.attributes

	rm_attributes: HASH_TABLE [C_ATTRIBUTE_ED_CONTEXT, STRING]
			-- Editor nodes for unconstrained RM attributes that have been lazy-requested for viewing
			-- Once created, they don't leave, they are just displayed or hidden in the EV_GRID tree

feature -- Display

	prepare_display_in_grid (a_gui_grid: EVX_GRID)
		do
			precursor (a_gui_grid)
			across c_attributes as attr_csr loop
				attr_csr.item.prepare_display_in_grid (a_gui_grid)
			end
		end

	display_in_grid (ui_settings: GUI_DEFINITION_SETTINGS)
		do
			precursor (ui_settings)
			across c_attributes as attr_csr loop
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
				prepare_rm_property (props.item_for_iteration)
			end
		end

feature -- Modification

	add_attribute (a_node: C_ATTRIBUTE_ED_CONTEXT)
			-- add a new attribute node
		do
			c_attributes.put (a_node, a_node.rm_property.name)
			a_node.set_parent (Current)
		end

feature {NONE} -- Implementation

	ev_grid_rm_row_stack: ARRAYED_STACK [EV_GRID_ROW]
			-- stack for building the RM node trees

	ev_grid_rm_row_removals_stack: detachable ARRAYED_STACK [BOOLEAN]
			-- stack for tracking removals

	rm_node_path: detachable OG_PATH

	last_property_grid_row: EV_GRID_ROW

	prepare_rm_property (a_bmm_prop: BMM_PROPERTY_DEFINITION)
			-- enter a BMM_PROPERTY_DEFINITION
		local
			bmm_class_def: BMM_CLASS_DEFINITION
			show_prop: BOOLEAN
			child_ed_node: C_ATTRIBUTE_ED_CONTEXT
		do
			-- first of all work out whether this property is in the existing constrained properties,
			-- i.e. actually in the archetype
			if not c_attributes.has (a_bmm_prop.name) then
				-- see if this property should be shown; if not, leave it for now
				show_prop := show_rm_data_properties
					and (not a_bmm_prop.is_im_runtime or else show_rm_runtime_properties)
					and (not a_bmm_prop.is_im_infrastructure or else show_rm_infrastructure_properties)

				if show_prop then
					-- see if the property was created previously; if not create it new
					if not rm_attributes.has (a_bmm_prop.name) then
						create child_ed_node.make_rm (a_bmm_prop, archetype, flat_ontology, rm_schema)
						rm_attributes.put (child_ed_node, a_bmm_prop.name)
						child_ed_node.set_parent (Current)
					else
						child_ed_node := rm_attributes.item (a_bmm_prop.name)
					end

					-- see if it is already shown, which means it must not be hidden
					if not child_ed_node.is_shown_in_grid then

					end
				else
					child_ed_node := rm_attributes.item (a_bmm_prop.name)
					child_ed_node.hide_in_grid
				end
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
--				last_property_grid_row := Void
--				if attached gui_grid.matching_sub_row (gui_grid_row,
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
--							type_spec := bmm_class_def

--						elseif attached {BMM_CONTAINER_TYPE_REFERENCE} a_bmm_prop.type as bmm_cont_type_ref then
--							prop_str.append (": " + bmm_cont_type_ref.container_type.name + Generic_left_delim.out + Generic_right_delim.out)
--							type_str := bmm_cont_type_ref.type.name
--							type_spec := bmm_cont_type_ref.type

--						elseif attached {BMM_GENERIC_TYPE_REFERENCE} a_bmm_prop.type as bmm_gen_type_ref then
--							type_str := bmm_gen_type_ref.as_type_string
--							type_spec := bmm_gen_type_ref.root_type

--						elseif attached {BMM_GENERIC_PARAMETER_DEFINITION} a_bmm_prop.type as bmm_gen_parm_def then -- type is T, U etc
--							type_str := bmm_gen_parm_def.as_type_string
--							type_spec := a_bmm_prop.type
--						end

--						-- ======== property node =========
--						gui_grid.add_sub_row (parent_class_row, a_bmm_prop)
--						last_property_grid_row := gui_grid.last_row

--						gui_grid.set_last_row_label_col (Definition_grid_col_rm_name, prop_str, rm_node_path.as_string,
--							col, get_icon_pixmap ("rm/generic/" + a_bmm_prop.multiplicity_key_string))


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
