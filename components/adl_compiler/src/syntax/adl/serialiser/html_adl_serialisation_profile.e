note
	component:   "openEHR ADL Tools"
	description: "Common routines for HTML ADL serialisation"
	keywords:    "test, ADL"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2003- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class HTML_ADL_SERIALISATION_PROFILE

inherit
	ADL_2_TOKENS
		export
			{NONE} all;
			{ANY} deep_copy, deep_twin, is_deep_equal, standard_is_equal
		end

	HTML_SERIALISATION_PROFILE
		export
			{NONE} all
		redefine
			make
		end

create
	make

feature -- Initialisation

	make (an_output_format: STRING)
			-- make with the output format name this serialiser is to be associated with
		do
			precursor (an_output_format)
			create last_string_value.make_empty
		end

feature {NONE} -- Implementation

	symbols: HASH_TABLE[STRING, INTEGER]
			-- keywords in this format, keyed by logical name
		once
			create Result.make(0)
			Result.put("archetype",		SYM_ARCHETYPE)
			Result.put("template",		SYM_TEMPLATE)
			Result.put("template_overlay",		SYM_TEMPLATE_OVERLAY)
			Result.put("adl_version",	SYM_ADL_VERSION)
			Result.put("rm_release",	SYM_RM_RELEASE)
			Result.put("controlled",	SYM_IS_CONTROLLED)
			Result.put("generated",	    SYM_IS_GENERATED)
			Result.put("specialize",	SYM_SPECIALIZE)
			Result.put("language",		SYM_LANGUAGE)
			Result.put("description",	SYM_DESCRIPTION)
			Result.put("definition",	SYM_DEFINITION)
			Result.put("rules",		SYM_RULES)
			Result.put("terminology",		SYM_TERMINOLOGY)
			Result.put("annotations",	SYM_ANNOTATIONS)
			Result.put("component_terminologies",	SYM_COMPONENT_TERMINOLOGIES)
			Result.put("uid",	SYM_UID)
			Result.put("build_uid",	SYM_BUILD_UID)
		end

end


