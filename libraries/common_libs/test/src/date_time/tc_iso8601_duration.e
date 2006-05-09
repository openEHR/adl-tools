indexing
	component:   "openEHR Reusable Libraries"
	description: "Test case for ISO8601_DURATION type."
	keywords:    "test, date, time"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2006 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class TC_ISO8601_DURATION

inherit
	TEST_CASE
		redefine 
			check_result
		end
		
	SHARED_TEST_ENV
		export
			{NONE} all
		end

creation
	make

feature -- Access

	title: STRING is "ISO8601_DURATION test"

feature -- Initialisation

	make(arg:ANY) is
		do
		end

	execute is
		local
			iso_dur: ISO8601_DURATION
			str, iso_dur_str: STRING
		do
			io.put_string("input    	is_valid_iso8601_duration()		as_string valid%N")
			io.put_string("---------	---------------------------		---------------%N")

			from
				valid_iso_strings.start
			until
				valid_iso_strings.off
			loop
				create str.make (0)
				str.copy (valid_iso_strings.item)
				str.append(create {STRING}.make_filled(' ', 20-str.count))
				str.append_character('%T')

				if is_valid_iso8601_duration(valid_iso_strings.item) then
					create iso_dur.make_from_string(valid_iso_strings.item)
					str.append("True%T%T%T%T")
					iso_dur_str := iso_dur.as_string
					str.append(valid_iso_strings.item.is_equal(iso_dur_str).out)
					str.append("%T(" + iso_dur_str + ")")
					io.put_string(str + "%N")
				else
					str.append("False%T%T%T%T-")
					io.put_string(str + "%N")
				end
				valid_iso_strings.forth
			end

			io.put_string("%Ninput    	!is_valid_iso8601_duration()	as_string valid%N")
			io.put_string("---------	----------------------------	---------------%N")
			from
				invalid_iso_strings.start
			until
				invalid_iso_strings.off
			loop
				create str.make (0)
				str.copy (invalid_iso_strings.item)
				str.append(create {STRING}.make_filled(' ', 20-str.count))
				str.append_character('%T')
				io.put_string(str + (not
				is_valid_iso8601_duration(invalid_iso_strings.item)).out + "%T%T%T%T-%N")
				invalid_iso_strings.forth
			end
		end

	valid_iso_strings: ARRAYED_LIST [STRING] is
		once
			create Result.make(0)

			Result.extend("P1Y")
			Result.extend("P1M")
			Result.extend("P1W")
			Result.extend("P1D")
			Result.extend("PT1H")
			Result.extend("PT1M")
			Result.extend("PT1S")

			Result.extend("P39W")
			Result.extend("P150D")
			Result.extend("P12M")

			Result.extend("P22Y3M5D")
			Result.extend("P2DT15h32M12S")
			Result.extend("P22Y3M5DT15H32M12s")

			Result.extend("PT1,04S")
			Result.extend("PT2H4M22,049S")
		end

	invalid_iso_strings: ARRAYED_LIST [STRING] is
		once
			create Result.make(0)

			Result.extend("P1H")
			Result.extend("P1S")
		end

feature -- Access

	check_result is
	    do
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
--| The Original Code is tc_base_units.e.
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
