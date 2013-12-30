note
	component:   "openEHR ADL Tools"
	description: "Common routines for HTML assertion serialisation"
	keywords:    "assertion"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2005 Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


class HTML_ASSERTION_SERIALISATION_PROFILE

inherit
	HTML_SERIALISATION_PROFILE

	CADL_15_TOKENS
		export
			{NONE} all
		end

create
	make

feature {NONE} -- Implementation

	symbols: HASH_TABLE[STRING, INTEGER]
			-- keywords in this format, keyed by logical name
		once
			create Result.make(0)
			Result.put("&isin;",			SYM_MATCHES)
			Result.put("{",				SYM_START_CBLOCK)
			Result.put("}",				SYM_END_CBLOCK)
			Result.put("*",				SYM_ANY)
		end

end


