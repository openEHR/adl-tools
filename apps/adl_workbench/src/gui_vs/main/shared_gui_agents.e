note
	component:   "openEHR ADL Tools"
	description: "Shared GUI agents for use across GUI tools"
	keywords:    "AWB, archetypes, workbench"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2011 Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


class
	SHARED_GUI_AGENTS

feature -- Access

	gui_agents: GUI_AGENTS
		once
			create Result
		end

end


