note
	component:   "openEHR ADL Tools"
	description: "Test case for embedded cADL in dADL"
	keywords:    "test, object graph, cADL, dADL, ADL"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2005 Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


class TC_DADL_EMBEDDED_CADL

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

	title:STRING = "dADL with embedded cADL"

feature -- Initialisation

	make(arg:ANY)
		do
		end

	execute
		do
			io.put_string("---------- original dADL  -----------%N")
			io.put_string(dadl_text)
			dadl_engine.set_source (dadl_text, 1)
			dadl_engine.parse
			if not dadl_engine.parse_succeeded then
				io.put_string("Parse failed; reason = " + dadl_engine.parse_error_text + "%N")
			else
				dadl_engine.serialise ("adl")
				io.put_string("---------- serialised to ADL -----------%N")
				io.put_string(dadl_engine.serialised)
			end
		end

feature -- Access

	check_result
	    do
	    end

feature -- Implementation

	dadl_text: STRING  
		local
			from_file: PLAIN_TEXT_FILE
		do
			create from_file.make_open_read("../src/dadl/dadl_embedded_cadl.txt")
			from_file.read_stream(from_file.count)
			Result := from_file.last_string
		end

end

