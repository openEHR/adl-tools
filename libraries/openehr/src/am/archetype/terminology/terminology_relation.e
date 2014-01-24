note
	component:   "openEHR ADL Tools"
	description: "General concept of a terminology relationship"
	keywords:    "archetype, coded term"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2003-2011 Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class TERMINOLOGY_RELATION

inherit
	ADL_15_TERM_CODE_TOOLS
		export
			{NONE} all;
			{ANY} is_qualified_codestring, is_deep_equal, standard_is_equal, deep_twin
		end

create
	make

feature -- Initialisation

	make (an_origin: STRING; a_targets: ARRAYED_LIST [STRING])
		require
			Origin_valid: not an_origin.is_empty
			Targets_valid: a_targets.for_all (agent (a_tc: STRING): BOOLEAN do Result := not a_tc.is_empty end)
		do
			create origin.make_from_string (an_origin)
			targets := a_targets
		end

feature -- Access

	origin: STRING

	targets: ARRAYED_LIST [STRING]

feature -- Modification

	set_origin (an_origin: STRING)
		require
			Origin_valid: not an_origin.is_empty
		do
			create origin.make_from_string (an_origin)
		end

end


