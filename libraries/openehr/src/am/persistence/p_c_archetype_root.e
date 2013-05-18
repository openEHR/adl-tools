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
			slot_node_id := a_car.slot_node_id
		end

feature -- Access

	slot_node_id: detachable STRING
			-- record node id of slot in parent archetype that this object fills, in the case a slot exists;
			-- only set in flat form of archetype

feature -- Factory

	create_c_archetype_root: C_ARCHETYPE_ROOT
		do
			if attached slot_node_id as sni then
				create Result.make_with_slot_id (rm_type_name, node_id, sni)
			else
				create Result.make (rm_type_name, node_id)
			end
			populate_c_instance (Result)
		end

end


