note
	component:   "openEHR ADL Tools"
	description: "Shared access to ARCHETYPE_COMPILER"
	keywords:    "shared access, archetype compiler"
	author:      "Thomas Beale"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2007- Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class SHARED_ARCHETYPE_COMPILER

feature -- Implementation

	archetype_compiler: ARCHETYPE_COMPILER
		once ("PROCESS")
			create Result.make
		end

end



