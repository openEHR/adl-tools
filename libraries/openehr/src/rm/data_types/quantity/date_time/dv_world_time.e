note
	component:   "openEHR ADL Tools"

	description: "[
			 Date/times on the real world timeline, i.e. relative to both a temporal 
			 origin and a geographical location on the planet earth.
			 ]"
	keywords:    "date, time"

	requirements:"ISO 18308 TS V1.0 STR 3.7"
	design:      "openEHR Data Types Reference Model 1.7"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2000-2004 The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


deferred class DV_WORLD_TIME

inherit
	DV_QUANTITY

	DATE_TIME_CONSTANTS
		undefine
			is_equal,
			default_create
		end

feature -- Access

	Min_timezone: DV_DURATION
		once
			create Result.make_definite(0, 12, 0, 0)
			Result := -Result
		ensure
			Result.as_string.is_equal("-12:00:00")
		end

	Max_timezone: DV_DURATION
		once
			create Result.make_definite(0, 12, 0, 0)
		ensure
			Result.as_string.is_equal("12:00:00")
		end

	timezone: DV_DURATION
			-- offset from Universal Coordinated Time, in the range -1200 - +1200
			-- (note that this can affect the date even if no time is recorded).

invariant
	timezone_valid: timezone /= Void and then (timezone >= Min_timezone and timezone <= Max_timezone)

end


