note
	description: "[
				International locale English settings; this class corrects ES's 
				US english versoin which contains the US non-standard way of 
				stringifyin dates. This version contains the international 
				standardised version from ISO8601
				]"

class
	DATE_TIME_TOOLS

inherit
	DATE_TIME_LANGUAGE_CONSTANTS

feature

	name: STRING = "English"

	days_text: ARRAY [STRING]
		once
			Result := <<
				"SUN",
				"MON",
				"TUE",
				"WED",
				"THU",
				"FRI",
				"SAT"
				
			>>
			Result.compare_objects
		end

	months_text: ARRAY [STRING]
		once
			Result := <<
				"JAN",
				"FEB",
				"MAR",
				"APR",
				"MAY",
				"JUN",
				"JUL",
				"AUG",
				"SEP",
				"OCT",
				"NOV",
				"DEC"
			>>
			Result.compare_objects
		end

	long_days_text: ARRAY [STRING]
		once
			Result := <<
				"SUNDAY",
				"MONDAY",
				"TUESDAY",
				"WEDNESDAY",
				"THURSDAY",
				"FRIDAY",
				"SATURDAY"
				
			>>
			Result.compare_objects
		end

	long_months_text: ARRAY [STRING]
		once
			Result := <<
				"JANUARY",
				"FEBRUARY",
				"MARCH",
				"APRIL",
				"MAY",
				"JUNE",
				"JULY",
				"AUGUST",
				"SEPTEMBER",
				"OCTOBER",
				"NOVEMBER",
				"DECEMBER"
			>>
			Result.compare_objects
		end

	date_default_format_string: STRING = "yyyy-[0]mm-[0]dd"
			-- ISO 8601 standard

	time_default_format_string: STRING = "[0]hh:[0]mi:[0]ss.ff3"
			-- ISO 8601 standard

	default_format_string: STRING = "yyyy-[0]mm-[0]dd [0]hh:[0]mi:[0]ss.ff3"
			-- ISO 8601 standard

end -- class DATE_TIME_TOOLS



