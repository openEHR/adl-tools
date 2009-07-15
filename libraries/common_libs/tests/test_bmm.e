note
	component:   "openEHR Archetype Project"
	description: "Shared UI resources"
	keywords:    "test, ADL"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2009 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"
	testing:     "type/manual"

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
			if not rm_checker.model_loaded then
				io.put_string ("Error - RM checker status: " + rm_checker.status)
			end
		end

feature -- Test routines

	test_has_property_path
			-- New test routine
		note
			testing:  "paths", "bmm", "covers/{BMM_MODEL}.has_property_path"
		do
			assert ("CARE_ENTRY has /protocol", rm_checker.has_property_path ("CARE_ENTRY", "/protocol"))
			assert ("CARE_ENTRY has /data/events/data", rm_checker.has_property_path ("CARE_ENTRY", "/data/events/data"))
			assert ("OBSERVATION has /data/events/data", rm_checker.has_property_path ("OBSERVATION", "/data/events/data"))
			assert ("OBSERVATION has /data/events/data/items", rm_checker.has_property_path ("OBSERVATION", "/data/events/data/items"))
			assert ("OBSERVATION has /data/events[at0003]/math_function", rm_checker.has_property_path ("OBSERVATION", "/data/events[at0003]/math_function"))
			assert ("OBSERVATION has /protocol", rm_checker.has_property_path ("OBSERVATION", "/protocol"))
			assert ("OBSERVATION has /data/events[at0002]/data/items[at0.76]/items", rm_checker.has_property_path ("OBSERVATION", "/data/events[at0002]/data/items[at0.76]/items"))
			assert ("OBSERVATION not has /data/events[at0002]/data/itemsXX[at0.76]/items", not rm_checker.has_property_path ("OBSERVATION", "/data/events[at0002]/data/itemsXX[at0.76]/items"))
			assert ("COMPOSITION not has /xxxx", not rm_checker.has_property_path ("COMPOSITION", "/xxxx"))
		end

	test_property_definition_at_path
			-- New test routine
		note
			testing:  "paths", "bmm", "covers/{BMM_MODEL}.property_definition_at_path"
		do
			assert ("CARE_ENTRY found property at /protocol", rm_checker.property_definition_at_path ("CARE_ENTRY", "/protocol").name.is_equal("protocol"))
			assert ("CARE_ENTRY found property at /data/events/data", rm_checker.property_definition_at_path ("CARE_ENTRY", "/data/events/data").name.is_equal("data"))
			assert ("OBSERVATION found property at /data/events/data", rm_checker.property_definition_at_path ("OBSERVATION", "/data/events/data").name.is_equal("data"))
			assert ("OBSERVATION found property at /data/events/data/items", rm_checker.property_definition_at_path ("OBSERVATION", "/data/events/data/items").name.is_equal("items"))
			assert ("OBSERVATION found property at /data/events[at0003]/math_function", rm_checker.property_definition_at_path ("OBSERVATION", "/data/events[at0003]/math_function").name.is_equal("math_function"))
			assert ("OBSERVATION found property at /protocol", rm_checker.property_definition_at_path ("OBSERVATION", "/protocol").name.is_equal("protocol"))
			assert ("OBSERVATION found property at /data/events[at0002]/data/items[at0.76]/items", rm_checker.property_definition_at_path ("OBSERVATION", "/data/events[at0002]/data/items[at0.76]/items").name.is_equal("items"))
		end

end


