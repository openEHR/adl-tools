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
			populate_c_instance
		end

create
	make

feature -- Access

	attributes: detachable ARRAYED_LIST [P_C_ATTRIBUTE]

	attribute_tuples: detachable ARRAYED_LIST [P_C_ATTRIBUTE_TUPLE]

feature -- Modification

	add_attribute_tuple (a_p_c_attr_tuple: P_C_ATTRIBUTE_TUPLE)
		local
			attr_tuples: ARRAYED_LIST [P_C_ATTRIBUTE_TUPLE]
		do
			if attached attribute_tuples as atpl then
				attr_tuples := atpl
			else
				create attr_tuples.make (0)
				attribute_tuples := attr_tuples
			end
			attr_tuples.extend (a_p_c_attr_tuple)
		end

	add_attribute (a_p_c_attr: P_C_ATTRIBUTE)
		local
			pcattrs: ARRAYED_LIST [P_C_ATTRIBUTE]
		do
			if attached attributes as attrs then
				pcattrs := attrs
			else
				create pcattrs.make (0)
				attributes := pcattrs
			end
			pcattrs.extend (a_p_c_attr)
		end

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
			if attached attributes as attrs then
				across attrs as attrs_csr loop
					a_c_o.put_attribute (attrs_csr.item.create_c_attribute)
				end

				if attached attribute_tuples as attr_tpls then
					across attr_tpls as ca_tuples_csr loop
						ca_tuple := ca_tuples_csr.item.create_c_attribute_tuple (a_c_o.attributes)
						a_c_o.put_attribute_tuple (ca_tuple)
						ca_tuple.rebuild
					end
				end
			end
		end

end


