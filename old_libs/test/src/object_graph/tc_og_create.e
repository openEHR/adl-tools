note
	component:   "openEHR Reusable Libraries"
	description: "Test case for object graph creation"
	keywords:    "test, object graph, creation"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2004 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"


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

--|
--| ***** BEGIN LICENSE BLOCK *****
--| Version: MPL 1.1/GPL 2.0/LGPL 2.1
--|
--| The contents of this file are subject to the Mozilla Public License Version
--| 1.1 (the 'License'); you may not use this file except in compliance with
--| the License. You may obtain a copy of the License at
--| http://www.mozilla.org/MPL/
--|
--| Software distributed under the License is distributed on an 'AS IS' basis,
--| WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License
--| for the specific language governing rights and limitations under the
--| License.
--|
--| The Original Code is tc_base_units.e.
--|
--| The Initial Developer of the Original Code is Thomas Beale.
--| Portions created by the Initial Developer are Copyright (C) 2003-2004
--| the Initial Developer. All Rights Reserved.
--|
--| Contributor(s):
--|
--| Alternatively, the contents of this file may be used under the terms of
--| either the GNU General Public License Version 2 or later (the 'GPL'), or
--| the GNU Lesser General Public License Version 2.1 or later (the 'LGPL'),
--| in which case the provisions of the GPL or the LGPL are applicable instead
--| of those above. If you wish to allow use of your version of this file only
--| under the terms of either the GPL or the LGPL, and not to allow others to
--| use your version of this file under the terms of the MPL, indicate your
--| decision by deleting the provisions above and replace them with the notice
--| and other provisions required by the GPL or the LGPL. If you do not delete
--| the provisions above, a recipient may use your version of this file under
--| the terms of any one of the MPL, the GPL or the LGPL.
--|
--| ***** END LICENSE BLOCK *****
--|
