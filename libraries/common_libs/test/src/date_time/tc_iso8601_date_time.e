indexing
	component:   "openEHR Reusable Libraries"
	description: "Test case for ISO8601_DATE_TIME type."
	keywords:    "test, date, time"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2006 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class TC_ISO8601_DATE_TIME

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

	title: STRING is "ISO8601_DATE_TIME test"

feature -- Initialisation

	make(arg:ANY) is
		do
		end

	execute is
		local
			iso_dt: ISO8601_DATE_TIME
			str, iso_dt_str: STRING
		do
			io.put_string("input    		is_valid_iso8601_date_time()	as_string valid%N")
			io.put_string("---------		----------------------------	---------------%N")

			from
				valid_iso_strings.start
			until
				valid_iso_strings.off
			loop
				create str.make (0)
				str.copy (valid_iso_strings.item)
				str.append(create {STRING}.make_filled(' ', 30-str.count))
				str.append_character('%T')

				if is_valid_iso8601_date_time(valid_iso_strings.item) then
					create iso_dt.make_from_string(valid_iso_strings.item)
					str.append("True%T%T%T%T")
					iso_dt_str := iso_dt.as_string
					str.append(valid_iso_strings.item.is_equal(iso_dt_str).out)
					str.append("%T(" + iso_dt_str + ")")
					io.put_string(str + "%N")
				else
					str.append("False%T%T%T%T-")
					io.put_string(str + "%N")
				end
				valid_iso_strings.forth
			end

			io.put_string("%Ninput    		!is_valid_iso8601_date_time()	as_string valid%N")
			io.put_string("---------		-----------------------------	---------------%N")
			from
				invalid_iso_strings.start
			until
				invalid_iso_strings.off
			loop
				create str.make (0)
				str.copy (invalid_iso_strings.item)
				str.append(create {STRING}.make_filled(' ', 30-str.count))
				str.append_character('%T')
				io.put_string(str + (not is_valid_iso8601_date_time(invalid_iso_strings.item)).out + "%T%T%T%T-%N")
				invalid_iso_strings.forth
			end
		end

	valid_iso_strings: ARRAYED_LIST [STRING] is
		once
			create Result.make(0)

			--	YYYY-MM-DDThh:mm:ss
			Result.extend("1989-01-01T18:04:00")
			Result.extend("1989-01-01T18:04:00Z")
			Result.extend("1989-01-01T18:04:00+1000")

			--	YYYY-MM-DDThh:mm
			Result.extend("1989-01-01T18:04")
			Result.extend("1989-01-01T18:04Z")
			Result.extend("1989-01-01T18:04+1000")

			--	YYYY-MM-DDThh
			Result.extend("1989-01-01T18")
			Result.extend("1989-01-01T18Z")
			Result.extend("1989-01-01T18+1000")
		end

	invalid_iso_strings: ARRAYED_LIST [STRING] is
		once
			create Result.make(0)

			--	YYYY-MM-DDThhmmss
			Result.extend("1989-01-01T180400")

			--	YYYYMMDDThh:mm:ss
			Result.extend("19890101T18:04:00")
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
