note
	component:   "openEHR ADL Tools"
	description: "Persistent form of C_ARCHETYPE_ROOT."
	keywords:    "persistence, ADL"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2011- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class P_C_ARCHETYPE_ROOT

inherit
	P_C_COMPLEX_OBJECT
		redefine
			make
		end

create
	make

feature -- Initialisation

	make (a_car: C_ARCHETYPE_ROOT)
		do
			precursor (a_car)
			archetype_ref := a_car.archetype_ref
		end

feature -- Access

	archetype_ref: STRING
			-- record node id of slot in parent archetype that this object fills, in the case a slot exists;
			-- only set in flat form of archetype

feature -- Factory

	create_c_archetype_root: C_ARCHETYPE_ROOT
		do
			create Result.make (rm_type_name, node_id, archetype_ref)
			populate_c_instance (Result)
		end

end


