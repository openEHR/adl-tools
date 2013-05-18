note
	component:   "openEHR ADL Tools"

	description: "[
	             A data structure in the form of a tree.
			 Structure is as follows:
					branch_1: CLUSTER
						branch_1.1: CLUSTER
							value_1: ELEMENT
							....
							value_N: ELEMENT

						branch_1.2: CLUSTER
							value_1: ELEMENT
							....
							value_N: ELEMENT

						value_1: ELEMENT
						value_2: ELEMENT
						....
						value_N: ELEMENT

					branch_2: CLUSTER
						branch_2.1: CLUSTER
							value_1: ELEMENT
							....
							value_N: ELEMENT

						branch_2.2: CLUSTER
							value_1: ELEMENT
							....
							value_N: ELEMENT

						value_1: ELEMENT
						value_2: ELEMENT
						....
						value_N: ELEMENT

					branch_N: CLUSTER
						branch_N.1: CLUSTER
							value_1: ELEMENT
							....
							value_N: ELEMENT

						branch_N.2: CLUSTER
							value_1: ELEMENT
							....
							value_N: ELEMENT

						value_1: ELEMENT
						value_2: ELEMENT
						....
						value_N: ELEMENT
	             	
	             Valid paths are of the form:	
	             	whole tree: |<root-name>
	             				
	             	branch: |<root-name>|branch=<brach-name>|value=<value_name>
	             	value: |<root-name>|value=<n>
	  	       ]"
	keywords:    "content, spatial, data structure"

	requirements:"ISO 18308 TS V1.0 ???"
	design:      "openEHR Data Structures Reference Model 1.2.1"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2000-2004 The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


class ITEM_TREE

inherit
	ITEM_STRUCTURE
	
	CLUSTER

feature -- Access

	element_at_path(a_path:STRING): ELEMENT
			-- Return the leaf element at the path ‘a_path’
		require
			has_element_path(a_path)	
		do
		end

feature -- Status Report

	has_element_path(a_path:STRING): BOOLEAN
			-- True if path ‘a_path’ is a valid leaf path
		do
		end

feature -- Conversion

	as_hierarchy: CLUSTER
			-- the physical representation as a CEN 13606-compliant structure
		do
		end
	
end


