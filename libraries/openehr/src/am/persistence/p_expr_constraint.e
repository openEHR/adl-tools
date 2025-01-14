note
	component:   "openEHR ADL Tools"
	description: "Persistent form of EXPR_ARCHETYPE_REF."
	keywords:    "persistence, ADL"
	author:      "Thomas Beale <thomas.beale@openEHR.org>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2025 openEHR International"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


class P_EXPR_CONSTRAINT

inherit
	P_EXPR_LEAF

create
	make

feature -- Initialisation

	make (an_as: EXPR_CONSTRAINT)
		do
			if attached {C_STRING} an_as.item as c then
				create {P_C_STRING} item.make (c)

			elseif attached {C_BOOLEAN} an_as.item as c then
				create {P_C_BOOLEAN} item.make (c)

			elseif attached {C_INTEGER} an_as.item as c then
				create {P_C_INTEGER} item.make (c)
			elseif attached {C_REAL} an_as.item as c then
				create {P_C_REAL} item.make (c)

			elseif attached {C_DATE} an_as.item as c then
				create {P_C_DATE} item.make (c)
			elseif attached {C_DATE_TIME} an_as.item as c then
				create {P_C_DATE_TIME} item.make (c)
			elseif attached {C_TIME} an_as.item as c then
				create {P_C_TIME} item.make (c)
			elseif attached {C_DURATION} an_as.item as c then
				create {P_C_DURATION} item.make (c)

			elseif attached {C_TERMINOLOGY_CODE} an_as.item as c then
				create {P_C_TERMINOLOGY_CODE} item.make (c)

			end
		end

feature -- Access

	item: P_C_PRIMITIVE_OBJECT
		attribute
			create {P_C_BOOLEAN} Result.make (create {C_BOOLEAN}.make_false)
		end

feature -- Factory

	create_expression: EXPR_CONSTRAINT
		do
			create Result.make(item.create_c_primitive_object)
		end

end


