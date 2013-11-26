note
	component:   "openEHR ADL Tools"
	description: "[
				 Second order constraint representing a tuple form of a C_ATTRIBUTE.
				 ]"
	keywords:    "AOM, ADL"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2013- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class C_ATTRIBUTE_TUPLE

inherit
	C_2ND_ORDER
		redefine
			member_type
		end

create
	make

feature -- Access

	member_type: detachable C_ATTRIBUTE

	tuple_count: INTEGER
			-- number of actual tuples. determined by looking at first child of first C_ATTRIBUTE and
			-- obtaining its count
		do
			if not members.is_empty and then i_th_member (1).has_children and then
				attached {C_PRIMITIVE_OBJECT} i_th_member (1).children.first as cpo
			then
				Result := cpo.list_count
			end
		end

feature -- Status Report

	has_attribute (an_attr_name: STRING): BOOLEAN
			-- True if this tuple constrains an attribute called `an_attr_name'
		do
			Result := across members as ca_csr some ca_csr.item.rm_attribute_name.same_string (an_attr_name) end
		end

end


