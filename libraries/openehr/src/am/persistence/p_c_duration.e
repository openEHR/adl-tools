note
	component:   "openEHR ADL Tools"
	description: "Persistent form of C_DURATION"
	keywords:    "archetype, date"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2000- The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class P_C_DURATION

inherit
	P_C_PRIMITIVE_OBJECT
		redefine
			make, populate_c_instance
		end

create
	make

feature -- Initialisation

	make (a_cpo: C_DURATION)
		do
			precursor (a_cpo)
			range := a_cpo.list
			pattern := a_cpo.pattern
		end

feature -- Access

	pattern: detachable STRING

	range: detachable ARRAYED_LIST [INTERVAL [ISO8601_DURATION]]

feature -- Factory

	create_c_primitive_object: C_DURATION
		do
			create Result.default_create
			populate_c_instance (Result)
		end

	populate_c_instance (a_c_o: C_DURATION)
		do
			precursor (a_c_o)
			a_c_o.set_constraint (range, pattern)
		end

end


