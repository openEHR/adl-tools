note
	component:   "openEHR ADL Tools"
	description: "Test case for base units"
	keywords:    "test, units"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2004 Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


class TC_BASE_UNITS

inherit
	TEST_CASE
		redefine 
			check_result
		end

create
	make

feature -- Access

	title:STRING = "BASE units test"

feature -- Initialisation

	make(arg:ANY)
		do
		end

	execute
		local
			parser:UNITS_PARSER
		do
			create parser.make
			parser.execute("m.s^-1")
			io.put_string("%Nparsing %"m.s^-1%"%N")
			if parser.error_count > 0 then
				io.put_string("Error: " + parser.output + "; " + parser.error_message + "%N")
			else
				io.put_string("Parsed ok. Result: " + parser.units.out + "%N")
			end

			parser.execute("m/s")
			io.put_string("%Nparsing %"m/s%"%N")
			if parser.error_count > 0 then
				io.put_string("Error: " + parser.output + "; " + parser.error_message + "%N")
			else
				io.put_string("Parsed ok. Result: " + parser.units.out + "%N")
			end

			parser.execute("mm")
			io.put_string("%Nparsing %"mm%"%N")
			if parser.error_count > 0 then
				io.put_string("Error: " + parser.output + "; " + parser.error_message + "%N")
			else
				io.put_string("Parsed ok. Result: " + parser.units.out + "%N")
			end

			parser.execute("mm[Hg]")
			io.put_string("%Nparsing %"mm[Hg]%"%N")
			if parser.error_count > 0 then
				io.put_string("Error: " + parser.output + "; " + parser.error_message + "%N")
			else
				io.put_string("Parsed ok. Result: " + parser.units.out + "%N")
			end

			parser.execute("kg.m/s^2")
			io.put_string("%Nparsing %"kg.m/s^2%"%N")
			if parser.error_count > 0 then
				io.put_string("Error: " + parser.output + "; " + parser.error_message + "%N")
			else
				io.put_string("Parsed ok. Result: " + parser.units.out + "%N")
			end
		end

feature -- Access

	check_result
	    do
	    end

end

