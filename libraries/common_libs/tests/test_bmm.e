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

	SHARED_ADL_APPLICATION

	SHARED_REFERENCE_MODEL_ACCESS

	SHARED_APP_RESOURCES

feature {NONE} -- Events

	on_prepare
			-- <Precursor>
		do
			adl_application.initialise
			if not found_valid_rm_schemas then
				io.put_string ("Error - RM schema status: " + rm_schema.status)
			else
				rm_schema := rm_schema_for_package ("openehr-ehr")
			end
		end

feature -- Access

	rm_schema: SCHEMA_ACCESS
			-- set if this archetype has a valid package-class_name

feature -- Test routines

	test_has_property_path
			-- New test routine
		note
			testing:  "paths", "bmm", "covers/{SCHEMA_ACCESS}.has_property_path"
		do
			assert ("CARE_ENTRY has /protocol", rm_schema.has_property_path ("CARE_ENTRY", "/protocol"))
			assert ("CARE_ENTRY has /data/events/data", rm_schema.has_property_path ("CARE_ENTRY", "/data/events/data"))
			assert ("OBSERVATION has /data/events/data", rm_schema.has_property_path ("OBSERVATION", "/data/events/data"))
			assert ("OBSERVATION has /data/events/data/items", rm_schema.has_property_path ("OBSERVATION", "/data/events/data/items"))
			assert ("OBSERVATION has /data/events[at0003]/math_function", rm_schema.has_property_path ("OBSERVATION", "/data/events[at0003]/math_function"))
			assert ("OBSERVATION has /protocol", rm_schema.has_property_path ("OBSERVATION", "/protocol"))
			assert ("OBSERVATION has /data/events[at0002]/data/items[at0.76]/items", rm_schema.has_property_path ("OBSERVATION", "/data/events[at0002]/data/items[at0.76]/items"))
			assert ("OBSERVATION not has /data/events[at0002]/data/itemsXX[at0.76]/items", not rm_schema.has_property_path ("OBSERVATION", "/data/events[at0002]/data/itemsXX[at0.76]/items"))
			assert ("COMPOSITION not has /xxxx", not rm_schema.has_property_path ("COMPOSITION", "/xxxx"))
			assert ("CLUSTER has /items/items/items", rm_schema.has_property_path ("CLUSTER", "/items/items/items"))
		end

	test_property_definition_at_path
			-- New test routine
		note
			testing:  "paths", "bmm", "covers/{SCHEMA_ACCESS}.property_definition_at_path"
		do
			assert ("CARE_ENTRY found property at /protocol", rm_schema.property_definition_at_path ("CARE_ENTRY", "/protocol").name.is_equal("protocol"))
			assert ("CARE_ENTRY found property at /data/events/data", rm_schema.property_definition_at_path ("CARE_ENTRY", "/data/events/data").name.is_equal("data"))
			assert ("OBSERVATION found property at /data/events/data", rm_schema.property_definition_at_path ("OBSERVATION", "/data/events/data").name.is_equal("data"))
			assert ("OBSERVATION found property at /data/events/data/items", rm_schema.property_definition_at_path ("OBSERVATION", "/data/events/data/items").name.is_equal("items"))
			assert ("OBSERVATION found property at /data/events[at0003]/math_function", rm_schema.property_definition_at_path ("OBSERVATION", "/data/events[at0003]/math_function").name.is_equal("math_function"))
			assert ("OBSERVATION found property at /protocol", rm_schema.property_definition_at_path ("OBSERVATION", "/protocol").name.is_equal("protocol"))
			assert ("OBSERVATION found property at /data/events[at0002]/data/items[at0.76]/items", rm_schema.property_definition_at_path ("OBSERVATION", "/data/events[at0002]/data/items[at0.76]/items").name.is_equal("items"))
			assert ("CLUSTER found proerty at /items/items/items", rm_schema.property_definition_at_path ("CLUSTER", "/items/items/items").name.is_equal("items"))
		end

	test_is_descendant_of
			-- New test routine
		note
			testing:  "is_descendant_of", "bmm", "covers/{BMM_SCHEMA}.is_descendant_of"
		do
			assert ("COMPOSITION is a subclass of LOCATABLE", rm_schema.is_descendant_of ("COMPOSITION", "LOCATABLE"))
			assert ("LOCATABLE is not subclass of COMPOSITION", not rm_schema.is_descendant_of ("LOCATABLE", "COMPOSITION"))
		end

	test_immediate_suppliers
			-- New test routine
		note
			testing:  "immediate_suppliers", "bmm", "covers/{BMM_CLASS_DEFINITION}.immediate_suppliers"
		local
			supps: ARRAYED_SET [STRING]
		do
			supps := rm_schema.class_definition ("COMPOSITION").immediate_suppliers
			assert ("COMPOSITION immediate suppliers includes CODE_PHRASE", supps.has ("CODE_PHRASE"))
			assert ("COMPOSITION immediate suppliers includes DV_CODED_TEXT", supps.has ("DV_CODED_TEXT"))
			assert ("COMPOSITION immediate suppliers includes PARTY_PROXY", supps.has ("PARTY_PROXY"))
			assert ("COMPOSITION immediate suppliers includes EVENT_CONTEXT", supps.has ("EVENT_CONTEXT"))
			assert ("COMPOSITION immediate suppliers includes CONTENT_ITEM", supps.has ("CONTENT_ITEM"))
		end

	test_all_suppliers
			-- New test routine
		note
			testing:  "all_suppliers", "bmm", "covers/{BMM_CLASS_DEFINITION}.all_suppliers"
		local
			supps: ARRAYED_SET [STRING]
		do
			supps := rm_schema.class_definition ("COMPOSITION").all_suppliers
			assert ("COMPOSITION immediate suppliers includes CODE_PHRASE", supps.has ("CODE_PHRASE"))
			assert ("COMPOSITION immediate suppliers includes DV_CODED_TEXT", supps.has ("DV_CODED_TEXT"))
			assert ("COMPOSITION immediate suppliers includes PARTY_PROXY", supps.has ("PARTY_PROXY"))
			assert ("COMPOSITION immediate suppliers includes EVENT_CONTEXT", supps.has ("EVENT_CONTEXT"))
			assert ("COMPOSITION immediate suppliers includes CONTENT_ITEM", supps.has ("CONTENT_ITEM"))
		end

end


