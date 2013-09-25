note
	component:   "openEHR ADL Tools"
	description: "Constrainer type for instances of REAL"
	keywords:    "archetype, real"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2000- The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class C_REAL

inherit
	C_ORDERED [REAL]
		redefine
			valid_value, set_assumed_value, format_value
		end

create
	make_interval, make_list_simple, make_list, make_simple, default_create

feature -- Status Report

	valid_value (a_value: REAL): BOOLEAN
    		-- FIXME: only needed because 7.3 compiler fails to correctly infer type from predecessor
		do
			Result := precursor (a_value)
		end

feature -- Modification

	set_assumed_value (a_value: REAL)
    		-- FIXME: only needed because 7.3 compiler fails to correctly infer type from predecessor
		do
			assumed_value := a_value
		end

feature -- Conversion

	format_value (a_val: REAL): STRING
		do
			Result := format_real (a_val)
		end

end


