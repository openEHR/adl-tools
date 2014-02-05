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
			make, member_type
		end

create
	make

feature -- Initialisation

	make
		do
			precursor
			create tuples.make (0)
		end

feature -- Access

	tuples: ARRAYED_LIST [C_PRIMITIVE_TUPLE]

	member_type: detachable C_ATTRIBUTE

	tuple_count: INTEGER
			-- number of actual tuples. determined by looking at first child of first C_ATTRIBUTE and
			-- obtaining its count
		do
			Result := tuples.count
		end

	i_th_tuple (i: INTEGER): C_PRIMITIVE_TUPLE
		require
			i_in_range: i > 0 and i <= tuples.count
		do
			Result := tuples.i_th (i)
		end

feature -- Status Report

	has_attribute (an_attr_name: STRING): BOOLEAN
			-- True if this tuple constrains an attribute called `an_attr_name'
		do
			Result := across members as ca_csr some ca_csr.item.rm_attribute_name.same_string (an_attr_name) end
		end

feature -- Comparison

	c_conforms_to (other: like Current; rm_type_conformance_checker: FUNCTION [ANY, TUPLE [STRING, STRING], BOOLEAN]): BOOLEAN
			-- True if this node is a subset of, or the same as `other'
		do
			Result := across tuples as tuple_csr all
				across other.tuples as other_tuple_csr some tuple_csr.item.c_conforms_to (other_tuple_csr.item, rm_type_conformance_checker) end
			end
		end

	c_equal (other: like Current): BOOLEAN
			-- True if Current and `other' are semantically the same
		do
			Result := across tuples as tuple_csr all
				across other.tuples as other_tuple_csr some tuple_csr.item.c_equal (other_tuple_csr.item) end
			end
		end

feature -- Modification

	put_tuple (a_tuple: C_PRIMITIVE_TUPLE)
		do
			tuples.extend (a_tuple)
		end

	add_tuple
		do
			tuples.extend (create {C_PRIMITIVE_TUPLE}.make)
		end

feature -- Commands

	rebuild
			-- after materialisation from an object dump, regenerate `tuples' from `members' (the C_ATTRIBUTEs in the tuple)
		local
			i: INTEGER
		do
			create tuples.make (0)
			from i := 1 until i > members.first.child_count	loop
				add_tuple
				across members as c_attr_csr loop
					if attached {C_PRIMITIVE_OBJECT} c_attr_csr.item.children.i_th (i) as cpo then
						tuples.last.put_member (cpo)
					end
				end
			end
		end

end


