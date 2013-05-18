note
	component:   "openEHR ADL Tools"
	description: "Test case for object graph modification"
	keywords:    "test, object graph, creation"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2004 Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


class TC_OG_MODIFY

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

	title:STRING = "Object Graph MODIFY test"

feature -- Initialisation

	make(arg:ANY)
		do
		end

	execute
		local
			attr_node: OG_ATTRIBUTE_NODE
			obj_node: OG_OBJECT
		do
			-- remove all children of  creation
			io.put_string("----- initial state ----%N")
			print_paths(root_node.all_paths)
			
			io.put_string("----- remove children of '/items' ----%N")
			obj_node ?= root_node.object_node_at_path (create {OG_PATH}.make_from_string("/items"))
			attr_node := obj_node.parent
			attr_node.remove_all_children
			print_paths(root_node.all_paths)
		end

feature -- Access

	check_result
	    do
	    end

end

