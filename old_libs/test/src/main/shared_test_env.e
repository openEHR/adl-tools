note
	component:   "openEHR ADL Tools"
	description: "Test case for archetype creation"
	keywords:    "test, ADL, CADL"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2003, 2004 Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


class SHARED_TEST_ENV
	
inherit
	SHARED_METHOD_DISPATCHER
		
	SHARED_DT_SERIALISERS
		export
			{NONE} all
			{ANY} has_dt_serialiser_format
		end

	SHARED_RESOURCES
		export
			{NONE} all
		end

	INTERNAL
		export
			{NONE} all
		end
		
	ISO8601_ROUTINES
		export
			{NONE} all
		end
		
feature -- Access

	root_node: OG_OBJECT_NODE
			-- 
		once
			-- initial creation
			io.put_string("----- Create root node, id = at0001 ----%N")
			create Result.make("at0001", Void)
		end

	print_paths(paths: HASH_TABLE [OG_OBJECT, OG_PATH])
		do
			from 
				paths.start
			until
				paths.off
			loop
				io.put_string(paths.key_for_iteration.as_string)
				io.new_line
				paths.forth
			end
		end

	print_paths_list(paths: ARRAYED_LIST [OG_PATH])
		do
			from 
				paths.start
			until
				paths.off
			loop
				io.put_string(paths.item.as_string)
				io.new_line
				paths.forth
			end
		end

	part: PART
		once
			create Result
		end

	string_list:LINKED_LIST[STRING]
		once
			create Result.make
			Result.extend("1 - this")
			Result.extend("2 - is")
			Result.extend("3 - a")
			Result.extend("4 - list")

			Result.compare_objects
		end
	
	print_list (a_list: LIST[STRING]):STRING
		do
			create Result.make(0)
			from a_list.start until a_list.off loop
				Result.append(a_list.item)
				Result.append("%N")
				a_list.forth
			end
		end
		
	dadl_engine: DADL_ENGINE
			-- 
		once
			create Result.make
		end
	    
	path_parser: OG_PATH_VALIDATOR

end

