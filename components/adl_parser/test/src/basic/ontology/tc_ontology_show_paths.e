indexing
	component:   "openEHR Archetype Project"
	description: "Test case for ADL ontology"
	keywords:    "test, ADL"

	author:      "Sam Heard"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2004 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class TC_ONTOLOGY_SHOW_PATHS
	
inherit
	TEST_CASE
		redefine
			prereqs
		end
		
	SHARED_TEST_ENV
		export
			{NONE} all
		end
		
create
	make

feature -- Initialisation

	make(arg:ANY) is
	    do
	    end

feature -- Access

	title: STRING is "Show ontology paths"

	prereqs: ARRAY[STRING] is 
			-- ids of prerequisite test cases
		once
			Result := <<"TC_ONTOLOGY_POPULATE">>
		end

feature -- testing

	execute is
		local
			a_term: ARCHETYPE_TERM
			archetype: ARCHETYPE
			paths: ARRAYED_LIST [STRING]
		do
			archetype := adl_interface.archetype

			io_message.put_string ("------------------ Show all the paths -------------------%N")
		
			if archetype.is_valid then
				from
					paths := archetype.physical_paths
					paths.start
				until
					paths.off
				loop
					io_message.put_string (paths.item)	
					io_message.new_line
					paths.forth
				end
				
			else
				io_message.put_string (archetype.errors)
			end
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
--| The Original Code is tc_ontology_terms.e.
--|
--| The Initial Developer of the Original Code is Sam Heard
--| Portions created by the Initial Developer are Copyright (C) 2003-2004
--| the Initial Developer. All Rights Reserved.
--|
--| Contributor(s): Thomas Beale
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
