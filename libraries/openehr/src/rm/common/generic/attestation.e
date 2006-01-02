indexing
	component:   "openEHR Common Reference Model"
	
	description: "Abstract model of attestation of a party to some information"
	keywords:    "attestation"

	design:      "openEHR Common Reference Model 2.0"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2000-2005 The openEHR Foundation <http://www.openEHR.org>"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class ATTESTATION

inherit
	AUDIT_DETAILS

	EXTERNAL_ENVIRONMENT_ACCESS
		export
			{NONE} all
		end

feature -- Initialization

feature -- Access

	proof: DV_ENCAPSULATED	
			-- Proof of attestation.

	items: Set [DV_EHR_URI]
			-- Items attested. Although not recommended, these may include fine-grained 
			-- items which have been attested in some other system. Otherwise the attestation 
			-- is for the entire Version with which it is associated.

	reason: DV_TEXT	
			-- reason of attestation; coded by openEHR terminology group
			-- "attestation reason"

	is_pending: BOOLEAN
			-- True if this attestation is pending

invariant
	-- re-instate when we can state an expression which includes an assignment attempt
	--Reason_validity: reason /= Void and then
	--	(reason.generating_type.is_equal("DV_CODED_TEXT") implies
	--	terminology("openehr").codes_for_group_name("attestation status",
	--	"en").has(reason.defining_code))

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
--| The Original Code is attestation.e.
--|
--| The Initial Developer of the Original Code is Thomas Beale.
--| Portions created by the Initial Developer are Copyright (C) 2003-2005
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
