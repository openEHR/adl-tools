note
	component:   "openEHR ADL Tools"
	description: "[
			     Object node representing any non-simple type in ADL parse tree. 
			     Can be any of the following:
			     	- normal object with child properties
			     	- constraint referring to other archetype(s)
			     	- coded reference to a constraint defined somewhere else 
			     		(usually in the terminology part of the archetype)
			     	- 'any' node, meaning no constraint other than the type
			     ]"
	keywords:    "test, ADL"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2003- The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class C_COMPLEX_OBJECT

inherit
	C_DEFINED_OBJECT
		redefine
			representation_cache, out
		end

create
	make_identified, make_anonymous

feature -- Initialisation

	make_identified (a_rm_type_name, an_object_id: STRING)
			-- set type name, object_id
		require
			Rm_type_name_valid: not a_rm_type_name.is_empty
			Object_id_valid: not an_object_id.is_empty
		do
			rm_type_name := a_rm_type_name
			create representation_cache.make (an_object_id)
			representation_cache.set_content (Current)
		end

	make_anonymous (a_rm_type_name: STRING)
			-- set type name
		require
			Rm_type_name_valid: not a_rm_type_name.is_empty
		do
			rm_type_name := a_rm_type_name
			create representation_cache.make_anonymous
			representation_cache.set_content (Current)
		end

