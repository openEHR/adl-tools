note
	component:   "openEHR ADL Tools"
	description: "Shared CADL Factor"
	keywords:    "CADL"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2004 Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


class SHARED_C_FACTORY

feature -- Access

	constraint_model_factory: C_FACTORY
			-- access to constraint-building routines
		once
			create Result.make
		end

end


