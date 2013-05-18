note
	component:   "openEHR ADL Tools"

	description: "[
	              Leaf item in a hierarchical representation for spatial structures.
			  ]"
	keywords:    "content, spatial, data structure"

	requirements:"ISO 18308 TS V1.0 ???"
	design:      "openEHR Data Structures Reference Model 1.2.1"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2000-2004 The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


class ELEMENT

inherit
	ITEM

	EXTERNAL_ENVIRONMENT_ACCESS

feature -- Access

	value: DATA_VALUE

	null_flavor: DV_CODED_TEXT
			-- data quality indicator, also known as "flavour of NULL" is
		
	is_null: BOOLEAN
			-- 	set True if no value provided; in this case, `null_flavor' is set to indicate why
		do
			Result := null_flavor /= Void
		ensure
			null_flavor /= Void implies Result
		end

	path_of_item (a_loc: LOCATABLE): STRING
			-- The path to an item relative to the root of this archetyped structure.
		do
		end

	item_at_path (a_path: STRING): LOCATABLE
			-- The item at a path (relative to this item).
		do
		end

feature -- Status Report

	path_exists (a_path: STRING): BOOLEAN
			-- True if the path is valid with respect to the current item.
		do
		end
		
invariant
	Null_flavour_indicated: is_null xor null_flavor /= Void
	Null_flavour_valid: is_null implies
		terminology(terminology_id_openehr).has_code_for_group_id(group_id_null_flavours, null_flavor.defining_code)

end


