note
	component:   "openEHR Reusable Libraries"
	description: "Test case for procedure call"
	keywords:    "test, method dispatcher"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2004 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class TC_MD_PROC_CALL_2

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

	title:STRING = "Procedure call using PART/SUB_PART"

feature -- testing

	execute
		local
			feature_name:STRING
		do
			feature_name := "proc_no_args"

			io.put_string("Checking " + part.generating_type + "." + feature_name + 
				" is valid Function_character: " + 
				method_dispatcher.is_valid_feature(part.generating_type, feature_name).out + "%N")

			io.put_string("Dispatching " + part.generating_type + "." + feature_name + "%N")
			method_dispatcher.dispatch_procedure(part, feature_name, Void)
		end

	check_result
		do
		end

end
