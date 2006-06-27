indexing
	component:   "openEHR Reusable Libraries"
	description: "Test case for basic dADL types"
	keywords:    "test, object graph, creation"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2005 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class TC_DADL2_BASIC_TYPES

inherit
	TEST_CASE
		redefine 
			check_result
		end
		
	SHARED_TEST_ENV
		export
			{NONE} all
		end

creation
	make

feature -- Access

	title:STRING is "dADL2 basic types"

feature -- Initialisation

	make(arg:ANY) is
		do
		end

	execute is
		do
			io.put_string("---------- original dADL (working types) -----------%N")
			io.put_string(basic_types_dadl)
			dadl_engine.set_source (basic_types_dadl, 1)
			dadl_engine.parse
			if not dadl_engine.parse_succeeded then
				io.put_string("Parse failed; reason = " + dadl_engine.parse_error_text + "%N")
			else
				dadl_engine.serialise ("adl")
				io.put_string("---------- serialised to ADL -----------%N")
				io.put_string(dadl_engine.serialised)
			end

			io.put_string("---------- original dADL (failing types) -----------%N")
			io.put_string(types_that_fail)
			dadl_engine.set_source (types_that_fail, 1)
			dadl_engine.parse
			if not dadl_engine.parse_succeeded then
				io.put_string("Parse failed; reason = " + dadl_engine.parse_error_text + "%N")
			else
				dadl_engine.serialise ("adl")
				io.put_string("---------- serialised to ADL -----------%N")
				io.put_string(dadl_engine.serialised)
			end
		end

feature -- Access

	check_result is
	    do
	    end

feature -- Implementation

	basic_types_dadl: STRING is "an_obj = <			%N%
		%string_1 = <%"this is how it goes%"> 		%N%
		%char_1 = <'p'>						%N%
		%int_1 = <24>	 					%N%
		%real_1 = <189.5>		 				%N%
		%real_2 = <6.023e23>		 			%N%
		%bool_1 = <True>		 				%N%
		%bool_2 = <False>		 				%N%
		%time_1 = <16:35>	 				%N%
		%time_2 = <16:35:04>	 				%N%
		%time_3 = <16:35:04,5>	 				%N%
		%time_4 = <16:35:04+0900>	 				%N%
		%date_1 = <1955-04-02>	 				%N%
		%date_2 = <1955-04>	 				%N%
		%date_time_1 = <2001-05-12T07:35:20>		%N%
		%date_time_2 = <2001-05-12T07:35:20+1000>		%N%
		%date_time_3 = <2001-05-12T07:35>		%N%
		%date_time_4 = <2001-05-12T07>		%N%
		%duration_1 = <P22DT4H15M20S>				%N%
		%interval_int_1 = <|0..5|>				%N%
		%interval_real_1 = <|0.0..1000.0|>			%N%
		%interval_time_1 = <|08:02..09:10|>			%N%
		%interval_date_1 = <|>= 1939-02-01|>		%N%
		%list_int_1 = <0,5, 10>					%N%
		%list_real_1 = <0.0, 500.3, 1000.0>			%N%
		%list_time_1 = <08:02, 09:10, 10:34, 12:30:00,023>	%N%
		%list_date_1 = <1939-02-01, ...>			%N%
		%uri_1 = <http://www.openEHR.org>			%N%
		%code_phrase_1 = <[icd10::F60]>			%N%
		%code_phrase_2 = <[snomed-ct::02203999]>			%N%
		%code_phrase_list_1 = <[snomed-ct::02203999], [icd10::F60]>			%N%
		%>								%N%
		%"

	types_that_fail: STRING is "an_obj = <			%N%
		%interval_real_2 = <|5.0 +/-0.5|>			%N%
		%>								%N%
		%"

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
--| The Original Code is tc_dadl_basic.e.
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
