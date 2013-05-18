note
	component:   "openEHR ADL Tools"

	description: "[
				 Multi-axial archetype identifier of the form:
				 		qualified_rm_entity.domain_concept.version
				 	where:
				 		qualified_rm_entity	= rm_originator-rm_name-rm_entity_name
				 		domain_concept = string name of concept, including specialised parts
				 						 separated by '-'s
				 		version = string
				 ]"
	keywords:    "archetype"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2000- The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class ARCHETYPE_ID

inherit
	RM_CONCEPT_ID

create
	make,
	make_from_string,
	make_new,
	default_create

feature -- Definitions

	Default_id: STRING = "openehr-ehr-ENTRY.any.v1"

feature {NONE} -- Implementation

	id_pattern_regex: RX_PCRE_REGULAR_EXPRESSION
			-- Pattern matcher for archetype ids.
		once
			create Result.make
			Result.compile ("^[a-zA-Z][a-zA-Z0-9_]+(-[a-zA-Z0-9_]+){2}\.[a-zA-Z][a-zA-Z0-9_]+(-[a-zA-Z][a-zA-Z0-9_]+)*\.v[0-9]+(\.[0-9]+){0,2}$")
		end

end



