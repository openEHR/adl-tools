note
	component:   "openEHR ADL Tools"
	description: "Tests for manipulating an archetype compiler"
	keywords:    "archetype, compiler, build"
	author:      "Peter Gummer"
	support:     "Ocean Informatics <support@OceanInformatics.com>"
	copyright:   "Copyright (c) 2011- Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"
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
			assert_equal (current_library.archetype_count, current_library.compile_attempt_count)
			assert_equal ("", errors)

			archetype_compiler.rebuild_all
			assert_equal (False, archetype_compiler.is_interrupt_requested)
			assert_equal (False, archetype_compiler.is_building)
			assert_equal (True, archetype_compiler.is_full_build_completed)
			assert_equal (current_library.archetype_count, current_library.compile_attempt_count)
			assert_equal ("", errors)
		end

feature {NONE} -- Implementation

	errors: detachable STRING
		-- Error messages during compilation.
		note
			option: stable
		attribute
		end

	on_archetype_update (ara: ARCH_LIB_ARCHETYPE_ITEM)
			-- Update with progress on build.
		do
			if ara.compilation_state = ara.cs_invalid then
				errors.append (ara.status + "%R")
			end
		end

end



