note
	component:   "openEHR ADL Tools"
	description: "Serialisation profile for native CADL"
	keywords:    "test, ADL"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2003 Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


class NATIVE_CADL_SERIALISATION_PROFILE

inherit
	NATIVE_SERIALISATION_PROFILE
		redefine
			make
		end

	CADL_TOKENS
		export
			{NONE} all
		end

create
	make

feature -- Initialisation

	make (an_output_format: STRING)
			-- make with the output format name this serialiser is to be associated with
		do
			precursor (an_output_format)
			create last_string_value.make_empty
			create last_c_dv_quantity_value.default_create
		end

feature {NONE} -- Implementation

	symbols: HASH_TABLE[STRING, INTEGER]
			-- keywords in this format, keyed by logical name
		once
			create Result.make(0)
			Result.put("matches",			SYM_MATCHES)
			Result.put("occurrences",		SYM_OCCURRENCES)
			Result.put("existence",			SYM_EXISTENCE)
			Result.put("cardinality",		SYM_CARDINALITY)
			Result.put("use_node",			SYM_USE_NODE)
			Result.put("allow_archetype",		SYM_ALLOW_ARCHETYPE)
			Result.put("use_archetype",		SYM_USE_ARCHETYPE)

			Result.put("closed",			SYM_CLOSED)
			Result.put("include",			SYM_INCLUDE)
			Result.put("exclude",			SYM_EXCLUDE)

			Result.put("before",			SYM_BEFORE)
			Result.put("after",			SYM_AFTER)

			Result.put("{",				SYM_START_CBLOCK)
			Result.put("}",				SYM_END_CBLOCK)
			Result.put("*",				SYM_ANY)
		end

end


