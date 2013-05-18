note
	component:   "openEHR ADL Tools"
	description: "Persistent form of ARCHETYPE_INTERNAL_REF."
	keywords:    "persistence, ADL"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2011- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class P_ARCHETYPE_INTERNAL_REF

inherit
	P_C_OBJECT
		redefine
			make
		end

create
	make

feature -- Initialisation

	make (a_air: ARCHETYPE_INTERNAL_REF)
		do
			precursor (a_air)
			target_path := a_air.target_path
		end

feature -- Access

	target_path: STRING
			-- path to the referenced node

feature -- Factory

	create_archetype_internal_ref: ARCHETYPE_INTERNAL_REF
		do
			create Result.make (rm_type_name, target_path)
			if attached node_id as nid then
				Result.set_node_id (nid)
			end
			populate_c_instance (Result)
		end

end


