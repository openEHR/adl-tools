note
	component:   "openEHR Archetype Project"
	description: "Miscellaneous String utilities."
	keywords:    "formatting"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2003- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "See notice at bottom of class"

class DT_STRING_UTILITIES

inherit
	STRING_UTILITIES

feature -- Conversion

	primitive_value_to_dadl_string (a_prim_val: ANY): STRING
			-- generate a string, including dADL delimiters, e.g. "", '' for strings and chars.
		do
			if attached {STRING_GENERAL} a_prim_val then
				Result := "%"" + a_prim_val.out + "%""
			elseif attached {CHARACTER} a_prim_val or attached {CHARACTER_32} a_prim_val then
				Result := "%'" + a_prim_val.out + "%'"
			elseif attached {TERMINOLOGY_CODE} a_prim_val then
				Result := "[" + a_prim_val.out + "]"
			else
				Result := serialise_primitive_value (a_prim_val)
			end
		end

	primitive_value_to_simple_string (a_prim_val: ANY): STRING
			-- generate a basic string
		do
			-- FIXME: duration.out does not exist in Eiffel, and in any case would not be ISO8601-compliant
			if attached {DATE_TIME_DURATION} a_prim_val as a_dur then
				Result := (create {ISO8601_DURATION}.make_date_time_duration(a_dur)).as_string
			elseif attached {DATE_TIME} a_prim_val as a_dt then
				Result := (create {ISO8601_DATE_TIME}.make_date_time(a_dt)).as_string
			else
				Result := a_prim_val.out
				-- FIXME: REAL.out is broken (still the case in Eiffel 6.6)
				if (attached {REAL_32} a_prim_val or attached {REAL_64} a_prim_val) and then Result.index_of ('.', 1) = 0 then
					Result.append(".0")
				end
			end
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
--| The Original Code is string_routines.e.
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
