note
	component:   "openEHR ADL Tools"
	description: "node in ADL parse tree"
	keywords:    "attribute, ADL"
	author:      "Thomas Beale <thomas.beale@openehr.org>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2003 openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class C_ATTRIBUTE

inherit
	ARCHETYPE_CONSTRAINT
		redefine
			parent, representation_cache, path, set_subtree_specialisation_status
		end

	C_COMMON
		export {NONE}
			all
		end

	ITERABLE [C_OBJECT]
		undefine
			is_equal, out
		end

create
	make_single, make_multiple, default_create

feature -- Initialisation

	make_single (a_name: STRING; an_existence: detachable MULTIPLICITY_INTERVAL)
			-- make representing a single-valued attribute with attr name and optional existence
		require
			a_name_valid: not a_name.is_empty
		local
			rep: attached like representation_cache
		do
			existence := an_existence
			create rep.make_single (a_name)
			rep.set_content (Current)
			representation_cache := rep
		ensure
			Is_single: not is_multiple
			Existence_set: existence = an_existence
		end

	make_multiple (a_name: STRING; an_existence: detachable MULTIPLICITY_INTERVAL; a_cardinality: detachable CARDINALITY)
			-- make representing a container attribute with attr name & optional existence and cardinality
		require
			a_name_valid: not a_name.is_empty
		local
			rep: attached like representation_cache
		do
			existence := an_existence
			cardinality := a_cardinality
			create rep.make_multiple (a_name)
			rep.set_content (Current)
			representation_cache := rep
		ensure
			Is_multiple: is_multiple
			Existence_set: existence = an_existence
			Cardinality_set: cardinality = a_cardinality
		end

