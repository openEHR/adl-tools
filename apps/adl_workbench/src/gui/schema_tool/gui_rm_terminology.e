note
	component:   "openEHR ADL Tools"
	description: "[
				 Sub-tool for reporting terminology used by an RM, including: 
				     * value-constrained fields, i.e. those needing external terminology
				 ]"
	keywords:    "RM, archetype, schema"
	author:      "Thomas Beale <thomas.beale@graphitehealth.io>"
	support:     "Graphite Health <support@GraphiteHealth.io>"
	copyright:   "Copyright (c) 2024 Graphite Health"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class GUI_RM_TERMINOLOGY

inherit
	GUI_RM_TARGETTED_TOOL

create
	make

feature -- Definitions

	Grid_class_col: INTEGER = 1
	Grid_property_col: INTEGER = 2
	Grid_property_type_col: INTEGER = 3
	Grid_value_set_col: INTEGER = 4
	Grid_column_ids: ARRAY [INTEGER]
		once
			Result := <<Grid_class_col, Grid_property_col, Grid_property_type_col, Grid_value_set_col>>
		end

feature {NONE} -- Initialisation

	make
		do
			-- create widgets
			create ev_root_container
			create ev_grid

			-- connect them together
			ev_root_container.extend (ev_grid)

			-- set visual characteristics
			ev_root_container.set_padding (Default_padding_width)
			ev_root_container.set_border_width (Default_border_width)

			ev_grid.disable_row_height_fixed
			ev_root_container.set_data (Current)
		end

feature -- Access

	ev_root_container: EV_VERTICAL_BOX

feature {NONE} -- Implementation

	ev_grid: EV_GRID

	do_clear
			-- Wipe out content.
		do
			ev_grid.wipe_out
		end

	do_populate
		do
			populate_grid
		end

	populate_grid
		local
			gli: EV_GRID_LABEL_ITEM
			str: STRING
			ref_model: BMM_MODEL
			source_schema: BMM_SCHEMA
			bmm_class: BMM_CLASS
		do
			check attached source as s then
				ref_model := s
			end

			ev_grid.wipe_out
			ev_grid.enable_column_resize_immediate

			-- column names
			ev_grid.insert_new_column (Grid_class_col)
			ev_grid.column (Grid_class_col).set_title (get_msg ({ADL_MESSAGES_IDS}.ec_rm_terminology_class, Void))

			ev_grid.insert_new_column (Grid_property_col)
			ev_grid.column (Grid_property_col).set_title (get_msg ({ADL_MESSAGES_IDS}.ec_rm_terminology_property, Void))

			ev_grid.insert_new_column (Grid_property_type_col)
			ev_grid.column (Grid_property_type_col).set_title (get_msg ({ADL_MESSAGES_IDS}.ec_rm_terminology_property_type, Void))

			ev_grid.insert_new_column (Grid_value_set_col)
			ev_grid.column (Grid_value_set_col).set_title (get_msg ({ADL_MESSAGES_IDS}.ec_rm_terminology_value_constraint, Void))

			across ref_model.class_definitions as classes_csr loop
				bmm_class := classes_csr.item
				across bmm_class.properties as props_csr loop
					if attached {BMM_MODEL_TYPE} props_csr.item.bmm_type.unitary_type as model_type and then
						attached model_type.value_constraint as vc
					then
						-- class name
						create gli.make_with_text (bmm_class.name)
						ev_grid.set_item (Grid_class_col, ev_grid.row_count + 1, gli)

						-- property name
						create gli.make_with_text (props_csr.item.name)
						ev_grid.set_item (Grid_property_col, ev_grid.row_count, gli)

						-- property type
						create gli.make_with_text (model_type.type_name)
						ev_grid.set_item (Grid_property_type_col, ev_grid.row_count, gli)

						-- value constraint
						create gli.make_with_text (vc.value_set_id)
						ev_grid.set_item (Grid_value_set_col, ev_grid.row_count, gli)

					end
				end
			end

			-- resize grid cols properly
			Grid_column_ids.do_all (
				agent (i: INTEGER)
					do
						ev_grid.column(i).resize_to_content
						ev_grid.column(i).set_width ((ev_grid.column (i).width * 1.2).ceiling)
					end
			)

		end

end

