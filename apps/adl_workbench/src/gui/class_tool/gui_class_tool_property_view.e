note
	component:   "openEHR ADL Tools"
	description: "Class control - visualise property view of a class, including inheritance lineage."
	keywords:    "archetype, cadl, gui"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.com>"
	copyright:   "Copyright (c) 2010 Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

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

	Grid_enum_name_col: INTEGER = 1
	Grid_enum_value_col: INTEGER = 2
	Grid_enum_dummy_col: INTEGER = 3

feature -- Initialisation

	make
		do
			create anc_classes.make(0)
			create flat_properties.make (0)

			-- create widgets
			create ev_root_container

			create ev_grid
			ev_grid.enable_tree

			-- connect widgets
			ev_root_container.extend (ev_grid)
			ev_root_container.set_data (Current)
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

			if attached {BMM_ENUMERATION_DEFINITION[COMPARABLE]} source then
				do_populate_enumeration
			else
				do_populate_properties
			end

			-- resize grid cols properly
			Grid_column_ids.do_all (
				agent (i: INTEGER; a_grid: EV_GRID)
					do
						a_grid.column (i).resize_to_content
						a_grid.column(i).set_width ((a_grid.column (i).width * 1.1).ceiling)
					end (?, ev_grid)
			)
		end

	do_populate_properties
			-- populate properties of normal class
		do
			-- grid columns
			ev_grid.insert_new_column (Grid_declared_in_col)
			ev_grid.column (Grid_declared_in_col).set_title (get_text (ec_property_grid_declared_in_col_title))
			ev_grid.insert_new_column (Grid_property_col)
			ev_grid.column (Grid_property_col).set_title (get_text (ec_property_grid_property_col_title))
			ev_grid.insert_new_column (Grid_property_type_col)
			ev_grid.column (Grid_property_type_col).set_title (get_text (ec_property_grid_property_type_col_title))

			-- add the rows
			check attached source as src then
 				populate_class_node (src)
 			end
		end

	do_populate_enumeration
			-- populate enumeration class
   		local
			gli: EV_GRID_LABEL_ITEM
		do
			-- grid columns
			ev_grid.insert_new_column (Grid_enum_name_col)
			ev_grid.column (Grid_enum_name_col).set_title (get_text (ec_enumeration_grid_enum_name_col_title))
			ev_grid.insert_new_column (Grid_enum_value_col)
			ev_grid.column (Grid_enum_value_col).set_title (get_text (ec_enumeration_grid_enum_value_col_title))
			ev_grid.insert_new_column (Grid_enum_dummy_col)

			-- add the rows
			check attached {BMM_ENUMERATION_DEFINITION[COMPARABLE]} source as enum_src then
				across enum_src.item_names as names_csr loop
					create gli.make_with_text (names_csr.item)
					-- gli.set_pixmap (get_icon_pixmap ("rm/generic/" + a_class_def.type_category))
					ev_grid.set_item (Grid_enum_name_col, ev_grid.row_count + 1, gli)

					create gli.make_with_text (enum_src.item_values.i_th (names_csr.target_index).out)
					ev_grid.set_item (Grid_enum_value_col, ev_grid.row_count, gli)
				end
 			end
		end

	flat_properties: HASH_TABLE [BMM_PROPERTY_DEFINITION, STRING]

	anc_classes: ARRAYED_LIST [STRING]

	ev_grid: EV_GRID_KBD_MOUSE

   	populate_class_node (a_class_def: BMM_CLASS_DEFINITION)
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
			across a_class_def.properties as properties_csr loop
				if flat_properties.has_item (properties_csr.item) then
					prop_list.extend (properties_csr.item)
				end
			end

			-- if there were any, populate the class and then the properties
			if not prop_list.is_empty then
				-- populate class row
				create gli.make_with_text (a_class_def.as_display_type_string)
				gli.set_pixmap (get_icon_pixmap ("rm/generic/" + a_class_def.type_category))
				gli.set_data (a_class_def)
				gli.pointer_button_press_actions.force_extend (agent class_node_handler (gli, ?, ?, ?))
				ev_grid.set_item (Grid_declared_in_col, ev_grid.row_count + 1, gli)
				class_row := gli.row

				-- do property rows if we have not already encountered this class due to
				-- multiple inheritance
				if not anc_classes.has (a_class_def.name) then
					across prop_list as props_csr loop
						-- property name
						create gli.make_with_text (props_csr.item.name)
						if props_csr.item.is_im_infrastructure then
							gli.set_foreground_color (rm_infrastructure_attribute_colour)
						elseif props_csr.item.is_im_runtime then
							gli.set_foreground_color (rm_runtime_attribute_colour)
						else
							gli.set_foreground_color (rm_attribute_color)
						end
						gli.set_pixmap (get_icon_pixmap ("rm/generic/" + props_csr.item.multiplicity_key_string))
						ev_grid.set_item (Grid_property_col, ev_grid.row_count + 1, gli)
						property_row := gli.row

						-- property type
						create gli.make_with_text (props_csr.item.type.as_display_type_string)
						prop_class := source.bmm_schema.class_definition (props_csr.item.type.root_class)
						gli.set_pixmap (get_icon_pixmap ("rm/generic/" + prop_class.type_category))
						gli.set_data (prop_class)
						gli.pointer_button_press_actions.force_extend (agent class_node_handler (gli, ?, ?, ?))
						property_row.set_item (Grid_property_type_col, gli)
					end
				end
				anc_classes.extend (a_class_def.name)
			end

			-- visit ancestors, recursively
			across a_class_def.ancestors as ancestors_csr loop
				populate_class_node (ancestors_csr.item)
			end
		end

	class_node_handler (eti: EV_SELECTABLE; x,y, button: INTEGER)
			-- creates the context menu for a right click action for class node
		local
			menu: EV_MENU
			bmm_class_def: BMM_CLASS_DEFINITION
		do
			if button = {EV_POINTER_CONSTANTS}.right and attached {BMM_TYPE_SPECIFIER} eti.data as bmm_type_spec then
				if attached {BMM_CLASS_DEFINITION} bmm_type_spec as a_bmm_class_def then
					bmm_class_def := a_bmm_class_def
				else
					bmm_class_def := rm_schema.class_definition (bmm_type_spec.root_class)
				end
				create menu
				-- add menu item for retarget tool to current node / display in new tool
				add_class_context_menu (menu, bmm_class_def)
				menu.show
			end
		end

end


