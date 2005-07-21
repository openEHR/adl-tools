indexing
	component:   "openEHR Reusable Libraries"
	description: "Test case for base units"
	keywords:    "test, units"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2004 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class TC_BASE_UNITS

inherit
	TEST_CASE
		redefine 
			check_result
		end

creation
	make

feature -- Access

	title:STRING is "BASE units test"

feature -- Initialisation

	make(arg:ANY) is
		do
		end

	execute is
		local
			parser:UNITS_PARSER
		do
			create parser.make
			parser.execute("m.s^-1")
			io.put_string("%Nparsing %"m.s^-1%"%N")
			if parser.error_count > 0 then
				io.put_string("Error: " + parser.output + "; " + parser.error_message + "%N")
			else
				io.put_string("Parsed ok. Result: " + parser.units.out + "%N")
			end

			parser.execute("m/s")
			io.put_string("%Nparsing %"m/s%"%N")
			if parser.error_count > 0 then
				io.put_string("Error: " + parser.output + "; " + parser.error_message + "%N")
			else
				io.put_string("Parsed ok. Result: " + parser.units.out + "%N")
			end

			parser.execute("mm")
			io.put_string("%Nparsing %"mm%"%N")
			if parser.error_count > 0 then
				io.put_string("Error: " + parser.output + "; " + parser.error_message + "%N")
			else
				io.put_string("Parsed ok. Result: " + parser.units.out + "%N")
			end

			parser.execute("mm[Hg]")
			io.put_string("%Nparsing %"mm[Hg]%"%N")
			if parser.error_count > 0 then
				io.put_string("Error: " + parser.output + "; " + parser.error_message + "%N")
			else
				io.put_string("Parsed ok. Result: " + parser.units.out + "%N")
			end

			parser.execute("kg.m/s^2")
			io.put_string("%Nparsing %"kg.m/s^2%"%N")
			if parser.error_count > 0 then
				io.put_string("Error: " + parser.output + "; " + parser.error_message + "%N")
			else
				io.put_string("Parsed ok. Result: " + parser.units.out + "%N")
			end
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
