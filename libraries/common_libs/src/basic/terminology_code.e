note
	component:   "Basic Data Types"

	description: "[
				 Terminology code, possibly coordinated by terminology service; consisting of
				 a key, which is parsable into a terminology id and a code string,
				 representing the key within the terminology service for the intended
				 concept, from the given terminology.
				 The format of the key is:
					terminology_id SEP code_string
				 ]"
	keywords:    "text, data"

	requirements:"ISO 18308 TS V1.0 STR 4.2"
	design:      "openEHR Data Types Reference Model 1.7"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2000- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "See notice at bottom of class"

class TERMINOLOGY_CODE

inherit
	COMPARABLE
		undefine
			out
		end

create
	default_create, make, make_from_string

feature -- Definitions

	default_terminology_id: STRING = "local"

	default_code_string: STRING = "000001"

	separator: STRING = "::"

feature -- Initialization

	make_from_string (str: STRING)
			-- make from a string of the form terminology_id::code_string, e.g. ICD10(1998)::M10
			-- the form terminology_id:: is also allowable, in which case the default_code_string will
			-- be used
		require
			Key_valid: not str.is_empty
		local
			sep_pos: INTEGER
		do
			sep_pos := str.substring_index (separator, 1)
			create terminology_id.make_from_string (str.substring (1, sep_pos-1))
			if str.count >= sep_pos + separator.count then
				code_string := str.substring (sep_pos+separator.count, str.count)
			else
				code_string := default_code_string.twin
			end
		end

	make (a_terminology_id, a_code_string: STRING)
			-- make from two strings
		require
			Terminology_id_valid: not a_terminology_id.is_empty
			Code_string_valid: not a_code_string.is_empty
		do
			terminology_id := a_terminology_id
			code_string := a_code_string
		ensure
			Terminology_id_set: terminology_id.is_equal(a_terminology_id)
			Code_string_set: code_string = a_code_string
		end

feature -- Access

	terminology_id: STRING
			-- Identifier of the distinct terminology from which the code_string
			-- (or its elements) was extracted
		attribute
			create Result.make_from_string (default_terminology_id)
		end

	code_string: STRING
			-- The key used by the terminology service to identify a concept or
			-- coordination of concepts. This string is most likely parsable inside
			-- the terminology service, but nothing can be assumed about its syntax
			-- outside that context.
		attribute
			create Result.make_from_string (default_code_string)
		end

feature -- Comparison

	is_less alias "<" (other: like Current): BOOLEAN
			-- Compare two terms
		local
			s, s_other: STRING
		do
			create s.make(0)
			s.append (terminology_id)
			s.append (code_string)

			create s_other.make(0)
			s_other.append (other.terminology_id)
			s_other.append (other.code_string)

			Result := s < s_other
		end

feature -- Output

	as_string: STRING
			-- string form displayable for humans - e.g. ICD9(1989)::M17
		do
			create Result.make(0)
			Result.append (terminology_id)
			Result.append (separator)
			Result.append (code_string)
		end

	out: STRING
			-- '['  + `as_string' + ']'
		do
			Result := as_string
		end

invariant
	code_string_valid: not code_string.is_empty

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
--| The Original Code is coordinated_term.e.
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
