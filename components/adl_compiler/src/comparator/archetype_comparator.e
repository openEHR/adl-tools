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

	ARCHETYPE_TERM_CODE_TOOLS
		export
			{NONE} all
		end

	ARCHETYPE_DEFINITIONS
		export
			{NONE} all
		end

create
	make, make_create_differential

feature -- Initialisation

	make (a_parent_aca: ARCH_CAT_ARCHETYPE; a_child_archetype: FLAT_ARCHETYPE)
			-- create with two archetypes for comparison
		require
			Valid_parent_archetype: a_parent_aca.is_valid
			Child_archetype_valid: a_child_archetype.is_specialised
		do
			parent_descriptor := a_parent_aca
			flat_parent := parent_descriptor.flat_archetype
			flat_child := a_child_archetype
		end

	make_create_differential (a_child_aca: ARCH_CAT_ARCHETYPE)
			-- make with a valid specialised child archetype descriptor
		require
			Child_archetype_valid: a_child_aca.is_valid and a_child_aca.is_specialised
		do
			check attached a_child_aca.specialisation_parent as parent_aca then
				make (parent_aca, a_child_aca.flat_archetype)
			end
			compare
			generate_diff
			compress_differential_child
		end

feature -- Access

	parent_descriptor: ARCH_CAT_ARCHETYPE
			-- compiled parent archetype descriptor

	flat_parent: FLAT_ARCHETYPE
			-- compiled parent archetype

	flat_child: FLAT_ARCHETYPE
			-- flat form of child archetype

	differential_child: detachable DIFFERENTIAL_ARCHETYPE
			-- generated differential result of calling `

feature -- Status Report

	child_is_marked: BOOLEAN
			-- True if `compare' has been run on `flat_child'

feature -- Comparison

	compare
			-- validate definition of specialised archetype against flat parent
		require
			Child_specialised: flat_child.is_specialised
		local
			def_it: C_ITERATOR
			a_c_iterator: OG_CONTENT_ITERATOR
			rollup_builder: C_ROLLUP_BUILDER
		do
--			-- first phase - mark all nodes as added by default
--			create def_it.make (flat_child.definition)
--			def_it.do_all (agent (a_c_node: ARCHETYPE_CONSTRAINT; depth: INTEGER) do a_c_node.set_specialisation_status_added end, agent (a_c_node: ARCHETYPE_CONSTRAINT; depth: INTEGER) do  end)

			-- now mark nodes as added / redefined based on their
			-- direct counterparts (if they exist) in the flat parent
			create def_it.make (flat_child.definition)
			def_it.do_until_surface (agent child_node_compare, agent child_node_test)

			-- phase 2 - roll up the changes
			create rollup_builder.make (flat_child)
			create a_c_iterator.make (flat_child.definition.representation, rollup_builder)
			a_c_iterator.do_all

			child_is_marked := True
			differential_child := Void
		ensure
			Child_marked: child_is_marked
			Diff_needs_regenerating: not attached differential_child
		end

	generate_diff
			-- create differential form of archetype based on flat_child
		require
			child_is_marked
		local
			c_it: C_ITERATOR
			inherited_subtree_list: HASH_TABLE [ARCHETYPE_CONSTRAINT, STRING]
			diff_child: DIFFERENTIAL_ARCHETYPE
		do
			create diff_child.make_from_flat (flat_child)
			differential_child := diff_child

			-- using rolled_up_specialisation statuses in nodes of definition
			-- generate a list of nodes/paths for deletion from flat-form archetype
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
				if attached {C_OBJECT} subtree_csr.item as cco_1 then
					-- FIXME: in the following statement, we are assuming that if the cardinality of the parent attribute
					-- does not exist (typical for a differential archetype), that it is ordered; really we should look up
					-- the RM schema
					if attached cco_1.parent and (cco_1.parent.cardinality = Void or cco_1.parent.is_ordered) then
						if attached {C_OBJECT} cco_1.parent.child_after (cco_1) as cco_next and then
							cco_next.specialisation_status = ss_added
						then
							cco_next.set_sibling_order_after (cco_1.node_id)
						end
						if attached {C_OBJECT} cco_1.parent.child_before (cco_1) as cco_prev and then
							cco_prev.specialisation_status = ss_added
						then
							cco_prev.set_sibling_order_before (cco_1.node_id)
						end
					end
				end
			end

			-- now remove inherited subtrees
			across inherited_subtree_list as subtree_csr loop
				if attached {C_OBJECT} subtree_csr.item as cco then
					if attached cco.parent then
						cco.parent.remove_child (cco)
					else
						-- cco must be the parent, which means the entire definition is a copy of that from the parent archetype
					end
				elseif attached {C_ATTRIBUTE} subtree_csr.item as c_attr then
					c_attr.parent.remove_attribute (c_attr)
				end
			end

			-- rebuild all internal references, path cache etc
			diff_child.rebuild
		ensure
			Diff_generated: attached differential_child
		end

	compress_differential_child
			-- perform path-compression on differential child archetype
		require
			Diff_available: attached differential_child
		do
			check attached differential_child as diff_child then
				diff_child.convert_to_differential_paths
			end
		end

