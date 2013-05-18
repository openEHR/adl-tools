note
	component:   "openEHR ADL Tools"
	description: "Test case for presence of object path"
	keywords:    "test, object graph, path"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2004 Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


class TC_OG_HAS_PATH

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

	title:STRING = "Object Graph has_path"

feature -- Initialisation

	make(arg:ANY)
		do
		end

	execute
		local
			path_set: HASH_TABLE [OG_OBJECT, OG_PATH]
		do
			io.put_string("----- path set ----%N")
			path_set := root_node.all_paths
			print_paths(path_set)
			
			from
				path_set.start
			until
				path_set.off
			loop
				io.put_string("%Thas_path(" + path_set.key_for_iteration.as_string + ") = " + 
					root_node.has_path(path_set.key_for_iteration).out + "%N")
				path_set.forth
			end
			
		end

feature -- Access

	check_result
	    do
	    end

end

