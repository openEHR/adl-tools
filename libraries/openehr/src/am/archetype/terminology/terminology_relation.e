note
	component:   "openEHR ADL Tools"
	description: "General concept of a terminology relationship"
	keywords:    "archetype, coded term"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2003- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
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

	make (an_origin: STRING; a_members: ARRAYED_LIST [STRING])
		require
			Origin_valid: not an_origin.is_empty
			Members_valid: a_members.for_all (agent (a_tc: STRING): BOOLEAN do Result := not a_tc.is_empty end)
		do
			create origin.make_from_string (an_origin)
			create members.make (0)
			members.compare_objects
			members.append (a_members)
		ensure
			Members_comparable: members.object_comparison
		end

feature -- Access

	origin: STRING

	members: ARRAYED_LIST [STRING]

feature -- Status Report

	has_member_code (a_code: STRING): BOOLEAN
			-- True if `members' has `a_code'
		do
			Result := members.has (a_code)
		end

feature -- Modification

	set_origin (an_origin: STRING)
		require
			Origin_valid: not an_origin.is_empty
		do
			create origin.make_from_string (an_origin)
		end

feature {AOM_POST_PARSE_PROCESSOR} -- Modification

	replace_member_code (old_code, new_code: STRING)
		require
			has_member_code (old_code)
		do
			members.go_i_th (members.index_of (old_code, 1))
			members.replace (new_code)
		end

end
