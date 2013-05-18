note
	component:   "openEHR ADL Tools"
	description: "Test case for archetype parse, simulating call from java"
	keywords:    "test, ADL, java"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2005 Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


class TC_JS_ARCHETYPE_PARSE

inherit
	TEST_CASE
		export
			{NONE} all
		end

	SHARED_TEST_ENV
		export
			{NONE} all
		end

create
	make

feature -- Initialisation

	make(arg:ANY)
	    do
	    end

feature -- Access

	title: STRING = "Test Archetype Create"

	infile: STRING
		once
			create Result.make(0)
			Result.append("openEHR-EHR-OBSERVATION.blood_pressure.v1.adl")
		end

	outfile: STRING
		once
			create Result.make(0)
			Result.append("openEHR-EHR-OBSERVATION.blood_pressure.v1.html")
		end

feature -- testing

	execute
		local
			c_status, c_infile, c_outfile, c_format: BASE_C_STRING
		do
			create c_infile.make (infile)
			create c_outfile.make (outfile)
			create c_format.make("html")
			c_adl_interface.open_adl_file(c_infile.item)

			create c_status.make_by_pointer (c_adl_interface.status)
			if c_adl_interface.archetype_source_loaded then
				io.put_string("Loaded " + infile + "; status: " + c_status.string + "%N")

				c_adl_interface.parse_archetype
				create c_status.make_by_pointer (c_adl_interface.status)
				if c_adl_interface.parse_succeeded then
					c_adl_interface.save_archetype(c_outfile.item, c_format.item)

					if c_adl_interface.save_succeeded then
						io.put_string("Saved to " + outfile + "%N")
					else
						create c_status.make_by_pointer (c_adl_interface.status)
						io.put_string("failed to serialise; status = " + c_status.string + "%N")
					end
				else
					io.put_string("failed to parse; status = " + c_status.string + "%N")
				end
			else
				io.put_string("Unable to load " + infile + " because of " + c_status.string + "%N")
			end
		end

end

