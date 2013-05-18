note
	component:   "openEHR ADL Tools"

	description: "[
				 Model of the DCE Universal Unique Identifier or UUID which takes the 
				 form of hexadecimal integers separated by hyphens, following the pattern 
				 8-4-4-4-12 as defined by the Open Group, CDE 1.1 Remote Procedure 
				 Call specification, Appendix A. Also known as a GUID.
				 ]"
	keywords:    "universal unique identifiers, UUID, GUID"
	design:      "openEHR Support Information Model 1.5"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2006- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class UUID

inherit
	UID

create
	make, default_create

feature -- Definitions

	Default_value: STRING = "00000000-0000-0000-0000-000000000000"
			-- default UUID

	Segment_separator: CHARACTER = '-'

feature -- Status Report

	valid_id (an_id: STRING): BOOLEAN
			-- check if `an_id' is really a UUID (i.e. Guid) by checking that the string consists of
			-- the 8-4-4-4-12 pattern of segments, each a hex integer string.
		do
			Result := id_matcher.recognizes (an_id)
		end

feature {NONE} -- Implementation

	id_matcher: RX_PCRE_REGULAR_EXPRESSION
		once
			create Result.make
			Result.compile ("[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}")
		end

end



