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
	TEST_ARCH_DIRECTORY

inherit
	OPENEHR_TEST_SET

	SHARED_ADL_APPLICATION

	SHARED_KNOWLEDGE_REPOSITORY

	SHARED_SOURCE_REPOSITORIES

	SHARED_ARCHETYPE_COMPILER

	SHARED_APP_RESOURCES

feature -- Test routines

	test_validation
			-- Check that the expected errors occur when building the validation test archetypes.
		note
			testing:  "covers/{ARCH_DIRECTORY}.populate_directory"
		local
			repository: STRING
			expected: STRING
		do
			adl_application.initialise
			set_status_reporting_level (message_type_error)
			repository := resource_value ("tests", "validation_repository")

			source_repositories.set_reference_repository (repository)
			arch_dir.populate

			expected := "ERROR - No parent matching /specialisation_parent_term found for archetype " +
						repository + "\adl-test-ENTRY.specialisation_parent_term-missing.v1.adl      (ARCH_DIRECTORY.merge_enter)%N" +
						"ERROR - No parent matching /specialisation_parent found for archetype " +
						repository + "\adl-test-ENTRY.specialisation_parent-missing.v1.adl      (ARCH_DIRECTORY.merge_enter)%N"

			assert_equal (expected, billboard.content)
			archetype_compiler.build_all
			print (billboard.content)
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
--| The Original Code is test_arch_directory.e.
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
