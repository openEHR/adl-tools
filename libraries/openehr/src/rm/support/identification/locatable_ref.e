note
	component:   "openEHR ADL Tools"
	
	description: "[
				 Reference to a LOCATABLE node within a top-level structure;
				 consists of an OBJECT_VERSION_ID and a path.
				 ]"
	keywords:    "object identifiers"

	design:      "openEHR Support Model 1.5"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2006 The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


class LOCATABLE_REF

inherit
	OBJECT_REF
		redefine
			id
		end

feature -- Access

	id: OBJECT_VERSION_ID	
			-- The identifier of the Version.

	path: STRING	
			-- The path to an instance in question, as an absolute path with respect to 
			-- the object found at VERSION.data. An empty path means that the object 
			-- referred to by id being specified.

	as_uri: STRING	
			-- A URI form of the reference, created by concatenating the following:
			-- "ehr://" + id.value + "/" + path

invariant
	Path_valid: path /= Void implies not path.is_empty

end



