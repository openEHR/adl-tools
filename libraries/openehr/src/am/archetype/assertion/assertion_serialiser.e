note
	component:   "openEHR ADL Tools"
	description: "Serialise assertions to any format"
	keywords:    "assertion"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2005- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

deferred class ASSERTION_SERIALISER

inherit
	ANY_SERIALISER

feature -- Modification

	start_assertion (a_node: ARRAYED_LIST[ASSERTION]; depth: INTEGER)
			-- start serialising an ASSERTION
		deferred
		end

	end_assertion (a_node: ARRAYED_LIST[ASSERTION]; depth: INTEGER)
			-- end serialising an ASSERTION
		deferred
		end

end


