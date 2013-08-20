note
	component:   "openEHR ADL Tools"
	description: "Persistent form of C_PRIMITIVE_OBJECT."
	keywords:    "persistence, ADL"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2011- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class P_C_PRIMITIVE_OBJECT

inherit
	P_C_DEFINED_OBJECT
		redefine
			make
		end

create
	make

feature -- Initialisation

	make (a_cpo: C_PRIMITIVE_OBJECT)
		do
			precursor (a_cpo)
			item := a_cpo
		end

feature -- Access

	item: C_PRIMITIVE_OBJECT

feature -- Factory

	create_c_primitive_object: C_PRIMITIVE_OBJECT
		do
			Result := item
			populate_c_instance (Result)
		end

end


