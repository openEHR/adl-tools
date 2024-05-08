note
	component:   "openEHR ADL Tools"
	description: "Archetype report data object"
	keywords:    "export, archetype, ADL"
	author:      "Thomas Beale <thomas.beale@GraphiteHealth.io>"
	support:     "openEHR AWB project <http://www.openehr.org/issues/browse/AWB>"
	copyright:   "Copyright (c) 2024 Graphite Health"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class REPORT_DATA_NODE

inherit
	REPORT_DATA
		redefine
			default_create
		end

create
	default_create, make

feature -- Initialisation

	default_create
		do
			precursor
			create attributes.make(0)
		end

feature -- Access

	attributes: HASH_TABLE [STRING, STRING]

feature-- Modification

	add_attribute (an_item, a_key: STRING)
		do
			attributes.put (an_item, a_key)
		end

end
