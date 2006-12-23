indexing
	component:   "openEHR EHR Extract Reference Model"

	description: "[
				  A 'message' is an authored, possibly signed, piece of content intended for one or more recipients. 
				  Since the recipient may or may not be known directly, recipients are specified in the ADDRESSED_MESSAGE class.
				 ]"
	keywords:    "message"

	design:      "openEHR EHR Extract Reference Model 2.0"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2000-2006 The openEHR Foundation <http://www.openEHR.org>"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class MESSAGE

feature -- Access

	audit: AUDIT_DETAILS	
			-- Details of who actually created the messageand when. This is the person who entered the data or 
			-- otherwise caused the message to be created, or might be a piece of softare.

	author: PARTY_PROXY	
			-- Party responsible for the message content, who may or may not be technically responsible for 
			-- its creation (e.g. by data entry etc).

	content: ANY	
			-- Content of the message.

	signature: STRING	
			-- Optional signature by the author of message content in openPGP format. The signature is created 
			-- as a Hash and optional signing of the serialisation of this message object with this signature field Void.

invariant
	Author_valid: author /= Void
	Audit_valid: audit /= Void
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
--| The Original Code is message_content.e.
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