feature -- Source Control

	set_subtree_specialisation_status (a_spec_status: INTEGER)
			-- mark every node from here down as having the specialisation status `a_spec_status'
		local
			def_it: C_ITERATOR
		do
			create def_it.make (Current)
			def_it.do_all (
				agent (a_c_node: ARCHETYPE_CONSTRAINT; depth: INTEGER; a_spec_sts: INTEGER)
					do
						a_c_node.set_specialisation_status (a_spec_sts)
					end (?, ?, a_spec_status),
				agent (a_c_node: ARCHETYPE_CONSTRAINT; depth: INTEGER)
					do
					end
			)
		end

feature -- Access

	attribute_tuples: detachable ARRAYED_LIST [C_ATTRIBUTE_TUPLE]
			-- attributes that occur in tuples of 2 or more
			-- currently limited to attributes whose values are C_PRIMITIVEs

	attributes: ARRAYED_LIST [C_ATTRIBUTE]
		attribute
			create Result.make (0)
		end

	c_attribute (an_attr_name: STRING): C_ATTRIBUTE
		require
			an_attr_name_valid: has_attribute (an_attr_name)
		do
			check attached {C_ATTRIBUTE} representation.child_with_id (an_attr_name).content_item as ca then
				Result := ca
			end
		end

	c_attribute_at_path (a_path: STRING): C_ATTRIBUTE
			-- get C_ATTRIBUTE at a path (which doesn't terminate in '/')
		require
			a_path_valid: has_path (a_path)
		do
			check attached {C_ATTRIBUTE} representation.attribute_node_at_path (create {OG_PATH}.make_from_string (a_path)).content_item as ca then
				Result := ca
			end
		end

	c_object_at_path (a_path: STRING): C_OBJECT
			-- get C_OBJECT at a path (which terminates in '/')
		require
			a_path_valid: has_path (a_path)
		do
			check attached {C_OBJECT} representation.object_node_at_path (create {OG_PATH}.make_from_string(a_path)).content_item as co then
				Result := co
			end
		end

	all_paths_at_path (a_path: STRING): HASH_TABLE [detachable C_OBJECT, STRING]
			-- all paths starting at node found at a_path, including itself
		require
			Path_valid: has_path(a_path)
		do
			create Result.make(0)
			if attached {OG_OBJECT_NODE} representation.object_node_at_path(create {OG_PATH}.make_from_string(a_path)) as og_node then
				across og_node.all_paths as paths_csr loop
					if attached {OG_OBJECT} paths_csr.item as og_obj then
						if attached {C_OBJECT} og_obj.content_item as c_obj then
							Result.put (c_obj, paths_csr.key.as_string)
						end
					else
						Result.put (Void, paths_csr.key.as_string)
					end
				end
			end
		end

	all_paths: HASH_TABLE [detachable C_OBJECT, STRING]
			-- All paths below this point, including this node, with C_OBJECT at each
			-- path that is an object path, and Void at paths that are attribute paths.
		do
			create Result.make (0)
			across representation.all_paths as paths_csr loop
				if attached {OG_OBJECT} paths_csr.item as og_obj then
					if attached {C_OBJECT} og_obj.content_item as c_obj then
						Result.put (c_obj, paths_csr.key.as_string)
					end
				else
					Result.put (Void, paths_csr.key.as_string)
				end
			end
		end

	prototype_value: ANY
			-- 	generate a default value from this constraint object
		do
			-- FIXME: to be implemented
			Result := "to be implemented"
		end

feature -- Status Report

	any_allowed: BOOLEAN
			-- True if any value allowed ('*' received in parsed input)
			-- i.e. no attributes
		do
			Result := attributes.is_empty and not is_prohibited
		end

	has_attributes: BOOLEAN
			-- True if any attribute nodes below this node
		do
			Result := attributes.count > 0
		end

	has_attribute_tuples: BOOLEAN
			-- True if any attribute nodes below this node
		do
			Result := attached attribute_tuples
		end

	has_path (a_path: STRING): BOOLEAN
			-- does a_path exist from this node?
		do
			Result := representation.has_path (create {OG_PATH}.make_from_string(a_path))
		end

	has_object_path (a_path: STRING): BOOLEAN
			-- does a_path exist to an object node from this node?
		do
			Result := representation.has_object_path (create {OG_PATH}.make_from_string(a_path))
		end

	has_attribute_path (a_path: STRING): BOOLEAN
			-- does a_path to an object node exist from this node?
		do
			Result := representation.has_attribute_path (create {OG_PATH}.make_from_string(a_path))
		end

	has_attribute (an_attr_name: STRING): BOOLEAN
		require
			an_attr_name_valid: not an_attr_name.is_empty
		do
			Result := representation.has_child_with_id (an_attr_name)
		end

	valid_value (a_value: like prototype_value): BOOLEAN
		do
			-- FIXME: to be implemented
		end

	valid_assumed_value (a_value: like assumed_value): BOOLEAN
		do
			-- FIXME: to be implemented
		end

feature -- Modification

	put_attribute (an_attr: C_ATTRIBUTE)
			-- put a new attribute
		require
			Attribute_valid: not has_attribute (an_attr.rm_attribute_path)
		do
			representation.put_child (an_attr.representation)
			attributes.extend (an_attr)
			an_attr.set_parent (Current)
		end

	remove_attribute (an_attr: C_ATTRIBUTE)
			-- remove an existing attribute
		require
			Attribute_valid: has_attribute (an_attr.rm_attribute_path)
		do
			attributes.prune_all(an_attr)
			representation.remove_child (an_attr.representation)
		ensure
			not has_attribute (an_attr.rm_attribute_path)
		end

	remove_attribute_by_name (an_attr_name: STRING)
			-- remove an existing attribute
		require
			Attribute_name_valid: has_attribute (an_attr_name)
		do
			attributes.prune_all (c_attribute (an_attr_name))
			representation.remove_child (c_attribute (an_attr_name).representation)
		ensure
			not has_attribute (an_attr_name)
		end

	remove_all_attributes
			--
		do
			representation.remove_all_children
			attributes.wipe_out
		end

	put_attribute_tuple (an_attr_tuple: C_ATTRIBUTE_TUPLE)
		local
			attr_tuples: ARRAYED_LIST [C_ATTRIBUTE_TUPLE]
		do
			if attached attribute_tuples as ats then
				attr_tuples := ats
			else
				create attr_tuples.make (1)
				attribute_tuples := attr_tuples
			end
			attr_tuples.extend (an_attr_tuple)
		end

feature -- Output

	out: STRING
			--
		do
			create Result.make(0)
			Result.append (rm_type_name + "[" + node_id + "] ")
			if attached occurrences as occ then
				Result.append (occ.as_string)
			end
		end

feature -- Visitor

	enter_subtree (visitor: C_VISITOR; depth: INTEGER)
			-- perform action at start of block for this node
		do
			visitor.start_c_complex_object (Current, depth)
		end

	exit_subtree (visitor: C_VISITOR; depth: INTEGER)
			-- perform action at end of block for this node
		do
			visitor.end_c_complex_object (Current, depth)
		end

feature {NONE} -- Implementation

	child_type: C_ATTRIBUTE
			-- child parse nodes
		once
			create Result
		end

feature -- Representation

	representation_cache: detachable OG_OBJECT_NODE
		note
			option: transient
		attribute
		end

	create_default_representation: attached like representation_cache
			-- create a reasonable `representation' instance
		do
			create Result.make_anonymous
		end

invariant
	Any_allowed_validity: any_allowed xor not attributes.is_empty
	Tuple_validity: attached attribute_tuples as ats implies ats.for_all (
		agent (cat: C_ATTRIBUTE_TUPLE): BOOLEAN
			do
				Result := cat.members.for_all (agent (ca: C_ATTRIBUTE): BOOLEAN do Result := attributes.has (ca) end)
			end
	)

end


