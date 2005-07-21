indexing
	component:   "openEHR Reusable Libraries"
	description: "Test case for presence of object path"
	keywords:    "test, object graph, path"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2004 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class TC_OG_HAS_MOVABLE_PATH

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

	title:STRING is "Object Graph has_path (movable path)"

feature -- Initialisation

	make(arg:ANY) is
		do
		end

	execute is
		local
			path_set: ARRAYED_LIST [OG_PATH]
			a_path, a_movable_path: OG_PATH
		do
			io.put_string("----- path set ----%N")
			path_set := root_node.all_paths
			print_paths(path_set)
			
			from
				path_set.start
			until
				path_set.off
			loop
				a_path := path_set.item
				io.put_string("%TPath: " + a_path.as_string + "%N")
				from
					a_path.start
				until
					a_path.off
				loop
					if a_path.item.is_object and then a_path.item.is_addressable then
						create a_movable_path.make_movable(create {OG_PATH_ITEM}.make_object(a_path.item.value))
						io.put_string("%T %TMovable path: " + a_movable_path.as_string + "; found: " + root_node.has_path(a_movable_path).out + "%N")
					end
					a_path.forth
				end
				path_set.forth
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
