note
	component:   "openEHR ADL Tools"
	description: "[
				 Shared access to AOM profiles
				 ]"
	keywords:    "ADL, archetype, aom, profile"
	author:      "Thomas Beale <thomas.beale@openehr.org>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2013- The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class SHARED_AOM_PROFILES_ACCESS

feature -- Access

	aom_profiles_access: AOM_PROFILES_ACCESS
			-- loaded profiles
		once ("PROCESS")
			create Result.make
		end

end



