note
	component:   "openEHR ADL Tools"
	description: "Test case for SI derived units"
	keywords:    "test, units"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2004 Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


class TC_SI_UNITS

inherit
	TEST_CASE
		redefine 
			check_result
		end

create
	make

feature -- Access

	title:STRING = "SI derived units test"

feature -- Initialisation

	make(arg:ANY)
		do
		end

	execute
		local
			parser:UNITS_PARSER
		do
			create parser.make
			parser.execute("W")
			io.put_string("%Nparsing %"W%"%N")
			if parser.error_count > 0 then
				io.put_string("Error: " + parser.output + "; " + parser.error_message + "%N")
			else
				io.put_string("Parsed ok. Result: " + parser.units.out + "%N")
			end

			parser.execute("J/s")
			io.put_string("%Nparsing %"J/s%"%N")
			if parser.error_count > 0 then
				io.put_string("Error: " + parser.output + "; " + parser.error_message + "%N")
			else
				io.put_string("Parsed ok. Result: " + parser.units.out + "%N")
			end

			parser.execute("V/m")
			io.put_string("%Nparsing %"V/m%"%N")
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

