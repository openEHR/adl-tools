indexing
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

creation
	make

feature -- Access

	title: STRING is "ISO8601_TIME test"

feature -- Initialisation

	make(arg:ANY) is
		do
		end

	execute is
		local
			t: ISO8601_TIME
		do
			--	Thh
			io.put_string("    is_valid_iso8601_time(%"T12%")=" + is_valid_iso8601_time("T12").out + "%N")
			io.put_string("    is_valid_iso8601_time(%"T00%")=" + is_valid_iso8601_time("T00").out + "%N")
			io.put_string("    is_valid_iso8601_time(%"T24%")=" + is_valid_iso8601_time("T24").out + "%N")
			io.put_string("not is_valid_iso8601_time(%"T25%")=" + (not is_valid_iso8601_time("T25")).out + "%N")

			io.put_string("    is_valid_iso8601_time(%"T12Z%")=" + is_valid_iso8601_time("T12Z").out + "%N")
			io.put_string("    is_valid_iso8601_time(%"T12+1000%")=" + is_valid_iso8601_time("T12+1000").out + "%N")
			io.put_string("not is_valid_iso8601_time(%"T12+1300%")=" + (not is_valid_iso8601_time("T12+1300")).out + "%N")
			io.put_string("    is_valid_iso8601_time(%"T12-1000%")=" + is_valid_iso8601_time("T12-1000").out + "%N")
			io.put_string("not is_valid_iso8601_time(%"T12-1300%")=" + (not is_valid_iso8601_time("T12-1300")).out + "%N")

			--	Thhmm
			io.put_string("    is_valid_iso8601_time(%"T1231%")=" + is_valid_iso8601_time("T1231").out + "%N")
			io.put_string("    is_valid_iso8601_time(%"T0031%")=" + is_valid_iso8601_time("T0031").out + "%N")
			io.put_string("    is_valid_iso8601_time(%"T2400%")=" + is_valid_iso8601_time("T2400").out + "%N")
			io.put_string("not is_valid_iso8601_time(%"T2431%")=" + (not is_valid_iso8601_time("T2431")).out + "%N")
			io.put_string("not is_valid_iso8601_time(%"T2531%")=" + (not is_valid_iso8601_time("T2531")).out + "%N")
			io.put_string("    is_valid_iso8601_time(%"T1200%")=" + is_valid_iso8601_time("T1200").out + "%N")
			io.put_string("    is_valid_iso8601_time(%"T0059%")=" + is_valid_iso8601_time("T0059").out + "%N")
			io.put_string("not is_valid_iso8601_time(%"T2460%")=" + (not is_valid_iso8601_time("T2460")).out + "%N")
			io.put_string("not is_valid_iso8601_time(%"T2561%")=" + (not is_valid_iso8601_time("T2561")).out + "%N")

			io.put_string("    is_valid_iso8601_time(%"T1540Z%")=" + is_valid_iso8601_time("T1540Z").out + "%N")
			io.put_string("    is_valid_iso8601_time(%"T1540+0600%")=" + is_valid_iso8601_time("T1540+0600").out + "%N")
			io.put_string("not is_valid_iso8601_time(%"T1540+1300%")=" + (not is_valid_iso8601_time("T1540+1300")).out + "%N")
			io.put_string("    is_valid_iso8601_time(%"T1540-0000%")=" + is_valid_iso8601_time("T1540-0000").out + "%N")
			io.put_string("not is_valid_iso8601_time(%"T1540-1300%")=" + (not is_valid_iso8601_time("T1540-1300")).out + "%N")

			--  Thhmmss
			io.put_string("    is_valid_iso8601_time(%"T123122%")=" + is_valid_iso8601_time("T123122").out + "%N")
			io.put_string("    is_valid_iso8601_time(%"T003122%")=" + is_valid_iso8601_time("T003122").out + "%N")
			io.put_string("    is_valid_iso8601_time(%"T240000%")=" + is_valid_iso8601_time("T240000").out + "%N")
			io.put_string("not is_valid_iso8601_time(%"T243122%")=" + (not is_valid_iso8601_time("T243122")).out + "%N")
			io.put_string("not is_valid_iso8601_time(%"T253122%")=" + (not is_valid_iso8601_time("T253122")).out + "%N")
			io.put_string("    is_valid_iso8601_time(%"T000000%")=" + is_valid_iso8601_time("T000000").out + "%N")
			io.put_string("    is_valid_iso8601_time(%"T120000%")=" + is_valid_iso8601_time("T120000").out + "%N")
			io.put_string("    is_valid_iso8601_time(%"T005959%")=" + is_valid_iso8601_time("T005959").out + "%N")
			io.put_string("not is_valid_iso8601_time(%"T246060%")=" + (not is_valid_iso8601_time("T246060")).out + "%N")
			io.put_string("not is_valid_iso8601_time(%"T256161%")=" + (not is_valid_iso8601_time("T256161")).out + "%N")

			--	Thh:mm
			io.put_string("    is_valid_iso8601_time(%"T12:31%")=" + is_valid_iso8601_time("T12:31").out + "%N")
			io.put_string("    is_valid_iso8601_time(%"T00:31%")=" + is_valid_iso8601_time("T00:31").out + "%N")
			io.put_string("    is_valid_iso8601_time(%"T24:00%")=" + is_valid_iso8601_time("T24:00").out + "%N")
			io.put_string("not is_valid_iso8601_time(%"T24:31%")=" + (not is_valid_iso8601_time("T24:31")).out + "%N")
			io.put_string("not is_valid_iso8601_time(%"T25:31%")=" + (not is_valid_iso8601_time("T25:31")).out + "%N")
			io.put_string("    is_valid_iso8601_time(%"T12:00%")=" + is_valid_iso8601_time("T12:00").out + "%N")
			io.put_string("    is_valid_iso8601_time(%"T00:59%")=" + is_valid_iso8601_time("T00:59").out + "%N")
			io.put_string("not is_valid_iso8601_time(%"T24:60%")=" + (not is_valid_iso8601_time("T24:60")).out + "%N")
			io.put_string("not is_valid_iso8601_time(%"T25:61%")=" + (not is_valid_iso8601_time("T25:61")).out + "%N")

			--  Thhmmss,sss
			io.put_string("    is_valid_iso8601_time(%"T123122,123%")=" + is_valid_iso8601_time("T123122,123").out + "%N")

			-- 	Thh:mm:ss
			io.put_string("    is_valid_iso8601_time(%"T12:31:22%")=" + is_valid_iso8601_time("T12:31:22").out + "%N")
			io.put_string("    is_valid_iso8601_time(%"T00:31:22%")=" + is_valid_iso8601_time("T00:31:22").out + "%N")
			io.put_string("    is_valid_iso8601_time(%"T24:00:00%")=" + is_valid_iso8601_time("T24:00:00").out + "%N")
			io.put_string("not is_valid_iso8601_time(%"T24:31:22%")=" + (not is_valid_iso8601_time("T24:31:22")).out + "%N")
			io.put_string("not is_valid_iso8601_time(%"T25:31:22%")=" + (not is_valid_iso8601_time("T25:31:22")).out + "%N")
			io.put_string("    is_valid_iso8601_time(%"T00:00:00%")=" + is_valid_iso8601_time("T00:00:00").out + "%N")
			io.put_string("    is_valid_iso8601_time(%"T12:00:00%")=" + is_valid_iso8601_time("T12:00:00").out + "%N")
			io.put_string("    is_valid_iso8601_time(%"T00:59:59%")=" + is_valid_iso8601_time("T00:59:59").out + "%N")
			io.put_string("not is_valid_iso8601_time(%"T24:60:60%")=" + (not is_valid_iso8601_time("T24:60:60")).out + "%N")
			io.put_string("not is_valid_iso8601_time(%"T25:61:61%")=" + (not is_valid_iso8601_time("T25:61:61")).out + "%N")

			-- 	Thh:mm:ss,sss
			io.put_string("    is_valid_iso8601_time(%"T12:31:22,123%")=" + is_valid_iso8601_time("T12:31:22,123").out + "%N")

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
