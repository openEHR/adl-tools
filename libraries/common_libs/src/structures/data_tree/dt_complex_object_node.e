note
	component:   "openEHR Archetype Project"
	description: "[
			     Object node representing root object in dADL parse tree
		         ]"
	keywords:    "ADL"
	author:      "Thomas Beale"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2003-2010 Ocean Informatics Pty Ltd"
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

create
	make_identified, make_anonymous, make_from_object

feature -- Initialisation

	default_create
			--
		do
			create attributes.make(0)
			create rm_type_name.make(0)
			rm_type_name.append(Unknown_type_name)
		ensure then
			not is_typed
		end

	make_identified(a_node_id: attached STRING)
			-- set node id, type_name = 'unknown'
		require
			Node_id_valid: not a_node_id.is_empty
		do
			default_create
			create representation.make (a_node_id, Current)
		ensure
			not is_typed
		end

	make_anonymous
		do
			default_create
			create representation.make_anonymous (Current)
		ensure
			not is_typed
		end

	make_from_object (an_obj: ANY)
			-- make a data tree from an object
		do
			make_anonymous
			object_converter.populate_dt_from_object(an_obj, Current)
		end

feature -- Access

	parent: DT_ATTRIBUTE_NODE

	attributes: attached ARRAYED_LIST [DT_ATTRIBUTE_NODE]
			-- next nodes, keyed by node id or attribute name

	attribute_node (an_attr_name: attached STRING): attached DT_ATTRIBUTE_NODE
			-- return attribute node at an_attr_name
		require
			An_attr_name_valid: has_attribute(an_attr_name)
		do
			Result ?= representation.child_with_id(an_attr_name).content_item
		end

	node_at_path(a_path: attached STRING): attached DT_OBJECT_ITEM
			-- find the child at the relative path `a_path'; paths can only ever return an object
		require
			Path_valid: has_path(a_path)
		do
			Result ?= representation.object_node_at_path(create {OG_PATH}.make_from_string(a_path)).content_item
		end

	attribute_node_at_path(a_path: attached STRING): attached DT_ATTRIBUTE_NODE
			-- find the child at the relative path `a_path'; paths can only ever return an object
		require
			Path_valid: has_path(a_path)
		do
			Result ?= representation.attribute_node_at_path(create {OG_PATH}.make_from_string(a_path)).content_item
		end

	all_paths: attached ARRAYED_LIST[STRING]
			-- all paths below this point, including this node
		local
			og_paths: HASH_TABLE [OG_OBJECT, OG_PATH]
		do
			og_paths := representation.all_paths
			create Result.make(0)
			Result.compare_objects
			from og_paths.start until og_paths.off loop
				Result.extend(og_paths.key_for_iteration.as_string)
				og_paths.forth
			end
		ensure
			Result_exists: Result.object_comparison
		end

	value_at_path(a_path: attached STRING): attached ANY
			-- retrieve leaf value object, including list or interval object at `a_path'
		require
			Path_valid: valid_path_string(a_path) and has_path(a_path)
		do
			if attached {DT_PRIMITIVE_OBJECT} node_at_path(a_path) as a_primitive_node then
				Result := a_primitive_node.value
			elseif attached {DT_PRIMITIVE_OBJECT_LIST} node_at_path(a_path) as a_primitive_list_node then
				Result := a_primitive_list_node.value
			elseif attached {DT_PRIMITIVE_OBJECT_INTERVAL} node_at_path(a_path) as a_primitive_ivl_node then
				Result := a_primitive_ivl_node.value
			end
		end

	value_list_at_path(a_path: attached STRING): SEQUENCE[ANY]
			-- attempt to get list value from path `a_path'; relies on
			-- prior knowledge that this path corresponds to a list object
		require
			Path_valid: valid_path_string(a_path) and has_path(a_path)
		do
			if attached {DT_PRIMITIVE_OBJECT_LIST} node_at_path(a_path) as a_primitive_list_node then
				Result := a_primitive_list_node.value
			end
		end

	value_interval_at_path(a_path: attached STRING): INTERVAL[PART_COMPARABLE]
			-- attempt to get interval value from path `a_path'; relies on
			-- prior knowledge that this path corresponds to an interval object
		require
			Path_valid: valid_path_string(a_path) and has_path(a_path)
		do
			if attached {DT_PRIMITIVE_OBJECT_INTERVAL} node_at_path(a_path) as a_primitive_ivl_node then
				Result := a_primitive_ivl_node.value
			end
		end

feature -- Iteration

	start
		do
			attributes.start
		end

	forth
		do
			attributes.forth
		end

	off: BOOLEAN
		do
			Result := attributes.off
		end

	item: DT_ATTRIBUTE_NODE
		do
			Result := attributes.item
		end

	first: DT_ATTRIBUTE_NODE
		do
			Result := attributes.first
		end

feature -- Status Report

	has_path(a_path: attached STRING): BOOLEAN
			-- find the child at the relative path `a_path'
		require
			Path_valid: not a_path.is_empty
		do
			Result := representation.has_path(create {OG_PATH}.make_from_string(a_path))
		end

	has_attribute (an_attr_name: attached STRING): BOOLEAN
			-- valid REL children of an object node must all be unique
		require
			Attr_name_valid: not an_attr_name.is_empty
		do
			Result := representation.has_child_with_id(an_attr_name)
		end

	is_valid: BOOLEAN
			-- report on validity
		do
			create invalid_reason.make(0)
			invalid_reason.append(rm_type_name + node_id + ":")
			Result := True
		end

	is_empty: BOOLEAN
			-- True if no attributes beneath this object
		do
			Result := attributes.is_empty
		end

