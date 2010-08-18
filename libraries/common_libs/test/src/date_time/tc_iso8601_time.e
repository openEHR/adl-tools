note
	component:   "openEHR Reusable Libraries"
	description: "Test case for ISO8601_TIME type."
	keywords:    "test, date, time"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2006 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class TC_ISO8601_TIME

inherit
	TEST_CASE
		redefine 
			check_result
		end
		
	SHARED_TEST_ENV
		export
			{NONE} all
		end

create
	make

feature -- Access

	title: STRING = "ISO8601_TIME test"

feature -- Initialisation

	make(arg:ANY)
		do
		end

	execute
		local
			iso_time: ISO8601_TIME
			str, iso_time_str: STRING
		do
			io.put_string("input    	is_valid_iso8601_time()		as_string valid%N")
			io.put_string("---------	-----------------------		---------------%N")

			from
				valid_iso_strings.start
			until
				valid_iso_strings.off
			loop
				create str.make (0)
				str.copy (valid_iso_strings.item)
				str.append(create {STRING}.make_filled(' ', 20-str.count))
				str.append_character('%T')

				if valid_iso8601_time(valid_iso_strings.item) then
					create iso_time.make_from_string(valid_iso_strings.item)
					str.append("True%T%T%T")
					iso_time_str := iso_time.as_string
					str.append(valid_iso_strings.item.is_equal(iso_time_str).out)
					str.append("%T(" + iso_time_str + ")")
					io.put_string(str + "%N")
				else
					str.append("False%T%T%T-")
					io.put_string(str + "%N")
				end
				valid_iso_strings.forth
			end

			io.put_string("%Ninput    	!is_valid_iso8601_time()	as_string valid%N")
			io.put_string("---------	------------------------	---------------%N")
			from
				invalid_iso_strings.start
			until
				invalid_iso_strings.off
			loop
				create str.make (0)
				str.copy (invalid_iso_strings.item)
				str.append(create {STRING}.make_filled(' ', 20-str.count))
				str.append_character('%T')
				io.put_string(str + (not valid_iso8601_time(invalid_iso_strings.item)).out + "%T%T%T-%N")
				invalid_iso_strings.forth
			end
		end

	valid_iso_strings: ARRAYED_LIST [STRING]
		once
			create Result.make(0)

			--	hh
			Result.extend("12")
			Result.extend("00")
			Result.extend("24")
			Result.extend("18Z")
			Result.extend("18+0700")

			Result.extend("12Z")
			Result.extend("12+1000")
			Result.extend("12-1000")

			--	hhmm
			Result.extend("1231")
			Result.extend("0031")
			Result.extend("2400")
			Result.extend("1200")
			Result.extend("0059")

			Result.extend("1540Z")
			Result.extend("1540+0600")
			Result.extend("1540-0000")

			--  hhmmss
			Result.extend("123122")
			Result.extend("003122")
			Result.extend("240000")
			Result.extend("000000")
			Result.extend("120000")
			Result.extend("005959")

			--	hh:mm
			Result.extend("12:31")
			Result.extend("00:31")
			Result.extend("24:00")
			Result.extend("12:00")
			Result.extend("00:59")
			Result.extend("00:59Z")
			Result.extend("00:59+1000")
			
			--  hhmmss,sss
			Result.extend("123122,123")

			-- 	hh:mm:ss
			Result.extend("12:31:22")
			Result.extend("00:31:22")
			Result.extend("24:00:00")
			Result.extend("00:00:00")
			Result.extend("12:00:00")
			Result.extend("00:59:59")
			Result.extend("18:04:00Z")
			Result.extend("18:04:00+1000")
			
			-- 	hh:mm:ss,sss
			Result.extend("12:31:22,123")
		end

	invalid_iso_strings: ARRAYED_LIST [STRING]
		once
			create Result.make(0)

			--	Thh
			Result.extend("T25")

			Result.extend("T12+1300")
			Result.extend("T12-1300")

			--	Thhmm
			Result.extend("T2431")
			Result.extend("T2531")
			Result.extend("T2460")
			Result.extend("T2561")

			Result.extend("T1540+1300")
			Result.extend("T1540-1300")

			--  Thhmmss
			Result.extend("T243122")
			Result.extend("T253122")
			Result.extend("T246060")
			Result.extend("T256161")

			--	Thh:mm
			Result.extend("T24:31")
			Result.extend("T25:31")
			Result.extend("T24:60")
			Result.extend("T25:61")

			-- 	Thh:mm:ss
			Result.extend("T24:31:22")
			Result.extend("T25:31:22")
			Result.extend("T24:60:60")
			Result.extend("T25:61:61")
			Result.extend("T22:59:60Q")
			Result.extend("T25:61:61Z")
		end

feature -- Access

	check_result
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
