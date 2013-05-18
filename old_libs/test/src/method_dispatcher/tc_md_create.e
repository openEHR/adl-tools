note
	component:   "openEHR ADL Tools"
	description: "Test case for object creation"
	keywords:    "test, method dispatcher"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2004 Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


class TC_MD_CREATE_OBJECT

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

	title: STRING = "Create object"

feature -- testing

	execute
		local
			obj: LINKED_LIST[STRING]
		do
			io.put_string("Create LINKED_LIST[STRING].make%N")
			obj ?= method_dispatcher.create_object("LINKED_LIST[STRING]", "make")
			if obj /= Void then
				io.put_string("Created object of type " + obj.generating_type + "%N")
				io.put_string(obj.generating_type + ".count = " + 
					method_dispatcher.dispatch_integer_function(obj, "count", Void).out + "%N")
			else
				io.put_string("Object creation failed%N")
			end
		end

	check_result
		do
		end

end
