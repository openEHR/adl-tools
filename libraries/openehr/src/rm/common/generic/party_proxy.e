note
	component:   "openEHR ADL Tools"
	
	description: "[
				 Abstract model of party proxy, which is the idea of a proxy
				 item representing a demographic entity. It has an optional
				 reference to the entity in an external service, and subtypes
				 add various identification information which serve as a proxy
				 in case there is no external entity to reference. Subtypes of
				 this class are not intended to express anything more than
				 identification information.
				 ]"
	keywords:    "party reference"

	design:      "openEHR Common Reference Model 2.0"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2005 The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


deferred class PARTY_PROXY

feature -- Access

	external_ref: PARTY_REF	
			-- optional computable party identifier in external identity,
			-- demographic, or other service

end


