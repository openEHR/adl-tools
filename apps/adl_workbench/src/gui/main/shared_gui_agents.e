note
	component:   "openEHR ADL Tools"
	description: "Shared GUI agents for use across GUI tools"
	keywords:    "AWB, archetypes, workbench"
	author:      "Thomas Beale <thomas.beale@openehr.org>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2011- The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class
	SHARED_GUI_AGENTS

feature -- Access

	gui_agents: GUI_AGENTS
		once ("PROCESS")
			create Result
		end

end


