note
	component:   "openEHR ADL Tools"
	description: "Persistent form of C_DV_QUANTITY"
	keywords:    "quantity, archetype, clinical type, ADL"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2011- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class P_C_DV_QUANTITY

inherit
	P_C_DEFINED_OBJECT
		redefine
			make
		end

create
	make

feature -- Initialisation

	make (a_c_dvq: C_DV_QUANTITY)
		do
			precursor (a_c_dvq)
			if attached a_c_dvq.property then
				property := a_c_dvq.property.as_string
			end
			list := a_c_dvq.list
		end

feature -- Access

	property: detachable STRING
			-- property

	list: detachable ARRAYED_LIST [C_QUANTITY_ITEM]
			-- list of items constraining magnitude/units pairs

feature -- Factory

	create_c_dv_quantity: C_DV_QUANTITY
		do
			create Result.default_create
			if attached property as p then
				Result.set_property (create {CODE_PHRASE}.make_from_string (p))
			end
			if attached list as l then
				Result.set_list (l)
			end
			populate_c_instance (Result)
		end

end

