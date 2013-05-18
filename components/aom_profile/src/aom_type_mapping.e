note
	component:   "openEHR ADL Tools"
	description: "Data object expressing a mapping between two types."
	keywords:    "ADL, archetype, aom, type mapping"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2013- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class AOM_TYPE_MAPPING

inherit
	ANY
		redefine
			default_create
		end

feature -- Initialisation

	default_create
		do
			create source_class_name.make_empty
			create target_class_name.make_empty
			create property_mappings.make (0)
		end

feature -- Identification

	source_class_name: STRING
			-- DO NOT RENAME OR OTHERWISE CHANGE THIS ATTRIBUTE EXCEPT IN SYNC WITH profile file

	target_class_name: STRING
			-- DO NOT RENAME OR OTHERWISE CHANGE THIS ATTRIBUTE EXCEPT IN SYNC WITH profile file

feature -- Access (attributes from file)

	property_mappings: HASH_TABLE [AOM_PROPERTY_MAPPING, STRING]
			-- DO NOT RENAME OR OTHERWISE CHANGE THIS ATTRIBUTE EXCEPT IN SYNC WITH profile file

feature -- Validation

	validate
		do
		end

end



