note
	component:   "openEHR ADL Tools"
	description: "Class map control - Visualise a reference model class as a node map"
	keywords:    "archetype, cadl, gui"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2011 Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class
	GUI_VALIDITY_REPORT_CONTROL

inherit
	GUI_ARCHETYPE_TARGETTED_TOOL

create
	make

feature {NONE} -- Initialization

	make
		do
			-- create widgets
			create ev_root_container

			create ev_rich_text

			-- connect them together
			ev_root_container.extend (ev_rich_text)

			ev_root_container.set_data (Current)
		end

feature -- Access

	ev_root_container: EV_VERTICAL_BOX

feature {NONE} -- Implementation

	do_clear
			-- wipe out content from ontology-related controls
		do
			ev_rich_text.remove_text
		end

	do_populate
		do
			ev_rich_text.set_text (utf8_to_utf32 (source.errors.as_string))
		end

	ev_rich_text: EV_RICH_TEXT

end


