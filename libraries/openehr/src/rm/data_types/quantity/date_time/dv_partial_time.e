note
	component:   "openEHR ADL Tools"

	description: "Implementation of DV_PARTIAL_TIME"
	keywords:    "time"

	requirements:"ISO 18308 TS V1.0 STR 3.8"
	design:      "openEHR Data Types Reference Model 1.7"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2000-2004 The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


class DV_PARTIAL_TIME

inherit
	DV_TIME
		redefine
			magnitude, as_string
		end

feature -- Access

	minute_known: BOOLEAN
			-- Indicates whether minute in hour is known. If so, the time
			-- is of the form y/m/?, if not, it is of the form y/?/

	magnitude: DOUBLE
		do
		ensure then
			Result = enclosing_interval.midpoint.magnitude
		end

	enclosing_interval: DV_INTERVAL[DV_TIME]
		do
		ensure
			minute_known implies Result.lower.second = 1 and Result.upper.second = seconds_in_minute
			not minute_known implies Result.lower.minute = 1 and Result.upper.minute = Minutes_in_hour and
				Result.lower.second = 1 and Result.upper.second = seconds_in_minute
		end

feature -- Output

	as_string: STRING
			-- Result has form “hh:mm:??” where mm, ss might be “??”	Result = follows ISO 8601
		do
		end

end


