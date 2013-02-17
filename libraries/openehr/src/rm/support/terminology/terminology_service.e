note
	component:   "openEHR common definitions"

	description: "Simple terminology service interface definition"
	keywords:    "terminology, vocabulary, identifiers"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2000- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "See notice at bottom of class"
	void_safe:   "yes"

class TERMINOLOGY_SERVICE

inherit
	BASIC_DEFINITIONS

	OPENEHR_TERMINOLOGY_GROUP_IDENTIFIERS

	OPENEHR_CODE_SET_IDENTIFIERS

feature -- Access

	terminology (name: STRING): detachable TERMINOLOGY_ACCESS
			-- return a terminology access object for a terminology identified in openEHR by openehr_id
			-- Allowable names are:
			--    * official names from the US NLM UMLS meta-data list at http://www.nlm.nih.gov/research/umls/metaa1.html
			--    * "openehr"
			--    * "cen13606-3"
		require
			id_valid: has_terminology (name)
		do
			Result := terminologies.item (name)
		end

	code_set (code_set_id: STRING): detachable CODE_SET_ACCESS
			-- Allowable names are taken from OPENEHR_CODE_SET_IDENTIFIERS class
		require
			id_valid: has_code_set (code_set_id)
		do
			Result := code_sets.item (code_set_id)
		end

feature -- Status Report

	has_terminology (a_name: STRING): BOOLEAN
			-- True if terminology with name is known by this service
			-- Allowable names are:
			--    * official names from the US NLM UMLS meta-data list at http://www.nlm.nih.gov/research/umls/metaa1.html
			--    * "openehr"
			--    * "cen13606-3"
		require
			name_valid: not a_name.is_empty
		do
			Result := terminologies.has (a_name)
		end

	has_code_set (name: STRING): BOOLEAN
			-- True if code set with name is known by this service
			-- Allowable names are taken from OPENEHR_CODE_SET_IDENTIFIERS class
		require
			name_valid: not name.is_empty
		do
			Result := code_sets.has (name)
		end

feature -- Modification

	add_terminology (a_name: STRING)
		require
			not has_terminology (a_name)
		do
			terminologies.put (create {TERMINOLOGY_ACCESS}.make (a_name), a_name)
		end

feature {NONE} -- Implementation

	terminologies: HASH_TABLE [TERMINOLOGY_ACCESS, STRING]
		once
			create Result.make (0)
		end

	code_sets: HASH_TABLE [CODE_SET_ACCESS, STRING]
		once
			create Result.make (0)
		end

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
--| The Original Code is terminology_service.e.
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
