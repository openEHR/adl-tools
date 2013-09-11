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
	P_C_PRIMITIVE_OBJECT
		redefine
			make, populate_c_instance
		end

create
	make

feature -- Initialisation

	make (a_cpo: C_INTEGER)
		do
			precursor (a_cpo)
			range := a_cpo.range
			list := a_cpo.list
		end

feature -- Access

	range: detachable INTERVAL [INTEGER]

	list: detachable ARRAYED_LIST [INTEGER]

feature -- Factory

	create_c_primitive_object: C_INTEGER
		do
			create Result.default_create
			populate_c_instance (Result)
		end

	populate_c_instance (a_c_o: C_INTEGER)
		do
			precursor (a_c_o)
			a_c_o.set_constraint (range, list)
		end

end
