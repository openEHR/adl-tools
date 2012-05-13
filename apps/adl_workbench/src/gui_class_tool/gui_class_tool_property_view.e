note
	component:   "openEHR Archetype Project"
	description: "Class map control - visualise property view of a class, including inheritance lineage."
	keywords:    "archetype, cadl, gui"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.com>"
	copyright:   "Copyright (c) 2010 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class GUI_CLASS_TOOL_PROPERTY_VIEW

inherit
	GUI_CLASS_TARGETTED_TOOL

	SHARED_REFERENCE_MODEL_ACCESS
		export
			{NONE} all
		end

create
	make

feature -- Definitions

	Grid_declared_in_col: INTEGER = 1
	Grid_property_col: INTEGER = 2
	Grid_property_type_col: INTEGER = 3

	Grid_column_ids: ARRAY [INTEGER]
		once
			Result := <<Grid_declared_in_col, Grid_property_col, Grid_property_type_col>>
		end

feature -- Initialisation

	make
		do
			-- create widgets
			create ev_root_container
			ev_root_container.set_data (Current)

			create ev_grid
			ev_grid.enable_tree
			create grid_controller.make_for_grid (ev_grid)

			-- connect widgets
			ev_root_container.extend (ev_grid)
		end

feature -- Access

	ev_root_container: EV_HORIZONTAL_BOX

feature {NONE} -- Implementation

	do_clear
		do
 			ev_grid.wipe_out
		end

	do_populate
		do
			flat_properties := source.flat_properties
			create anc_classes.make(0)
			anc_classes.compare_objects

			-- grid columns
			ev_grid.insert_new_column (Grid_declared_in_col)
			ev_grid.column (Grid_declared_in_col).set_title (get_msg ("property_grid_declared_in_col_title", Void))
			ev_grid.insert_new_column (Grid_property_col)
			ev_grid.column (Grid_property_col).set_title (get_msg ("property_grid_property_col_title", Void))
			ev_grid.insert_new_column (Grid_property_type_col)
			ev_grid.column (Grid_property_type_col).set_title (get_msg ("property_grid_property_type_col_title", Void))

			-- add the rows
 			populate_class_node (source)

			-- resize grid cols properly
			Grid_column_ids.do_all (
				agent (i: INTEGER; a_grid: EV_GRID)
					do
						a_grid.column (i).resize_to_content
						a_grid.column(i).set_width ((a_grid.column (i).width * 1.1).ceiling)
					end (?, ev_grid)
			)
		end

	ev_grid: EV_GRID

	grid_controller: GUI_GRID_CONTROLLER

	flat_properties: HASH_TABLE [BMM_PROPERTY_DEFINITION, STRING]

	anc_classes: ARRAYED_LIST [STRING]

   	populate_class_node (a_class_def: attached BMM_CLASS_DEFINITION)
			-- Add rows and sub rows if there are properties from `a_class_def' found in the flat_properties
			-- of `source'. Then iterate through ancestors recusrively
   		local
			gli: EV_GRID_LABEL_ITEM
			class_row, property_row: EV_GRID_ROW
			prop_list: ARRAYED_LIST [BMM_PROPERTY_DEFINITION]
			prop_class: BMM_CLASS_DEFINITION
		do
			-- find properties defined on `a_class_def', if any; have to check against flat properties, since
			-- there could be properties which were overridden in some lower descendant, and which
			-- therefore should not be displayed as being from the original class
			create prop_list.make (0)
			from a_class_def.properties.start until a_class_def.properties.off loop
				if flat_properties.has_item (a_class_def.properties.item_for_iteration) then
					prop_list.extend (a_class_def.properties.item_for_iteration)
				end
				a_class_def.properties.forth
			end

			-- if there were any, populate the class and then the properties
			if not prop_list.is_empty then
				-- populate class row
				create gli.make_with_text (a_class_def.as_type_string)
				gli.set_pixmap (get_icon_pixmap ("rm/generic/" + a_class_def.type_category))
				gli.set_data (a_class_def)
				gli.pointer_button_press_actions.force_extend (agent class_node_handler (gli, ?, ?, ?))
				ev_grid.set_item (Grid_declared_in_col, ev_grid.row_count + 1, gli)
				class_row := gli.row

				-- do property rows if we have not already encountered this class
				if not anc_classes.has (a_class_def.name) then
					from prop_list.start until prop_list.off loop
	--					class_row.insert_subrow (class_row.subrow_count+1)
	--					property_row := class_row.subrow (class_row.subrow_count)

						-- property name
						create gli.make_with_text (prop_list.item.name)
						gli.set_pixmap (get_icon_pixmap ("rm/generic/" + prop_list.item.multiplicity_key_string))
						ev_grid.set_item (Grid_property_col, ev_grid.row_count + 1, gli)
						property_row := gli.row
	--					property_row.set_item (Grid_property_col, gli)

						-- property type
						create gli.make_with_text (prop_list.item.type.as_type_string)
						prop_class := source.bmm_schema.class_definition (prop_list.item.type.root_class)
						gli.set_pixmap (get_icon_pixmap ("rm/generic/" + prop_class.type_category))
						gli.set_data (prop_class)
						gli.pointer_button_press_actions.force_extend (agent class_node_handler (gli, ?, ?, ?))
						property_row.set_item (Grid_property_type_col, gli)

						prop_list.forth
					end

	--				class_row.expand
				end
				anc_classes.extend (a_class_def.name)
			end

			-- visit ancestors, recursively
			from a_class_def.ancestors.start until a_class_def.ancestors.off loop
				populate_class_node (a_class_def.ancestors.item_for_iteration)
				a_class_def.ancestors.forth
			end
		end

	class_node_handler (eti: EV_SELECTABLE; x,y, button: INTEGER)
			-- creates the context menu for a right click action for class node
		local
			menu: EV_MENU
		do
			if button = {EV_POINTER_CONSTANTS}.right and attached {BMM_TYPE_SPECIFIER} eti.data as bmm_type_spec then
				create menu
				-- add menu item for retarget tool to current node / display in new tool
				add_class_context_menu (menu, eti)
				menu.show
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
--| The Original Code is adl_node_map_control.e.
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
