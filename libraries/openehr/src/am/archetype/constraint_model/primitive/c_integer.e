note
	component:   "openEHR ADL Tools"
	description: "Constrainer type for instances of INTEGER"
	keywords:    "archetype, integer"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2000- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class C_INTEGER

inherit
	C_ORDERED [INTEGER]
		redefine
			assumed_value
		end

create
	make, make_interval, make_value, make_value_list, default_create

feature -- Access

    assumed_value: detachable INTEGER_REF
            -- value to be assumed if none sent in data

feature -- Status Report

	valid_assumed_value (a_value: INTEGER_REF): BOOLEAN
		do
			Result := valid_value (a_value.item)
		end

end


