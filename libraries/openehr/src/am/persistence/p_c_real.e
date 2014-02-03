note
	component:   "openEHR ADL Tools"
	description: "Persistent form of C_REAL"
	keywords:    "archetype, real"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2013- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class P_C_REAL

inherit
	P_C_ORDERED [REAL]
		redefine
			assumed_value, tuple_constraint
		end

create
	make

feature -- Access

    assumed_value: REAL_REF

	tuple_constraint: detachable ARRAYED_LIST [ARRAYED_LIST [INTERVAL [REAL]]]

feature -- Factory

	create_c_primitive_object: C_REAL
		do
			create Result.default_create
			if attached tuple_constraint as att_tc then
				Result.set_constraint (att_tc)
			end
			populate_c_instance (Result)
		end

end
