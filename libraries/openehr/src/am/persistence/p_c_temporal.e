note
	component:   "openEHR ADL Tools"
	description: "Persistent form of C_DATE"
	keywords:    "archetype, date"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2013- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

deferred class P_C_TEMPORAL [G -> ISO8601_TYPE]

inherit
	P_C_ORDERED [G]
		redefine
			make
		end

feature -- Initialisation

	make (a_cpo: C_TEMPORAL[G])
		do
			precursor (a_cpo)
			pattern := a_cpo.pattern
		end

feature -- Access

	pattern: detachable STRING

end

