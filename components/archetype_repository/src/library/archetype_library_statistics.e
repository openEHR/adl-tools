note
	component:   "openEHR ADL Tools"
	description: "Archetype report data object"
	keywords:    "export, archetype, ADL"
	author:      "Thomas Beale <thomas.beale@GraphiteHealth.io>"
	support:     "openEHR AWB project <http://www.openehr.org/issues/browse/AWB>"
	copyright:   "Copyright (c) 2024 Graphite Health"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class ARCHETYPE_LIBRARY_STATISTICS

create
	make

feature -- Initialisation

	make (a_library_name, a_component_name: READABLE_STRING_GENERAL)
		do
			library_name := a_library_name
			component_name := a_component_name
			create model_statistics.make (0)
		end

feature -- Access

	library_name: READABLE_STRING_GENERAL

	component_name: READABLE_STRING_GENERAL

	model_statistics: STRING_TABLE [REPORTED_STATISTICAL_DATUM]

feature -- Modification

	add_model_statistics (a_stats: STRING_TABLE [STATISTICAL_DATUM])
		do
			across a_stats as stats_csr loop
				model_statistics.put (stats_csr.item.as_report_item, stats_csr.key)
			end
		end

end
