indexing
	component:   "openEHR Reference Model"

	description: "Reference Model testing application"
	keywords:    "test"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2000-2004 The openEHR Foundation <http://www.openEHR.org>"
	license:     "See notice at bottom of class"

	file:        "$Source"
	revision:    "$Revision"
	last_change: "$Date"

class
	MAIN_WINDOW

inherit
	MAIN_WINDOW_IMP

	TEST_APPLICATION
		export
			{NONE} all
		undefine
			default_create, copy
		end
			
	SHARED_TEST_ENV
		export
			{NONE} all
		undefine
			default_create, copy
		end

	SHARED_RESOURCES
		export
			{NONE} all
		undefine
			default_create, copy
		end

	SHARED_UI_RESOURCES
		export
			{NONE} all
		undefine
			default_create, copy, Execution_environment
		end

	SHARED_UNIT_DATABASE
		export
			{NONE} all
		undefine
			default_create, copy
		end

	EXCEPTIONS
		rename
			raise as raise_exception
		export
			{NONE} all
		undefine
			default_create, copy
		end

feature {NONE} -- Initialization

	user_initialization is
			-- called by `initialize'.
			-- Any custom user initialization that
			-- could not be performed in `initialize',
			-- (due to regeneration of implementation class)
			-- can be added here.
		local
			units_dir: STRING
		do
			units_dir := resource_value("any", "units_dir")

			initialise_unit_database(units_dir + operating_environment.Directory_separator.out + "tables", 
					units_dir + operating_environment.Directory_separator.out + "prefixes.txt")
	
			test_suite_list.disable_multiple_selection
			set_default_streams (create {EV_TEST_STREAM}.make(test_case_report_text), create {EV_TEST_STREAM}.make(test_case_output_text))
			populate_test_suite_list
		end

feature -- Template

	test_init is
			-- application-specific initialisation
   		do
			test_initialised := True
		end

	test_suites: LINKED_LIST[TEST_SUITE] is
		once
			create Result.make
			Result.extend(create {TS_DT_BASIC}.make(Void))
			Result.extend(create {TS_DT_TEXT}.make(Void))
			Result.extend(create {TS_DT_QUANTITY}.make(Void))
			Result.extend(create {TS_DT_DATE_TIME}.make(Void))
			Result.extend(create {TS_DT_ENCAPSULATED}.make(Void))
			Result.extend(create {TS_DT_TIME_SPECIFICATION}.make(Void))
			Result.extend(create {TS_DT_URI}.make(Void))

			Result.extend(create {TS_DS_HISTORY}.make(Void))
			Result.extend(create {TS_DS_ITEM_STRUCTURE}.make(Void))

			Result.extend(create {TS_COMMON_CHANGE_CONTROL}.make(Void))
			Result.extend(create {TS_COMMON_GENERIC}.make(Void))
			Result.extend(create {TS_COMMON_IDENTIFICATION}.make(Void))

			Result.extend(create {TS_DEMO_PARTY}.make(Void))

			Result.extend(create {TS_EHR_EHR}.make(Void))
			Result.extend(create {TS_EHR_ENTRY}.make(Void))

			Result.extend(create {TS_EHR_EXTRACT}.make(Void))
		end
		
feature {NONE} -- Implementation

	exception_encountered: BOOLEAN
			-- True if last operation caused an exception
	
	populate_test_suite_list is
			-- 
		local
			ts_list: ARRAYED_LIST[STRING]
		do
			create ts_list.make(0)
			from
				test_suites.start
			until
				test_suites.off
			loop
				ts_list.extend(test_suites.item.title)
				test_suites.forth
			end
			test_suite_list.set_strings (ts_list)
		end

	select_test_suite is
		local
			tc_list: ARRAYED_LIST [STRING]
		do
			selected_test_suite := test_suite_index.item(test_suite_list.selected_item.text)
			create tc_list.make(0)
			from
				selected_test_suite.start
			until
				selected_test_suite.off
			loop
				tc_list.extend(selected_test_suite.item.title)
				selected_test_suite.forth
			end
			test_case_list.set_strings (tc_list)
		end

	selected_test_suite: TEST_SUITE
			-- curently selected test suite
			
	run_test_case is
		local
			tc: TEST_CASE
		do
			if not exception_encountered then
				if test_case_list.selected_item /= Void then
					test_case_output_text.set_text ("")
					tc := selected_test_suite.test_case_index.item(test_case_list.selected_item.text)
					tc.execute
				end
			else
				exception_encountered := False
			end
		rescue
			status.append_text("Software Exception " + exception.out + " caught; stack:%N")
			status.append_text(exception_trace)
			exception_encountered := True
			retry			
		end

	exit_app is
			-- 
		do
			((create {EV_ENVIRONMENT}).application).destroy
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
--| The Original Code is main_window.e.
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
