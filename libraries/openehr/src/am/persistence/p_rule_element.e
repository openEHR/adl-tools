note
	component:   "openEHR ADL Tools"
	description: "Persistent form of RULE_ELEMENT."
	keywords:    "persistence, ADL"
	author:      "Thomas Beale <thomas.beale@openEHR.org>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2025 openEHR International"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


deferred class P_RULE_ELEMENT

feature -- Access

	type: STRING
        attribute
            create Result.make_empty
        end

end


