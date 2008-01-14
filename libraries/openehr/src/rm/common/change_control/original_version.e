indexing
	component:   "openEHR Common Information Model"

	description: "[
				 Original version - the concept of a VERSION created to contain original content, as
				 opposed to an imported version that wraps existing content.
				 Also supports recording the list of input versions to the merge 
				 in addition to standard Version attributes.	
				 ]"
	keywords:    "version"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2006 The openEHR Foundation <http://www.openEHR.org>"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class ORIGINAL_VERSION [G]

inherit
	VERSION [G]

feature -- Access

	uid: OBJECT_VERSION_ID
			-- Stored version of inheritance precursor.

	preceding_version_uid: OBJECT_VERSION_ID	
			-- Stored version of inheritance precursor.
	
	data: G
			-- the data being versioned. If not present, this corresponds to logical deletion.

	attestations: LIST [ATTESTATION]	
			-- Set of attestations relating to this version.

	other_input_version_uids: SET [OBJECT_VERSION_ID]	
			-- Identifiers of the Versions used as input into this merged version, if any. There is 
			-- no guarantee that the identifiers of all Versions contributing to this Version
			-- are included here - this list is merely indicative, but can be used to track 
			-- machine-managed version mreging as well

	lifecycle_state: DV_CODED_TEXT	
			-- Lifecycle state of the content item in this version.
			
feature -- Status Report

	is_merged: BOOLEAN is
			-- True if this Version was created from more than just the preceding (checked out) version
		do
			
		end

invariant
	Attestations_valid: attestations /= Void implies not attestations.is_empty
	Other_input_version_uids_valid: other_input_version_uids /= Void xor is_merged	
	Other_input_version_uids_valid: other_input_version_uids /= Void implies not other_input_version_uids.is_empty
	
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
--| The Original Code is versionable.e.
--|
--| The Initial Developer of the Original Code is Thomas Beale.
--| Portions created by the Initial Developer are Copyright (C) 2003-2004
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
