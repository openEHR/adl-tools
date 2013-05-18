note
	component:   "openEHR ADL Tools"
	description: "Test case for presence of object path"
	keywords:    "test, object graph, path"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2004 Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


class TC_OG_HAS_MOVABLE_PATH

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

	title:STRING = "Object Graph has_path (movable path)"

feature -- Initialisation

	make(arg:ANY)
		do
		end

	execute
		local
			path_set: HASH_TABLE [OG_OBJECT, OG_PATH]
			a_path, a_movable_path: OG_PATH
		do
			io.put_string("----- path set ----%N")
			path_set := root_node.all_paths
			print_paths(path_set)
			
			from
				path_set.start
			until
				path_set.off
			loop
				a_path := path_set.key_for_iteration
				io.put_string("%TPath: " + a_path.as_string + "%N")
				from
					a_path.start
				until
					a_path.off
				loop
					if a_path.item.is_addressable then
						create a_movable_path.make_movable(create {OG_PATH_ITEM}.make_from_other(a_path.item))
						io.put_string("%T %TMovable path: " + a_movable_path.as_string + "; found: " + root_node.has_path(a_movable_path).out + "%N")
					end
					a_path.forth
				end
				path_set.forth
			end
			
		end

feature -- Access

	check_result
	    do
	    end

end

