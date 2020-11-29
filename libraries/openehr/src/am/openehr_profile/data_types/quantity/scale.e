note
	component:   "openEHR Archetype Project"
	description: "FIXME: temporary type for SCALE until reconciled with DV_SCALE"
	keywords:    "scale, ADL"

	author:      "Peter Gummer"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2003, 2004 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class
	SCALE

inherit
	ANY
		redefine
			out
		end

create
	make

feature -- Definitions

	Separator: CHARACTER is '|'
			-- separates each value from its code-phrase

feature -- Initialisation

	make(a_value: REAL; a_symbol: CODE_PHRASE; a_value_text: STRING)
			-- set value & symbol
		require
			A_symbol_valid: a_symbol /= Void
			A_value_text_valid: a_value_text /= Void
		do
			value := a_value
			symbol := a_symbol
			value_text := a_value_text
		ensure
			Value_set: value = a_value
			Symbol_set: symbol = a_symbol
			Value_text_set: value_text = a_value_text
		end

feature -- Access

	value: REAL

	symbol: CODE_PHRASE

	value_text: STRING

feature -- Conversion

	as_string: STRING
			--
		do
			create Result.make(0)
			Result.append (value_text + Separator.out + "[" + symbol.as_string + "]")
		end

	out: STRING
			--
		do
			Result := as_string
		end

invariant
	Symbol_exists: symbol /= Void
	Value_text_exists: value_text /= Void

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
--| The Original Code is scale.e.
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