feature -- Source Control

	set_subtree_specialisation_status (a_spec_status: INTEGER)
			-- mark every node from here down as having the specialisation status `a_spec_status'
		do
			set_specialisation_status (a_spec_status)
			across children as child_csr loop
				if attached {C_COMPLEX_OBJECT} child_csr.item as c_c_o then
					c_c_o.set_subtree_specialisation_status (a_spec_status)
				else
					child_csr.item.set_specialisation_status (a_spec_status)
				end
			end
		end

feature -- Access

	rm_attribute_name: STRING
			-- name of this attribute in reference model
		do
			Result := representation.node_id
		end

	rm_attribute_path: STRING
			-- path of this attribute with respect to owning C_OBJECT,
			-- including differential path where applicable
		do
			Result := representation.node_key
		end

	children: ARRAYED_LIST [C_OBJECT]
		attribute
			create Result.make (0)
		end

	existence: detachable MULTIPLICITY_INTERVAL

	cardinality: detachable CARDINALITY

	path: STRING
			-- take account of differential path if it exists
		do
			if has_differential_path then
				Result := rm_attribute_path
			else
				Result := precursor
			end
		end

	differential_path: detachable STRING
			-- if set, contains the path to this attribute, excluding the name of this attribute, allowing this
			-- C_ATTRIBUTE to stand as a 'path-compressed' replacement for a string of C_COMPLEX_OBJECT/
			-- C_ATTRIBUTE constraint objects
		do
			if attached representation.differential_path as att_dp then
				Result := att_dp.as_string
			end
		end

	aggregate_occurrences_lower_sum: INTEGER
			-- calculate sum of all occurrences lower bounds; where no occurrences are stated, 0 is assumed
		do
			across children as c_obj_csr loop
				if attached c_obj_csr.item.occurrences as att_occ then
					Result := Result + att_occ.lower
				end
			end
		end

	aggregate_occurrences_upper_is_one (an_ancestor_node_id: STRING; rm_prop_mult: FUNCTION [ANY, TUPLE[STRING, STRING], MULTIPLICITY_INTERVAL]): BOOLEAN
			-- sum of all occurrences upper bound of children of `an_ancestor_node_id' under this node
			-- is 1. For example, if this C_ATTRIBUTE node in a differential archetype has one child
			-- id4.0.1, with occurrences.upper = 1, for ancestor id id4, then Result = True.
			-- `rm_attr_prop_mult' is a function that knows how to compute effective object multiplicity
			-- by looking at the owning RM property.
		local
			matching_children: ARRAYED_LIST [C_OBJECT]
		do
			matching_children := children_matching_id (an_ancestor_node_id)
			Result := matching_children.count = 1 and matching_children.first.effective_occurrences (rm_prop_mult).upper = 1
		end

	minimum_child_count: INTEGER
			-- calculate minimum number of child objects that must occur in data; count 1 for every mandatory
			-- object, and 1 for all optional objects
		local
			found_opt_obj: BOOLEAN
		do
			across children as c_obj_csr loop
				if attached c_obj_csr.item.occurrences as att_occ and then att_occ.lower > 0 then
					Result := Result + 1
				else
					found_opt_obj := True
				end
			end
			if found_opt_obj then
				Result := Result + 1
			end
		end

	parent: detachable C_COMPLEX_OBJECT

	child_count: INTEGER
			-- number of children; 0 if any_allowed is True
		do
			Result := children.count
		end

	first_child: C_OBJECT
			-- obtain first child if there are children
		require
			child_count > 0
		do
			Result := children.first
		end

	child_before (an_obj: C_OBJECT): detachable C_OBJECT
			-- return child node before `an_obj' if there is one, else Void
		require
			Object_valid: has_child (an_obj)
		local
			pos: INTEGER
		do
			pos := children.index_of (an_obj, 1)
			if pos > 1 then
				Result := children.i_th (pos-1)
			end
		ensure
			has_result: attached Result implies has_child (Result)
		end

	child_after (an_obj: C_OBJECT): detachable C_OBJECT
			-- return child node after `an_obj' if there is one, else Void
		require
			Object_valid: has_child (an_obj)
		local
			pos: INTEGER
		do
			pos := children.index_of (an_obj, 1)
			if pos < children.count then
				Result := children.i_th (pos+1)
			end
		ensure
			has_result: attached Result implies has_child (Result)
		end

	child_with_id (a_node_id: STRING): C_OBJECT
			-- find the child node with `a_node_id'
		require
			has_child_with_id (a_node_id)
		do
			from
				children.start
			until
				children.off or children.item.node_id.is_equal (a_node_id)
			loop
				children.forth
			end
			Result := children.item
		end

	children_matching_id (a_node_id: STRING): ARRAYED_LIST [C_OBJECT]
			-- find child nodes with node_ids that contain `a_node_id', e.g. 'at0013' would match
			-- nodes with ids 'at0013.1', 'at0013.2', 'at0013.1.5' and so on
		do
			create Result.make(0)
			across children as child_csr loop
 				if codes_conformant (child_csr.item.node_id, a_node_id) then
 					Result.extend (child_csr.item)
 				end
			end
		end

	child_with_rm_type_name (an_rm_type: STRING): C_OBJECT
			-- return a child node with rm_type_name = `an_rm_type'
		require
			Rm_type_valid: has_child_with_rm_type_name(an_rm_type)
		do
			from children.start until children.off or children.item.rm_type_name.is_equal (an_rm_type) loop
				children.forth
			end
			Result := children.item
		end

	child_reuse_count (a_node_id: STRING): INTEGER
			-- number of children with either `a_node_id' or specialisations of `a_node_id'
		do
			across children as child_csr loop
				if codes_conformant (child_csr.item.node_id, a_node_id) then
					Result := Result + 1
				end
			end
		end

	children_with_rm_type_name_count (a_type_name: STRING): INTEGER
			-- number of child nodes with rm_type_name = `a_type_name'
		require
			Type_name_valid: not a_type_name.is_empty
		do
			across children as child_csr loop
				if child_csr.item.rm_type_name.is_equal (a_type_name) then
					Result := Result + 1
				end
			end
		end

	collective_occurrences_of (a_parent_co: C_OBJECT; an_rm_prop_mult: FUNCTION [ANY, TUPLE[STRING, STRING], MULTIPLICITY_INTERVAL]): MULTIPLICITY_INTERVAL
	        -- compute collective occurrences according to VSONCO, of all object nodes under this
	        -- attribute node that redefine `a_parent_co`, which is assumed to be an object node
	        -- within the specialisation parent of this C_ATTRIBUTE
	    require
	        a_parent_co.parent.is_multiple
	    do
	        -- make a 0..0 interval
	        create Result.make_prohibited

	        children.do_all (
	            agent (child_obj, parent_co: C_OBJECT;
	            		rm_prop_mult: FUNCTION [ANY, TUPLE[STRING, STRING], MULTIPLICITY_INTERVAL];
	            		interval: MULTIPLICITY_INTERVAL)
	            	local
	            		child_occ: MULTIPLICITY_INTERVAL
	                do
	                    if child_obj.node_id_conforms_to (parent_co) then
	                    	-- child object node may have no occurrences
	                    	child_occ := child_obj.effective_occurrences (rm_prop_mult)

	                        interval.set_lower (interval.lower + child_occ.lower)
	                        if child_occ.upper_unbounded then
	                            interval.set_upper_unbounded
	                        elseif not interval.upper_unbounded then
	                            interval.set_upper (interval.upper + child_occ.upper)
	                        end
	                    end
	                end (?, a_parent_co, an_rm_prop_mult, Result)
	        )

	        if attached cardinality and then not cardinality.upper_unbounded then
	            Result.set_upper (if Result.upper_unbounded then cardinality.upper else Result.upper.min (cardinality.upper) end)
	        end
	    end

feature -- Status Report

	any_allowed: BOOLEAN
			-- Is any value allowed ('*' received in parsed input) - i.e. no children and not is_prohibited?
		do
			Result := children.is_empty and not is_prohibited
		end

	has_children: BOOLEAN
			-- True if any object nodes below this node
		do
			Result := children.count > 0
		end

	is_constraint_multiple: BOOLEAN
			-- True if this node reprsents a container or else there are multiple alternative object
			-- nodes below this node. True implies that the id-codes on all child nodes must be
			-- defined in the terminology
		do
			Result := is_multiple or children.count > 1
		end

	is_multiple: BOOLEAN
			-- True if this node logically represents a container attribute
		do
			Result := representation.is_multiple
		end

	is_single: BOOLEAN
			-- True if this attribute is a single-valued attribute, i.e. not a container
		do
			Result := not representation.is_multiple
		end

	is_ordered: BOOLEAN
			-- True if this attribute is multiple and ordered;
			-- if no cardinality, assume it is ordered; should really be checked in the RM schema
		do
			Result := is_multiple and then attached cardinality as att_card and then att_card.is_ordered
		end

	is_prohibited: BOOLEAN
			-- True if occurrences set to {0} i.e. prohibited
		do
			Result := attached existence as att_ex and then att_ex.is_prohibited
		end

	is_mandatory: BOOLEAN
			-- True if occurrences set to {1} i.e. prohibited
		do
			Result := attached existence as att_ex and then att_ex.is_mandatory
		end

	is_leaf_parent: BOOLEAN
			-- True if single-valued and has a leaf child
		do
			Result := is_single and has_children and children.first.is_leaf
		end

	has_differential_path: BOOLEAN
			-- True if this node has a contracted path
		do
			Result := differential_path /= Void
		end

	has_any_differential_path: BOOLEAN
			-- True if this node has a compressed path anywhere in its path
		do
			Result := has_differential_path
			if not Result and then attached parent as cco and then attached cco.parent as att_ca then
				Result := att_ca.has_any_differential_path
			end
		end

	has_child_with_id (a_node_id: STRING): BOOLEAN
			-- has a child node with id a_node_id
		require
			Node_id_valid: not a_node_id.is_empty
		do
			Result := representation.has_child_with_id (a_node_id)
		end

	has_child_with_rm_type_name (a_type_name: STRING): BOOLEAN
			-- has a child node with rm_type_name = `a_type_name'
		require
			Type_name_valid: not a_type_name.is_empty
		do
			Result := across children as child_csr some child_csr.item.rm_type_name.is_equal (a_type_name) end
		end

	has_child_matching (match_agt: FUNCTION [ANY, TUPLE [C_OBJECT], BOOLEAN]): BOOLEAN
			-- has a child node matching `match_agt'
		do
			Result := children.there_exists (match_agt)
		end

	has_child (a_node: C_OBJECT): BOOLEAN
			-- True if a_node is actually one of the children
		do
			Result := children.has (a_node)
		end

	is_non_constraining: BOOLEAN
			-- True if there is no existence or cardinality constraint, and any_allowed is true
		do
			Result := not attached existence and not attached cardinality and any_allowed
		end

feature -- Iteration

	new_cursor: INDEXABLE_ITERATION_CURSOR [C_OBJECT]
			-- Fresh cursor associated with current structure
		do
			Result := children.new_cursor
		end

feature -- Comparison

	c_conforms_to (other: like Current; rm_type_conformance_checker: FUNCTION [ANY, TUPLE [STRING, STRING], BOOLEAN]): BOOLEAN
			-- True if this node on its own (ignoring any subparts) expresses the same or narrower constraints as `other'.
			-- Returns False if any of the following is incompatible:
			--	cardinality
			--	existence
		do
			Result := existence_conforms_to (other) and ((is_single and other.is_single) or else (is_multiple and cardinality_conforms_to (other)))
		end

	c_congruent_to (other: like Current): BOOLEAN
			-- True if this node on its own (ignoring any subparts) expresses no additional constraints than `other'.
		do
			Result := existence = Void and ((is_single and other.is_single) or (is_multiple and other.is_multiple and cardinality = Void))
		end

	existence_conforms_to (other: like Current): BOOLEAN
			-- True if the existence of this node conforms to other.existence
		do
			if attached existence as ex and attached other.existence as other_ex then
				Result := other_ex.contains (ex)
			else
				Result := True
			end
		end

	existence_matches (other: like Current): BOOLEAN
			-- True if the existence of this node is a duplicate of other.existence, which is
			-- non-conformant except in non-strict mode
		do
			Result := existence ~ other.existence
		end

	cardinality_conforms_to (other: like Current): BOOLEAN
			-- True if the cardinality of this node conforms to other.cardinality, if it exists
		do
			if attached cardinality as card and attached other.cardinality as other_card then
				Result := other_card.contains (card)
			else
				Result := True
			end
		end

	cardinality_matches (other: like Current): BOOLEAN
			-- True if the cardinality of this node is a duplicate of other.cardinality, which is
			-- non-conformant except in non-strict mode
		do
			Result := cardinality ~ other.cardinality
		end

feature -- Modification

	set_existence (an_interval: MULTIPLICITY_INTERVAL)
			-- set existence constraint on this relation - applies whether single or multiple
		do
			existence := an_interval
		end

	set_prohibited
			-- set existence constraint on this relation to prohibited, i.e. {0..0}
		do
			existence := create {MULTIPLICITY_INTERVAL}.make_prohibited
		end

	set_mandated
			-- set existence constraint on this relation to mandatory, i.e. {1..1}
		do
			existence := create {MULTIPLICITY_INTERVAL}.make_mandatory
		end

	set_optional
			-- set existence constraint on this relation to optional, i.e. {0..1}
		do
			existence := create {MULTIPLICITY_INTERVAL}.make_optional
		end

	set_cardinality (a_cardinality: CARDINALITY)
			--
		do
			cardinality := a_cardinality
		end

	remove_cardinality
		do
			cardinality := Void
		ensure
			not attached cardinality
		end

	remove_existence
		do
			existence := Void
		ensure
			not attached existence
		end

	set_differential_path (a_path: STRING)
			-- set `differential_path'
		require
			Path_valid: not a_path.is_empty
		do
			representation.set_differential_path (create {OG_PATH}.make_from_string (a_path))
		end

	clear_differential_path
			-- remove `differential_path'
		do
			representation.clear_differential_path
		end

	set_differential_path_to_here
			-- set `differential_path'
		require
			not has_differential_path
		do
			if attached representation.parent as att_rep_parent then
				representation.set_differential_path (att_rep_parent.path)
				if attached parent as att_parent and then not att_parent.is_root then
					reparent_to_root
				end
			end
		ensure
			Differential_path_set: differential_path /= Void
		end

	put_child (an_obj: C_OBJECT)
			-- put a new child node
		require
			Object_valid: valid_new_child (an_obj)
		do
			representation.put_child (an_obj.representation)
			children.extend (an_obj)
			an_obj.set_parent(Current)
		ensure
			Child_added: has_child_with_id (an_obj.node_id)
			Parent_set: an_obj.parent = Current
		end

	put_child_left (a_new_obj, before_obj: C_OBJECT)
			-- insert a new child node before another node
		require
			Object_valid: valid_new_child (a_new_obj)
			Before_obj_valid: has_child (before_obj)
		do
			representation.put_child_left (a_new_obj.representation, before_obj.representation)
			children.go_i_th (children.index_of (before_obj, 1))
			children.put_left (a_new_obj)
			a_new_obj.set_parent (Current)
		ensure
			Child_added: has_child (a_new_obj)
			Parent_set: a_new_obj.parent = Current
		end

	put_child_right (a_new_obj, after_obj: C_OBJECT)
			-- insert a new child node `a_new_obj' after the node `after_obj'
		require
			Object_valid: valid_new_child (a_new_obj)
			After_obj_valid: has_child (after_obj)
		do
			representation.put_child_right (a_new_obj.representation, after_obj.representation)
			children.go_i_th (children.index_of (after_obj, 1))
			children.put_right (a_new_obj)
			a_new_obj.set_parent (Current)
		ensure
			Child_added: has_child (a_new_obj)
			Parent_set: a_new_obj.parent = Current
		end

	put_sibling_child (a_new_obj: C_OBJECT; to_right: BOOLEAN)
			-- put a new child node after any sibling that is already there 'sibling' is defined
			-- as an object with a node_id with the same parent as the node_id of `an_obj';
			-- usually it is a specialised node id with a common parent, but may be a top level id
			-- put `an_obj' at end if no sibling found
		require
			Object_valid: valid_new_child (a_new_obj)
		local
			parent_id: STRING
			siblings: ARRAYED_LIST [C_OBJECT]
		do
			parent_id := specialised_code_base (a_new_obj.node_id)
			siblings := children_matching_id (parent_id)
			if not siblings.is_empty then
				if to_right then
					put_child_right (a_new_obj, siblings.last)
				else
					put_child_left (a_new_obj, siblings.first)
				end
			else
				put_child (a_new_obj)
			end
		ensure
			Child_added: has_child (a_new_obj)
			Parent_set: a_new_obj.parent = Current
		end

	replace_child_by_id (an_obj: C_OBJECT; an_id: STRING)
			-- replace node with id `an_id' by `an_obj'
		require
			Object_valid: valid_child_object (an_obj)
			Id_valid: has_child_with_id (an_id)
		do
			children.go_i_th (children.index_of (child_with_id (an_id), 1))
			children.replace (an_obj)
			representation.replace_child_by_id (an_obj.representation, an_id)
			an_obj.set_parent (Current)
		ensure
			Child_added: has_child (an_obj)
			Parent_set: an_obj.parent = Current
		end

	replace_child_by_rm_type_name (an_obj: C_OBJECT)
			-- replace node with same rm_type_name as `an_obj' by `an_obj'
		require
			Attribute_validity: is_single
			Object_valid: valid_child_object (an_obj)
		do
			representation.replace_child_by_id (an_obj.representation, child_with_rm_type_name (an_obj.rm_type_name).representation.node_key)
			children.go_i_th (children.index_of (child_with_rm_type_name (an_obj.rm_type_name), 1))
			children.replace (an_obj)
			an_obj.set_parent (Current)
		ensure
			Child_added: has_child (an_obj)
			Parent_set: an_obj.parent = Current
		end

	remove_child (an_obj: C_OBJECT)
			-- remove an existing child node
		require
			Object_valid: has_child (an_obj)
		do
			representation.remove_child_by_id (an_obj.node_id)
			children.prune_all (an_obj)
		ensure
			not has_child (an_obj)
		end

	remove_child_by_id (an_id: STRING)
			-- remove an existing child node
		require
			Id_valid: has_child_with_id (an_id)
		local
			an_obj: C_OBJECT
		do
			an_obj := child_with_id (an_id)
			representation.remove_child_by_id (an_id)
			children.prune_all(an_obj)
		ensure
			not has_child_with_id (an_id)
		end

	remove_all_children
		do
			children.wipe_out
			representation.remove_all_children
		ensure
			not has_children
		end

	replace_node_id (old_id, new_id: STRING)
			-- replace old_id with new_id in relevant child node, and also in attribute parent list
		require
			New_id_valid: not new_id.is_empty and not has_child_with_id (new_id)
			Old_id_valid: has_child_with_id (old_id)
		do
			if not old_id.same_string (new_id) then
				representation.replace_node_id (old_id, new_id)
				representation.child_with_id (new_id).set_node_id (new_id)
			end
		ensure
			has_child_with_id (new_id)
		end

	overlay_differential (a_flat_obj, diff_obj: C_OBJECT)
			-- apply any differences from `diff_obj' to `an_obj' node including node_id
			-- NOTE: will not overlay `attribute_tuples' if it happens to be set in `diff_obj' -
			-- this must be done separately
		require
			Flat_obj_valid: has_child (a_flat_obj)
		local
			old_flat_id: STRING
		do
			-- have to do the object overlay first, so it detects any difference in node id
			old_flat_id := a_flat_obj.node_id.twin
			a_flat_obj.overlay_differential (diff_obj)
		end

