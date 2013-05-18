note
	component:   "openEHR ADL Tools"
	description: "Test case for basic path parsing"
	keywords:    "test, path"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2006 Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


class TC_PATH_BASIC

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

	title:STRING = "Basic path test"

feature -- Initialisation

	make(arg:ANY)
		do
		end

	execute
		local
			path: OG_PATH
		do
			create path_parser.make
			
			from
				test_path_set.start
			until
				test_path_set.off
			loop
				path_parser.reset
				io.put_string("------------ testing path %"" + test_path_set.item + "%"%N")
				path_parser.execute(test_path_set.item)

				if path_parser.syntax_error then
					io.put_string("Parse FAILED: " + path_parser.error_text + "%N")
				else
					path := path_parser.output
					io.put_string("Parse succeeded...%N")
					io.put_string("%Tas_string: " + path.as_string + "%N")
					
					if  path.is_terminal then
						io.put_string("%Tis_terminal%N")
					end
					if  path.is_absolute then
						io.put_string("%Tis_absolute%N")
					end
					if  path.is_movable then
						io.put_string("%Tis_movable%N")
					end
					if  path.last.is_feature_call then
						io.put_string("%Tis_feature_call%N")
					end
					io.put_string("%N")
				end
				
				test_path_set.forth
			end			
		end

feature -- Access

	check_result
	    do
	    end
	    
	test_path_set: LINKED_LIST[STRING]
			-- list of test paths
		once
			create Result.make
			Result.extend("items")
			Result.extend("/items")

			Result.extend("items[at0001]")
			Result.extend("/items[at0001]")
			
			Result.extend("items[at0001]/data/events[at0002]")
			Result.extend("/items[at0001]/data/events[at0002]")
			
			Result.extend("items[at0001]/data/events")
			Result.extend("/items[at0001]/data/events")
			
			Result.extend("items[at0001]/data[at0002]/events")
			Result.extend("/items[at0001]/data[at0002]/event")
			
			Result.extend("/items[at0001]/data[at0002]/events[at0003]")
			
--			Result.extend("/items[at0001]/func()")
			
			Result.extend("//items")
			Result.extend("//items[at0001]")
		end
		

end

