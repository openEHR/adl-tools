note
	component:   "openEHR ADL Tools"
	description: "Test case for ISO8601_DATE_TIME type."
	keywords:    "test, date, time"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2006 Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


class TC_ISO8601_DATE_TIME

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

	title: STRING = "ISO8601_DATE_TIME test"

feature -- Initialisation

	make(arg:ANY)
		do
		end

	execute
		local
			iso_dt: ISO8601_DATE_TIME
			str, iso_dt_str: STRING
		do
			io.put_string("input    		is_valid_iso8601_date_time()	as_string valid%N")
			io.put_string("---------		----------------------------	---------------%N")

			from
				valid_iso_strings.start
			until
				valid_iso_strings.off
			loop
				create str.make (0)
				str.copy (valid_iso_strings.item)
				str.append(create {STRING}.make_filled(' ', 30-str.count))
				str.append_character('%T')

				if valid_iso8601_date_time(valid_iso_strings.item) then
					create iso_dt.make_from_string(valid_iso_strings.item)
					str.append("True%T%T%T")
					iso_dt_str := iso_dt.as_string
					str.append(valid_iso_strings.item.is_equal(iso_dt_str).out)
					str.append("%T(" + iso_dt_str + ")")
					io.put_string(str + "%N")
				else
					str.append("False%T%T%T-")
					io.put_string(str + "%N")
				end
				valid_iso_strings.forth
			end

			io.put_string("%Ninput    		!is_valid_iso8601_date_time()	as_string valid%N")
			io.put_string("---------		-----------------------------	---------------%N")
			from
				invalid_iso_strings.start
			until
				invalid_iso_strings.off
			loop
				create str.make (0)
				str.copy (invalid_iso_strings.item)
				str.append(create {STRING}.make_filled(' ', 30-str.count))
				str.append_character('%T')
				io.put_string(str + (not valid_iso8601_date_time(invalid_iso_strings.item)).out + "%T%T%T-%N")
				invalid_iso_strings.forth
			end
		end

	valid_iso_strings: ARRAYED_LIST [STRING]
		once
			create Result.make(0)

			--	YYYY-MM-DDThh:mm:ss
			Result.extend("1989-01-01T18:04:00")
			Result.extend("1989-01-01T18:04:00Z")
			Result.extend("1989-01-01T18:04:00+1000")

			--	YYYY-MM-DDThh:mm
			Result.extend("1989-01-01T18:04")
			Result.extend("1989-01-01T18:04Z")
			Result.extend("1989-01-01T18:04+1000")

			--	YYYY-MM-DDThh
			Result.extend("1989-01-01T18")
			Result.extend("1989-01-01T18Z")
			Result.extend("1989-01-01T18+1000")
		end

	invalid_iso_strings: ARRAYED_LIST [STRING]
		once
			create Result.make(0)

			--	YYYY-MM-DDThhmmss
			Result.extend("1989-01-01T180400")

			--	YYYYMMDDThh:mm:ss
			Result.extend("19890101T18:04:00")

			Result.extend("1989-01-01")
			Result.extend("198901")
		end

feature -- Access

	check_result
	    do
	    end

end

