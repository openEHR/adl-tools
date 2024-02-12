note
	component:   "openEHR ADL Tools"
	description: "Expression tree leaf item representing a constraint on an archetype id"
	keywords:    "assertion, ADL"
	author:      "Thomas Beale <thomas.beale@GraphiteHealth.io>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2024- Graphite Health <http://www.GraphiteHealth.io>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class EXPR_ARCHETYPE_ID_CONSTRAINT

inherit
	EXPR_CONSTRAINT
		redefine
			make
		end

create
	make

feature -- Initialisation

	make (an_item: C_STRING)
			-- node is a constraint on a primitive type; can only be used with "matches" function
   		do
			item := an_item
			type := an_item.generator
		end

end


