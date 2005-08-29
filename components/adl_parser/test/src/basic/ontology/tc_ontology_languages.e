indexing
	component:   "openEHR Archetype Project"
	description: "Test case for ADL ontology"
	keywords:    "test, ADL"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2004 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class TC_ONTOLOGY_LANGUAGES
	
inherit
	TEST_CASE
		export
			{NONE} all
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

	title: STRING is "Add languages to ontology"

	prereqs: ARRAY[STRING] is 
			-- ids of prerequisite test cases
		once
			Result := <<"TC_ONTOLOGY_POPULATE">>
		end

feature -- testing

	execute is
		local
			archetype: ARCHETYPE
			obj_node2: C_COMPLEX_OBJECT
			a_simple_node: C_PRIMITIVE_OBJECT
		do
			archetype := adl_interface.adl_engine.archetype

			io_message.put_string ("------------------ ADD fr -------------------%N")
			ontology.add_language_available("fr")

			if archetype.is_valid then
				adl_interface.adl_engine.serialise (serialise_format)
				io_message.put_string (adl_interface.adl_engine.serialised_archetype)
			else
				io_message.put_string (archetype.errors)
			end
			
			io_message.put_string ("------------------ ADD tr -------------------%N")
			ontology.add_language_available("tr")
			if archetype.is_valid then
				adl_interface.adl_engine.serialise (serialise_format)
				io_message.put_string (adl_interface.adl_engine.serialised_archetype)
			else
				io_message.put_string (archetype.errors)
			end

	--		io_message.put_string ("-------------- ADD tr again (expect ERROR) ---------------%N")
	--		ontology.add_language_available("tr")
	--		if archetype.is_valid then
	--			adl_interface.adl_engine.serialise (serialise_format)
	--			io_message.put_string (adl_interface.adl_engine.serialised_archetype)
	--		else
	--			io_message.put_string (archetype.errors)
	--		end
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
--| The Original Code is tc_ontology_languages.e.
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
