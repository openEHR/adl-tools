note
	component:   "openEHR ADL Tools"
	description: "Test case for typed dADL"
	keywords:    "test, object graph, creation"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2004 Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


class TC_DADL2_TYPED

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

	title:STRING = "dADL2 typed attributes"

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
		end

feature -- Access

	check_result
	    do
	    end

feature -- Implementation
		
	dadl_tour_data: STRING = "%N%
		%destinations = 	<							%N%
		%	[%"seville%"] = TOURIST_DESTINATION <				%N%
		%		profile = DESTINATION_PROFILE <>			%N%
		%		hotels = LODGING <							%N%
		%			[%"gran sevilla%"] = HISTORIC_HOTEL <>	%N%
		%			[%"sofitel%"] = LUXURY_HOTEL <>			%N%
		%			[%"hotel real%"] = PENSION <>			%N%
		%		>								%N%
		%		attractions = <						%N%
		%			[%"la corrida%"] = ATTRACTION <>		%N%
		%			[%"Alcázar%"] = HISTORIC_SITE <>		%N%
		%		>								%N%
		%	>									%N%
		%>										%N%
		%>%N"

end

