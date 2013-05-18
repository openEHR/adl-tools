note
	component:   "openEHR ADL Tools"

	description: "[
			 Interface to content objects which are locatable - i.e. organisers
			 and items.
			 ]"
	keywords:    "locator, locatable"

	requirements:"ISO 18308 TS V1.0 ???"
	design:      "openEHR EHR Reference Model 4.1"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2000-2004 The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


deferred class CONTENT_ITEM

inherit
	LOCATABLE
	
end


