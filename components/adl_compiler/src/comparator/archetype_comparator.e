note
	component:   "openEHR ADL Tools"
	description: "[
				 Comparator of two flat archetypes in a specialisation parent/child relationship
		         ]"
	keywords:    "archetype, comparison, constraint model"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.com>"
	copyright:   "Copyright (c) 2007- Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class ARCHETYPE_COMPARATOR

inherit
	SPECIALISATION_STATUSES

	ADL_2_TERM_CODE_TOOLS
		export
			{NONE} all
		end

	ARCHETYPE_DEFINITIONS
		export
			{NONE} all
		end

	INTERNAL
		export
			{NONE} all
		end

create
	make, make_create_differential

feature -- Initialisation

	make (an_ancestor_flat, a_flat_target: AUTHORED_ARCHETYPE)
			-- create with two archetypes for comparison
		require
			Valid_ancestor_archetype: an_ancestor_flat.is_flat
			Target_archetype_valid: a_flat_target.is_flat and a_flat_target.is_specialised
		do
			flat_ancestor := an_ancestor_flat
			flat_child := a_flat_target
		end

	make_create_differential (an_ancestor_flat, a_flat_target: AUTHORED_ARCHETYPE)
			-- make with a valid specialised child archetype descriptor
		require
			Valid_ancestor_archetype: an_ancestor_flat.is_flat
			Target_archetype_valid: a_flat_target.is_flat and a_flat_target.is_specialised
		do
			make (an_ancestor_flat, a_flat_target)
			compare
			generate_diff
			compress_differential_child
		end

feature -- Access

	flat_ancestor: AUTHORED_ARCHETYPE
			-- flat form of parent archetype

	flat_child: AUTHORED_ARCHETYPE
			-- flat form of child archetype

	differential_output: detachable AUTHORED_ARCHETYPE
			-- generated differential result of calling `generate_diff'

feature -- Status Report

	target_is_marked: BOOLEAN
			-- True if `compare' has been run on `flat_child'