feature -- Validation

	valid_new_child (an_obj: C_OBJECT): BOOLEAN
			-- test an_obj for addition as a new child node (including for replacement)
		do
			Result := valid_child_object (an_obj) and not has_child_with_id (an_obj.node_id) or else attached {C_PRIMITIVE_OBJECT} an_obj
		end

	valid_child_object (an_obj: C_OBJECT): BOOLEAN
			-- test an_obj for validity as a child node
		do
			if not has_child (an_obj) then
				if is_single then
					Result := not attached an_obj.occurrences as att_occ or else (not att_occ.upper_unbounded and att_occ.upper <= 1)
				else
					Result := (not attached an_obj.occurrences as att_occ or else not attached cardinality as att_card or else
							(att_card.interval.upper_unbounded or else
							(att_occ.upper_unbounded or else att_card.interval.upper >= att_occ.upper)))
				end
			end
		end

feature -- Serialisation

	enter_subtree (visitor: C_VISITOR; depth: INTEGER)
			-- perform serialisation at start of block for this node
		do
			visitor.start_c_attribute (Current, depth)
		end

	exit_subtree (visitor: C_VISITOR; depth: INTEGER)
			-- perform serialisation at end of block for this node
		do
			visitor.end_c_attribute (Current, depth)
		end

feature {NONE} -- Implementation

	reparent_to_root
			-- reparent this node to the root node, removing intervening orphaned nodes on the way
		local
			csr: ARCHETYPE_CONSTRAINT
		do
			if attached parent as p then
