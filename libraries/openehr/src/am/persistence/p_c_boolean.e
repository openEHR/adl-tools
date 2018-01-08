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
			make, assumed_value, populate_c_instance
		end

create
	make

feature -- Initialisation

	make (a_cpo: C_BOOLEAN)
		do
			precursor (a_cpo)
			if not a_cpo.any_allowed then
				constraint := a_cpo.constraint
			end
		end

feature -- Access

	constraint: detachable ARRAYED_LIST [BOOLEAN]

    assumed_value: BOOLEAN_REF
    		-- FIXME: only needed because 7.3 compiler fails to correctly infer type from predecessor

feature -- Factory

	create_c_primitive_object: C_BOOLEAN
		do
			create Result.default_create
			populate_c_instance (Result)
		end

	populate_c_instance (a_c_o: C_BOOLEAN)
		do
			if attached constraint as att_c then
				a_c_o.set_constraint (att_c)
			end
			precursor (a_c_o)
		end

end


