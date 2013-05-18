note
	component:   "openEHR ADL Tools"
	description: "Test case for ADL ontology"
	keywords:    "test, ADL"

	author:      "Sam Heard"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2004 Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


class TC_ONTOLOGY_SHOW_PATHS
	
inherit
	TEST_CASE
		redefine
			prereqs
		end
		
	SHARED_TEST_ENV
		export
			{NONE} all
		end
		
create
	make

feature -- Initialisation

	make(arg:ANY)
	    do
	    end

feature -- Access

	title: STRING = "Show ontology paths"

	prereqs: ARRAY[STRING] 
			-- ids of prerequisite test cases
		once
			Result := <<"TC_ONTOLOGY_POPULATE">>
		end

feature -- testing

	execute
		local
			a_term: ARCHETYPE_TERM
			archetype: ARCHETYPE
			paths: ARRAYED_LIST [STRING]
		do
			archetype := adl_interface.archetype

			io_message.put_string ("------------------ Show all the paths -------------------%N")
		
			if archetype.is_valid then
				from
					paths := archetype.physical_paths
					paths.start
				until
					paths.off
				loop
					io_message.put_string (paths.item)	
					io_message.new_line
					paths.forth
				end
				
			else
				io_message.put_string (archetype.errors)
			end
		end
	
end