feature -- Modification

	put_attribute(an_attr_node: attached DT_ATTRIBUTE_NODE)
			-- put a new child node
		require
			Node_exists: not has_attribute(an_attr_node.rm_attr_name)
		do
			representation.put_child (an_attr_node.representation)
			attributes.extend(an_attr_node)
			an_attr_node.set_parent(Current)
		end

	set_value_at_path (a_value: attached ANY; a_path: attached STRING)
			-- set a leaf value at a path, replacing any previous value
		require
			Path_valid: has_path(a_path)
		do
			if attached {DT_PRIMITIVE_OBJECT} node_at_path(a_path) as a_primitive_node then
				a_primitive_node.set_value(a_value)
			elseif attached {DT_PRIMITIVE_OBJECT_LIST} node_at_path(a_path) as a_primitive_list_node and attached {SEQUENCE[ANY]} a_value as a_sequence_value then
				a_primitive_list_node.set_value (a_sequence_value)
			elseif attached {DT_PRIMITIVE_OBJECT_INTERVAL} node_at_path(a_path) as a_primitive_ivl_node and attached {INTERVAL[PART_COMPARABLE]} a_value as an_interval_value then
				a_primitive_ivl_node.set_value (an_interval_value)
			end
		ensure
			Value_set: value_at_path (a_path) = a_value
		end

	put_value_at_path(a_value: attached ANY; a_path: attached STRING)
			-- create a new set of objects corresponding to `a_path'. At least the final segment
			-- of `a_path' does not already exist in the structure below the current object node
		require
			a_path_new: not a_path.is_empty and then not has_path (a_path)
			a_path_can_be_created: (create {OG_PATH}.make_root).valid_path_string(a_path)
		local
			an_og_path_item: OG_PATH_ITEM
			dt_obj: DT_OBJECT_ITEM
		do
			an_og_path_item := (create {OG_PATH}.make_from_string (a_path)).last

			-- deal with the object
			if an_og_path_item.is_addressable then
				if attached {SEQUENCE[ANY]} a_value as a_sequence_value then
					create {DT_PRIMITIVE_OBJECT_LIST} dt_obj.make_identified (a_sequence_value, an_og_path_item.object_id)
				elseif attached {INTERVAL[PART_COMPARABLE]} a_value as an_interval_value then
					create {DT_PRIMITIVE_OBJECT_INTERVAL} dt_obj.make_identified (an_interval_value, an_og_path_item.object_id)
				else
					create {DT_PRIMITIVE_OBJECT} dt_obj.make_identified (a_value, an_og_path_item.object_id)
				end
			else
				if attached {SEQUENCE[ANY]} a_value as a_sequence_value then
					create {DT_PRIMITIVE_OBJECT_LIST} dt_obj.make_anonymous (a_sequence_value)
				elseif attached {INTERVAL[PART_COMPARABLE]} a_value as an_interval_value then
					create {DT_PRIMITIVE_OBJECT_INTERVAL} dt_obj.make_anonymous (an_interval_value)
				else
					create {DT_PRIMITIVE_OBJECT} dt_obj.make_anonymous (a_value)
				end
			end
			put_object_at_path (dt_obj, a_path)
		end

	put_object_at_path(new_dt_obj: attached DT_OBJECT_ITEM; a_path: attached STRING)
			-- put `an_obj' at `a_path'; create the intervening structure if it doesn't already exist
			-- At least the final segment of `a_path' does not already exist in the structure below
			-- the current object node
		require
			a_path_new: not a_path.is_empty and then not has_path (a_path)
			a_path_can_be_created: (create {OG_PATH}.make_root).valid_path_string(a_path)
		local
			an_og_path: OG_PATH
			dt_attr: DT_ATTRIBUTE_NODE
			parent_dt_obj: DT_COMPLEX_OBJECT_NODE
			dt_obj: DT_OBJECT_ITEM
		do
			parent_dt_obj := Current
			create an_og_path.make_from_string (a_path)
			from an_og_path.start until an_og_path.off loop
				-- deal with the attribute
				if not parent_dt_obj.has_attribute (an_og_path.item.attr_name) then
					if an_og_path.item.is_addressable then
						create dt_attr.make_multiple (an_og_path.item.attr_name)
					else
						create dt_attr.make_single (an_og_path.item.attr_name)
					end
					parent_dt_obj.put_attribute(dt_attr)
				else
					dt_attr := parent_dt_obj.attribute_node (an_og_path.item.attr_name)
				end

				-- deal with the object
				if an_og_path.is_last then
					dt_attr.put_child (new_dt_obj)
				else -- any interior path node must be a DT_COMPLEX_OBJECT
					if dt_attr.is_multiple and an_og_path.item.is_addressable then
						if dt_attr.has_child_with_id (an_og_path.item.object_id) then
							dt_obj := dt_attr.child_with_id (an_og_path.item.object_id)
						else
							create {DT_COMPLEX_OBJECT_NODE} dt_obj.make_identified (an_og_path.item.object_id)
							dt_attr.put_child (dt_obj)
						end
					elseif not dt_attr.is_multiple and not an_og_path.item.is_addressable then
						if dt_attr.children.count = 1 then
							dt_obj := dt_attr.first_child
						else
							create {DT_COMPLEX_OBJECT_NODE} dt_obj.make_anonymous
							dt_attr.put_child (dt_obj)
						end
					else
						-- error state
					end
					parent_dt_obj ?= dt_obj
				end
				an_og_path.forth
			end
		end

	replace_attribute_name(old_name, new_name: attached STRING)
			-- change the name of an attribute
		require
			Old_name_valid: has_attribute(old_name)
			New_name_valid: not new_name.is_empty
		do
			representation.replace_attribute_name(old_name, new_name)
		end

	remove_attribute (attr_name: attached STRING)
			-- remove attribute node at `attr_name'
		require
			Attr_name_valid: has_attribute(attr_name)
		local
			attr_node: DT_ATTRIBUTE_NODE
		do
			attr_node := attribute_node(attr_name)
			representation.remove_child (attr_node.representation)
			attributes.prune (attr_node)
		end

feature -- Conversion

	out: STRING
			--
		do
			create Result.make(0)
			Result.append(rm_type_name + "[" + node_id + "] ")
		end

	as_object(a_type_id: INTEGER): ANY
			-- make an object whose classes and attributes correspond to the structure
			-- of this DT_OBJECT
		do
			Result := object_converter.dt_to_object(Current, a_type_id)
			as_object_ref := Result
		end

	as_object_from_string(a_type_name: STRING): ANY
			-- make an object whose classes and attributes correspond to the structure
			-- of this DT_OBJECT
		do
			Result := object_converter.dt_to_object_from_string(Current, a_type_name)
			as_object_ref := Result
		end

feature -- Representation

	representation: OG_OBJECT_NODE

feature -- Serialisation

	enter_subtree(serialiser: DT_SERIALISER; depth: INTEGER)
			-- perform serialisation at start of block for this node
		do
			serialiser.start_complex_object_node(Current, depth)
		end

	exit_subtree(serialiser: DT_SERIALISER; depth: INTEGER)
			-- perform serialisation at end of block for this node
		do
			serialiser.end_complex_object_node(Current, depth)
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
