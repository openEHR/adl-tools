note
	component:   "openEHR Data Types"
	description: "[
			 Encapsulated data expressed as a parsable STRING. The internal model of the data item 
			 is not described in the openEHR model in common with other encapsulated types, but in 
			 this case, the form of the data is assumed to be plaintext, rather than compressed or 
			 other types of large binary data.
			 ]"
	keywords:    "encapsulated, data, parsed"

	requirements:"ISO 18308 TS V1.0 STR ??"
	design:      "openEHR Data Types Reference Model 1.7"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2000-2004 The openEHR Foundation <http://www.openEHR.org>"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class DV_PARSABLE

inherit
	DV_ENCAPSULATED

create
	make

feature -- Initialization

	make (a_value, a_formalism: attached STRING)
		require
			Value_valid: not a_value.is_empty
			Formalism_valid: not a_formalism.is_empty
		do
			value := a_value
			formalism := a_formalism
		end

	make_from_string (str:STRING)
		do
		end

feature -- Access

	value: attached STRING
			-- the string, which may validly be empty in some syntaxes

	formalism: attached STRING
			-- name of the formalism, e.g. “GLIF 1.0”, “proforma” etc.

feature -- Output

	as_string: STRING
			-- string form displayable for humans
		do
		end

invariant
	formalism_exists: not formalism.is_empty

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
--| The Original Code is dv_parsable.e.
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
