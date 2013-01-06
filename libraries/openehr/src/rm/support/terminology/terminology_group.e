note
	component:   "openEHR common definitions"

	description: "Representation of a value domain"
	keywords:    "terminology, vocabulary"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2012- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "See notice at bottom of class"
	void_safe:	 "yes"

class TERMINOLOGY_GROUP

create
	make

feature -- Initialisation

	make (a_name: STRING)
			-- make a terminology interface with `a_name'
		require
			Name_valid: not a_name.is_empty
		do
			name := a_name
			create terms.make (0)
		ensure
			Name_set: name = a_name
		end

feature -- Access

	name: STRING
			-- identifier of this terminology value set (group)

	term (a_code: STRING): detachable DV_CODED_TEXT
		require
			has_term (a_code)
		do
			Result := terms.item (a_code)
		end

feature -- Status Report

	has_term (a_concept_code: STRING): BOOLEAN
			-- 	True if a_concept_code exists in this code set
		do
			Result := terms.has (a_concept_code)
		end

feature -- Modification

	add_term (a_term: DV_CODED_TEXT)
		require
			not has_term (a_term.defining_code.code_string)
		do
			terms.put (a_term, a_term.defining_code.code_string)
		end

feature {NONE} -- mplementation

	terms: HASH_TABLE [DV_CODED_TEXT, STRING]
			-- table of terms indexed by concept code


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
