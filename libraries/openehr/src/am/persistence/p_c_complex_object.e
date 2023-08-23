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
		local
			p_c_attr_tuples: ARRAYED_LIST [P_C_ATTRIBUTE_TUPLE]
			p_c_attr_list: ARRAYED_LIST [P_C_ATTRIBUTE]
		do
			precursor (a_cco)
			if a_cco.has_attributes then
				create p_c_attr_list.make (0)
				attributes := p_c_attr_list
				across a_cco.attributes as ca_csr loop
					p_c_attr_list.extend (create {P_C_ATTRIBUTE}.make (ca_csr.item))
				end

				if attached a_cco.attribute_tuples as att_attr_tuples then
					create p_c_attr_tuples.make (0)
					across att_attr_tuples as ca_tuple_csr loop
						p_c_attr_tuples.extend (create {P_C_ATTRIBUTE_TUPLE}.make (ca_tuple_csr.item))
					end
					attribute_tuples := p_c_attr_tuples
				end
			end
		end

feature -- Access

	attributes: detachable ARRAYED_LIST [P_C_ATTRIBUTE]

	attribute_tuples: detachable ARRAYED_LIST [P_C_ATTRIBUTE_TUPLE]

feature -- Factory

	create_c_complex_object: C_COMPLEX_OBJECT
		do
			create Result.make (rm_type_name, node_id)
			populate_c_instance (Result)
		end

	populate_c_instance (a_c_o: C_COMPLEX_OBJECT)
			-- populate fields not already populated from creation of a C_XXX instance
		local
			ca_tuple: C_ATTRIBUTE_TUPLE
		do
			precursor (a_c_o)
			if attached attributes then
				across attributes as attrs_csr loop
					a_c_o.put_attribute (attrs_csr.item.create_c_attribute)
				end

				if attached attribute_tuples then
					across attribute_tuples as ca_tuples_csr loop
						ca_tuple := ca_tuples_csr.item.create_c_attribute_tuple (a_c_o.attributes)
						a_c_o.put_attribute_tuple (ca_tuple)
						ca_tuple.rebuild
					end
				end
			end
		end

end


