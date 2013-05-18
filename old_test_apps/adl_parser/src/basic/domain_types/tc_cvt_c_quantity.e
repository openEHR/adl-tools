note
	component:   "openEHR ADL Tools"
	description: "Test case converting dadl to a simple object"
	keywords:    "test, object graph, creation"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2005 Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


class TC_CVT_C_QUANTITY

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

	title:STRING = "C_DV_QUANTITY bidirectional conversion from dADL"

feature -- Initialisation

	make(arg:ANY)
		do
		end

	execute
		local
			a_dt_obj: DT_COMPLEX_OBJECT_NODE
		do
			dadl_engine.set_source (dadl_c_quantity, 1)
			dadl_engine.parse
			if not dadl_engine.parse_succeeded then
				io.put_string("Parse failed; reason = " + dadl_engine.parse_error_text + "%N")
			else
				dadl_engine.serialise ("adl")
				io.put_string("---------- original dADL -----------%N")
				io.put_string(dadl_c_quantity)
				io.put_string("---------- serialised to ADL -----------%N")
				io.put_string(dadl_engine.serialised)
				io.put_string("---------- paths -----------%N")
				io.put_string(print_list(dadl_engine.tree.all_paths))
				test_object ?= dadl_engine.tree.as_object(dynamic_type_from_string("C_QUANTITY"))
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

	dadl_c_quantity: STRING = "[
			C_DV_QUANTITY <
				property = <[openehr::271]>
				list = <
					["1"] = <
						units = <"C">
						magnitude = <|>= 4.0|>
					>
					["2"] = <
						units = <"F">
						magnitude = <|>= 40.0|>
					>
				>
				assumed_value = <
					units = <"C">
					magnitude = <8.0>
				>
			>
		]"

	test_object: C_DV_QUANTITY

end

