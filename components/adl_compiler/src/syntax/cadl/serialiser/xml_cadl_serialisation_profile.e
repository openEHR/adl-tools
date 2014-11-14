note
	component:   "openEHR ADL Tools"
	description: "Common routines for XML ADL serialisation"
	keywords:    "test, ADL"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2003 Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


class XML_CADL_SERIALISATION_PROFILE

inherit
	XML_SERIALISATION_PROFILE

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
			Result.put("&isin;",			SYM_MATCHES)
			Result.put("occurrences",		SYM_OCCURRENCES)
			Result.put("existence",			SYM_EXISTENCE)
			Result.put("cardinality",		SYM_CARDINALITY)
			Result.put("use_node",			SYM_USE_NODE)
			Result.put("allow_archetype",	SYM_ALLOW_ARCHETYPE)

			Result.put("include",			SYM_INCLUDE)
			Result.put("exclude",			SYM_EXCLUDE)

			Result.put("{",					SYM_START_CBLOCK)
			Result.put("}",					SYM_END_CBLOCK)
			Result.put("*",					SYM_ANY)
			Result.put("invariant",			SYM_INVARIANT)
		end

	tags: HASH_TABLE[STRING, INTEGER]
			-- keywords in this format, keyed by logical name
		once
			create Result.make(0)
			Result.put("node",			TAG_NODE)
			Result.put("type",			TAG_NODE_TYPE)
			Result.put("rm_class",		TAG_NODE_RM_CLASS)
			Result.put("id",			TAG_NODE_ID)
			Result.put("level",			TAG_NODE_LEVEL)
			Result.put("parent",		TAG_NODE_PARENT)
			Result.put("child",			TAG_NODE_CHILD)
			Result.put("tag",			TAG_INVARIANT_TAG)
			Result.put("item",			TAG_ITEM)
			Result.put("code",			TAG_CODE)
			Result.put("text",			TAG_TEXT)
		end

end


