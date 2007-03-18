indexing
	component:   "openEHR EHR Reference Model"

	description: "[
				  Generic model of an Extract of some information from a repository; the 
				  generic parameters select which kind of specification and content the Extract carries.
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

	path_of_item (an_item: LOCATABLE): STRING is
			-- The path to an item relative to the root of this archetyped structure.
		do
		end

	item_at_path (a_path: STRING): LOCATABLE is
			-- The item at a path (relative to this item).
		do
		end

	parent: LOCATABLE
			-- parent node of this node in compositional structure
		
feature -- Status Report

	path_exists (a_path: STRING): BOOLEAN is
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
