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
			item := a_cpo.item
		end

feature -- Access

	item: detachable C_PRIMITIVE

feature -- Factory

	create_c_primitive_object: C_PRIMITIVE_OBJECT
		do
			if attached item as cp then
				create Result.make (cp)
				populate_c_instance (Result)
			else
				create Result.make_any (rm_type_name)
			end
		end

end


