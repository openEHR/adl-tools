note
	component:   "openEHR ADL Tools"
	description: "Test case converting dadl to a simple object"
	keywords:    "test, object graph, creation"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2005 Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


class TC_DADL2_AS_OBJECT_SIMPLE

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

	title:STRING = "dADL2 as_object - simple"

feature -- Initialisation

	make(arg:ANY)
		do
		end

	execute
		local
			a_dt_obj: DT_COMPLEX_OBJECT_NODE
		do
			dadl_engine.set_source (dadl_simple_object, 1)
			dadl_engine.parse
			if not dadl_engine.parse_succeeded then
				io.put_string("Parse failed; reason = " + dadl_engine.parse_error_text + "%N")
			else
				dadl_engine.serialise ("adl")
				io.put_string("---------- original dADL -----------%N")
				io.put_string(dadl_simple_object)
				io.put_string("---------- serialised to ADL -----------%N")
				io.put_string(dadl_engine.serialised)
				io.put_string("---------- paths -----------%N")
				io.put_string(print_list(dadl_engine.tree.all_paths))
				test_object ?= dadl_engine.tree.as_object(dynamic_type_from_string("DADL_SIMPLE_OBJECT"))
				if test_object /= Void then
					io.put_string("---------- object form successfully created -----------%N")
					io.put_string(test_object.out)
					
					io.put_string("---------- REGENERATE Data Tree from object -----------%N")
					create a_dt_obj.make_from_object(test_object)
					dadl_engine.set_tree(a_dt_obj)
					dadl_engine.serialise ("adl")
					
					io.put_string("---------- serialised to ADL -----------%N")
					io.put_string(dadl_engine.serialised)
					io.put_string("---------- paths -----------%N")
					io.put_string(print_list(dadl_engine.tree.all_paths))
				else
					io.put_string("---------- object form NOT created -----------%N")
				end
			end
		end

feature -- Access

	check_result
	    do
	    end

feature -- Implementation

	dadl_simple_object: STRING = "							%N%
		%name = <%"Dirk Flinthart%"> 						%N%
		%address = <										%N%
		%	number = <24>	 								%N%
		%	street = <%"St Germain%">						%N%
		%	city = <%"Paris%">								%N%
		%	other_details = <								%N%
		%		[%"1%"] = <%"address_detail_1%">			%N%
		%		[%"2%"] = <%"address_detail_2%">			%N%
		%		[%"3%"] = <%"address_detail_3%">			%N%
		%	>												%N%
		%	address_part = <								%N%
		%		key = <%"address_part_detail_1%">			%N%
		%		value = <%"address_part_detail_2%">			%N%
		%	>												%N%
		%>													%N%
		%height = <189.5>		 							%N%
		%other_details = <									%N%
		%	[%"a%"] = <%"person_detail_1%">					%N%
		%	[%"b%"] = <%"person_detail_2%">					%N%
		%	[%"c%"] = <%"person_detail_3%">					%N%
		%>													%N%
		%generic_nested_data = <							%N%
		%	[%"key_1%"] = <									%N%
		%			[%"key_1.1%"] = <%"inner_detail_1.1%">	%N%
		%			[%"key_1.2%"] = <%"inner_detail_1.2%">	%N%
		%			[%"key_1.3%"] = <%"inner_detail_1.3%">	%N%
		%			[%"key_1.4%"] = <%"inner_detail_1.4%">	%N%
		%	>												%N%
		%	[%"key_2%"] = <									%N%
		%			[%"key_2.1%"] = <%"inner_detail_2.1%">	%N%
		%			[%"key_2.2%"] = <%"inner_detail_2.2%">	%N%
		%			[%"key_2.3%"] = <%"inner_detail_2.3%">	%N%
		%			[%"key_2.4%"] = <%"inner_detail_2.4%">	%N%
		%	>												%N%
		%>													%N%
		%generic_object_data = <							%N%
		%	[%"obj_1%"] = <									%N%
		%			key = <%"obj_key_1%">					%N%
		%			value = <%"obj_value_1%">				%N%
		%	>												%N%
		%	[%"obj_2%"] = <									%N%
		%			key = <%"obj_key_2%">					%N%
		%			value = <%"obj_value_2%">				%N%
		%	>												%N%
		%>													%N%
		%"

--		%		items = <									%N%
--		%		>											%N%

	test_object: DADL_SIMPLE_OBJECT

end

