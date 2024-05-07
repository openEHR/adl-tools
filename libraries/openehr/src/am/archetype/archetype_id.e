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
	support:     "Ocean Informatics <support@OceanInformatics.com>"
	copyright:   "Copyright (c) 2000- The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class ARCHETYPE_ID

inherit
	OBJECT_ID

create
	make_from_string

feature -- Definitions

	Default_id: STRING = "openehr-ehr-ENTRY.any.v1"

feature -- Status Report

	valid_id (an_id: STRING): BOOLEAN
			--
		local
			arch_hrid: ARCHETYPE_HRID
		do
			create arch_hrid.default_create
			Result := arch_hrid.valid_adl2_id (an_id)
		end

feature {NONE} -- Implementation

	id_pattern_regex: RX_PCRE_REGULAR_EXPRESSION
			-- Pattern matcher for archetype ids.
		once
			create Result.make
			Result.compile ("^[a-zA-Z][a-zA-Z0-9_]+(-[a-zA-Z0-9_]+){2}\.[a-zA-Z][a-zA-Z0-9_]+(-[a-zA-Z][a-zA-Z0-9_]+)*\.v[0-9]+(\.[0-9]+){0,2}$")
		end

end



