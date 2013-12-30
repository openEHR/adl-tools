note
	component:   "openEHR ADL Tools"
	description: "Common routines for HTML ADL serialisation"
	keywords:    "test, ADL"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2003- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class XML_ADL_SERIALISATION_PROFILE

inherit
	ADL_15_TOKENS
		export
			{NONE} all
		end

	XML_SERIALISATION_PROFILE
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
			Result.put("archetype",		SYM_ARCHETYPE)
			Result.put("template",		SYM_TEMPLATE)
			Result.put("template_overlay",		SYM_TEMPLATE_OVERLAY)
			Result.put("adl_version",	SYM_ADL_VERSION)
			Result.put("controlled",	SYM_IS_CONTROLLED)
			Result.put("specialize",	SYM_SPECIALIZE)
			Result.put("description",	SYM_DESCRIPTION)
			Result.put("definition",	SYM_DEFINITION)
			Result.put("rules",		SYM_RULES)
			Result.put("terminology",	SYM_TERMINOLOGY)
			Result.put("annotations",	SYM_ANNOTATIONS)
			Result.put("component_terminologies",	SYM_COMPONENT_TERMINOLOGIES)
			Result.put("uid",	SYM_UID)
		end

	tags: HASH_TABLE[STRING, INTEGER]
			-- keywords in this format, keyed by logical name
		once
			create Result.make(0)
			Result.put("code",			TAG_CODE)
			Result.put("text",			TAG_TEXT)
		end

end


