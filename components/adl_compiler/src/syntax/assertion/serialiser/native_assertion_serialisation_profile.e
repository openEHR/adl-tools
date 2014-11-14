note
	component:   "openEHR ADL Tools"
	description: "Serialisation profile for native syntax form of assertion"
	keywords:    "assertion"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2005 Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


class NATIVE_ASSERTION_SERIALISATION_PROFILE

inherit
	NATIVE_SERIALISATION_PROFILE

	CADL_2_TOKENS
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
			Result.put("matches",			SYM_MATCHES)
			Result.put("{",				SYM_START_CBLOCK)
			Result.put("}",				SYM_END_CBLOCK)
			Result.put("*",				SYM_ANY)
		end

end


