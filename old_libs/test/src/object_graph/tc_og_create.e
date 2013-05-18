note
	component:   "openEHR ADL Tools"
	description: "Test case for object graph creation"
	keywords:    "test, object graph, creation"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2004 Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


class TC_OG_CREATE

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

	title:STRING = "Object Graph CREATE test"

feature -- Initialisation

	make(arg:ANY)
		do
		end

	execute
		local
			obj_node: OG_OBJECT_NODE
			attr_node: OG_ATTRIBUTE_NODE
			leaf_node: OG_OBJECT_LEAF
		do
			io.put_string("----- initial state ----%N")
			print_paths(root_node.all_paths)
			
			-- add two attributes
			create attr_node.make("name", Void)
			root_node.put_child(attr_node)
			
			create attr_node.make("items", Void)
			root_node.put_child(attr_node)
			
			io.put_string("----- add 'name' and 'items' children, id = at0001 ----%N")
			print_paths(root_node.all_paths)
			
			-- add some object nodes
			io.put_string("----- put anon node under 'name' ----%N")
			attr_node := root_node.attribute_node_at_path (create {OG_PATH}.make_from_string("/name"))
			create leaf_node.make_anonymous(Void)
			attr_node.put_child(leaf_node)
			print_paths(root_node.all_paths)
			
			io.put_string("----- put 2 addressable nodes under 'items' ----%N")
			attr_node := root_node.attribute_node_at_path (create {OG_PATH}.make_from_string("/items"))
			create leaf_node.make("at0002", Void)
			attr_node.put_child(leaf_node)
			create obj_node.make("at0003", Void)
			attr_node.put_child(obj_node)
			print_paths(root_node.all_paths)

			io.put_string("----- put addressable node under 'items/[at0003]' ----%N")
			obj_node ?= root_node.object_node_at_path (create {OG_PATH}.make_from_string("/items[at0003]"))
			create attr_node.make("count", Void)
			obj_node.put_child(attr_node)
			create leaf_node.make("at0004", Void)
			attr_node.put_child(leaf_node)
			print_paths(root_node.all_paths)
		end

feature -- Access

	check_result
	    do
	    end

end

