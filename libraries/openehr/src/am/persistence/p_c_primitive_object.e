note
	component:   "openEHR ADL Tools"
	description: "Persistent form of C_PRIMITIVE_OBJECT."
	keywords:    "persistence, ADL"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2011- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

deferred class P_C_PRIMITIVE_OBJECT

inherit
	P_C_DEFINED_OBJECT
		redefine
			make, populate_c_instance
		end

feature -- Initialisation

	make (a_c_do: C_PRIMITIVE_OBJECT)
		do
			precursor (a_c_do)
			assumed_value := a_c_do.assumed_value
			is_enumerated_type_constraint := a_c_do.is_enumerated_type_constraint
		end

feature -- Access

    assumed_value: detachable ANY
            -- value to be assumed if none sent in data

feature -- Status Report

	is_enumerated_type_constraint: BOOLEAN

feature -- Factory

	create_c_primitive_object: C_PRIMITIVE_OBJECT
		deferred
		end

	populate_c_instance (a_c_o: C_PRIMITIVE_OBJECT)
			-- populate fields not already populated from creation of a C_XXX instance
		do
			precursor (a_c_o)
			if attached assumed_value as av then
				a_c_o.set_assumed_value (av)
			end
			if is_enumerated_type_constraint then
				a_c_o.set_enumerated_type_constraint
			end
		end

end


