note
	component:   "openEHR ADL Tools"
	description: "[
				 Multi-axial template identifier of the form:
				 		qualified_rm_entity.domain_concept.version
				 	where:
				 		qualified_rm_entity	= rm_originator-rm_name-rm_entity_name
				 		domain_concept = string name of concept, including specialised parts
				 						 separated by '-'s
				 		version = string
				 ]"
	keywords:    "archetype"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.com>"
	copyright:   "Copyright (c) 2008 The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class TEMPLATE_ID

inherit
	RM_CONCEPT_ID

create
	make,
	make_from_string,
	default_create

feature -- Definitions

	Default_id: STRING = "openehr-ehr-COMPOSITION.any.v1"

feature -- Access


feature {NONE} -- Implementation

	id_pattern_regex: RX_PCRE_REGULAR_EXPRESSION
			-- Pattern matcher for archetype ids.
		once
			-- currently same as Archetype id regex, but probably needs
			-- a) front section for reverse domain name of authority
			-- b) remove the '-' sections from the middle part, since specialisation not supported in templates
			create Result.compile_case_insensitive ("^[a-zA-Z][a-zA-Z0-9_]+(-[a-zA-Z][a-zA-Z0-9_]+){2}\.[a-zA-Z][a-zA-Z0-9_]+(-[a-zA-Z][a-zA-Z0-9_]+)*\.v[1-9][0-9]*$")
		end

end



