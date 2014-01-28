note
	component:   "openEHR ADL Tools"
	description: "Shared access to COMPILER_BILLBOARD"
	keywords:    "ADL, parser, serialiser"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.com>"
	copyright:   "Copyright (c) 2009- Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


class SHARED_COMPILER_BILLBOARD

feature {NONE} -- Implementation

	compiler_billboard: COMPILER_BILLBOARD
		once
			create Result.initialise
		end

end