feature -- Comparison

	compare
			-- compare definition of specialised archetype against flat parent and mark
			-- nodes in the specialised flat target for removal
		require
			Child_specialised: flat_child.is_specialised
		local
			def_it: C_ITERATOR
			a_c_iterator: OG_CONTENT_ITERATOR
			rollup_builder: C_ROLLUP_BUILDER
		do
			-- first phase - mark all nodes as added by default
			create def_it.make (flat_child.definition)
			def_it.do_all (
				agent (a_c_node: ARCHETYPE_CONSTRAINT; depth: INTEGER)
					do
						a_c_node.set_specialisation_status_added
					end,
				agent (a_c_node: ARCHETYPE_CONSTRAINT; depth: INTEGER)
					do
					end
			)

			-- now mark nodes as added / redefined based on their
			-- direct counterparts (if they exist) in the flat parent
			create def_it.make (flat_child.definition)
			def_it.do_until_surface (agent child_node_compare, agent child_node_test)

			-- phase 2 - roll up the changes
			create rollup_builder.make (flat_child)
			create a_c_iterator.make (flat_child.definition.representation, rollup_builder)
			a_c_iterator.do_all

			target_is_marked := True
			differential_output := Void
		ensure
			Child_marked: target_is_marked
			Diff_needs_regenerating: not attached differential_output
		end

	generate_diff
			-- create uncompressed differential of archetype based on flat_child
		require
			target_is_marked
		local
			c_it: C_ITERATOR
			inherited_subtree_list: HASH_TABLE [ARCHETYPE_CONSTRAINT, STRING]
			diff_child: AUTHORED_ARCHETYPE
			term_removal_list, vset_id_codes_list: ARRAYED_SET [STRING]
			def_id_codes: HASH_TABLE [ARRAYED_LIST [ARCHETYPE_CONSTRAINT], STRING]
			def_at_codes: HASH_TABLE [ARRAYED_LIST [C_TERMINOLOGY_CODE], STRING]
			def_ac_codes: HASH_TABLE [C_TERMINOLOGY_CODE, STRING]
		do
			diff_child := flat_child
			diff_child.set_generated_differential
			differential_output := diff_child

			-- using rolled_up_specialisation statuses in nodes of definition generate a list of nodes/paths
			-- for deletion from flat-form archetype
			create inherited_subtree_list.make (0)
			create c_it.make (diff_child.definition)
			c_it.do_at_surface (
				agent (a_c_node: ARCHETYPE_CONSTRAINT; depth: INTEGER; subtree_list: HASH_TABLE [ARCHETYPE_CONSTRAINT, STRING])
					do
						subtree_list.put (a_c_node, a_c_node.path)
					end (?, ?, inherited_subtree_list),
				agent (a_c_node: ARCHETYPE_CONSTRAINT): BOOLEAN
					do
						Result := a_c_node.rolled_up_specialisation_status = ss_inherited
					end
			)

			-- add before/after ordering markers to new nodes whose parent attributes are ordered containers
			across inherited_subtree_list as subtree_csr loop
				-- FIXME: in the following statement, we are assuming that if the cardinality of the parent
				-- attribute does not exist (typical for a differential archetype), that it is ordered;
				-- really we should look up the RM schema
				if attached {C_OBJECT} subtree_csr.item as co and then attached co.parent as ca_parent and then
					(ca_parent.cardinality = Void or else ca_parent.is_ordered)
				then
					if attached {C_OBJECT} ca_parent.child_after (co) as co_next and then co_next.specialisation_status = ss_added then
						co_next.set_sibling_order_after (co.node_id)
					end
					if attached {C_OBJECT} ca_parent.child_before (co) as co_prev and then co_prev.specialisation_status = ss_added then
						co_prev.set_sibling_order_before (co.node_id)
					end
				end
			end

			-- now remove inherited subtrees
			across inherited_subtree_list as subtree_csr loop
				if attached {C_OBJECT} subtree_csr.item as co then
					if attached co.parent then
						co.parent.remove_child (co)
					else
						-- co must be the parent, which means the entire definition is a copy of that from
						-- the parent archetype
					end
				elseif attached {C_ATTRIBUTE} subtree_csr.item as c_attr then
					c_attr.parent.remove_attribute (c_attr)
				end
			end

			-- rebuild all internal references, path cache etc
			diff_child.rebuild

			-- =========== remove unneeded items from differential terminology ===========
			create term_removal_list.make (0)

			-- id-codes
			term_removal_list.compare_objects
			def_id_codes := diff_child.id_codes_index
			across diff_child.terminology.id_codes as codes_csr loop
				if specialisation_depth_from_code (codes_csr.item) = diff_child.specialisation_depth and then not def_id_codes.has (codes_csr.item) or else
					specialisation_depth_from_code (codes_csr.item) < diff_child.specialisation_depth
				then
					term_removal_list.extend (codes_csr.item)
				end
			end

			-- ac-codes and value-sets
			def_ac_codes := diff_child.term_constraints_index
			across diff_child.terminology.value_set_codes as codes_csr loop
				if specialisation_depth_from_code (codes_csr.item) = diff_child.specialisation_depth and then not def_ac_codes.has (codes_csr.item) or else
					specialisation_depth_from_code (codes_csr.item) < diff_child.specialisation_depth
				then
					term_removal_list.extend (codes_csr.item)
					if diff_child.terminology.has_value_set (codes_csr.item) then
						diff_child.terminology.value_sets.remove (codes_csr.item)
					end
				end
			end
			create vset_id_codes_list.make (0)
			across diff_child.terminology.value_sets as vsets_csr loop
				if specialisation_depth_from_code (vsets_csr.item.id) < diff_child.specialisation_depth then
					vset_id_codes_list.extend (vsets_csr.item.id)
				end
			end
			across vset_id_codes_list as vset_keys_to_remove_csr loop
				diff_child.terminology.value_sets.remove (vset_keys_to_remove_csr.item)
			end

			-- at-codes
			def_at_codes := diff_child.value_codes_index
			across diff_child.terminology.value_codes as codes_csr loop
				if specialisation_depth_from_code (codes_csr.item) = diff_child.specialisation_depth and then
					not (def_at_codes.has (codes_csr.item) or diff_child.terminology.has_value_set_value_code (codes_csr.item)) or else
					specialisation_depth_from_code (codes_csr.item) < diff_child.specialisation_depth
				then
					term_removal_list.extend (codes_csr.item)
				end
			end

			across term_removal_list as terms_csr loop
				diff_child.terminology.remove_definition (terms_csr.item)
			end
		ensure
			Diff_generated: attached differential_output as diff and then diff.is_differential
		end

	compress_differential_child
			-- perform path-compression on differential child archetype
		require
			Diff_available: attached differential_output
		do
			check attached differential_output as diff_child then
				diff_child.convert_to_differential_paths
			end
		end

