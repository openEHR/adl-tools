note
	component:   "openEHR common definitions"
	
	description: "Simple code set interface definition"
	keywords:    "terminology, vocabulary, code set"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2000-2004 The openEHR Foundation <http://www.openEHR.org>"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class CODE_SET_ACCESS

create
	make
	
feature -- Initialisation
	
	make(an_id: STRING)
			-- make a code_set interface with `an_id'
		require
			Id_valid: an_id /= Void and then not an_id.is_empty
		do
			id := an_id
		ensure
			Id_set: id = an_id
		end

feature -- Access

	id: STRING
			-- identifier of this terminology

	all_codes: SET [CODE_PHRASE]
		do
			create {LINKED_SET[CODE_PHRASE]} Result.make
		ensure
			Result_exists: Result /= Void
		end
		
feature -- Status Report

	has(a_code: CODE_PHRASE): BOOLEAN
			-- 	True if a_code exists in thsi code set
		require
			Code_exists: a_code /= Void
		do
			-- FIXME: TO_BE_IMPLEM
			Result := True
		end

	has_code(a_code: STRING): BOOLEAN
		require
			a_code_valid: a_code /= Void and then not a_code.is_empty
		do
			-- FIXME: TO_BE_IMPLEM
			Result := True
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
--| The Original Code is code_set_interface.e.
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
