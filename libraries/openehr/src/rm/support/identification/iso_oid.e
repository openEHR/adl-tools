note
	component:   "openEHR ADL Tools"

	description: "[
				 Model of ISO s Object Identifier (oid) as defined by the standard 
				 ISO/IEC 8824 . Oids are formed from integers separated by dots. 
				 Each non-leaf node in an Oid starting from the left corresponds 
				 to an assigning authority, and identifies that authority’s namespace, 
				 inside which the remaining part of the identifier is locally unique.
				 ]"
	keywords:    "unique identifiers, OID"

	design:      "openEHR Support Information Model 1.5"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2006- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class ISO_OID

inherit
	UID

create
	make, default_create

feature -- Definitions

	Default_value: STRING = "1"
			-- ISO Oid

feature -- Status Report

	valid_id (an_id: STRING): BOOLEAN
			-- check if `an_id' is really an ISO OID by checking that the string consists of
			-- only numeric sequences with interspersed '.' separators
		do
			Result := id_matcher.recognizes (an_id)
		end

feature {NONE} -- Implementation

	id_matcher: RX_PCRE_REGULAR_EXPRESSION
		once
			create Result.make
			Result.compile ("[0-9]+(\.[0-9]+)*")
		end

end



