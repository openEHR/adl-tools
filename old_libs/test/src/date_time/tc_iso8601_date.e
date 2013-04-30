note
	component:   "openEHR Reusable Libraries"
	description: "Test case for ISO8601_DATE type."
	keywords:    "test, date, time"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2006 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class TC_ISO8601_DATE

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

	title:STRING = "ISO8601_DATE test"

feature -- Initialisation

	make(arg:ANY)
		do
		end

	execute
		local
			iso_date: ISO8601_DATE
			str, iso_date_str: STRING
		do
			io.put_string("input    	is_valid_iso8601_date()		as_string valid%N")
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

				if valid_iso8601_date(valid_iso_strings.item) then
					create iso_date.make_from_string(valid_iso_strings.item)
					str.append("True%T%T%T")
					iso_date_str := iso_date.as_string
					str.append(valid_iso_strings.item.is_equal(iso_date_str).out)
					str.append("%T(" + iso_date_str + ")")
					io.put_string(str + "%N")
				else
					str.append("False%T%T%T-")
					io.put_string(str + "%N")
				end
				valid_iso_strings.forth
			end

			io.put_string("%Ninput    	!is_valid_iso8601_date()	as_string valid%N")
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
				io.put_string(str + (not valid_iso8601_date(invalid_iso_strings.item)).out + "%T%T%T-%N")
				invalid_iso_strings.forth
			end
		end

	valid_iso_strings: ARRAYED_LIST [STRING]
		once
			create Result.make(0)

			--	YYYY
			Result.extend("1989")

			--	YYYYMM
			Result.extend("198901")
			Result.extend("198912")

			--	YYYYMMDD
			Result.extend("19890101")
			Result.extend("19890131")
			Result.extend("19000201")
			Result.extend("19000228")
			Result.extend("19040229")

			--	YYYY-MM
			Result.extend("1989-01")
			Result.extend("1989-12")

			--	YYYY-MM-DD
			Result.extend("1989-01-01")
			Result.extend("1989-01-31")
			Result.extend("1900-02-01")
			Result.extend("1900-02-28")
			Result.extend("1904-02-29")
			Result.extend("2000-01-01")
		end

	invalid_iso_strings: ARRAYED_LIST [STRING]
		once
			create Result.make(0)

			--	YYYY
			Result.extend("21989")

			--	YYYYMM
			Result.extend("198900")
			Result.extend("198913")

			--	YYYYMMDD
			Result.extend("19890100")
			Result.extend("19890132")
			Result.extend("19000229")

			--	YYYY-MM
			Result.extend("1989-00")
			Result.extend("1989-13")

			--	YYYY-MM-DD
			Result.extend("1989-01-00")
			Result.extend("1989-01-32")
			Result.extend("1900-02-29")
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
