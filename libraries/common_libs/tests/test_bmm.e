note
	description: "[
		Eiffel tests that can be executed by testing tool.
	]"
	author: "EiffelStudio test wizard"
	date: "$Date$"
	revision: "$Revision$"
	testing: "type/manual"

class
	TEST_BMM

inherit
	EQA_TEST_SET
		redefine
			on_prepare
		end

	SHARED_REFERENCE_MODEL_ACCESS

	SHARED_UI_RESOURCES

feature {NONE} -- Events

	on_prepare
			-- <Precursor>
		do
			initialise_default_resource_config_file_name
			rm_checker.set_rm_checking_on(rm_checking_on)
			if rm_checking_on and not rm_checker.model_loaded then
				io.put_string ("Error - RM checker status: " + rm_checker.status)
			end
		end

feature -- Test routines

	test_has_path
			-- New test routine
		note
			testing:  "paths", "bmm", "covers/{BMM_MODEL}.has_path"
		do
			assert ("OBSERVATION has /data/events/data/items", rm_checker.has_path ("/data/events/data/items", "OBSERVATION"))
			assert ("OBSERVATION has /data/events[at0003]/math_function", rm_checker.has_path ("/data/events[at0003]/math_function", "OBSERVATION"))
			assert ("OBSERVATION has /protocol", rm_checker.has_path ("/protocol", "OBSERVATION"))
			assert ("OBSERVATION has /data/events[at0002]/data/items[at0.76]/items", rm_checker.has_path ("/data/events[at0002]/data/items[at0.76]/items", "OBSERVATION"))
			assert ("CARE_ENTRY has /protocol", rm_checker.has_path ("/protocol", "CARE_ENTRY"))
			assert ("COMPOSITION not has /xxxx", not rm_checker.has_path ("/xxxx", "COMPOSITION"))
		end

end


