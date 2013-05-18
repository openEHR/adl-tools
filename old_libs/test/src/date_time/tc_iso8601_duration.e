note
	component:   "openEHR ADL Tools"
	description: "Test case for ISO8601_DURATION type."
	keywords:    "test, date, time"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2006 Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


class TC_ISO8601_DURATION

inherit
	TEST_CASE
		redefine 
			check_result
		end
		
	SHARED_TEST_ENV
		export
			{NONE} all
		end

create
	make

feature -- Access

	title: STRING = "ISO8601_DURATION test"

feature -- Initialisation

	make(arg:ANY)
		do
		end

	execute
		local
			iso_dur: ISO8601_DURATION
			str, iso_dur_str: STRING
		do
			io.put_string("input    	is_valid_iso8601_duration()		as_string valid%N")
			io.put_string("---------	---------------------------		---------------%N")

			from
				valid_iso_strings.start
			until
				valid_iso_strings.off
			loop
				create str.make (0)
				str.copy (valid_iso_strings.item)
				str.append(create {STRING}.make_filled(' ', 20-str.count))
				str.append_character('%T')

				if valid_iso8601_duration(valid_iso_strings.item) then
					create iso_dur.make_from_string(valid_iso_strings.item)
					str.append("True%T%T%T%T")
					iso_dur_str := iso_dur.as_string
					str.append(valid_iso_strings.item.is_equal(iso_dur_str).out)
					str.append("%T(" + iso_dur_str + ")")
					io.put_string(str + "%N")
				else
					str.append("False%T%T%T%T-")
					io.put_string(str + "%N")
				end
				valid_iso_strings.forth
			end

			io.put_string("%Ninput    	!is_valid_iso8601_duration()	as_string valid%N")
			io.put_string("---------	----------------------------	---------------%N")
			from
				invalid_iso_strings.start
			until
				invalid_iso_strings.off
			loop
				create str.make (0)
				str.copy (invalid_iso_strings.item)
				str.append(create {STRING}.make_filled(' ', 20-str.count))
				str.append_character('%T')
				io.put_string(str + (not valid_iso8601_duration(invalid_iso_strings.item)).out + "%T%T%T%T-%N")
				invalid_iso_strings.forth
			end
		end

	valid_iso_strings: ARRAYED_LIST [STRING]
		once
			create Result.make(0)

			Result.extend("P1Y")
			Result.extend("P1M")
			Result.extend("P1W")
			Result.extend("P1D")
			Result.extend("PT1H")
			Result.extend("PT1M")
			Result.extend("PT1S")

			Result.extend("P39W")
			Result.extend("P150D")
			Result.extend("P12M")

			Result.extend("P22Y3M5D")
			Result.extend("PT15H32M12S")
			Result.extend("P2DT15H32M12S")
			Result.extend("P22Y3M5DT15H32M12S")

			Result.extend("PT1,04S")
			Result.extend("PT2H4M22,049S")
		end

	invalid_iso_strings: ARRAYED_LIST [STRING]
		once
			create Result.make(0)

			Result.extend("P1H")
			Result.extend("P1S")
		end

feature -- Access

	check_result
	    do
	    end

end