feature {NONE} -- Implementation

	child_node_compare (a_c_node: ARCHETYPE_CONSTRAINT; depth: INTEGER)
			-- set specialisation status markers in `a_c_node' based on comparison with
			-- parent
		local
			ca_parent_flat: C_ATTRIBUTE
			co_parent_flat: C_OBJECT
			apa: ARCHETYPE_PATH_ANALYSER
			path_in_flat: STRING
		do
			if attached {C_ATTRIBUTE} a_c_node as ca_child then
				create apa.make_from_string (a_c_node.path)
				path_in_flat := apa.path_at_level (flat_parent.specialisation_depth)
				if flat_parent.definition.has_attribute_path (path_in_flat) then
					ca_parent_flat := flat_parent.definition.c_attribute_at_path (path_in_flat)
				else -- must be due to an internal ref; look in full attr_path_map
					ca_parent_flat := flat_parent.c_attr_at_path (path_in_flat)
				end

				-- if existence or cardinality have changed, it's a redefinition
				if not ca_child.c_equal (ca_parent_flat) then
					ca_child.set_specialisation_status_redefined
				else
					ca_child.set_specialisation_status_inherited
--					if attached ca_child.parent as co_par and then co_par.is_path_compressible then
--						ca_child.set_is_path_compressible
--					end
				end

			-- C_ARCHETYPE_ROOT - either a slot filler, or a direct external reference with no parent slot
			elseif attached {C_ARCHETYPE_ROOT} a_c_node as car_child then
				car_child.set_specialisation_status_redefined

			-- other kind of C_OBJECT
			elseif attached {C_OBJECT} a_c_node as co_child then
				create apa.make_from_string (a_c_node.path)
				path_in_flat := apa.path_at_level (flat_parent.specialisation_depth)
				co_parent_flat := flat_parent.c_object_at_path (apa.path_at_level (flat_parent.specialisation_depth))

				-- if occurrences different, or node_id different, or RM type different or else primitive object constraint different
				if not co_child.c_equal (co_parent_flat) then
					co_child.set_specialisation_status_redefined
--					if not co_child.node_id.is_equal (co_parent_flat.node_id) and (co_child.is_root or else (attached co_child.parent as ca_par and then ca_par.is_path_compressible)) then
--						co_child.set_is_path_compressible
--					end
				else
					co_child.set_specialisation_status_inherited
--					if co_child.is_root or else (attached co_child.parent as ca_par and then ca_par.is_path_compressible) then
--						co_child.set_is_path_compressible
--					end
				end
			end
		end

	child_node_test (a_c_node: ARCHETYPE_CONSTRAINT): BOOLEAN
		local
			apa: ARCHETYPE_PATH_ANALYSER
		do
			if attached {C_ARCHETYPE_ROOT} a_c_node as car_child then
				create apa.make_from_string (car_child.slot_path)
				Result := flat_parent.has_path (apa.path_at_level (flat_parent.specialisation_depth))

			elseif attached {C_OBJECT} a_c_node as co_child then
				if not co_child.is_addressable then
					create apa.make_from_string (a_c_node.path)
					Result := flat_parent.has_object_path (apa.path_at_level (flat_parent.specialisation_depth))
				elseif specialisation_depth_from_code (co_child.node_id) <= flat_parent.specialisation_depth -- node from previous level
					or else is_refined_code (co_child.node_id)  -- from current level, refined
				then
					create apa.make_from_string (a_c_node.path)
					Result := flat_parent.has_object_path (apa.path_at_level (flat_parent.specialisation_depth))
				else
					-- it's a new code at this level; don't do anything, this branch will be treated as 'added'
				end

			elseif attached {C_ATTRIBUTE} a_c_node as ca_child then
				create apa.make_from_string (a_c_node.path)
				Result := flat_parent.has_path (apa.path_at_level (flat_parent.specialisation_depth))
			end
		end

end


