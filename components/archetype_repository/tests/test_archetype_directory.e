note
	component:   "openEHR Archetype Project"
	description: "Tests for manipulating an archetype directory"
	keywords:    "archetype, ontology, terminology"

	author:      "Peter Gummer"
	support:     "Ocean Informatics <support@OceanInformatics.com>"
	copyright:   "Copyright (c) 2009 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"
	testing:     "type/manual"

class
	TEST_ARCHETYPE_DIRECTORY

inherit
	OPENEHR_TEST_SET
		redefine
			on_prepare
		end

	SHARED_ADL_APPLICATION

	SHARED_KNOWLEDGE_REPOSITORY

	SHARED_SOURCE_REPOSITORIES

	SHARED_ARCHETYPE_COMPILER

	SHARED_APP_RESOURCES

feature {NONE} -- Events

	on_prepare
			-- <Precursor>
		do
			Precursor
			application_developer_name.make_from_string ("openEHR")
			resource_config_file.make (user_config_file_path)
			adl_application.initialise

			if repository_profiles.has ("Test") then
				test_repository := repository_profiles ["Test"].first
			elseif repository_profiles.has ("test") then
				test_repository := repository_profiles ["test"].first
			else
				assert ("Please define the %"Test%" repository profile in " + resource_config_file.file_name, False)
			end
		end

feature -- Access

	test_repository: STRING
			-- Repository of test archetypes. Its path must be defined in the cfg file, otherwise these unit tests fail.

feature -- Test routines

	test_add_adhoc_item
			-- Check that an ad-hoc archetype can be added.
		note
			testing: "covers/{ARCHETYPE_DIRECTORY}.add_adhoc_item"
		do
			assert_equal (False, arch_dir.has_selected_archetype)
			arch_dir.add_adhoc_item (test_repository + "\basics\openehr-test_pkg-BOOK.structure_test1.v1.adls")
			assert_equal (True, arch_dir.has_selected_archetype)
		end

	test_validation
			-- Check that the expected errors occur when building the validation test archetypes.
		note
			testing: "covers/{ARCHETYPE_DIRECTORY}.populate"
		local
			expected: STRING
		do
			set_status_reporting_level (message_type_error)
			source_repositories.set_reference_repository (test_repository)
			arch_dir.populate
			assert ("Expected warning about ADL version", billboard.content.has_substring ("WARNING - Using ADL version"))
			archetype_compiler.build_all
			assert_equal (False, archetype_compiler.is_interrupted)
			assert_equal (True, archetype_compiler.build_completed)
			assert ("Expected status message", archetype_compiler.status.has_substring ("finished building system"))
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
--| The Original Code is test_archetype_directory.e.
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