debug("compress")
	io.put_string("%T%Tabout to REPARENT attribute Current (" + rm_attribute_path +
		") from parent object " + p.rm_type_name + "[" + p.node_id + "]%N")
end
				p.remove_attribute (Current)
				from csr := p until not attached csr.parent loop
					if attached {C_COMPLEX_OBJECT} csr.parent as cco and attached {C_ATTRIBUTE} csr as ca then
						if not ca.has_children then
debug("compress")
	io.put_string("%T%Tabout to remove ORPHAN attribute " + ca.rm_attribute_name +
		" from object " + cco.rm_type_name + "[" + cco.node_id + "]%N")
end
							cco.remove_attribute (ca)
						end
					elseif attached {C_ATTRIBUTE} csr.parent as ca and attached {C_COMPLEX_OBJECT} csr as cco then
						if not cco.has_attributes then
debug("compress")
	io.put_string("%T%Tabout to remove ORPHAN object " + cco.rm_type_name +
		"[" + cco.node_id + "] from attribute " + ca.rm_attribute_name + "%N")
end
							ca.remove_child (cco)
						end
					end
					if attached csr.parent as att_parent then
						csr := att_parent
					end
				end
				if attached {C_COMPLEX_OBJECT} csr as cco then
debug("compress")
	io.put_string("%T%Tabout to put REPARENTED attribute Current (" + rm_attribute_path +
		") on ROOT object " + cco.rm_type_name + "[" + cco.node_id + "]%N")
end
					cco.put_attribute (Current)
				end
			end
		end

	representation_cache: detachable OG_ATTRIBUTE_NODE
		note
			option: transient
		attribute
		end

	create_default_representation: attached like representation_cache
			-- create a reasonable `representation' instance
		do
			create Result.make_single ("initial")
		end

invariant
	Rm_attribute_name_valid: not rm_attribute_name.is_empty
	Any_allowed_validity: any_allowed xor not children.is_empty
	Children_occurrences_lower_sum_validity: (attached cardinality as att_card and then not att_card.interval.upper_unbounded) implies aggregate_occurrences_lower_sum <= att_card.interval.upper
	Children_orphans_validity: (attached cardinality as att_card and then not att_card.interval.upper_unbounded) implies minimum_child_count <= att_card.interval.upper
	Differential_path_valid: attached differential_path as att_diff_path implies not att_diff_path.is_empty
	Alternatives_valid: not is_multiple implies across children as child_csr all not attached child_csr.item.occurrences as att_occ or else att_occ.upper <= 1 end
	Has_differential_path_valid: differential_path = Void xor has_differential_path

end


