note
	component:   "openEHR ADL Tools"
	description: "Archetype report data object"
	keywords:    "export, archetype, ADL"
	author:      "Thomas Beale <thomas.beale@GraphiteHealth.io>"
	support:     "openEHR AWB project <http://www.openehr.org/issues/browse/AWB>"
	copyright:   "Copyright (c) 2024 Graphite Health"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class ARCHETYPE_LIBRARY_STATS_REPORT

inherit
	REPORT_DATA

create
	make

feature -- Access

	compilation_statistics: STRING_TABLE [INTEGER]
			-- Archetype library compilation stats
		attribute
			create Result.make(0)
		end

	models_reports: STRING_TABLE [ARCHETYPE_LIBRARY_STATISTICS]
			-- Archetype library model stats, grouped by Model name, e.g. 'EHR', 'ENTITY' etc
		attribute
			create Result.make(0)
		end

feature-- Modification

	add_models_report (a_report: ARCHETYPE_LIBRARY_STATISTICS; a_key: READABLE_STRING_GENERAL)
		do
			models_reports.put (a_report, a_key)
		end

end
