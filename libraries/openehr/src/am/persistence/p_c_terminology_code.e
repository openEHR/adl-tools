note
	component:   "openEHR ADL Tools"
	description: "Persistent form of C_TERMINOLOGY_CODE"
	keywords:    "archetype, terminology"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2013- The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class P_C_TERMINOLOGY_CODE

inherit
	P_C_PRIMITIVE_OBJECT
		redefine
			make, populate_c_instance
		end

create
	make

feature -- Initialisation

	make (a_cpo: C_TERMINOLOGY_CODE)
		do
			precursor (a_cpo)
			constraint := a_cpo.constraint
		end

feature -- Access

	constraint: STRING

feature -- Factory

	create_c_primitive_object: C_TERMINOLOGY_CODE
		do
			create Result.default_create
			populate_c_instance (Result)
		end

	populate_c_instance (a_c_o: C_TERMINOLOGY_CODE)
		do
			precursor (a_c_o)
			a_c_o.set_constraint (constraint)
		end

end


