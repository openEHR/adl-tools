note
	component:   "openEHR ADL Tools"
	description: "Common things for all SML archetypes"
	keywords:    "test, ADL"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2003, 2004 Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


deferred class C_COMMON

feature -- Access

	default_occurrences: MULTIPLICITY_INTERVAL
			-- default object occurrences object representing 1..1
		once
			create Result.make_mandatory
		ensure
			Result_exists: Result /= Void
		end

	default_existence: MULTIPLICITY_INTERVAL
			-- default property existence object representing 0..1
		once
			create Result.make_optional
		ensure
			Result_exists: Result /= Void
		end

end


