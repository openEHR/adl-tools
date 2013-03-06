note
	component:   "openEHR Archetype Project"
	description: "Test case for setting description on an archetype"
	keywords:    "test, ADL, CADL"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2005 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$Source"
	revision:    "$Revision"
	last_change: "$Date"

class TC_ARCHETYPE_SET_DESCRIPTION

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

	make(arg:ANY)
	    do
	    end

feature -- Access

	title: STRING = "Test Archetype set Description"

	prereqs: ARRAY[STRING]
			-- ids of prerequisite test cases
		once
			Result := <<"TC_ARCHETYPE_CREATE", "TC_ONTOLOGY_POPULATE">>
		end

feature -- testing

	execute
		local
			archetype: ARCHETYPE
			desc: RESOURCE_DESCRIPTION
			a_desc_item: RESOURCE_DESCRIPTION_ITEM
		do
			archetype := archetype_compiler.archetype
			create desc.make ("Archy Type", "en")
			desc.set_resource_package_uri ("http://archetypes.are.us/package_home")
			desc.add_other_contributor ("Archy's 1st friend")
			desc.add_other_contributor ("Archy's 2nd friend")
			desc.add_original_author_item ("email", "archy@home.com")
			desc.set_lifecycle_state ("review")

			-- Add an english language descriptor
			create a_desc_item.make (create {CODE_PHRASE}.make(default_language_code_set, "en"), "This archetype purpose")
			a_desc_item.add_keyword ("keyword1")
			a_desc_item.add_keyword ("keyword2")
			a_desc_item.add_keyword ("keyword3")
			a_desc_item.add_original_resource_uri ("medline", "http://www.nlm.nih.gov/medlineplus/druginformation.html")
			a_desc_item.add_other_detail ("some other key", "some other detail")
			a_desc_item.set_copyright ("copyright to me 2003")
			a_desc_item.set_use ("This is the main use of the archetype")
			a_desc_item.set_misuse ("This is how the archetype should not be used")

			desc.add_detail (a_desc_item)

			archetype.set_description(desc)


			if archetype.is_valid then
				archetype_compiler.serialise_archetype (serialise_format)
				io.put_string (archetype_compiler.serialised_archetype)
			else
				-- FIXME: This did not compile because of revision 319. What should it do?
				io.put_string (archetype.errors)
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
--| The Original Code is tc_archetype_add_object_term.e.
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
