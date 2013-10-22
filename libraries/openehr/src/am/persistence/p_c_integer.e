note
	component:   "openEHR ADL Tools"
	description: "Persistent form of C_INTEGER"
	keywords:    "archetype, integer"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2000- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class P_C_INTEGER

inherit
	P_C_ORDERED [INTEGER]
		redefine
			assumed_value, list
		end

create
	make

feature -- Access

    assumed_value: INTEGER_REF

	list: ARRAYED_LIST [INTERVAL [INTEGER]]

feature -- Factory

	create_c_primitive_object: C_INTEGER
		do
			create Result.make_list (list)
			populate_c_instance (Result)
		end

end
