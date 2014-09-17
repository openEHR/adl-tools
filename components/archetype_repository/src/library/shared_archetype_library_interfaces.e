note
	component:   "openEHR ADL Tools"
	description: "Shared access to archetype library access objects"
	keywords:    "ADL, archetype, library"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2014- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class SHARED_ARCHETYPE_LIBRARY_INTERFACES

feature -- Access

	archetype_library_interfaces: ARCHETYPE_LIBRARY_INTERFACES
			-- loaded libraries
		once ("PROCESS")
			create Result.make
		end

end



