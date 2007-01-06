indexing
	component:   "openEHR Archetype Project"
	description: "Test case for archetype creation"
	keywords:    "test, ADL, CADL"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2003, 2004 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class SHARED_TEST_ENV
	
inherit
	SHARED_METHOD_DISPATCHER
		
	SHARED_DT_SERIALISERS
		export
			{NONE} all
			{ANY} has_dt_serialiser_format
		end

	SHARED_RESOURCES
		export
			{NONE} all
		end

	INTERNAL
		export
			{NONE} all
		end
		
	ISO8601_ROUTINES
		export
			{NONE} all
		end
		
feature -- Access

	root_node: OG_OBJECT_NODE is
			-- 
		once
			-- initial creation
			io.put_string("----- Create root node, id = at0001 ----%N")
			create Result.make("at0001", Void)
		end

	print_paths(paths: HASH_TABLE [OG_OBJECT, OG_PATH]) is
		do
			from 
				paths.start
			until
				paths.off
			loop
				io.put_string(paths.key_for_iteration.as_string)
				io.new_line
				paths.forth
			end
		end

	print_paths_list(paths: ARRAYED_LIST [OG_PATH]) is
		do
			from 
				paths.start
			until
				paths.off
			loop
				io.put_string(paths.item.as_string)
				io.new_line
				paths.forth
			end
		end

	part: PART is
		once
			create Result
		end

	string_list:LINKED_LIST[STRING] is
		once
			create Result.make
			Result.extend("1 - this")
			Result.extend("2 - is")
			Result.extend("3 - a")
			Result.extend("4 - list")

			Result.compare_objects
		end
	
	print_list (a_list: LIST[STRING]):STRING is
		do
			create Result.make(0)
			from a_list.start until a_list.off loop
				Result.append(a_list.item)
				Result.append("%N")
				a_list.forth
			end
		end
		
	dadl_engine: DADL_ENGINE is
			-- 
		once
			create Result.make
		end
	    
	path_parser: OG_PATH_VALIDATOR

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
--| The Original Code is shared_test_env.e.
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
