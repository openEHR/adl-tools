note
	component:   "openEHR ADL Tools"
	description: "Test application for ADL validating parser"
	keywords:    "test, ADL"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2003 Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


class APPLICATION

inherit
	SHARED_RESOURCES
		export
			{NONE} all
		end

	SHARED_ARCHETYPE_SERIALISERS
		export
			{NONE} all
			{ANY} has_archetype_serialiser_format, archetype_serialiser_formats
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

create
	make

feature -- Template

	test_init
			-- application-specific initialisation
		local
			rep_path: STRING
   		do
			read_resource_file
			rep_path := resource_value("any", "repository")

			if not rep_path.is_empty then
				working_directory := substitute_env_vars(rep_path)
			else
				working_directory := application_startup_directory
			end

			-- FIXME: This does not compile. What should it do?
			archetype_compiler.set_current_directory(working_directory)

			test_initialised := True
		end

	test_suites: LINKED_LIST[TEST_SUITE]
		once
			create Result.make
			Result.extend(create {TS_ADL_SUITE}.make(Void))
			Result.extend(create {TS_JAVA_SIM_SUITE}.make(Void))
		end

feature -- Template

	read_resource_file
			--
		local
			s: STRING
		do
			s := application_name
			s.replace_substring_all(".exe", ".cfg")
			initialise_resource_config_file_name(s)
		end

	repository: FILE_REPOSITORY

	splash: STRING
			-- create a splash string for the console
		do
			create Result.make_empty
			Result.append("%N..........................................................................%N")
			Result.append(  ".           Ocean Informatics Validating ADL Parser (c)2003 - 2007       .%N")
			Result.append(  current_adl_version + "%N")
			Result.append(  "..........................................................................%N")
			Result.append(  ". available from: www.OceanInformatics.biz                               .%N")
			Result.append(  ".         author: Thomas Beale                                           .%N")
			Result.append(  ".    built using: ISE Eiffel (see www.eiffel.com)                        .%N")
			Result.append(  ".                 Gobo parsing libraries & tools (see www.gobosoft.com)  .%N")
			Result.append(  ".        support: support@OceanInformatics.biz                           .%N")
			Result.append(  "..........................................................................%N%N")
		end

	working_directory: STRING

	archetype_file_name_pattern: STRING = "^[a-z][a-z0-9_]*-[a-z][a-z0-9_]*-[a-z][a-z0-9_]*\.[a-z][a-z0-9\-_]*\.[a-z][a-z0-9_]*\.adl$"
			-- matches "rm_originator-rm_name-rm_entity.concept.version.adl"

end


