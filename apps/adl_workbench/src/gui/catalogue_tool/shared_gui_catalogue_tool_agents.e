note
	component:   "openEHR ADL Tools"
	description: "Shared agents for use across GUI catalogue tool"
	keywords:    "AWB, archetypes, workbench"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2012 Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class SHARED_GUI_CATALOGUE_TOOL_AGENTS

feature -- Access

	tool_agents: GUI_CATALOGUE_TOOL_AGENTS
		once
			create Result
		end

end


