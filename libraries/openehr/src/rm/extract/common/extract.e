note
	component:   "openEHR ADL Tools"

	description: "[
				  Generic model of an Extract of some information from a repository; the 
				  generic parameters select which kind of specification and content the Extract carries.
				  ]"
	keywords:    "ehr, extract"

	design:      "openEHR EHR Exztract Reference Model rev 2"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2006 The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

	file:        "$URL"
	revision:    "$LastChangedRevision"
	last_change: "$LastChangedDate"

class EXTRACT [T -> EXTRACT_SPEC, U -> EXTRACT_CONTENT]

inherit
	LOCATABLE
		redefine
			uid
		end
		
feature -- Access

	uid: HIER_OBJECT_ID	
			-- Identifier of this Extract.

	request_id: OBJECT_REF	
			-- Reference to causing Request, if any.

	definition: T	
			-- Definition of the actual specification that this Extract conforms to; 
			-- might not be identical with the specification of the corresponding request.

	participations: SET [PARTICIPATION]	
			-- Participations relevant to the creation of this Extract, over and above the 
			-- responsible_party inherited from MESSAGE_CONTENT.

	directory: EXTRACT_FOLDER	
			-- Optional Folder structure for this Extract.

	content: U	
			-- The content extracted and serialised from the source repository for this Extract.

	path_of_item (an_item: LOCATABLE): STRING
			-- The path to an item relative to the root of this archetyped structure.
		do
		end

	item_at_path (a_path: STRING): LOCATABLE
			-- The item at a path (relative to this item).
		do
		end

	parent: LOCATABLE
			-- parent node of this node in compositional structure
		
feature -- Status Report

	path_exists (a_path: STRING): BOOLEAN
			-- True if the path is valid with respect to the current item.
		do
		end
		
invariant
	Uid_exists: uid /= Void
	Request_id_valid: request_id /= Void implies request_id.type.is_equal("EXTRACT_REQUEST")
	Participations_valid: participations /= Void implies not participations.is_empty
	Directory_valid: directory /= Void implies directory.is_archetype_root
	Definition_valid: definition /= Void
	Content_valid: content /= Void	

end



