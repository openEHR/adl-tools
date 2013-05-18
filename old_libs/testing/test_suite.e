note
	component:   "openEHR ADL Tools"
	description: "Test suite abstraction for simple test framework"
	keywords:    "test"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2004 Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


deferred class TEST_SUITE

inherit
	TEST_IO
		export 
			{NONE} all
		end

feature -- Access

	test_cases: LINKED_LIST[TEST_CASE]
			-- the list of tests available
		deferred
		end
		
	test_case_index: HASH_TABLE [TEST_CASE, STRING]
		do
			if stored_test_case_index = Void then
				create stored_test_case_index.make(0)
				from 
					test_cases.start
				until
					test_cases.off
				loop
					stored_test_case_index.put(test_cases.item, test_cases.item.title)
					test_cases.forth
				end
			end
			Result := stored_test_case_index
		end

	title:STRING
	        -- title of this suite of tests
	    deferred
	    end

	start
		do
			test_cases.start
		end
		
	forth
		do
			test_cases.forth
		end
		
	off: BOOLEAN
		do
			Result := test_cases.off
		end
		
	item: TEST_CASE
		do
			Result := test_cases.item
		end
		
feature -- Initialisation

	make(arg:ANY)
		deferred
		end

	finalise
		do
		end

feature -- Execution

	do_all
		local
			str:STRING
		do
			create test_case_results.make(0)
			io_message.put_string("===============> Executing All Test Cases in Suite%N")

			from test_cases.start until test_cases.off loop
	 			io_message.put_string("----------- TC " + test_cases.item.id + ": " + test_cases.item.title + " -----------%N") 
	 			
				test_cases.item.execute
				test_cases.item.check_result
				create str.make(0) 
				str.append("TC " + test_cases.item.title) 
				if test_cases.item.failed then
					str.append(" FAILED; reason: " + test_cases.item.fail_reason)
				else
					str.append(" PASSED")
				end
				test_case_results.extend(str)
				test_cases.forth
			end
			io_message.put_string("---------------------------------%N")
	    end

	display_results
		do
			io_output.put_string("RESULTS:%N")
			from test_case_results.start until test_case_results.off loop
				io_output.put_string(test_case_results.item) io_output.new_line
				test_case_results.forth
			end
		end

	store_results(a_directory: STRING)
		require
			Directory_exists: a_directory /= Void
		local
			result_file: PLAIN_TEXT_FILE
			directory: STRING
		do
			directory := a_directory.twin
			directory.append_character(operating_environment.directory_separator)
			directory.append(title)
			directory.replace_substring_all(" ", "_")
			directory.append(".txt")
			create Result_file.make_create_read_write(directory)
			if result_file.exists then
				io_message.put_string("Writing to file ") io_message.put_string(directory) io_message.new_line
				from test_case_results.start until test_case_results.off loop
					result_file.put_string(test_case_results.item) result_file.new_line
					test_case_results.forth
				end
				result_file.close
			else
				io_message.put_string("Failed to create file ") io_message.put_string(directory) io_message.new_line
			end
		end


feature -- Access

	test_case_results: ARRAYED_LIST[STRING]	

feature {NONE} -- Implementation

	stored_test_case_index: HASH_TABLE [TEST_CASE, STRING]

end

