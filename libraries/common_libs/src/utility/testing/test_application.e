indexing
	component:   "openEHR Reusable Libraries"
	description: "[
		       Test bed application template. To be inherited by any application 
			 needing a menu-driven framework for TEST_SUITEs and TEST_CASEs.
			 ]"
	keywords:    "test"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2004 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

deferred class TEST_APPLICATION

inherit
	TEST_IO
		export
			{NONE} all
		end

feature -- Template

	test_init is
			-- application-specific initialisation
   		deferred
		end

	test_suites: LINKED_LIST[TEST_SUITE] is
		deferred
		end

feature -- Access

	test_result_dir: STRING is "c:\temp"

	test_initialised: BOOLEAN
			-- must be set True by test_init for application to run
			
	test_suite_index: HASH_TABLE [TEST_SUITE, STRING] is
			-- test suites, keyed by title
		once
			create Result.make(0)
			from 
				test_suites.start
			until
				test_suites.off
			loop
				test_suite_index.put(test_suites.item, test_suites.item.title)
				test_suites.forth
			end			
		end

feature -- Initialisation

	make is
		do
			-- set up output streams
			set_default_streams(create {STD_TEST_STREAM}, create {STD_TEST_STREAM})
			
			-- call the descendant class's initialisation
			test_init

			if test_initialised then
				test_run
			else
				io.new_line
				io.put_string("test initialisation failure%N")
			end
		end
	
	test_run is
		local
			suite_nr, test_case_nr, i: INTEGER
			finished_suites, finished_test_cases, all_test_cases: BOOLEAN
			test_cases: LINKED_LIST[TEST_CASE]
			suite_menu, tc_menu: MENU
			tc_menu_title, tc_menu_item: STRING
		do
			io.put_string(splash)

			-- dummy call to force initialisation of once routines
			test_suites.start

			-- set suite menu up
			create suite_menu.make("TEST SUITES")
			from test_suites.start suite_nr := 0 until test_suites.off loop
				suite_nr := suite_nr + 1
				suite_menu.add_item(test_suites.item.title) 
				test_suites.forth
			end

			from until finished_suites loop
				-- write a menu of test suites to the console
				suite_menu.display
				suite_menu.choose

				if suite_menu.all_selected then
					from test_suites.start until test_suites.off loop
						test_suites.item.do_all
						-- test_suites.item.display_results
						test_suites.item.store_results(test_result_dir)
						test_suites.forth
					end
					finished_suites := True

				elseif suite_menu.quit_selected then
					finished_suites := True

				else
					from 
						finished_test_cases := False
						all_test_cases := False
						test_cases := test_suites.i_th(suite_menu.selection).test_cases
					until 
						finished_test_cases 
					loop
						-- write a menu of test cases to the console with a special
						-- option for "do all", i.e. run all tests and report on results.
						create tc_menu_title.make(0) 
						tc_menu_title.append(test_suites.i_th(suite_menu.selection).title) 
						tc_menu_title.append(": Test Cases")
						create tc_menu.make(tc_menu_title)
						from test_cases.start test_case_nr := 0 until test_cases.off loop
							test_case_nr := test_case_nr + 1
							create tc_menu_item.make(0) 
							tc_menu_item.append(test_cases.item.id + ": " + test_cases.item.title)

							-- add the prerequsite test cases
							from 
								i := test_cases.item.prereqs.lower
							until
								i > test_cases.item.prereqs.upper
							loop
								tc_menu_item.append(" --> Pre-req (" + i.out + "): " + test_cases.item.prereqs.item(i)) 
								i := i + 1
							end
							tc_menu.add_item(tc_menu_item)
							test_cases.forth
			  			end
						tc_menu.set_all_item("ALL tests and report results")
						tc_menu.set_quit_item("MAIN MENU")
						tc_menu.display
						tc_menu.choose

						if tc_menu.all_selected then
							test_suites.i_th(suite_menu.selection).do_all
							finished_test_cases := True
						elseif tc_menu.quit_selected then
							finished_test_cases := True
						else
							io.put_string("----------> EXECUTING TC ") io.put_string(test_cases.i_th(tc_menu.selection).title) io.put_string(" -------------%N")
	    						test_cases.i_th(tc_menu.selection).execute
						end
					end
				end
			end

			from test_suites.start until test_suites.off loop
				test_suites.item.finalise
				test_suites.forth
			end

			io.put_string("Test Facility  TERMINATED%N")
		end

	splash: STRING is
			-- create a splash string for the console
		do
			create Result.make(0)
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
--| The Original Code is test_application.e.
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
