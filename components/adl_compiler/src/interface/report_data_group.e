note
	component:   "openEHR ADL Tools"
	description: "Archetype report data object"
	keywords:    "export, archetype, ADL"
	author:      "Thomas Beale <thomas.beale@GraphiteHealth.io>"
	support:     "openEHR AWB project <http://www.openehr.org/issues/browse/AWB>"
	copyright:   "Copyright (c) 2024 Graphite Health"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class REPORT_DATA_GROUP

inherit
	REPORT_DATA_NODE
		redefine
			default_create
		end

create
	default_create, make

feature -- Initialisation

	default_create
		do
			precursor
			create items.make(0)
		end

feature -- Access

	items: HASH_TABLE [REPORT_DATA, STRING]

feature-- Modification

	add_item (an_item: REPORT_DATA)
		do
			items.put (an_item, an_item.id)
		end

end
