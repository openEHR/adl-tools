note
	component:   "openEHR ADL Tools"
	description: "Persistent form of archetype used for standard serialisations"
	keywords:    "archetype, persistence"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2011- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class P_TEMPLATE

inherit
	P_AUTHORED_ARCHETYPE
		redefine
			make, artefact_class_type, create_archetype
		end

create
	make, make_dt

feature -- Initialisation

	make (an_archetype: like artefact_class_type)
		do
			precursor (an_archetype)
			overlays :=  an_archetype.overlays
		end

feature -- Access

	overlays: detachable ARRAYED_LIST [STRING]

feature -- Factory

	create_archetype: detachable like artefact_class_type
		do
			Result := precursor
			if attached Result as att_p_tpl and attached overlays as att_overlays then
				att_p_tpl.set_overlays (att_overlays)
			end
		end

feature {NONE} -- Implementation

	artefact_class_type: TEMPLATE
		do
			create Result
		end

end

