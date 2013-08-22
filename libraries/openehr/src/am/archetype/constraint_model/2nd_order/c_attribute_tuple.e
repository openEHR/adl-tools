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
			member_type, make
		end

create
	make

feature -- Initialisation

	make
		do
			precursor
			create children.make (0)
		end

feature -- Access

	member_type: detachable C_ATTRIBUTE

	children: ARRAYED_LIST [C_OBJECT_TUPLE]

	i_th_child (i: INTEGER): C_OBJECT_TUPLE
		require
			i_in_range: i > 0 and i <= children.count
		do
			Result := children.i_th (i)
		end

	last_child: C_OBJECT_TUPLE
		do
			Result := children.last
		end

feature -- Status report

feature -- Comparison

feature -- Modification

	put_child (a_child: C_OBJECT_TUPLE)
		do
			children.extend (a_child)
		end

end


