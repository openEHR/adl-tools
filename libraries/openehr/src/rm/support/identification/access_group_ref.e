note
	component:   "openEHR ADL Tools"

	description: "[
			 Reference to an ACCESS_GROUP object, e.g. in an access control service
			 ]"
	keywords:    "access control reference"

	design:      "openEHR Common Reference Model 1.4.1"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2000-2004 The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


class ACCESS_GROUP_REF

inherit
	OBJECT_REF

create
	make
	
invariant
	namespace_validity: namespace.is_equal("access_control")
	type_validity: type.is_equal("ACCESS_GROUP")

end



