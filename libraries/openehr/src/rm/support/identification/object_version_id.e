note
	component:   "openEHR ADL Tools"

	description: "[
			 Globally uniqie identifier of a Version within a version
			 container. Supports distributed version control.
			 ]"
	keywords:    "object identifiers"
	design:      "openEHR Support Information Model 1.5"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2006- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class OBJECT_VERSION_ID

inherit
	UID_BASED_ID

feature -- Access

	object_id: UID
			-- Unique identifier for logical object of which this identifier identifies one version;
			-- normally the object_id will be the unique identifier of the version container containing
			-- the version referred to by this OBJECT_VERSION_ID instance.
		do
			Result := root
		end

	version_tree_id: VERSION_TREE_ID
			-- tree identifier of this version with respect to other versions in the same version tree,
			-- as either 1 or 3 part dot-separated numbers, e.g. “1”, “2.1.4”.
		local
			sep_pos1, sep_pos2: INTEGER
		do
			sep_pos1 := value.substring_index (Extension_separator, 1) + Extension_separator.count
			sep_pos2 := value.substring_index (Extension_separator, sep_pos1) - 1
			create Result.make (value.substring(sep_pos1, sep_pos2))
		end

	creating_system_id: UID
			-- Identifier of the system that created the Version corresponding to this Object version id.
		local
			sep_pos1, sep_pos2: INTEGER
			sys_id: STRING
		do
			sep_pos1 := value.substring_index (Extension_separator, 1) + Extension_separator.count
			sep_pos2 := value.substring_index (Extension_separator, sep_pos1) + 1
			sys_id := value.substring (sep_pos2, value.count)
			create {UUID} Result.default_create
			-- TODO: finish implementation
		end

feature -- Status Report

	valid_id (an_id: STRING): BOOLEAN
			--
		do
		end

end



