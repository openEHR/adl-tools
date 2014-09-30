note
	component:   "openEHR ADL Tools"
	description: "Status area control and logic"
	keywords:    "ADL, archetype workbench"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2011- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class GUI_CONSOLE_TOOL

inherit
	EV_SHARED_APPLICATION
		export
			{NONE} all;
			{ANY} standard_is_equal, is_deep_equal, deep_copy, deep_twin
		end

create
	make

feature {NONE} -- Initialisation

	make
		do
			create ev_console
			ev_console.set_minimum_height (200)
			ev_console.disable_edit
		end

feature -- Access

	ev_console: EV_TEXT

feature -- Commands

	append_text (a_text: STRING)
		do
			ev_console.append_text (a_text)
			ev_console.scroll_to_end
	--		ev_application.process_graphical_events
		end

	clear
		do
			ev_console.remove_text
		end

	show
			-- make visible
		do
			docking_pane.show
		end

feature -- Modification

	set_docking_pane (a_docking_pane: SD_CONTENT)
		do
			docking_pane := a_docking_pane
		end

feature {NONE} -- Implementation

	docking_pane: detachable SD_CONTENT
		note
			option: stable
		attribute
		end

end


