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

feature -- Definitions

	default_attr_name: STRING = "other"

feature -- Initialisation

	default_create
		do
			precursor
			create attributes.make(0)
		end

feature -- Access

	attributes: HASH_TABLE [HASH_TABLE [STRING, STRING], STRING]

feature-- Modification

	add_attribute (an_item, a_key: STRING)
		do
			add_named_attribute (an_item, a_key, default_attr_name)
		end

	add_named_attribute (an_item, a_key, attr_name: STRING)
		local
			attrs_for_name: HASH_TABLE [STRING, STRING]
		do
			if attributes.has (attr_name) and then attached attributes.item (attr_name) as ht then
				attrs_for_name := ht
			else
				create attrs_for_name.make (0)
				attributes.put (attrs_for_name, attr_name)
			end
			attrs_for_name.put (an_item, a_key)
		end

end
