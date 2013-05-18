note
	component:   "openEHR ADL Tools"
	description: "Test case for typed anonymous dADL"
	keywords:    "test, object graph, creation"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2005 Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


class TC_DADL2_TYPED_ANON

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

	title:STRING = "dADL2 typed anonymous object block"

feature -- Initialisation

	make(arg:ANY)
		do
		end

	execute
		do
			dadl_engine.set_source (dadl_tour_data, 1)
			dadl_engine.parse
			if not dadl_engine.parse_succeeded then
				io.put_string("Parse failed; reason = " + dadl_engine.parse_error_text + "%N")
			else
				dadl_engine.serialise ("adl")
				io.put_string("---------- original dADL -----------%N")
				io.put_string(dadl_tour_data)
				io.put_string("---------- serialised to ADL -----------%N")
				io.put_string(dadl_engine.serialised)
				io.put_string("---------- paths -----------%N")
				io.put_string(print_list(dadl_engine.tree.all_paths))
			end

			dadl_engine.set_source (c_dv_quantity, 1)
			dadl_engine.parse
			if not dadl_engine.parse_succeeded then
				io.put_string("Parse failed; reason = " + dadl_engine.parse_error_text + "%N")
			else
				dadl_engine.serialise ("adl")
				io.put_string("---------- original dADL -----------%N")
				io.put_string(c_dv_quantity)
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

	dadl_tour_data: STRING = "[
			TOURIST_DESTINATION <
				profile = DESTINATION_PROFILE <>
				hotels = LODGING <
					["gran sevilla"] = HISTORIC_HOTEL <>
					["sofitel"] = LUXURY_HOTEL <>
					["hotel real"] = PENSION <>
				>
				attractions = <
					["la corrida"] = ATTRACTION <>
					["Alcázar"] = HISTORIC_SITE <>
				>
			>
		]"

	c_dv_quantity: STRING = "[
			C_DV_QUANTITY <
				assumed_value = <
					units = <"C">
					precision = <0>
					magnitude = <8.0>
				>
				property = <[openehr::127]>
				list = <
					["1"] = <
						units = <"C">
						magnitude = <|>=4.0|>
					>
					["2"] = <
						units = <"F">
						magnitude = <|>=40.0|>
					>
				>
			>
		]"

end

