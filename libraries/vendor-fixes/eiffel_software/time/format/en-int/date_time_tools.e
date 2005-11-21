indexing
	description: "[
				International locale English settings; this class corrects ES's 
				US english versoin which contains the US non-standard way of 
				stringifyin dates. This version contains the international 
				standardised version from ISO8601
				]"
	date: 		"$LastChangedDate$"
	revision: 	"$LastChangedRevision$"

class 
	DATE_TIME_TOOLS	

inherit 	
	DATE_TIME_LANGUAGE_CONSTANTS

feature 

	name: STRING is "English"

	days_text: ARRAY [STRING] is
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

	months_text: ARRAY [STRING] is
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

	long_days_text: ARRAY [STRING] is
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

	long_months_text: ARRAY [STRING] is
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

	date_default_format_string: STRING is "yyyy-[0]mm-[0]dd"
			-- ISO 8601 standard

	time_default_format_string: STRING is "[0]hh:[0]mi:[0]ss.ff3"
			-- ISO 8601 standard

	default_format_string: STRING is "yyyy-[0]mm-[0]dd [0]hh:[0]mi:[0]ss.ff3"
			-- ISO 8601 standard

end -- class DATE_TIME_TOOLS 


--|----------------------------------------------------------------
--| EiffelTime: library of reusable components for ISE Eiffel.
--| Copyright (C) 1986-2001 Interactive Software Engineering Inc.
--| All rights reserved. Duplication and distribution prohibited.
--| May be used only with ISE Eiffel, under terms of user license. 
--| Contact ISE for any other use.
--|
--| Interactive Software Engineering Inc.
--| ISE Building
--| 360 Storke Road, Goleta, CA 93117 USA
--| Telephone 805-685-1006, Fax 805-685-6869
--| Electronic mail <info@eiffel.com>
--| Customer support: http://support.eiffel.com>
--| For latest info see award-winning pages: http://www.eiffel.com
--|----------------------------------------------------------------

