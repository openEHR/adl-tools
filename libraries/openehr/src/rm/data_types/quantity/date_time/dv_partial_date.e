note
	component:   "openEHR ADL Tools"

	description: "Implementation of DV_PARTIAL_DATE"
	keywords:    "date, time"

	requirements:"ISO 18308 TS V1.0 STR 3.8"
	design:      "openEHR Data Types Reference Model 7.3.7"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2000-2005 The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


class DV_PARTIAL_DATE

inherit
	DV_DATE
		redefine
			magnitude, as_string
		end

feature -- Access

	month_known: BOOLEAN
			-- Indicates whether month in year is known. If so, the date 
			-- is of the form y/m/?, if not, it is of the form y/?/

	magnitude: INTEGER_REF
		do
		ensure then
			Result = enclosing_interval.midpoint.magnitude
		end

	enclosing_interval: DV_INTERVAL[DV_DATE]
			-- note that midpoint is available from Result.midpoint
		do
		ensure
			month_known implies Result.lower.day = 1 and Result.upper.day = days_in_month(month, year)
			not month_known implies Result.lower.month = 1 and Result.upper.month = Months_in_year and 
				Result.lower.day = 1 and Result.upper.day = days_in_month(Months_in_year, year) 
		end

feature -- Output

	as_string: STRING
			-- Result has form “yyyy-MM-??” where MM, dd might be “??”	Result = follows ISO 8601
		do
		end

end


