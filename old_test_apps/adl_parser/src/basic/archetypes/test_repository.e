note
	component:   "openEHR ADL Tools"
	description: "Test all archetypes in repository"
	keywords:    "test, ADL"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2003 Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


class TEST_REPOSITORY

feature -- Initialisation

	make(arg:ANY)
	    do
	    end

feature -- Access

	title: STRING = "Test repository archetypes"
			-- the name of the test

	prereqs:ARRAY[STRING] 
			-- names of prerequisite test cases
		once
			Result := <<>>
		end

feature -- testing

	execute
			-- test routine
		do
		end

	check_result
			-- compare actual result with required result and set 'failed' as necessary
		do
		ensure
			Failure_reason_given: failed implies fail_reason /= Void and then not fail_reason.empty
		end

end

