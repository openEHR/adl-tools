note
	component:   "openEHR ADL Tools"
	description: "Shared access to archetype repositories"
	keywords:    "ADL, archetype, aom, profile"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2013- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class SHARED_ARCHETYPE_REPOSITORIES_ACCESS

feature -- Access

	archetype_repositories_access: ARCHETYPE_REPOSITORIES_ACCESS
			-- loaded repositories
		once
			create Result.make
		end

end



