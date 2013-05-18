note
	component:   "openEHR ADL Tools"
	description: "Test suite for method dispatcher"
	keywords:    "test, method dispatcher"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2004 Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


class TS_METHOD_DISPATCH

inherit 
	TEST_SUITE
	SHARED_TEST_ENV

create
	make

feature -- Access

	test_cases: LINKED_LIST[TEST_CASE]
		local
			tc_md_proc1:TC_MD_PROC_CALL_1
			tc_md_proc2:TC_MD_PROC_CALL_2
			tc_md_proc3:TC_MD_PROC_CALL_3
			tc_md_func_bool_call:TC_MD_FUNC_BOOL_CALL
			tc_md_func_int_call:TC_MD_FUNC_INT_CALL
			tc_md_create:TC_MD_CREATE_OBJECT
		once
			create Result.make
			create tc_md_proc1.make(Void) Result.extend(tc_md_proc1)
			create tc_md_proc2.make(Void) Result.extend(tc_md_proc2)
			create tc_md_proc3.make(Void) Result.extend(tc_md_proc3)
			create tc_md_func_bool_call.make(Void) Result.extend(tc_md_func_bool_call)
			create tc_md_func_int_call.make(Void) Result.extend(tc_md_func_int_call)
			create tc_md_create.make(Void) Result.extend(tc_md_create)
		end

	title:STRING = "Method Dispatcher"

feature -- Initialisation

	make(arg:ANY)
	    do
	    end

end
