note
	component:   "openEHR ADL Tools"
	description: "[
			 Shared access to ARCHETYPE_PARSER.
			 ]"
	keywords:    "C wrapper"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2004 Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


class SHARED_ARCHETYPE_PARSER

inherit
	SHARED_APPLICATION_CONTEXT

feature {NONE} -- Implementation

	archetype_parser: ARCHETYPE_PARSER
		once
			create Result
		end

end



