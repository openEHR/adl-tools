note
	component:   "openEHR ADL Tools"

	description: "[
				 Model of a reverse internet domain, as used to uniquely identify an internet domain. 
				 In the form of a dot-separated string in the reverse order of a domain name, 
				 specified by IETF RFC 1034 (http://www.ietf.org/rfc/rfc1034.txt).
				 
				 The domain name matcher is based on the following syntax from http://tools.ietf.org/html/rfc1035 (pg 7):
				 	<domain> ::= <subdomain> | " "
					<subdomain> ::= <label> | <subdomain> "." <label>
					<label> ::= <letter> [ [ <ldh-str> ] <let-dig> ]
					<ldh-str> ::= <let-dig-hyp> | <lut-dig-hyp> <ldh-str>
					<let-dig-hyp> ::= <let-dig> | "-"
					<let-dig> ::= <letter> | <digit>
					<letter> ::= any one of the 52 alphabetic characters A through Z in
					upper case and a through z in lower case
					<digit> ::= any one of the ten digits 0 through 9

				 ]"
	keywords:    "object identifiers"
	design:      "openEHR Support Model 1.5"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2006- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class INTERNET_ID

inherit
	UID

create
	make, default_create

convert
	make ({STRING}),
	as_string: {STRING}

feature -- Definitions

	Default_value: STRING = "org.openehr"

feature -- Status Report

	valid_id (an_id: STRING): BOOLEAN
			-- check if `an_id' is really a UUID (i.e. Guid) by checking that the string consists of
			-- the 8-4-4-4-12 pattern of segments, each a hex integer string.
		do
			Result := id_matcher.recognizes (an_id)
		end

feature {NONE} -- Implementation

	id_matcher: RX_PCRE_REGULAR_EXPRESSION
			-- note that we allow underscores here; this name spec follows IETF RFC 1035 + RFC 2181 modifications, which
			-- widened the character set that can be used in domain names. In any case, underscores are widely supported
			-- (although arguably not widely used)
		once
			create Result.make
			Result.compile ("([a-zA-Z][a-zA-Z\d-_]*[a-zA-Z\d]+)(\.[a-zA-Z][a-zA-Z\d-_]*[a-zA-Z\d]+)*")
		end

end

