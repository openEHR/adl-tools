note
	component:   "openEHR ADL Tools"
	description: "Definitions for resource classes"
	keywords:    "resources"
	author:      "Thomas Beale"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2006-2009 Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class RESOURCE_DEFINITIONS

feature -- Definitions

	Initial_resource_lifecycle_state: STRING
		once
			Result := Resource_lifecycle_states.first
		end

	Resource_lifecycle_states: ARRAYED_LIST [STRING]
			-- list of archetype authoring lifecycle states
			-- TODO: obtain from openEHR terminology
		once
			create Result.make(0)
			Result.compare_objects
			Result.extend ("unmanaged")
			Result.extend ("initial")
			Result.extend ("in_review")
			Result.extend ("suspended")
			Result.extend ("unstable")
			Result.extend ("release_candidate")
			Result.extend ("published")
			Result.extend ("obsolete")
			Result.extend ("superseded")
			Result.extend ("deprecated")
		end

feature -- Status Report

	valid_resource_lifecycle_state (a_state: STRING): BOOLEAN
		do
			Result := Resource_lifecycle_states.has (a_state.as_lower)
		end

end


