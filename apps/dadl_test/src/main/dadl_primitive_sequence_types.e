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

	my_character_arrayed_list: ARRAYED_LIST[CHARACTER]

	my_character_8_arrayed_list: ARRAYED_LIST[CHARACTER_8]

--	my_character_3_arrayed_list2: ARRAYED_LIST[CHARACTER_32]

	my_string_arrayed_list: ARRAYED_LIST[STRING]

	my_string_8_arrayed_list: ARRAYED_LIST[STRING_8]

--	my_string_32_arrayed_list: ARRAYED_LIST[STRING_32]

	my_boolean_arrayed_list: ARRAYED_LIST[BOOLEAN]

	my_integer_arrayed_list: ARRAYED_LIST[INTEGER]

	my_integer_8_arrayed_list: ARRAYED_LIST[INTEGER_8]

	my_integer_16_arrayed_list: ARRAYED_LIST[INTEGER_16]

	my_integer_32_arrayed_list: ARRAYED_LIST[INTEGER_32]

	my_integer_64_arrayed_list: ARRAYED_LIST[INTEGER_64]

	my_natural_arrayed_list: ARRAYED_LIST[NATURAL]

	my_natural_8_arrayed_list: ARRAYED_LIST[NATURAL_8]

	my_natural_16_arrayed_list: ARRAYED_LIST[NATURAL_16]

	my_natural_32_arrayed_list: ARRAYED_LIST[NATURAL_32]

	my_natural_64_arrayed_list: ARRAYED_LIST[NATURAL_64]

	my_real_arrayed_list: ARRAYED_LIST[REAL]

	my_real_32_arrayed_list: ARRAYED_LIST[REAL_32]

	my_real_64_arrayed_list: ARRAYED_LIST[REAL_64]

	my_double_arrayed_list: ARRAYED_LIST[DOUBLE]

	my_date_arrayed_list: ARRAYED_LIST[DATE]

	my_date_time_arrayed_list: ARRAYED_LIST[DATE_TIME]

	my_time_arrayed_list: ARRAYED_LIST[TIME]

	my_duration_arrayed_list: ARRAYED_LIST[DATE_TIME_DURATION]

	my_iso8601_date_arrayed_list: ARRAYED_LIST[ISO8601_DATE]

	my_iso8601_date_time_arrayed_list: ARRAYED_LIST[ISO8601_DATE_TIME]

	my_iso8601_time_arrayed_list: ARRAYED_LIST[ISO8601_TIME]

	my_iso8601_duration_arrayed_list: ARRAYED_LIST[ISO8601_DURATION]

feature -- Element change

	set_my_character_arrayed_list (a_char_arrayed_list: like my_character_arrayed_list)
		do
			my_character_arrayed_list := a_char_arrayed_list
		end

	set_my_character_8_arrayed_list (a_char_arrayed_list: like my_character_8_arrayed_list)
		do
			my_character_8_arrayed_list := a_char_arrayed_list
		end

--	set_my_character_32_arrayed_list (a_char_arrayed_list: like my_character_32_arrayed_list)
--		do
--			my_character_32_arrayed_list := a_char_arrayed_list
--		end

	set_my_string_arrayed_list (a_str_arrayed_list: like my_string_arrayed_list)
		do
			my_string_arrayed_list := a_str_arrayed_list
		end

	set_my_string_8_arrayed_list (a_str_arrayed_list: like my_string_8_arrayed_list)
		do
			my_string_8_arrayed_list := a_str_arrayed_list
		end

