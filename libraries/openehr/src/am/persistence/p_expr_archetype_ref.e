note
	component:   "openEHR ADL Tools"
	description: "Persistent form of EXPR_ARCHETYPE_REF."
	keywords:    "persistence, ADL"
	author:      "Thomas Beale <thomas.beale@openEHR.org>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2025 openEHR International"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


class P_EXPR_ARCHETYPE_REF

inherit
	P_EXPR_LEAF

create
	make

feature -- Initialisation

	make (an_as: EXPR_ARCHETYPE_REF)
		do
			path := an_as.path
			type := an_as.type
		end

feature -- Access

	path: STRING

feature -- Factory

	create_expression: EXPR_ARCHETYPE_REF
		do
			create Result.make_definition (path)
		end

end


