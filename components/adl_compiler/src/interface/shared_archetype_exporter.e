note
	component:   "openEHR ADL Tools"
	description: "Shared access to ARCHETYPE_EXPORTER"
	keywords:    "shared access, archetype exporter"
	author:      "Thomas Beale"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2024- Greaphite Health"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class SHARED_ARCHETYPE_EXPORTER

feature -- Implementation

	archetype_exporter: ARCHETYPE_EXPORTER
		once ("PROCESS")
			create Result.make
		end

end



