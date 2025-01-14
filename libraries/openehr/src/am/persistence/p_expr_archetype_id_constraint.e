note
	component:   "openEHR ADL Tools"
	description: "Persistent form of EXPR_ARCHETYPE_REF."
	keywords:    "persistence, ADL"
	author:      "Thomas Beale <thomas.beale@openEHR.org>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2025 openEHR International"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


class P_EXPR_ARCHETYPE_ID_CONSTRAINT

inherit
	P_EXPR_CONSTRAINT
		redefine
			make, item, create_expression
		end

create
	make

feature -- Initialisation

	make (an_as: EXPR_ARCHETYPE_ID_CONSTRAINT)
		do
			check attached {C_STRING} an_as.item as c_s then
				create item.make_all (c_s)
				type := c_s.generating_type
			end
		end

feature -- Access

	item: P_C_STRING

feature -- Factory

	create_expression: EXPR_ARCHETYPE_ID_CONSTRAINT
		do
			create Result.make (item.create_c_primitive_object)
		end

end


