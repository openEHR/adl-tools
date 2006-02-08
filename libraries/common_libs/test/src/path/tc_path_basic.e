indexing
	component:   "openEHR Reusable Libraries"
	description: "Test case for basic path parsing"
	keywords:    "test, path"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2006 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class TC_PATH_BASIC

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

	title:STRING is "Basic path test"

feature -- Initialisation

	make(arg:ANY) is
		do
		end

	execute is
		local
			path: OG_PATH
		do
			create path_parser.make
			
			from
				test_path_set.start
			until
				test_path_set.off
			loop
				path_parser.reset
				io.put_string("------------ testing path %"" + test_path_set.item + "%"%N")
				path_parser.execute(test_path_set.item)

				if path_parser.syntax_error then
					io.put_string("Parse FAILED: " + path_parser.error_text + "%N")
				else
					path := path_parser.output
					io.put_string("Parse succeeded...%N")
					io.put_string("%Tas_string: " + path.as_string + "%N")
					
					if  path.is_terminal then
						io.put_string("%Tis_terminal%N")
					end
					if  path.is_absolute then
						io.put_string("%Tis_absolute%N")
					end
					if  path.is_movable then
						io.put_string("%Tis_movable%N")
					end
					if  path.last.is_feature_call then
						io.put_string("%Tis_feature_call%N")
					end
					io.put_string("%N")
				end
				
				test_path_set.forth
			end			
		end

feature -- Access

	check_result is
	    do
	    end
	    
	test_path_set: LINKED_LIST[STRING] is
			-- list of test paths
		once
			create Result.make
			Result.extend("items")
			Result.extend("/items")

			Result.extend("items[at0001]")
			Result.extend("/items[at0001]")
			
			Result.extend("items[at0001]/data/events[at0002]")
			Result.extend("/items[at0001]/data/events[at0002]")
			
			Result.extend("items[at0001]/data/events")
			Result.extend("/items[at0001]/data/events")
			
			Result.extend("items[at0001]/data[at0002]/events")
			Result.extend("/items[at0001]/data[at0002]/event")
			
			Result.extend("/items[at0001]/data[at0002]/events[at0003]")
			
--			Result.extend("/items[at0001]/func()")
			
			Result.extend("//items")
			Result.extend("//items[at0001]")
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
