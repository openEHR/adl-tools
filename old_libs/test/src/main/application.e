note
	component:   "openEHR ADL Tools"
	description: "Test application for object graph generic parse tree"
	keywords:    "test, object graph"
	
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2004 Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


class APPLICATION

inherit
	SHARED_RESOURCES
		export
			{NONE} all
		end

	TEST_APPLICATION
		export
			{NONE} all
		redefine
			splash
		end
		
	SHARED_TEST_ENV
		export
			{NONE} all
		end

	SHARED_UNIT_DATABASE
		export
			{NONE} all
		end

create
	make

feature -- Template

	test_init
		local
			tables_dir:STRING
   		do
			if execution_environment.command_line.argument_count /= 1 then
				io.put_string("Argument required: directory where unit parser config files are found%N")
				io.put_string("	normally ends with %"config\units_parser%" %N")
			else
				-- for dADL tests
				initialise_serialisers
				
				-- for unit parser
				tables_dir := execution_environment.command_line.argument(1)
				
				initialise_unit_database(tables_dir + operating_environment.Directory_separator.out + "tables", 
					tables_dir + operating_environment.Directory_separator.out + "prefixes.txt")
				debug("units")
					io.put_string(unit_database.out)
				end
				test_initialised := True
			end
		end

	test_suites: LINKED_LIST[TEST_SUITE]
		once
			create Result.make
			Result.extend(create {TS_DADL}.make(Void))
			Result.extend(create {TS_METHOD_DISPATCH}.make(Void))
			Result.extend(create {TS_UNITS}.make(Void))
			Result.extend(create {TS_OBJECT_GRAPH}.make(Void))
			Result.extend(create {TS_PATH}.make(Void))
			Result.extend(create {TS_DATE_TIME}.make(Void))
			Result.extend(create {TS_UML}.make(Void))
		end

feature -- Template
	
	splash: STRING
			-- create a splash string for the console
		do
			create Result.make(0)
			Result.append("%N..........................................................................%N")
			Result.append(  ".     openEHR Re-usable Library test suite environment (c)2003 - 2004    .%N")
			Result.append(  "..........................................................................%N")
			Result.append(  ". available from: www.OceanInformatics.biz                               .%N")
			Result.append(  ".         author: Thomas Beale                                           .%N")
			Result.append(  ".    built using: ISE Eiffel (see www.eiffel.com)                        .%N")
			Result.append(  ".                 Gobo parsing libraries & tools (see www.gobosoft.com)  .%N")
			Result.append(  ".        support: support@OceanInformatics.biz                           .%N")
			Result.append(  "..........................................................................%N%N")

		end

feature {NONE} -- Implementation

	initialise_serialisers
		once
			dt_serialisers.put(create {DADL_SYNTAX_SERIALISER}.make(create {NATIVE_DADL_SERIALISATION_PROFILE}.make("adl")), "adl")
			dt_serialisers.put(create {DADL_SYNTAX_SERIALISER}.make(create {HTML_DADL_SERIALISATION_PROFILE}.make("html")), "html")
			dt_serialisers.put(create {DADL_TAGGED_SERIALISER}.make(create {XML_DADL_SERIALISATION_PROFILE}.make("xml")), "xml")
			dt_serialisers.put(create {DADL_OWL_SERIALISER}.make(create {OWL_DADL_SERIALISATION_PROFILE}.make("owl")), "owl")
		end
end

