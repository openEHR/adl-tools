note
	component:   "openEHR ADL Tools"
	description: "Shared agents for use across GUI library tool"
	keywords:    "AWB, archetypes, workbench"
	author:      "Thomas Beale <thomas.beale@openehr.org>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2012- The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class SHARED_GUI_LIBRARY_TOOL_AGENTS

feature -- Access

	library_tool_agents: GUI_LIBRARY_TOOL_AGENTS
		once
			create Result
		end

end


