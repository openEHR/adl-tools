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

class TC_OG_HAS_PATH

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

	title:STRING is "Object Graph has_path"

feature -- Initialisation

	make(arg:ANY) is
		do
		end

	execute is
		local
			path_set: HASH_TABLE [OG_OBJECT, OG_PATH]
		do
			io.put_string("----- path set ----%N")
			path_set := root_node.all_paths
			print_paths(path_set)
			
			from
				path_set.start
			until
				path_set.off
			loop
				io.put_string("%Thas_path(" + path_set.key_for_iteration.as_string + ") = " + 
					root_node.has_path(path_set.key_for_iteration).out + "%N")
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
