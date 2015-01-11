note
	component:   "openEHR ADL Tools"
	description: "Parsed structure for TEMPLATE"
	keywords:    "ADL, parsing"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2015- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class PARSED_TEMPLATE

inherit 
	PARSED_AUTHORED_ARCHETYPE
		redefine
			make, reset
		end

create
	make

feature -- Initialization

	make
			-- Create a new Eiffel parser.
		do
			precursor
			create overlays.make (0)
		end

	reset
		do
			precursor
			overlays.wipe_out
		end

feature -- Parse Output

	overlays: ARRAYED_LIST [PARSED_ARCHETYPE]

feature -- Modification 

	add_overlay (an_overlay: PARSED_ARCHETYPE)
		do
			overlays.extend (an_overlay)
		end

end