--	set_my_string_32_arrayed_list (a_str_arrayed_list: like my_string_32_arrayed_list)
--		do
--			my_string_32_arrayed_list := a_str_arrayed_list
--		end

	set_my_boolean_arrayed_list (a_bool_arrayed_list: like my_boolean_arrayed_list)
		do
			my_boolean_arrayed_list := a_bool_arrayed_list
		end

	set_my_integer_arrayed_list (an_int_arrayed_list: like my_integer_arrayed_list)
		do
			my_integer_arrayed_list := an_int_arrayed_list
		end

	set_my_integer_8_arrayed_list (an_int_arrayed_list: like my_integer_8_arrayed_list)
		do
			my_integer_8_arrayed_list := an_int_arrayed_list
		end

	set_my_integer_16_arrayed_list (an_int_arrayed_list: like my_integer_16_arrayed_list)
		do
			my_integer_16_arrayed_list := an_int_arrayed_list
		end

	set_my_integer_32_arrayed_list (an_int_arrayed_list: like my_integer_32_arrayed_list)
		do
			my_integer_32_arrayed_list := an_int_arrayed_list
		end

	set_my_integer_64_arrayed_list (an_int_arrayed_list: like my_integer_64_arrayed_list)
		do
			my_integer_64_arrayed_list := an_int_arrayed_list
		end

	set_my_real_arrayed_list (a_real_arrayed_list: like my_real_arrayed_list)
		do
			 my_real_arrayed_list := a_real_arrayed_list
		end

	set_my_real_32_arrayed_list (a_real_arrayed_list: like my_real_32_arrayed_list)
		do
			 my_real_32_arrayed_list := a_real_arrayed_list
		end

	set_my_real_64_arrayed_list (a_real_arrayed_list: like my_real_64_arrayed_list)
		do
			 my_real_64_arrayed_list := a_real_arrayed_list
		end

	set_my_double_arrayed_list (a_double_arrayed_list: like my_double_arrayed_list)
		do
			 my_double_arrayed_list := a_double_arrayed_list
		end

	set_my_natural_arrayed_list (a_nat_arrayed_list: like my_natural_arrayed_list)
		do
			my_natural_arrayed_list := a_nat_arrayed_list
		end

	set_my_natural_8_arrayed_list (a_nat_arrayed_list: like my_natural_8_arrayed_list)
		do
			my_natural_8_arrayed_list := a_nat_arrayed_list
		end

	set_my_natural_16_arrayed_list (a_nat_arrayed_list: like my_natural_16_arrayed_list)
		do
			my_natural_16_arrayed_list := a_nat_arrayed_list
		end

	set_my_natural_32_arrayed_list (a_nat_arrayed_list: like my_natural_32_arrayed_list)
		do
			my_natural_32_arrayed_list := a_nat_arrayed_list
		end

	set_my_natural_64_arrayed_list (a_nat_arrayed_list: like my_natural_64_arrayed_list)
		do
			my_natural_64_arrayed_list := a_nat_arrayed_list
		end

	set_my_date_arrayed_list (a_date_arrayed_list: like my_date_arrayed_list)
		do
			my_date_arrayed_list := a_date_arrayed_list
		end

	set_my_date_time_arrayed_list (a_date_time_arrayed_list: like my_date_time_arrayed_list)
		do
			my_date_time_arrayed_list := a_date_time_arrayed_list
		end

	set_my_time_arrayed_list (a_time_arrayed_list: like my_time_arrayed_list)
		do
			my_time_arrayed_list := a_time_arrayed_list
		end

	set_my_duration_arrayed_list (a_duration_arrayed_list: like my_duration_arrayed_list)
		do
			my_duration_arrayed_list := a_duration_arrayed_list
		end

	set_my_iso8601_date_arrayed_list (a_iso8601_date_arrayed_list: like my_iso8601_date_arrayed_list)
		do
			my_iso8601_date_arrayed_list := a_iso8601_date_arrayed_list
		end

	set_my_iso8601_date_time_arrayed_list (a_iso8601_date_time_arrayed_list: like my_iso8601_date_time_arrayed_list)
		do
			my_iso8601_date_time_arrayed_list := a_iso8601_date_time_arrayed_list
		end

	set_my_iso8601_time_arrayed_list (a_iso8601_time_arrayed_list: like my_iso8601_time_arrayed_list)
		do
			my_iso8601_time_arrayed_list := a_iso8601_time_arrayed_list
		end

	set_my_iso8601_duration_arrayed_list (a_iso8601_duration_arrayed_list: like my_iso8601_duration_arrayed_list)
		do
			my_iso8601_duration_arrayed_list := a_iso8601_duration_arrayed_list
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
