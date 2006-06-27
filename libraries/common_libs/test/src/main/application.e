indexing
	component:   "openEHR Archetype Project"
	description: "Test application for object graph generic parse tree"
	keywords:    "test, object graph"
	
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2004 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class APPLICATION

inherit
	SHARED_RESOURCES
		export
			{NONE} all
		end

	TEST_APPLICATION
		export
			{NONE} all
		redefine
			splash
		end
		
	SHARED_TEST_ENV
		export
			{NONE} all
		end

	SHARED_UNIT_DATABASE
		export
			{NONE} all
		end

creation
	make

feature -- Template

	test_init is
		local
			tables_dir:STRING
   		do
			if execution_environment.command_line.argument_count /= 1 then
				io.put_string("Argument required: directory where unit parser config files are found%N")
				io.put_string("	normally ends with %"config\units_parser%" %N")
			else
				-- for dADL tests
				initialise_serialisers
				
				-- for unit parser
				tables_dir := execution_environment.command_line.argument(1)
				
				initialise_unit_database(tables_dir + operating_environment.Directory_separator.out + "tables", 
					tables_dir + operating_environment.Directory_separator.out + "prefixes.txt")
				debug("units")
					io.put_string(unit_database.out)
				end
				test_initialised := True
			end
		end

	test_suites: LINKED_LIST[TEST_SUITE] is
		once
			create Result.make
			Result.extend(create {TS_DADL}.make(Void))
			Result.extend(create {SUITE_METHOD_DISPATCH}.make(Void))
			Result.extend(create {UNITS_SUITE}.make(Void))
			Result.extend(create {TS_OBJECT_GRAPH}.make(Void))
			Result.extend(create {TS_PATH}.make(Void))
			Result.extend(create {TS_DATE_TIME}.make(Void))
		end

feature -- Template
	
	splash: STRING is
			-- create a splash string for the console
		do
			create Result.make(0)
			Result.append("%N..........................................................................%N")
			Result.append(  ".     openEHR Re-usable Library test suite environment (c)2003 - 2004    .%N")
			Result.append(  "..........................................................................%N")
			Result.append(  ". available from: www.OceanInformatics.biz                               .%N")
			Result.append(  ".         author: Thomas Beale                                           .%N")
			Result.append(  ".    built using: ISE Eiffel (see www.eiffel.com)                        .%N")
			Result.append(  ".                 Gobo parsing libraries & tools (see www.gobosoft.com)  .%N")
			Result.append(  ".        support: support@OceanInformatics.biz                           .%N")
			Result.append(  "..........................................................................%N%N")

		end

feature {NONE} -- Implementation

	initialise_serialisers is
		once
			dt_serialisers.put(create {DADL_SYNTAX_SERIALISER}.make(create {NATIVE_DADL_SERIALISATION_PROFILE}.make("adl")), "adl")
			dt_serialisers.put(create {DADL_SYNTAX_SERIALISER}.make(create {HTML_DADL_SERIALISATION_PROFILE}.make("html")), "html")
			dt_serialisers.put(create {DADL_TAGGED_SERIALISER}.make(create {XML_DADL_SERIALISATION_PROFILE}.make("xml")), "xml")
			dt_serialisers.put(create {DADL_OWL_SERIALISER}.make(create {OWL_DADL_SERIALISATION_PROFILE}.make("owl")), "owl")
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
--| The Original Code is application.e.
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
