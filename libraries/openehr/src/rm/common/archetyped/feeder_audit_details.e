indexing
	component:   "openEHR Common Reference Model"
	description: "[
			     Audit details from any system in feeder audit chain
			     ]"
	keywords:    "locator, locatable"

	design:      "openEHR Common Reference Model 2.0"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2006 The openEHR Foundation <http://www.openEHR.org>"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class FEEDER_AUDIT_DETAILS

feature -- Initialisation
	
	make(a_system_id:STRING) is
		require
			a_system_id_exists: a_system_id /= Void and then not a_system_id.is_empty
		do
		end

feature -- Access

	system_id: STRING	
			-- Identifier of the system which handled the information item.

	provider: PARTY_IDENTIFIED	
			-- Optional provider(s) who created, committed, forwarded or otherwise handled the item.

	location: PARTY_IDENTIFIED	
			-- Identifier of the particular site/facility within an organisation which handled the item. 
			-- For computability, this identifier needs to be e.g. a PKI identifier which can be included 
			-- in the identifier list of the PARTY_IDENTIFIED object.

	time: DV_DATE_TIME	
			-- Time of handling the item.

	subject: PARTY_PROXY	
			-- Identifiers for subject of the received information item.

	version_id: STRING	
			-- Any identifier used in the system such as “interim”, “final”, or numeric versions if available.

invariant
	System_id_valid: system_id /= Void implies not system_id.is_empty	

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
--| The Original Code is feeder_audit.e.
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
