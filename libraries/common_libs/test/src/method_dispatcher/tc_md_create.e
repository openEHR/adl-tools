indexing
	component:   "openEHR Reusable Libraries"
	description: "Test case for object creation"
	keywords:    "test, method dispatcher"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2004 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class TC_MD_CREATE_OBJECT

inherit
	SHARED_TEST_ENV
	TEST_CASE
		redefine
			check_result
		end

creation
	make

feature -- Initialisation

	make(arg:ANY) is
		do
		end

feature -- Access

	title:STRING is "Create object"

feature -- testing

	execute is
		local
			obj:LINKED_LIST[STRING]
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

	check_result is
		do
		end

end
