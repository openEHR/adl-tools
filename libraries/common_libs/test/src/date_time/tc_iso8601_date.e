indexing
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

creation
	make

feature -- Access

	title:STRING is "ISO8601_DATE test"

feature -- Initialisation

	make(arg:ANY) is
		do
		end

	execute is
		local
			str: STRING
			d: ISO8601_DATE
			p: ISO8601_PARSER
		do
			--	YYYY
			io.put_string("    is_valid_iso8601_date(%"1989%")=" + is_valid_iso8601_date("1989").out + "%N")
			io.put_string("not is_valid_iso8601_date(%"21989%")=" + (not is_valid_iso8601_date("21989")).out + "%N")

			--	YYYYMM
			io.put_string("not is_valid_iso8601_date(%"198900%")=" + (not is_valid_iso8601_date("198900")).out + "%N")
			io.put_string("    is_valid_iso8601_date(%"198901%")=" + is_valid_iso8601_date("198901").out + "%N")
			io.put_string("    is_valid_iso8601_date(%"198912%")=" + is_valid_iso8601_date("198912").out + "%N")
			io.put_string("not is_valid_iso8601_date(%"198913%")=" + (not is_valid_iso8601_date("198913")).out + "%N")

			--	YYYYMMDD
			io.put_string("not is_valid_iso8601_date(%"19890100%")=" + (not is_valid_iso8601_date("19890100")).out + "%N")
			io.put_string("    is_valid_iso8601_date(%"19890101%")=" + is_valid_iso8601_date("19890101").out + "%N")
			io.put_string("    is_valid_iso8601_date(%"19890131%")=" + is_valid_iso8601_date("19890131").out + "%N")
			io.put_string("not is_valid_iso8601_date(%"19890132%")=" + (not is_valid_iso8601_date("19890132")).out + "%N")
			io.put_string("    is_valid_iso8601_date(%"19000201%")=" + is_valid_iso8601_date("19000201").out + "%N")
			io.put_string("    is_valid_iso8601_date(%"19000228%")=" + is_valid_iso8601_date("19000228").out + "%N")
			io.put_string("not is_valid_iso8601_date(%"19000229%")=" + (not is_valid_iso8601_date("19000229")).out + "%N")
			io.put_string("    is_valid_iso8601_date(%"19040229%")=" + is_valid_iso8601_date("19040229").out + "%N")

			--	YYYY-MM
			io.put_string("not is_valid_iso8601_date(%"1989-00%")=" + (not is_valid_iso8601_date("1989-00")).out + "%N")
			io.put_string("    is_valid_iso8601_date(%"1989-01%")=" + is_valid_iso8601_date("1989-01").out + "%N")
			io.put_string("    is_valid_iso8601_date(%"1989-12%")=" + is_valid_iso8601_date("1989-12").out + "%N")
			io.put_string("not is_valid_iso8601_date(%"1989-13%")=" + (not is_valid_iso8601_date("1989-13")).out + "%N")

			--	YYYY-MM-DD
			io.put_string("not is_valid_iso8601_date(%"1989-01-00%")=" + (not is_valid_iso8601_date("1989-01-00")).out + "%N")
			io.put_string("    is_valid_iso8601_date(%"1989-01-01%")=" + is_valid_iso8601_date("1989-01-01").out + "%N")
			io.put_string("    is_valid_iso8601_date(%"1989-01-31%")=" + is_valid_iso8601_date("1989-01-31").out + "%N")
			io.put_string("not is_valid_iso8601_date(%"1989-01-32%")=" + (not is_valid_iso8601_date("1989-01-32")).out + "%N")
			io.put_string("    is_valid_iso8601_date(%"1900-02-01%")=" + is_valid_iso8601_date("1900-02-01").out + "%N")
			io.put_string("    is_valid_iso8601_date(%"1900-02-28%")=" + is_valid_iso8601_date("1900-02-28").out + "%N")
			io.put_string("not is_valid_iso8601_date(%"1900-02-29%")=" + (not is_valid_iso8601_date("1900-02-29")).out + "%N")
			io.put_string("    is_valid_iso8601_date(%"1904-02-29%")=" + is_valid_iso8601_date("1904-02-29").out + "%N")
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
