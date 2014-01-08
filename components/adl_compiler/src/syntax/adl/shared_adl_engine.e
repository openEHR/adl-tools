note
	component:   "openEHR ADL Tools"
	description: "Shared access to ADL15_ENGINE"
	keywords:    "ADL, parser, serialiser"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.com>"
	copyright:   "Copyright (c) 2009- Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


class SHARED_ADL_ENGINE

feature {NONE} -- Implementation

	adl_15_engine: ADL_15_ENGINE
		once
			create Result.make
		end

	adl_14_engine: ADL_14_ENGINE
		once
			create Result.make
		end

	adl_14_15_rewriter: ADL_14_15_REWRITER
		once
			create Result.make
		end

end


