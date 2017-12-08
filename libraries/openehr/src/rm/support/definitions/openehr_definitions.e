note
	component:   "openEHR ADL Tools"
	description: "Definitions of constant values for the openEHR models"
	keywords:    "definitions"
	author:      "Thomas Beale <thomas.beale@openehr.org>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2005- The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class OPENEHR_DEFINITIONS

inherit
	BASIC_DEFINITIONS

feature -- Definitions

	Local_terminology_id: STRING = "local"
			-- predefined id of terminology to indicate it is local to
			-- the knowledge resource in which it occurs, e.g. an archetype


end


