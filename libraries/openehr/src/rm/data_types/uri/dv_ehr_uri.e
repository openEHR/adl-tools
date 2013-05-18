note
	component:   "openEHR Data Types"

	description: "[
			 A DV_EHR_URI is a DV_URI which has the scheme name 'ehr., and which 
			 can only reference elements in EHRs. 
			 ]"
	keywords:    "www, uri"

	requirements:"ISO 18308 TS V1.0 STR ??"
	design:      "openEHR Data Types Reference Model 1.7"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2000-2004 The openEHR Foundation <http://www.openEHR.org>"
	license:     "See notice at bottom of class"


class DV_EHR_URI

inherit
	DV_URI
		redefine
			scheme, path, fragment_id
		end

create
	make_from_string, make_from_canonical_string
	
feature -- Definitions

	Ehr_scheme:STRING = "ehr"
		
feature -- Access

	ehr_id: STRING
			-- the EHR identification part of the URI
		do
		end

	transaction_id:STRING
			-- the Transaction identification part of the URI
		do
		end

	organiser_id:STRING
			-- the Organiser identification part of the URI
		do
		end

	entry_id:STRING
			-- the Entry identification part of the URI
		do
		end

	scheme:STRING 
		once
			create Result.make(0)
			Result.append(Ehr_scheme)
		end

	path: STRING
		do
			Result := ehr_id + transaction_id
		end

	fragment_id: STRING
		do
			Result := organiser_id + entry_id
		end

feature -- Status Report

	target_is_ehr: BOOLEAN
			-- True if target is an EHR
		do
			
		end
		
	target_is_transaction: BOOLEAN
			-- 	True if target is a Transaction
		do
			
		end
		
	target_is_organiser: BOOLEAN
			-- True if target is an Organiser
		do
			
		end
		
	target_is_entry: BOOLEAN
			-- True if target is an Entry
		do
			
		end
		
invariant
	Scheme_is_EHR: scheme.is_equal(Ehr_scheme)

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
--| The Original Code is dv_ehr_uri.e.
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
