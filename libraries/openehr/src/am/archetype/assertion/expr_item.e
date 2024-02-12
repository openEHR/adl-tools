note
	component:   "openEHR ADL Tools"
	description: "node in ADL parse tree"
	keywords:    "expression"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2003- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

deferred class EXPRESSION

inherit
	RULE_ELEMENT

feature -- Conversion

	as_string: STRING
			-- output expression as a string
		deferred
		end

end


