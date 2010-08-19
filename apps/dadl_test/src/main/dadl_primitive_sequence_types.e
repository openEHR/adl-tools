note
	component:   "openEHR dADL Project"
	description: "Type for testing dADL serialise/deserialise of intervals of simple types."
	keywords:    "test, dADL"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.com>"
	copyright:   "Copyright (c) 2010 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL"
	revision:    "$LastChangedRevision"
	last_change: "$LastChangedDate"

class DADL_PRIMITIVE_SEQUENCE_TYPES


feature -- Access

	my_character: CHARACTER assign set_my_character

	my_character_8: CHARACTER_8 assign set_my_character_8

--	my_character_32: CHARACTER_32 assign set_my_character_32

	my_string: STRING assign set_my_string

	my_string_8: STRING_8 assign set_my_string_8

--	my_string_32: STRING_32 assign set_my_string_32

	my_boolean: BOOLEAN assign set_my_boolean

	my_integer: INTEGER assign set_my_integer

	my_integer_8: INTEGER_8 assign set_my_integer_8

	my_integer_16: INTEGER_16 assign set_my_integer_16

	my_integer_32: INTEGER_32 assign set_my_integer_32

	my_integer_64: INTEGER_64 assign set_my_integer_64

	my_natural: NATURAL assign set_my_natural

	my_natural_8: NATURAL_8 assign set_my_natural_8

	my_natural_16: NATURAL_16 assign set_my_natural_16

	my_natural_32: NATURAL_32 assign set_my_natural_32

	my_natural_64: NATURAL_64 assign set_my_natural_64

	my_real: REAL assign set_my_real

	my_real_32: REAL_32 assign set_my_real_32

	my_real_64: REAL_64 assign set_my_real_64

	my_double: REAL assign set_my_double

	my_date: DATE assign set_my_date

	my_date_time: DATE_TIME assign set_my_date_time

	my_time: TIME assign set_my_time

	my_duration: DATE_TIME_DURATION assign set_my_duration

feature -- Element change

	set_my_character (a_char: like my_character)
		do
			my_character := a_char
		end

	set_my_character_8 (a_char: like my_character_8)
		do
			my_character_8 := a_char
		end

--	set_my_character_32 (a_char: like my_character_32)
--		do
--			my_character_32 := a_char
--		end

	set_my_string (a_str: like my_string)
		do
			my_string := a_str
		end

	set_my_string_8 (a_str: like my_string_8)
		do
			my_string_8 := a_str
		end

--	set_my_string_32 (a_str: like my_string_32)
--		do
--			my_string_32 := a_str
--		end

	set_my_boolean (a_bool: like my_boolean)
		do
			my_boolean := a_bool
		end

	set_my_integer (an_int: like my_integer)
		do
			my_integer := an_int
		end

	set_my_integer_8 (an_int: like my_integer_8)
		do
			my_integer_8 := an_int
		end

	set_my_integer_16 (an_int: like my_integer_16)
		do
			my_integer_16 := an_int
		end

	set_my_integer_32 (an_int: like my_integer_32)
		do
			my_integer_32 := an_int
		end

	set_my_integer_64 (an_int: like my_integer_64)
		do
			my_integer_64 := an_int
		end

	set_my_real (a_real: like my_real)
		do
			 my_real := a_real
		end

	set_my_real_32 (a_real: like my_real_32)
		do
			 my_real_32 := a_real
		end

	set_my_real_64 (a_real: like my_real_64)
		do
			 my_real_64 := a_real
		end

	set_my_double (a_double: like my_double)
		do
			 my_double := a_double
		end

	set_my_natural (a_nat: like my_natural)
		do
			my_natural := a_nat
		end

	set_my_natural_8 (a_nat: like my_natural_8)
		do
			my_natural_8 := a_nat
		end

	set_my_natural_16 (a_nat: like my_natural_16)
		do
			my_natural := a_nat
		end

	set_my_natural_32 (a_nat: like my_natural_32)
		do
			my_natural_32 := a_nat
		end

	set_my_natural_64 (a_nat: like my_natural_64)
		do
			my_natural_64 := a_nat
		end

	set_my_date (a_date: like my_date)
		do
			my_date := a_date
		end

	set_my_date_time (a_date_time: like my_date_time)
		do
			my_date_time := a_date_time
		end

	set_my_time (a_time: like my_time)
		do
			my_time := a_time
		end

	set_my_duration (a_duration: like my_duration)
		do
			my_duration := a_duration
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
--| The Original Code is dadl_base_types.e.
--|
--| The Initial Developer of the Original Code is Thomas Beale.
--| Portions created by the Initial Developer are Copyright (C) 2010
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
