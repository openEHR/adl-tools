note
	component:   "openEHR ADL Tools"
	description: "Ancestor for test classes"
	keywords:    "archetype, ontology, terminology"
	author:      "Peter Gummer <peter.gummer@oceaninfomatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2009- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class
	ADL_TEST_SET

inherit
	TEST_UTILITIES

	SHARED_ADL_APP_RESOURCES
		undefine
			default_create
		end

feature {NONE} -- Assertions

	file_context: FILE_CONTEXT
			-- Access to the file system.
		once
			create Result
		end

	test_directory: STRING
			-- A directory for temporary test files.
		once
			Result := file_system.pathname (user_config_file_directory, "autotest")
			file_system.recursive_create_directory (Result)
		end

end


