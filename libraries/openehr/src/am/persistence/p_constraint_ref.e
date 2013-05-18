note
	component:   "openEHR ADL Tools"
	description: "Persistent version of CONSTRAINT_REF."
	keywords:    "persistence, ADL"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2011- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class P_CONSTRAINT_REF

inherit
	P_C_OBJECT
		redefine
			make
		end

create
	make

feature -- Initialisation

	make (a_cr: CONSTRAINT_REF)
		do
			precursor (a_cr)
			target := a_cr.target
			external_reference := a_cr.external_reference
		end

feature -- Access

	target: STRING

	external_reference: detachable DV_PARSABLE

feature -- Factory

	create_constraint_ref: CONSTRAINT_REF
		do
			create Result.make (target)
			populate_c_instance (Result)
			if attached external_reference as er then
				Result.set_external_reference (er)
			end
		end

end


