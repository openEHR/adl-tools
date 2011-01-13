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

	SHARED_APP_ROOT
		undefine
			default_create
		end

	SHARED_APP_RESOURCES
		undefine
			default_create
		end

feature {NONE} -- Events

	on_prepare
			-- <Precursor>
		do
			Precursor
			application_developer_name.make_from_string ("openEHR")
			app_cfg.make (user_config_file_path)
			app_root.initialise
			assert ("app_root initialisation failed", app_root.initialised)

			if repository_profiles.has_profile ("Test") then
				set_current_profile ("Test")
			elseif repository_profiles.has_profile ("test") then
				set_current_profile ("test")
			else
				assert ("Please define the %"Test%" repository profile in " + app_cfg.file_path, False)
			end

			set_error_reporting_level (Error_type_error)
			use_current_profile (True)
			test_repository := repository_profiles.current_profile.reference_repository
		end

feature -- Access

	test_repository: STRING
			-- Repository of test archetypes. Its path must be defined in the cfg file, otherwise these unit tests fail.

feature -- Test routines

	test_add_adhoc_item
			-- Check that an ad-hoc archetype can be added.
		note
			testing: "covers/{ARCHETYPE_DIRECTORY}.add_adhoc_item"
		local
			adl: STRING
			name: STRING
		do
			adl := "[
				archetype (adl_version=1.5)
					openehr-TEST_PKG-WHOLE.add_adhoc_item.v1
				language original_language = <[ISO_639-1::en]>
				description original_author = < ["name"] = <"unknown"> >
				definition WHOLE[at0000] matches {*}
				ontology term_definitions = < ["en"] = < items = < ["at0000"] = < description = <""> text = <""> > > > >
				]"

			name := file_system.pathname (test_directory, "openehr-TEST_PKG-WHOLE.add_adhoc_item.v1.adls")
			file_context.save_file (name, adl)
			assert_equal (False, current_arch_dir.has_selected_archetype)
			current_arch_dir.add_adhoc_item (name)
			assert_equal (True, current_arch_dir.has_selected_archetype)
		end

	test_populate
			-- Check that the repository can be populated.
		note
			testing: "covers/{ARCHETYPE_DIRECTORY}.populate"
		do
			assert_equal (test_repository, source_repositories.reference_repository.full_path)
			assert_equal (0, current_arch_dir.compile_attempt_count)
			assert_equal (Void, current_arch_dir.selected_item)
			assert ("Expected warning about ADL version", billboard.content.has_substring ("WARNING - Using ADL version"))
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
