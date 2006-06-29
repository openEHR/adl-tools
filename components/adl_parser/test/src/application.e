indexing
	component:   "openEHR Archetype Project"
	description: "Test application for ADL validating parser"
	keywords:    "test, ADL"
	
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2003 Ocean Informatics Pty Ltd"
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

	SHARED_ARCHETYPE_SERIALISERS
		export
			{NONE} all
			{ANY} has_archetype_serialiser_format, archetype_serialiser_formats
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

creation
	make

feature -- Template

	test_init is
			-- application-specific initialisation
		local
			rep_path: STRING
   		do
			read_resource_file
			rep_path := resource_value("any", "repository")

			if not rep_path.is_empty then
				working_directory := substitute_env_vars(rep_path)
			else
				working_directory := application_startup_directory
			end
			adl_interface.set_current_directory(working_directory)
			
			test_initialised := True
		end

	test_suites: LINKED_LIST[TEST_SUITE] is
		once
			create Result.make
			Result.extend(create {TS_ADL_SUITE}.make(Void))
			Result.extend(create {TS_JAVA_SIM_SUITE}.make(Void))
		end

feature -- Template
	
	read_resource_file is
			-- 
		local
			s: STRING
		do
			s := application_name
			s.replace_substring_all(".exe", ".cfg")
			initialise_resource_config_file_name(s)
		end
		
	repository: FILE_REPOSITORY
	
	splash: STRING is
			-- create a splash string for the console
		do
			create Result.make(0)
			Result.append("%N..........................................................................%N")
			Result.append(  ".           Ocean Informatics Validating ADL Parser (c)2003 - 2004       .%N")
			Result.append(  adl_interface.openehr_version + "%N")
			Result.append(  "..........................................................................%N")
			Result.append(  ". available from: www.OceanInformatics.biz                               .%N")
			Result.append(  ".         author: Thomas Beale                                           .%N")
			Result.append(  ".    built using: ISE Eiffel (see www.eiffel.com)                        .%N")
			Result.append(  ".                 Gobo parsing libraries & tools (see www.gobosoft.com)  .%N")
			Result.append(  ".        support: support@OceanInformatics.biz                           .%N")
			Result.append(  "..........................................................................%N%N")

		end

	working_directory: STRING
		
	archetype_file_name_pattern: STRING is "^[a-z][a-z0-9_]*-[a-z][a-z0-9_]*-[a-z][a-z0-9_]*\.[a-z][a-z0-9\-_]*\.[a-z][a-z0-9_]*\.adl$"
			-- matches "rm_originator-rm_name-rm_entity.concept.version.adl"
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
