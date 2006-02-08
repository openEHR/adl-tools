indexing
	component:   "openEHR Common Reference Model"
	
	description: "[
				 Proxy data for an identified party other than the subject of the 
				 record, minimally consisting of human-readable identifier(s), 
				 such as name, formal (and possibly computable) identifiers such 
				 as NHS number, and an optional link to external data. There must 
				 be at least one of name, identifier or external_ref present.	
				 
				 Used to describe parties where only identifiers may be known, and 
				 there is no entry at all in the demographic system (or even no 
				 demographic system). Typically for health care providers, e.g. 
				 name and provider number of an institution.
				 ]"
	keywords:    "attestation"

	design:      "openEHR Common Reference Model 2.0"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2005 The openEHR Foundation <http://www.openEHR.org>"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class PARTY_IDENTIFIED

inherit
	PARTY_PROXY

feature -- Initialization

feature -- Access

	name: STRING	
			-- optional human-readable name

	identifiers: LINKED_LIST [DV_IDENTIFIER]
			-- optional machine-readable / administrative identifiers

feature -- Conversion
	
	as_string: STRING is
			-- generate string form of identifier
		do
			create Result.make(0)
			Result.append(name)
		end
		
invariant
	Basic_validity: name /= Void or identifiers /= Void or external_ref /= Void
	Name_validity: name /= Void implies not name.is_empty
	Identifiers_validity: identifiers /= Void implies not identifiers.is_empty
	
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
--| The Original Code is related_party.e.
--|
--| The Initial Developer of the Original Code is Thomas Beale.
--| Portions created by the Initial Developer are Copyright (C) 2005
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
