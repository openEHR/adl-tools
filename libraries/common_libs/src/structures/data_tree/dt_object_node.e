indexing
	component:   "openEHR Archetype Project"
	description: "[
			     Object node representing root object in dADL parse tree
		         ]"
	keywords:    "ADL"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2003, 2004 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class DT_COMPLEX_OBJECT_NODE

inherit
	
	SHARED_DT_OBJECT_CONVERTER
		export
			{NONE} all
		undefine
			is_equal, out, default_create
		end
		
	DT_OBJECT_ITEM
		undefine
			out
		redefine
			parent, representation, default_create
		end

	OG_PATH_TOOLS
		export
			{NONE} all
			{ANY} valid_path_string
		undefine
			out, default_create, is_equal
		end
		
creation
	make_identified, make_anonymous, make_typed, make_typed_identified, make_from_object

feature -- Initialisation
	
	default_create is
			-- 
		do
			create attributes.make(0)
			create rm_type_name.make(0)
			rm_type_name.append(Unknown_type_name)
		ensure then
			not is_typed
		end
		
	make_identified(a_node_id: STRING) is
			-- set node id, type_name = 'unknown'
		require
			Node_id_valid: a_node_id /= Void and then not a_node_id.is_empty
		do
			default_create
			create representation.make (a_node_id, Current)
		ensure
			not is_typed
		end

	make_typed_identified(a_type_name, a_node_id: STRING) is
			-- set node id, type_name
		require
			Node_id_valid: a_node_id /= Void and then not a_node_id.is_empty
			Type_name_valid: a_type_name /= Void and then not a_type_name.is_empty
		do
			make_identified(a_node_id)
			set_type_name(a_type_name)
		ensure
			is_typed
		end

	make_typed(a_type_name: STRING) is
			-- set type_name
		require
			Type_name_valid: a_type_name /= Void and then not a_type_name.is_empty
		do
			make_anonymous
			set_type_name(a_type_name)
		ensure
			is_typed
		end

	make_anonymous is
		do
			default_create
			create representation.make_anonymous (Current)
		ensure
			not is_typed
		end

	make_from_object(an_obj:ANY) is
			-- make a data tree from an object
		do
			make_anonymous
			object_converter.populate_dt_from_object(an_obj, Current)
		end

feature -- Access

	parent: DT_ATTRIBUTE_NODE

	attributes: ARRAYED_LIST [DT_ATTRIBUTE_NODE]
			-- next nodes, keyed by node id or attribute name

	attribute(an_attr_name: STRING): DT_ATTRIBUTE_NODE is
			-- return attribute node at an_attr_name
		require
			An_attr_name_valid: an_attr_name /= Void and then has_attribute(an_attr_name)
		do
			Result ?= representation.child_at_node_id(an_attr_name).content_item
		end
		
	node_at_path(a_path: STRING): DT_OBJECT_ITEM is
			-- find the child at the relative path `a_path'; paths can only ever return an object
		require
			Path_valid: a_path /= Void and then has_path(a_path)
		do
			Result ?= representation.object_node_at_path(create {OG_PATH}.make_from_string(a_path)).content_item
		ensure
			Result_exists: Result /= Void
		end
		
	attribute_node_at_path(a_path: STRING): DT_ATTRIBUTE_NODE is
			-- find the child at the relative path `a_path'; paths can only ever return an object
		require
			Path_valid: a_path /= Void and then has_path(a_path)
		do
			Result ?= representation.attribute_node_at_path(create {OG_PATH}.make_from_string(a_path)).content_item
		ensure
			Result_exists: Result /= Void
		end
		
	all_paths: ARRAYED_LIST[STRING] is
			-- all paths below this point, including this node
		local
			og_paths: ARRAYED_LIST [OG_PATH]
		do
			og_paths := representation.all_paths
			create Result.make(0)
			Result.compare_objects
			from 
				og_paths.start
			until
				og_paths.off
			loop
				Result.extend(og_paths.item.as_string)
				og_paths.forth
			end
		ensure
			Result_exists: Result /= Void and then Result.object_comparison
		end

	value_at_path(a_path: STRING): ANY is
		require
			Path_valid: a_path /= Void and then (valid_path_string(a_path) and has_path(a_path))
		local
			a_primitive_node: DT_PRIMITIVE_OBJECT
		do
			a_primitive_node ?= node_at_path(a_path)
			Result := a_primitive_node.value
		end

	value_list_at_path(a_path: STRING): SEQUENCE[ANY] is
			-- get value list from path `a_path'
		require
			Path_valid: a_path /= Void and then (valid_path_string(a_path) and has_path(a_path))
		local
			a_primitive_list_node: DT_PRIMITIVE_OBJECT_LIST
		do
			a_primitive_list_node ?= node_at_path(a_path)
			if a_primitive_list_node /= Void then
				Result := a_primitive_list_node.value
			end
		end

feature -- Iteration

	start is
			-- 
		do
			attributes.start
		end

	forth is
			-- 
		do
			attributes.forth
		end

	off: BOOLEAN is
			-- 
		do
			Result := attributes.off
		end

	item: DT_ATTRIBUTE_NODE is
			-- 
		do
			Result := attributes.item
		end
		
feature -- Status Report

	has_path(a_path: STRING): BOOLEAN is
			-- find the child at the relative path `a_path'
		require
			Path_valid: a_path /= Void and then not a_path.is_empty
		do
			Result := representation.has_path(create {OG_PATH}.make_from_string(a_path))
		end

	has_attribute(an_attr_name: STRING):BOOLEAN is
			-- valid REL children of an object node must all be unique
		require
			Attr_name_valid: an_attr_name /= Void and then not an_attr_name.is_empty
		do
			Result := representation.has_child_node(an_attr_name)
		end
		
	is_valid: BOOLEAN is
			-- report on validity
		do
			create invalid_reason.make(0)
			invalid_reason.append(rm_type_name + node_id + ":")
			Result := True
		end
		
	is_empty: BOOLEAN is
			-- 
		do
			Result := attributes.is_empty
		end

