note
	component:   "openEHR ADL Tools"
	description: "Abstract test case"
	keywords:    "test"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2004 Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


deferred class TEST_CASE

inherit
	ERROR_STATUS
		rename 
			last_op_fail as failed
		export
			{NONE} all;
			{ANY} failed, fail_reason
		end

	TEST_IO
		export 
			{NONE} all
		end

feature -- Initialisation

	make(arg:ANY)
			-- 
		deferred
		end

feature -- Access

	id: STRING
			-- allocated on creation
		do
			Result := generating_type
		end

	title: STRING 
			-- the name of the test
		deferred
		end

	prereqs: ARRAY[STRING] 
			-- ids of prerequisite test cases
		once
			Result := <<>>
		end

feature -- testing

	set_up
			-- set up for this test; redefine in descendants
		do
		end

	execute
			-- test routine
		deferred
		end

	check_result
			-- compare actual result with required result and set 'failed' as necessary
		do
		ensure
			Failure_reason_given: failed implies fail_reason /= Void and then not fail_reason.is_empty
		end

	tear_down
			-- clean_up after this test; redefine in descendants
		do
		end

end

