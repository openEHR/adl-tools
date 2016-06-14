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
			representation_cache, out, set_subtree_specialisation_status
		end

create
	make

feature -- Initialisation

	make (a_rm_type_name, an_object_id: STRING)
			-- set type name, object_id
		require
			Rm_type_name_valid: not a_rm_type_name.is_empty
			Object_id_valid: is_valid_id_code (an_object_id)
		local
			rep: attached like representation_cache
		do
			rm_type_name := a_rm_type_name
			create rep.make (an_object_id)
			rep.set_content (Current)
			representation_cache := rep
		ensure
			Any_allowed: any_allowed
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

	attribute_with_name (an_attr_name: STRING): C_ATTRIBUTE
		require
			an_attr_name_valid: has_attribute (an_attr_name)
		do
			check attached {C_ATTRIBUTE} representation.child_with_id (an_attr_name).content_item as ca then
				Result := ca
			end
		end

	attributes_at_match_path (a_match_path: STRING): ARRAYED_LIST [C_ATTRIBUTE]
			-- get all C_ATTRIBUTEs whose paths match `a_path'
		do
			create Result.make (0)
			across representation.attribute_nodes_at_path (a_match_path) as og_attrs_csr loop
				if attached {C_ATTRIBUTE} og_attrs_csr.item.content_item as ca then
					Result.extend (ca)
				end
			end
		end

	objects_at_match_path (a_match_path: STRING): ARRAYED_LIST [C_OBJECT]
			-- get all C_OBJECTs whose paths match `a_path'
		do
			create Result.make (0)
			across representation.attribute_nodes_at_path (a_match_path) as og_attrs_csr loop
				if attached {C_OBJECT} og_attrs_csr.item.content_item as co then
					Result.extend (co)
				end
			end
		end

	attribute_at_path (a_path: STRING): C_ATTRIBUTE
			-- get C_ATTRIBUTE at a path
		require
			a_path_valid: has_attribute_path (a_path)
		local
			og_attrs: ARRAYED_LIST [OG_ATTRIBUTE_NODE]
		do
			og_attrs := representation.attribute_nodes_at_path (a_path)
			check not og_attrs.is_empty and then attached {C_ATTRIBUTE} og_attrs.first.content_item as ca then
				Result := ca
			end
		end

	object_at_path (a_path: STRING): C_OBJECT
			-- get C_OBJECT at a path
		require
			a_path_valid: has_object_path (a_path)
		local
			og_objs: ARRAYED_LIST [OG_OBJECT]
		do
			og_objs := representation.object_nodes_at_path (a_path)
			check not og_objs.is_empty and then attached {C_OBJECT} og_objs.first.content_item as co then
				Result := co
			end
		end

	path_map: HASH_TABLE [ARCHETYPE_CONSTRAINT, STRING]
			-- All paths below this point, including this node
		do
			create Result.make (0)
			across representation.path_map as paths_csr loop
				if attached {ARCHETYPE_CONSTRAINT} paths_csr.item.content_item as ac then
					Result.put (ac, paths_csr.key.as_string)
				end
			end
		end

	prototype_value: ANY
			-- 	generate a default value from this constraint object
		do
			-- FIXME: to be implemented
			Result := "to be implemented"
		end

	comparable_attribute_tuple (a_tuple: C_ATTRIBUTE_TUPLE): C_ATTRIBUTE_TUPLE
			-- Return the tuple in this object that could be compared to `a_tuple', i.e. constrains the same attributes
			-- in the same order
		require
			has_comparable_attribute_tuple (a_tuple)
		local
			comparable_tuple: detachable C_ATTRIBUTE_TUPLE
		do
			check attached attribute_tuples as att_tuples then
				across att_tuples as tuples_csr loop
					if tuples_csr.item.is_comparable_to (a_tuple) then
						comparable_tuple := tuples_csr.item
					end
				end
			end
			check attached comparable_tuple as att_tuple then
				Result := att_tuple
			end
		end

feature -- Status Report

	any_allowed: BOOLEAN
			-- True if any value allowed ('*' received in parsed input)
			-- i.e. no attributes and not is_prohibited
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
			Result := representation.has_path (a_path)
		end

	has_object_path (a_path: STRING): BOOLEAN
			-- does a_path exist to an object node from this node?
		do
			Result := representation.has_object_path (a_path)
		end

	has_attribute_path (a_path: STRING): BOOLEAN
			-- does a_path to an object node exist from this node?
		do
			Result := representation.has_attribute_path (a_path)
		end

	has_attribute (an_attr_name: STRING): BOOLEAN
		require
			an_attr_name_valid: not an_attr_name.is_empty
		do
			Result := representation.has_child_with_id (an_attr_name)
		end

	attribute_is_tuple_constrained (an_attr_name: STRING): BOOLEAN
			-- True if attribute `an_attr_name' is constrained by a tuple constraint in this object
		do
			Result := attached attribute_tuples as att_tuples and then across att_tuples as tuples_csr some tuples_csr.item.has_attribute (an_attr_name) end
		end

	valid_value (a_value: like prototype_value): BOOLEAN
		do
			-- FIXME: to be implemented
		end

	has_comparable_attribute_tuple (a_tuple: C_ATTRIBUTE_TUPLE): BOOLEAN
			-- True if there is some tuple in this object that could be compared to `a_tuple', i.e. constrains the same attributes
			-- in the same order
		do
			if attached attribute_tuples as att_tuples then
				Result := across att_tuples as tuples_csr some tuples_csr.item.is_comparable_to (a_tuple) end
			end
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
			attributes.prune_all (attribute_with_name (an_attr_name))
			representation.remove_child (attribute_with_name (an_attr_name).representation)
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

	replace_comparable_attribute_tuple (a_tuple: C_ATTRIBUTE_TUPLE)
			-- replace a tuple in this object that matches the signature of `a_tuple'
		require
			has_comparable_attribute_tuple (a_tuple)
		do
			check attached attribute_tuples as att_tuples then
				from att_tuples.start until att_tuples.item.is_comparable_to (a_tuple) or att_tuples.off loop
					att_tuples.forth
				end
				if not att_tuples.off then
					att_tuples.replace (a_tuple)
				end
			end
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
	Prohibited_validity: not (any_allowed and is_prohibited)
	Any_allowed_validity: any_allowed xor not attributes.is_empty
	Tuple_validity: attached attribute_tuples as ats implies ats.for_all (
		agent (cat: C_ATTRIBUTE_TUPLE): BOOLEAN
			do
				Result := cat.members.for_all (agent (ca: C_ATTRIBUTE): BOOLEAN do Result := attributes.has (ca) end)
			end
	)

end


