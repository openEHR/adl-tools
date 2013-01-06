note
	component:   "openEHR Archetype Project"
	description: "Persistent form of C_CODE_PHRASE"
	keywords:    "codephrase, ADL"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2011- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "See notice at bottom of class"

class P_C_CODE_PHRASE

inherit
	P_C_DEFINED_OBJECT
		redefine
			make
		end

create
	make

feature -- Initialisation

	make (a_ccp: C_CODE_PHRASE)
			-- Make from a C_CODE_PHRASE
		do
			precursor (a_ccp)
			terminology_id := a_ccp.terminology_id.value
			code_list := a_ccp.code_list
		end

feature -- Access

	terminology_id: STRING

	code_list: detachable ARRAYED_LIST [STRING]
			-- list of codes in terminology designated by terminology_id

feature -- Factory

	create_c_code_phrase: C_CODE_PHRASE
		do
			create Result.make_from_terminology_id (terminology_id)
			if attached code_list as cl then
				Result.set_code_list (cl)
			end
			populate_c_instance (Result)
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
--| The Original Code is cadl_object_term.e.
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
