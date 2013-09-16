note
	component:   "openEHR ADL Tools"
	description: "Persistable form of C_BOOLEAN"
	keywords:    "archetype, boolean, data"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2013- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class P_C_BOOLEAN

inherit
	P_C_PRIMITIVE_OBJECT
		redefine
			make, populate_c_instance
		end

create
	make

feature -- Initialisation

	make (a_cpo: C_BOOLEAN)
		do
			precursor (a_cpo)
			list := a_cpo.list
		end

feature -- Factory

	create_c_primitive_object: C_BOOLEAN
		do
			create Result.default_create
			populate_c_instance (Result)
		end

	populate_c_instance (a_c_o: C_BOOLEAN)
		do
			precursor (a_c_o)
			a_c_o.set_constraint (list)
		end

feature -- Access

	list: ARRAYED_LIST [BOOLEAN]

end


