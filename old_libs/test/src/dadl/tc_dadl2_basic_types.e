note
	component:   "openEHR ADL Tools"
	description: "Test case for basic dADL types"
	keywords:    "test, object graph, creation"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2005 Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


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

create
	make

feature -- Access

	title:STRING = "dADL2 basic types"

feature -- Initialisation

	make(arg:ANY)
		do
		end

	execute
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

	check_result
	    do
	    end

feature -- Implementation

	basic_types_dadl: STRING = "an_obj = <			%N%
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

	types_that_fail: STRING = "an_obj = <			%N%
		%interval_real_2 = <|5.0 +/-0.5|>			%N%
		%>								%N%
		%"

end