feature {NONE} -- Implementation

	child_node_compare (a_c_node: ARCHETYPE_CONSTRAINT; depth: INTEGER)
			-- set specialisation status markers in `a_c_node' based on comparison with parent
		local
			ca_in_flat_anc: C_ATTRIBUTE
			co_in_flat_anc: C_OBJECT
			apa: ARCHETYPE_PATH_ANALYSER
			path_in_flat: STRING
			node_congruent: BOOLEAN
		do
			if attached {C_ATTRIBUTE} a_c_node as ca_child then
				create apa.make_from_string (a_c_node.path)
				path_in_flat := apa.path_at_level (flat_ancestor.specialisation_depth)
				ca_in_flat_anc := flat_ancestor.attribute_at_path (path_in_flat)
				-- if existence or cardinality have changed, it's a redefinition
				if not ca_child.c_congruent_to (ca_in_flat_anc) then
					ca_child.set_specialisation_status_redefined
				else
					ca_child.set_specialisation_status_inherited
					if not ca_child.is_second_order_constrained and then attached ca_child.parent as co_par and then co_par.is_path_compressible then
						ca_child.set_is_path_compressible
					end
				end

			-- other kind of C_OBJECT
			elseif attached {C_OBJECT} a_c_node as co_child then
				create apa.make_from_string (a_c_node.path)
				path_in_flat := apa.path_at_level (flat_ancestor.specialisation_depth)
				co_in_flat_anc := flat_ancestor.object_at_path (apa.path_at_level (flat_ancestor.specialisation_depth))

				-- if AOM types different, then it's not congruent, else call congruent_to () on objects to find out
				node_congruent := dynamic_type (co_in_flat_anc) = dynamic_type (co_child) and then co_child.c_congruent_to (co_in_flat_anc)

				-- if occurrences different, or node_id different, or RM type different or else primitive object constraint different
				if not node_congruent or else not co_child.node_id.is_equal (co_in_flat_anc.node_id) then
					co_child.set_specialisation_status_redefined
				else
					co_child.set_specialisation_status_inherited
				end

				-- mark this node as path_compressible if it is congruent, it's a CCO redefining a CCO, its parent C_ATTR is path-compressible
				-- and its flat ancestor counterpart CCO has attributes. We use the `is_c_complex_object_type' to make sure both objects really
				-- are C_COMPLEX_OBJECTs to discount them being C_ARCHETYPE_ROOTs
				if node_congruent and is_c_complex_object_type (co_child) and attached {C_COMPLEX_OBJECT} co_in_flat_anc as cco_pf and then
					(co_child.is_root or else co_child.parent.is_path_compressible and cco_pf.has_attributes)
				then
					co_child.set_is_path_compressible
				end
			end
		end

	child_node_test (a_c_node: ARCHETYPE_CONSTRAINT): BOOLEAN
		local
			apa: ARCHETYPE_PATH_ANALYSER
		do
			if attached {C_OBJECT} a_c_node as co_child then
				if specialisation_depth_from_code (co_child.node_id) <= flat_ancestor.specialisation_depth -- node from previous level
					or else is_refined_code (co_child.node_id)  -- from current level, refined
				then
					create apa.make_from_string (a_c_node.path)
					Result := flat_ancestor.has_object_path (apa.path_at_level (flat_ancestor.specialisation_depth))
				else
					-- it's a new code at this level; don't do anything, this branch will be treated as 'added'
				end

			elseif attached {C_ATTRIBUTE} a_c_node as ca_child then
				create apa.make_from_string (a_c_node.path)
				Result := flat_ancestor.has_attribute_path (apa.path_at_level (flat_ancestor.specialisation_depth))
			end
		end

	is_c_complex_object_type (co: C_OBJECT): BOOLEAN
			-- True if `co' has dynamic type attached C_COMPLEX_OBJECT
		do
			Result := attached_type (dynamic_type (co)) = ({C_COMPLEX_OBJECT}).type_id
		end

invariant
	Flat_ancestor_is_flat: flat_ancestor.is_flat
	Flat_target_is_flat: flat_child.is_flat

end


