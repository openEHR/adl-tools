note
	component:   "openEHR ADL Tools"
	description: "Test case for dimensionless units"
	keywords:    "test, units"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2004 Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


class TC_DIMENSIONLESS_UNITS

inherit
	TEST_CASE
		redefine 
			check_result
		end

create
	make

feature -- Access

	title:STRING = "Dimensionless units test"

feature -- Initialisation

	make(arg:ANY)
		do
		end

	execute
		local
			parser:UNITS_PARSER
		do
			create parser.make
			parser.execute("ppm")
			io.put_string("%Nparsing %"ppm%"%N")
			if parser.error_count > 0 then
				io.put_string("Error: " + parser.output + "; " + parser.error_message + "%N")
			else
				io.put_string("Parsed ok. Result: " + parser.units.out + "%N")
			end

			parser.execute("%%")
			io.put_string("%Nparsing %"%%%"%N")
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

