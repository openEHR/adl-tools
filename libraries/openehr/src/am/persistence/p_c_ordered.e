note
	component:   "openEHR ADL Tools"
	description: "Persistent form of any C_COMPARABLE"
	keywords:    "archetype, comparable, persistence"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2013- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

deferred class P_C_ORDERED [G->COMPARABLE]

inherit
	P_C_PRIMITIVE_OBJECT
		redefine
			make
		end

feature -- Initialisation

	make (a_cc: C_ORDERED [G])
		do
			precursor (a_cc)
			if not a_cc.tuple_constraint.is_empty then
				tuple_constraint := a_cc.tuple_constraint
			end
		end

feature -- Access

	tuple_constraint: detachable ARRAYED_LIST [ARRAYED_LIST [INTERVAL [G]]]

end
