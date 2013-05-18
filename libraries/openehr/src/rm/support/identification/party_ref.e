note
	component:   "openEHR ADL Tools"
	description: "[
			 Reference to PARTY object, e.g. in a demographic service.
			 ]"
	keywords:    "Party reference"
	design:      "openEHR Common Reference Model 1.4.1"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2000- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class PARTY_REF

inherit
	OBJECT_REF

create
	make

invariant
	Type_validity: generating_type.out.is_equal ("PERSON") or
					generating_type.out.is_equal ("ORGANISATION") or
					generating_type.out.is_equal ("GROUP") or
					generating_type.out.is_equal ("AGENT")

end



