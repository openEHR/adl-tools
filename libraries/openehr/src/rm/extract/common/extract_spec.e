note
	component:   "openEHR EHR Reference Model"

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
	license:     "See notice at bottom of class"

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


--|
--| ***** BEGIN LICENSE BLOCK *****
--| Version: MPL 1.1/GPL 2.0/LGPL 2.1
--|
--| The contents of this file are subject to the Mozilla Public License Version
--| 1.1 (the 'License'); you may not use this file except in compliance with
--| the License. You may obtain a copy of the License at
--| http://www.mozilla.org/MPL/
--|
--| Software distributed under the License is distributed on an 'AS IS' basis,
--| WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License
--| for the specific language governing rights and limitations under the
--| License.
--|
--| The Original Code is extract_request.e.
--|
--| The Initial Developer of the Original Code is Thomas Beale.
--| Portions created by the Initial Developer are Copyright (C) 2006
--| the Initial Developer. All Rights Reserved.
--|
--| Contributor(s):
--|
--| Alternatively, the contents of this file may be used under the terms of
--| either the GNU General Public License Version 2 or later (the 'GPL'), or
--| the GNU Lesser General Public License Version 2.1 or later (the 'LGPL'),
--| in which case the provisions of the GPL or the LGPL are applicable instead
--| of those above. If you wish to allow use of your version of this file only
--| under the terms of either the GPL or the LGPL, and not to allow others to
--| use your version of this file under the terms of the MPL, indicate your
--| decision by deleting the provisions above and replace them with the notice
--| and other provisions required by the GPL or the LGPL. If you do not delete
--| the provisions above, a recipient may use your version of this file under
--| the terms of any one of the MPL, the GPL or the LGPL.
--|
--| ***** END LICENSE BLOCK *****
--|
