note
	component:   "openEHR Reusable Libraries"
	description: "Test case for procedure call"
	keywords:    "test, method dispatcher"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2004 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"


class TC_MD_PROC_CALL_1

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

	title:STRING = "Procedure call"

feature -- testing

	execute
		local
			new_entry, proc_name:STRING
		do
			proc_name := "put_front"
			new_entry := "5 - new entry"

			-- print out old list
			io.put_string("Initial list contents:%N" + print_list(string_list))

			io.put_string("Checking class visibility of " + string_list.generating_type + " " + 
				method_dispatcher.is_class_visible(string_list.generating_type).out + "%N")

			io.put_string("Checking %"" + string_list.generating_type + "." + proc_name + "%" is valid: " +
				method_dispatcher.is_valid_feature(string_list.generating_type, proc_name).out + "%N")

			io.put_string("Dispatching %"alist.put_front(new_entry)%"%N")
			method_dispatcher.dispatch_procedure(string_list, proc_name, new_entry)

			-- print again
			io.put_string("New list contents:%N")
			io.put_string(print_list(string_list))
		end

	check_result
		do
		end

end
