note
	component:   "openEHR ADL Tools"
	description: "Persistent form of ARCHETYPE_INTERNAL_REF."
	keywords:    "persistence, ADL"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2011- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class P_C_COMPLEX_OBJECT_PROXY

inherit
	P_C_OBJECT
		redefine
			make
		end

create
	make

feature -- Initialisation

	make (a_air: C_COMPLEX_OBJECT_PROXY)
		do
			precursor (a_air)
			target_path := a_air.target_path
		end

feature -- Access

	target_path: STRING
			-- path to the referenced node

feature -- Factory

	create_c_complex_object_proxy: C_COMPLEX_OBJECT_PROXY
		do
			create Result.make (rm_type_name, node_id, target_path)
			populate_c_instance (Result)
		end

end


