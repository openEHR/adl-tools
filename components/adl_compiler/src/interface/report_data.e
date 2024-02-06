note
	component:   "openEHR ADL Tools"
	description: "Archetype report data object"
	keywords:    "export, archetype, ADL"
	author:      "Thomas Beale <thomas.beale@GraphiteHealth.io>"
	support:     "openEHR AWB project <http://www.openehr.org/issues/browse/AWB>"
	copyright:   "Copyright (c) 2024 Graphite Health"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class REPORT_DATA

inherit
	ANY
		export {NONE}
			all
		redefine
			default_create
		end

create
	default_create, make

feature -- Definitions

	Default_id: STRING = "Unknown"

feature -- Initialisation

	default_create
		do
			create id.make_from_string (Default_id)
			create items.make(0)
			create attributes.make(0)
		end

	make (an_id: STRING)
		require
			an_id_valid: not an_id.is_empty
		do
			default_create
			id := an_id
		end

feature -- Access

	id: STRING

	items: HASH_TABLE [REPORT_DATA, STRING]

	attributes: HASH_TABLE [STRING, STRING]

feature -- Status Report

	is_identified: BOOLEAN
		do
			Result := not id.is_equal (Default_id)
		end

feature-- Modification

	set_id (an_id: STRING)
		require
			an_id_valid: not an_id.is_empty
		do
			id := an_id
		end

	add_item (an_item: REPORT_DATA)
		do
			items.put (an_item, an_item.id)
		end

	add_attribute (an_item, a_key: STRING)
		do
			attributes.put (an_item, a_key)
		end

end
