indexing
	component:   "openEHR Reusable Libraries"
	description: "Test suite abstraction for simple test framework"
	keywords:    "test"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2004 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

deferred class TEST_SUITE

inherit
	TEST_IO
		export 
			{NONE} all
		end

feature -- Access

	test_cases: LINKED_LIST[TEST_CASE] is
			-- the list of tests available
		deferred
		end
		
	test_case_index: HASH_TABLE [TEST_CASE, STRING] is
		do
			if stored_test_case_index = Void then
				create stored_test_case_index.make(0)
				from 
					test_cases.start
				until
					test_cases.off
				loop
					stored_test_case_index.put(test_cases.item, test_cases.item.title)
					test_cases.forth
				end
			end
			Result := stored_test_case_index
		end

	title:STRING is
	        -- title of this suite of tests
	    deferred
	    end

	start is
		do
			test_cases.start
		end
		
	forth is
		do
			test_cases.forth
		end
		
	off: BOOLEAN is
		do
			Result := test_cases.off
		end
		
	item: TEST_CASE is
		do
			Result := test_cases.item
		end
		
feature -- Initialisation

	make(arg:ANY) is
		deferred
		end

	finalise is
		do
		end

feature -- Execution

	do_all is
		local
			str:STRING
		do
			create test_case_results.make(0)
			io_message.put_string("===============> Executing All Test Cases in Suite%N")

			from test_cases.start until test_cases.off loop
	 			io_message.put_string("----------- TC " + test_cases.item.id + ": " + test_cases.item.title + " -----------%N") 
	 			
				test_cases.item.execute
				test_cases.item.check_result
				create str.make(0) 
				str.append("TC " + test_cases.item.title) 
				if test_cases.item.failed then
					str.append(" FAILED; reason: " + test_cases.item.fail_reason)
				else
					str.append(" PASSED")
				end
				test_case_results.extend(str)
				test_cases.forth
			end
			io_message.put_string("---------------------------------%N")
	    end

	display_results is
		do
			io_output.put_string("RESULTS:%N")
			from test_case_results.start until test_case_results.off loop
				io_output.put_string(test_case_results.item) io_output.new_line
				test_case_results.forth
			end
		end

	store_results(a_directory: STRING) is
		require
			Directory_exists: a_directory /= Void
		local
			result_file: PLAIN_TEXT_FILE
			directory: STRING
		do
			directory := a_directory.twin
			directory.append_character(operating_environment.directory_separator)
			directory.append(title)
			directory.replace_substring_all(" ", "_")
			directory.append(".txt")
			create Result_file.make_create_read_write(directory)
			if result_file.exists then
				io_message.put_string("Writing to file ") io_message.put_string(directory) io_message.new_line
				from test_case_results.start until test_case_results.off loop
					result_file.put_string(test_case_results.item) result_file.new_line
					test_case_results.forth
				end
				result_file.close
			else
				io_message.put_string("Failed to create file ") io_message.put_string(directory) io_message.new_line
			end
		end


feature -- Access

	test_case_results: ARRAYED_LIST[STRING]	

feature {NONE} -- Implementation

	stored_test_case_index: HASH_TABLE [TEST_CASE, STRING]

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
--| The Original Code is test_suite.e.
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
