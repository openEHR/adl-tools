note
	component:   "openEHR ADL Tools"
	description: "Persistent form of archetype used for standard serialisations"
	keywords:    "archetype, persistence"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2011- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class P_TEMPLATE_OVERLAY

inherit
	P_ARCHETYPE
		redefine
			artefact_class_type
		end

create
	make, make_dt

feature {NONE} -- Implementation

	artefact_class_type: TEMPLATE_OVERLAY
		do
			create Result
		end

end

