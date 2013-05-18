note
	component:   "openEHR ADL Tools"
	description: "Test case for call to integer-returning function"
	keywords:    "test, method dispatcher"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2004 Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


class TC_MD_FUNC_INT_CALL

inherit
	SHARED_TEST_ENV
	TEST_CASE
		redefine
			check_result
		end

create
	make

feature -- Initialisation

	make(arg:ANY)
		do
		end

feature -- Access

	title:STRING = "Function call - FUNC <STRING> : INTEGER"

feature -- testing

	execute
		local
			arg, feat_name:STRING
			call_result:INTEGER
		do
			feat_name := "occurrences"
			arg := "4 - list"

			-- print out old list
			io.put_string("Initial list contents:%N" + print_list(string_list))

			io.put_string("Verifying %"string_list." + feat_name + " is valid: " + 
				method_dispatcher.is_valid_feature(string_list.generating_type, feat_name).out + "%N")

			io.put_string("Dispatching %"string_list." + feat_name + "(" + arg + ")%"%N")
			call_result := method_dispatcher.dispatch_integer_function(string_list, feat_name, arg)

			io.put_string("Result: " + call_result.out + "%N")

			-- do direct call and compare
			io.put_string("Result using direct call: " + string_list.occurrences(arg).out + "%N")
		end

	check_result
		do
		end

end
