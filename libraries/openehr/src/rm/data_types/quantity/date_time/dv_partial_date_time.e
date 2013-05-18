note
	component:   "openEHR ADL Tools"

	description: "Implementation of DV_PARTIAL_DATE_TIME"
	keywords:    "date, time"

	requirements:"ISO 18308 TS V1.0 STR 3.8"
	design:      "openEHR Data Types Reference Model 1.8"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2000-2004 The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


class DV_PARTIAL_DATE_TIME

inherit
	DV_DATE_TIME
		redefine
			magnitude, as_string
		end

feature -- Access

	month_known: BOOLEAN	
			-- Indicates whether month in year is known.

	day_known: BOOLEAN	
			-- Indicates whether day in month is known.

	hour_known: BOOLEAN	
			-- Indicates whether hour in day is known.

	minute_known: BOOLEAN	
			-- Indicates whether minute in hour is known.

	magnitude: DOUBLE_REF	
			-- canonical value of enclosing_interval.midpoint.
		do
		ensure then
			Result = enclosing_interval.midpoint.magnitude
		end

	enclosing_interval: DV_INTERVAL[DV_DATE_TIME]
		do
		end

feature -- Output

	as_string: STRING
			-- Result has form “yyyy-MM-dd hh:mm:??” where MM, dd, hh and mm might be “??”	Result = follows ISO 8601
		do
		end

invariant
	Month_known_validity: not month_known implies not day_known
	Day_known_validity: not day_known implies not hour_known
	Hour_known_validity: not hour_known implies not minute_known
	Enclosing_interval: month_known implies enclosing_interval.lower.day = 1 and 
		enclosing_interval.upper.day = days_in_month(month, year) and 
		not month_known implies enclosing_interval.lower.month = 1 and 
		enclosing_interval.upper.month = Months_in_year and 
		enclosing_interval.lower.day = 1 and 
		enclosing_interval.upper.day = days_in_month(Months_in_year, year) and
		minute_known implies enclosing_interval.lower.second = 1 and 
		enclosing_interval.upper.second = Seconds_in_minute and
		not minute_known implies enclosing_interval.lower.minute = 1 and 
		enclosing_interval.upper.minute = Minutes_in_hour and 
		enclosing_interval.lower.second = 1 and 
		enclosing_interval.upper.second = Seconds_in_minute	

end


