note
	component:   "openEHR ADL Tools"
	description: "Persistent form of C_DATE_TIME"
	keywords:    "archetype, date"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2013- The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class P_C_DATE_TIME

inherit
	P_C_TEMPORAL [ISO8601_DATE_TIME]

create
	make

feature -- Factory

	create_c_primitive_object: C_DATE_TIME
		do
			create Result.default_create
			Result.set_constraint (constraint, pattern_constraint)
			populate_c_instance (Result)
		end

end
