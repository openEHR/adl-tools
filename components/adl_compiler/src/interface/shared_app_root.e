note
	component:   "openEHR ADL Tools"
	description: "Shared access to application root object"
	keywords:    "application, ADL"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2010-2012 Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class SHARED_APP_ROOT

inherit
	SHARED_ARCHETYPE_COMPILER

	SHARED_ARCHETYPE_SERIALISERS

	SHARED_ARCHETYPE_CATALOGUES

feature -- Access

	app_root: APP_ROOT
		once
			create Result
		end

end



