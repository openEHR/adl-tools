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
	P_C_COMPARABLE [REAL]
		redefine
			list, populate_c_instance
		end

create
	make

feature -- Access

	list: ARRAYED_LIST [INTERVAL [REAL]]

feature -- Factory

	create_c_primitive_object: C_REAL
		do
			create Result.make_list (list)
			populate_c_instance (Result)
		end

	populate_c_instance (a_c_o: C_REAL)
		do
			precursor (a_c_o)
		end

end
