note
	component:   "openEHR Archetype Project"
	description: "Tests for manipulating an archetype compiler"
	keywords:    "archetype, compiler, build"
	author:      "Peter Gummer"
	support:     "Ocean Informatics <support@OceanInformatics.com>"
	copyright:   "Copyright (c) 2011- Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"
	testing:     "type/manual"

class
	TEST_ARCHETYPE_COMPILER

inherit
	TEST_ARCHETYPE_DIRECTORY

feature -- Test routines

	test_build_all
			-- Check that the whole repository can be built and then rebuilt.
		note
			testing: "covers/{ARCHETYPE_COMPILER}.build_all"
			testing: "covers/{ARCHETYPE_COMPILER}.rebuild_all"
		do
			create errors.make_empty
			assert_equal (False, archetype_compiler.is_interrupt_requested)
			assert_equal (False, archetype_compiler.is_building)
			assert_equal (False, archetype_compiler.is_full_build_completed)

			archetype_compiler.set_archetype_visual_update_action (agent on_archetype_update)
			archetype_compiler.build_all
			assert_equal (False, archetype_compiler.is_interrupt_requested)
			assert_equal (False, archetype_compiler.is_building)
			assert_equal (True, archetype_compiler.is_full_build_completed)
			assert_equal (current_arch_cat.archetype_count, current_arch_cat.compile_attempt_count)
			assert_equal ("", errors)

			archetype_compiler.rebuild_all
			assert_equal (False, archetype_compiler.is_interrupt_requested)
			assert_equal (False, archetype_compiler.is_building)
			assert_equal (True, archetype_compiler.is_full_build_completed)
			assert_equal (current_arch_cat.archetype_count, current_arch_cat.compile_attempt_count)
			assert_equal ("", errors)
		end

feature {NONE} -- Implementation

	errors: detachable STRING
		-- Error messages during compilation.
		note
			option: stable
		attribute
		end

	on_archetype_update (a_msg: STRING; ara: ARCH_CAT_ARCHETYPE; dependency_depth: INTEGER)
			-- Update with progress on build.
		do
			if ara.compilation_state = ara.cs_invalid then
				errors.append (a_msg + "%R")
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
--| The Original Code is test_archetype_compiler.e.
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

