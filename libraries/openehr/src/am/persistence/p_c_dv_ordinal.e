note
	component:   "openEHR ADL Tools"
	description: "Persistent form of C_DV_ORDINAL"
	keywords:    "ordinal, ADL"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2011- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class P_C_DV_ORDINAL

inherit
	P_C_DEFINED_OBJECT
		redefine
			make
		end

create
	make

feature -- Initiaisation

	make (a_c_dvo: C_DV_ORDINAL)
		do
			precursor (a_c_dvo)
			if attached a_c_dvo.items as dvoi then
				create items.make (0)
				items.append (dvoi)
			end
		end

feature -- Access

	items: detachable ARRAYED_LIST [ORDINAL]

feature -- Factory

	create_c_dv_ordinal: C_DV_ORDINAL
		do
			create Result.default_create
			if attached items as i then
				Result.set_items (i)
			end
			populate_c_instance (Result)
		end

end


