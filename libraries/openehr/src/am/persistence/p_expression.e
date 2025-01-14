note
	component:   "openEHR ADL Tools"
	description: "Persistent form of EXPRESSION."
	keywords:    "persistence, ADL"
	author:      "Thomas Beale <thomas.beale@openEHR.org>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2025 openEHR International"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


deferred class P_EXPRESSION

inherit
	P_RULE_ELEMENT

feature -- Factory

	create_expression: EXPRESSION
		deferred
		end

end


