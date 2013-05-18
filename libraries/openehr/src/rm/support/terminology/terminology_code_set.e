note
	component:   "openEHR common definitions"

	description: "Representation of a value domain whose codes are also the meanings"
	keywords:    "terminology, vocabulary"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2012 The openEHR Foundation <http://www.openEHR.org>"
	license:     "See notice at bottom of class"


class TERMINOLOGY_CODE_SET

create
	make

feature -- Initialisation

	make (an_id, an_issuer: STRING)
			-- make a terminology interface with `a_name'
		require
			Id_valid: not an_id.is_empty
			Issuer_valid: not an_issuer.is_empty
		do
			openehr_id := an_id
			issuer := an_issuer
			create codes.make
			codes.compare_objects
		ensure
			Openehr_id_set: openehr_id = an_id
			Issuer_set: issuer = an_issuer
		end

feature -- Access

	openehr_id: STRING
			-- identifier of this code_set

	issuer: STRING

	codes: TWO_WAY_SORTED_SET [STRING]
			-- list of codes

feature -- Status Report

	has_code (a_code: STRING): BOOLEAN
			-- 	True if a_code exists in this code set
		do
			Result := codes.has (a_code)
		end

feature -- Modification

	add_code (a_code: STRING)
		require
			not has_code (a_code)
		do
			codes.extend (a_code)
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
--| The Original Code is terminology_interface.e.
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