feature -- Modification

	put_attribute(an_attr_node: DT_ATTRIBUTE_NODE) is
			-- put a new child node
		require
			Node_exists: an_attr_node /= Void and then not has_attribute(an_attr_node.rm_attr_name)
		do
			representation.put_child (an_attr_node.representation)
			attributes.extend(an_attr_node)
			an_attr_node.set_parent(Current)
		end

	set_value_at_path(a_value:ANY; a_path: STRING) is
			-- set a leaf value at a path
		require
			Path_valid: a_path /= Void and then has_path(a_path)
			Value_valid: a_value /= Void
		local
			a_primitive_node: DT_PRIMITIVE_OBJECT
		do
			a_primitive_node ?= node_at_path(a_path)
			a_primitive_node.set_value(a_value)
		end

	set_value_list_at_path(a_value:LIST[ANY]; a_path: STRING) is
			-- set a leaf value at a path
		require
			Path_valid: a_path /= Void and then has_path(a_path)
			Value_valid: a_value /= Void
		local
			a_primitive_node: DT_PRIMITIVE_OBJECT_LIST
		do
			a_primitive_node ?= node_at_path(a_path)
			a_primitive_node.set_value(a_value)
		end

	create_path(a_path: STRING) is
			-- create a new set of objects corresponding to `a_path'
		require
			a_path_valid: a_path /= Void and then not a_path.is_empty
		local
			an_attr_node: DT_ATTRIBUTE_NODE
			an_obj_node: DT_COMPLEX_OBJECT_NODE
		do
			
		end
		
feature -- Conversion

	out: STRING is
			-- 
		do
			create Result.make(0)
			Result.append(rm_type_name + "[" + node_id + "] ")
		end

	as_object(a_type_id: INTEGER): ANY is
			-- make an object whose classes and attributes correspond to the structure 
			-- of this DT_OBJECT
		do	
			Result := object_converter.dt_to_object(Current, a_type_id)
		end

feature -- Representation

	representation: OG_OBJECT_NODE

feature -- Serialisation

	enter_block(serialiser: DT_SERIALISER; depth: INTEGER) is
			-- perform serialisation at start of block for this node
		do
			serialiser.start_complex_object_node(Current, depth)
		end
		
	exit_block(serialiser: DT_SERIALISER; depth: INTEGER) is
			-- perform serialisation at end of block for this node
		do
			serialiser.end_complex_object_node(Current, depth)
		end

invariant
	Attributes_exists: attributes /= Void

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
--| The Original Code is dadl_object_node.e.
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
