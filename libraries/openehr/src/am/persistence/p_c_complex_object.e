note
	component:   "openEHR ADL Tools"
	description: "Persistent form of C_COMPLEX_OBJECT"
	keywords:    "persistence, ADL"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2011- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class P_C_COMPLEX_OBJECT

inherit
	P_C_DEFINED_OBJECT
		redefine
			make, populate_c_instance
		end

create
	make

feature -- Initialisation

	make (a_cco: C_COMPLEX_OBJECT)
		do
			precursor (a_cco)
			if a_cco.has_attributes then
				create attributes.make (0)
				across a_cco.attributes as ca_csr loop
					attributes.extend (create {P_C_ATTRIBUTE}.make (ca_csr.item))
				end
			end
		end

feature -- Access

	attributes: detachable ARRAYED_LIST [P_C_ATTRIBUTE]

feature -- Factory

	create_c_complex_object: C_COMPLEX_OBJECT
		do
			if attached node_id as nid then
				create Result.make_identified (rm_type_name, nid)
			else
				create Result.make_anonymous (rm_type_name)
			end
			populate_c_instance (Result)
		end

	populate_c_instance (a_c_o: C_COMPLEX_OBJECT)
			-- populate fields not already populated from creation of a C_XXX instance
		do
			precursor (a_c_o)
			if attached attributes then
				across attributes as attrs_csr loop
					a_c_o.put_attribute (attrs_csr.item.create_c_attribute)
				end
			end
		end

end


