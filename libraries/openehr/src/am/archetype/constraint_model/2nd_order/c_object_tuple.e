note
	component:   "openEHR ADL Tools"
	description: "[
				 Second order constraint representing a tuple of C_OBJECT constraints,
				 under a C_ATTRIBUTE_TUPLE.
				 ]"
	keywords:    "test, ADL"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2013- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class C_OBJECT_TUPLE

inherit
	C_2ND_ORDER
		redefine
			member_type
		end

create
	make

feature -- Access

	member_type: detachable C_PRIMITIVE_OBJECT

end


