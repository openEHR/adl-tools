note
	component:   "openEHR ADL Tools"
	description: "Statistics display for a single archetype"
	keywords:    "statistics"
	keywords:    "statistics, archteype"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2011 Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


class
	GUI_ARCHETYPE_INFORMATION_TOOL

inherit
	GUI_ARCHETYPE_TARGETTED_TOOL

create
	make

feature -- Definitions

	Grid_class_name_col: INTEGER = 1
	Grid_class_count_col: INTEGER = 2
	Grid_attr_name_col: INTEGER = 3
	Grid_attr_count_col: INTEGER = 4

	Grid_column_ids: ARRAY [INTEGER]
		once
			Result := <<Grid_class_name_col, Grid_class_count_col, Grid_attr_name_col, Grid_attr_count_col>>
		end

feature {NONE} -- Initialization

	make
		do
			create ev_root_container.default_create

			create report_controls.make
			ev_root_container.extend (report_controls.ev_root_container)
			add_sub_tool (report_controls)
			enable_selection_history

			ev_root_container.set_data (Current)
		end

feature -- Access

	ev_root_container: EV_CELL

feature {NONE} -- Implementation

	report_controls: GUI_ARCHETYPE_STATISTICAL_REPORT

	do_clear
		do
			report_controls.clear
		end

	do_populate
		do
			source.generate_statistics (differential_view)
			report_controls.populate (source.statistical_analyser.stats, differential_view)
		end

end


