note
	component:   "openEHR Archetype Project"
	description: "Assertion operator instance"
	keywords:    "ADL, assertion"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2005 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"
	void_safety: "initial"


class OPERATOR_KIND

inherit
	OPERATOR_TYPES
		redefine
			out
		end

create
	make, make_from_string

feature -- Initialisation

	make (an_op: INTEGER)
			-- make from operator code
		require
			valid_operator: valid_operator (an_op)
		do
			value := an_op
		end

	make_from_string (an_op_name: STRING)
			-- make from operator name
		require
			valid_operator_name: valid_operator_name (an_op_name)
		do
			value := operator_values.item (an_op_name)
		end

feature -- Access

	value: Integer
			-- Actual value of this instance

feature -- Output

	out: STRING
			-- output symbolic form
		do
			Result := as_string_symbol
		end

	as_string_symbol: STRING
			-- output symbolic form, e.g. "="
		do
			create Result.make_from_string (operator_symbol (value))
		end

	as_string_name: STRING
			-- output word form e.g. "equals"
		do
			create Result.make_from_string (operator_name (value))
		end

	as_text_symbol: STRING
			-- output word form e.g. "equals"
		do
			create Result.make_from_string (operator_text_identifier (value))
		end

invariant
	Validity: valid_operator (value)

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
--| The Original Code is operator_kind.e.
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
