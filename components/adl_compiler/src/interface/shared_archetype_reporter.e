note
	component:   "openEHR ADL Tools"
	description: "Shared access to ARCHETYPE_REPORTER"
	keywords:    "shared access, archetype reporter"
	author:      "Thomas Beale"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2024- Greaphite Health"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class SHARED_ARCHETYPE_REPORTER

feature -- Implementation

	archetype_reporter: ARCHETYPE_REPORTER
		once ("PROCESS")
			create Result.make
		end

end



