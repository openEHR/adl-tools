note
	component:   "openEHR ADL Tools"

	description: "[
				  Specification of an Extract’s contents. Subtypes are used to add 
				  details specific to the type of Extract. The specification consists 
				  of attributes specifying the directory, and two further 
				  groups of attributes in their own classes, namely a content specification 
				  (which information items are to be included in the specification) and a 
				  versioning specfication (which versions of information items are to be 
				  included).
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

class EXTRACT_SPEC

feature -- Access

	extract_type: STRING
			-- Coded term indicating the type of content required, e.g. 
			-- “openEHR EHR”
			-- “openEHR demographic”
			-- “other EHR/EMR”
			-- “other”

	includes_directory: BOOLEAN
			-- True if extract includes a Folder directory

	directory_archetype: ARCHETYPE_ID
			-- Identifier of archetype to use for local Folder structure; if Void and 
			-- includes_directory is True, a non-archetyped directory is used. 

	content_spec: EXTRACT_CONTENT_SPEC	
			-- Specification of information items to include in the Extract.

	version_spec: EXTRACT_VERSION_SPEC	
			-- Specification of which versions of information items to include in the Extract. 
			-- If Void, the default is latest versions only (which is reasonable for non-versioning 
			-- systems as well).

	other_details: ITEM_STRUCTURE	
			-- Other specification items. Archetypable.

invariant
	Extract_type_valid: extract_type /= Void
	Content_spec_valid: content_spec /= Void
	Directory_valid: directory_archetype /= Void implies includes_directory

end


