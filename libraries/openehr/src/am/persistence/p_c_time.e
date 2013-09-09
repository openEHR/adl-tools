note
	component:   "openEHR ADL Tools"
	description: "Persistent form of C_TIME"
	keywords:    "archetype, time"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2000- The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class P_C_TIME

inherit
	P_C_PRIMITIVE_OBJECT
		redefine
			make, populate_c_instance
		end

create
	make

feature -- Initialisation

	make (a_cpo: C_TIME)
		do
			precursor (a_cpo)
			range := a_cpo.range
			pattern := a_cpo.pattern
		end

feature -- Access

	range: detachable INTERVAL [ISO8601_TIME]

	pattern: detachable STRING

feature -- Factory

	create_c_primitive_object: C_TIME
		do
			create Result.default_create
			populate_c_instance (Result)
		end

	populate_c_instance (a_c_o: C_TIME)
		do
			precursor (a_c_o)
			a_c_o.set_constraint (range, pattern)
		end

end


