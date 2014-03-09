note
	component:   "openEHR ADL Tools"
	description: "Relationship in terminology representing a 1:N value set"
	keywords:    "archetype, coded term"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2003-2011 Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class VALUE_SET

inherit
	TERMINOLOGY_RELATION
		rename
			make as make_generic
		end

create
	make

feature -- Initialisation

	make (an_id: STRING; a_targets: ARRAYED_LIST [STRING])
		require
			Id_valid: not an_id.is_empty
			Targets_valid: a_targets.for_all (agent (a_tc: STRING): BOOLEAN do Result := not a_tc.is_empty end)
		do
			make_generic (an_id, a_targets)
		end

feature -- Access

end
