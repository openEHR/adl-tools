note
	component:   "openEHR ADL Tools"
	description: "Test case for nested 1:N attribute"
	keywords:    "test, object graph, creation"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2004 Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


class TC_DADL2_NESTED_MULTIPLE_ATTR

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

	title: STRING = "dADL2 nested multiple attr test"

feature -- Initialisation

	make(arg:ANY)
		do
		end

	execute
		do
			dadl_engine.set_source (dadl_term_definitions, 1)
			dadl_engine.parse
			if not dadl_engine.parse_succeeded then
				io.put_string("Parse failed; reason = " + dadl_engine.parse_error_text + "%N")
			else
				dadl_engine.serialise ("adl")
				io.put_string("---------- original dADL -----------%N")
				io.put_string(dadl_term_definitions)
				io.put_string("---------- serialised to ADL -----------%N")
				io.put_string(dadl_engine.serialised)
				io.put_string("---------- paths -----------%N")
				io.put_string(print_list(dadl_engine.tree.all_paths))
			end
		end

feature -- Access

	check_result
	    do
	    end

feature -- Implementation

	dadl_term_definitions: STRING = "%N%
		%term_definitions = < 							%N%
		%	[%"en%"] = <								%N%
		%		[%"at0000%"] = <						%N%
		%			text = <%"Blood gas assessment%">	%N%
		%			description = <%"The assessment of blood gas concentrations and acid-base balance in blood%">%N%
		%		>										%N%
		%		[%"at0001%"] = <						%N%
		%			text = <%"structure%">				%N%
		%			description = <%"@internal%">		%N%
		%		>										%N%
		%		[%"at0002%"] = <						%N%
		%			text = <%"history%">				%N%
		%			description = <%"@internal%">		%N%
		%		>										%N%
		%	>											%N%
		%	[%"de%"] = <								%N%
		%		[%"at0000%"] = <						%N%
		%			text = <%"*Blood gas assessment(en)%">	%N%
		%			description = <%"*The assessment of blood gas concentrations and acid-base balance in blood(en)%">%N%
		%		>										%N%
		%		[%"at0001%"] = <						%N%
		%			text = <%"*structure(en)%">			%N%
		%			description = <%"@internal%">		%N%
		%		>										%N%
		%		[%"at0002%"] = <						%N%
		%			text = <%"*history(en)%">			%N%
		%			description = <%"@internal%">		%N%
		%		>										%N%
		%	>											%N%
		%>%N"

end

