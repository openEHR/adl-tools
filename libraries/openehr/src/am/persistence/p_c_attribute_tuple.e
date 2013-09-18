note
	component:   "openEHR ADL Tools"
	description: "Persisten form of C_ATTRIBUTE_TUPLE."
	keywords:    "AOM, ADL"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2013- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class P_C_ATTRIBUTE_TUPLE

create
	make

feature -- Initialisation

	make (a_c_attr_tuple: C_ATTRIBUTE_TUPLE)
		do
			create members.make (0)
			across a_c_attr_tuple.members as ca_csr loop
				members.extend (ca_csr.item.rm_attribute_name)
			end
		end

feature -- Access

	members: ARRAYED_LIST [STRING]

feature -- Factory

	create_c_attribute_tuple (cco_attributes: ARRAYED_LIST [C_ATTRIBUTE]): C_ATTRIBUTE_TUPLE
		do
			create Result.make
			across members as members_csr loop
				across cco_attributes as cco_attrs_csr loop
					if cco_attrs_csr.item.rm_attribute_name.same_string (members_csr.item) then
						Result.put_member (cco_attrs_csr.item)
					end
				end
			end
		end

end


