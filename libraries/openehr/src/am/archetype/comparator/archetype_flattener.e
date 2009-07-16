note
	component:   "openEHR Archetype Project"
	description: "[
				 Generate a flat archetype from a source differential form archetype, and, if the latter is
				 specialised, its flat parent.
		         ]"
	keywords:    "archetype, comparison, constraint model"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.com>"
	copyright:   "Copyright (c) 2008 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL: http://www.openehr.org/svn/ref_impl_eiffel/TRUNK/libraries/openehr/src/am/archetype/comparator/archetype_flattener.e $"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate: 2008-05-17 15:32:35 +0100 (Sat, 17 May 2008) $"

class ARCHETYPE_FLATTENER

inherit
	ARCHETYPE_TERM_CODE_TOOLS
		export {NONE}
			all
		end

	SHARED_REFERENCE_MODEL_ACCESS

create
	make_specialised, make_non_specialised

feature -- Initialisation

	make_specialised (a_flat_archetype: FLAT_ARCHETYPE; a_src_archetype: DIFFERENTIAL_ARCHETYPE)
			-- create with flat archetype of parent and source (differential) archetype of
			-- archetype for which we wish to generate a flat archetype
		require
			Flat_archetype_attached: a_flat_archetype /= Void
			Src_archetype_attached: a_src_archetype /= Void
			Comparability: comparable_archetypes(a_flat_archetype, a_src_archetype)
		do
			arch_parent_flat := a_flat_archetype
			arch_child_diff := a_src_archetype
		end

	make_non_specialised (a_src_archetype: DIFFERENTIAL_ARCHETYPE)
			-- create with source (differential) archetype
		require
			Src_archetype_attached: a_src_archetype /= Void
		do
			arch_child_diff := a_src_archetype
		end

feature -- Access

	arch_parent_flat: FLAT_ARCHETYPE
			-- flat archetype of parent, if applicable

	arch_child_diff: DIFFERENTIAL_ARCHETYPE
			-- archetype for which flat form is being generated

	arch_output_flat: FLAT_ARCHETYPE
			-- generated flat archetype - logically an overlay of `arch_parent_flat' and `arch_child_diff'

feature -- Commands

	flatten
			-- flatten archetype to `arch_output_flat'; if non-specialised, then flatten against reference model
			-- (just pick up existence and cardinality); if specialised, flatten against a flat parent archetype
		require
			Rm_available: rm_checker.model_loaded
		local
			def_it: C_ITERATOR
		do
			if arch_child_diff.is_specialised then
				debug ("flatten")
					io.put_string ("============== flattening specialised archetype " + arch_child_diff.archetype_id.as_string + " with " +
							arch_parent_flat.archetype_id.as_string + " ==============%N")
				end
				create arch_output_flat.make_staging (arch_child_diff, arch_parent_flat)
				expand_definition_use_nodes
				flatten_definition
				flatten_invariants
				flatten_ontology
				arch_output_flat.set_parent_archetype_id (arch_parent_flat.archetype_id)
				arch_output_flat.set_is_valid (True)
			else
				create arch_output_flat.make_from_differential (arch_child_diff)
				create def_it.make(arch_output_flat.definition)
				def_it.do_all(agent rm_node_flatten_enter, agent rm_node_flatten_exit)
			end
		ensure
			arch_output_flat /= Void
		end

feature -- Comparison

	comparable_archetypes(a_flat_archetype: FLAT_ARCHETYPE; a_src_archetype: DIFFERENTIAL_ARCHETYPE): BOOLEAN
		require
			Valid_flat_archetype: a_flat_archetype /= Void
			Valid_src_archetype: a_src_archetype /= Void
		do
			if a_src_archetype.is_valid then
				if a_src_archetype.is_specialised then
					if a_flat_archetype.is_valid then
						Result := a_src_archetype.parent_archetype_id.as_string.is_equal (a_flat_archetype.archetype_id.as_string)
					end
				else
					Result := True
				end
			end
		end

feature {NONE} -- Implementation

	expand_definition_use_nodes
			-- if there are overrides in the specialised child that are located at use_node positions, we
			-- have to expand out a copy of the structures pointed to by the use_nodes in the parent, so that
			-- the override can be correctly applied.
		local
			int_refs: ARRAYED_LIST[ARCHETYPE_INTERNAL_REF]
			c_obj: C_OBJECT
			child_paths, child_paths_at_parent_level: ARRAYED_LIST [STRING]
			apa: ARCHETYPE_PATH_ANALYSER
			a_path: STRING
			clone_performed: BOOLEAN
		do
			if not arch_output_flat.use_node_index.is_empty then
				debug ("flatten")
					io.put_string ("--> expand_definition_use_nodes%N")
				end
				create child_paths_at_parent_level.make (0)
				child_paths_at_parent_level.compare_objects
				child_paths := arch_child_diff.physical_paths
				from child_paths.start until child_paths.off loop
					create apa.make_from_string (child_paths.item)
					if not apa.is_phantom_path_at_level (arch_parent_flat.specialisation_depth) then
						a_path := apa.path_at_level (arch_parent_flat.specialisation_depth)
						if not child_paths_at_parent_level.has (a_path) then
							child_paths_at_parent_level.extend (a_path)
						end
					end
					child_paths.forth
				end

				-- iterate through use nodes in parent and find any source paths that are matched by any paths
				-- within the child archetype (i.e. that the child archetype wants to override); clone the
				-- structure at the target location and replace the use_node in the flattened structure with it,
				-- so that the override will work properly.
				from arch_output_flat.use_node_index.start until arch_output_flat.use_node_index.off loop
					int_refs := arch_output_flat.use_node_index.item_for_iteration
					from int_refs.start until int_refs.off loop
						debug ("flatten")
							io.put_string ("%T...checking flat parent use_node path " + int_refs.item.path + " against child path map%N")
						end
						clone_performed := False
						from child_paths_at_parent_level.start until child_paths_at_parent_level.off or clone_performed loop
							if child_paths_at_parent_level.item.starts_with (int_refs.item.path) then
								debug ("flatten")
									io.put_string ("%T...cloning node at " + arch_output_flat.use_node_index.key_for_iteration + " and replacing at " +
											int_refs.item.path + "%N")
								end
								c_obj := arch_output_flat.c_object_at_path (arch_output_flat.use_node_index.key_for_iteration).safe_deep_twin
								int_refs.item.parent.replace_child_by_id (c_obj, int_refs.item.node_id)
								clone_performed := True
							end
							child_paths_at_parent_level.forth
						end
						int_refs.forth
					end
					arch_output_flat.use_node_index.forth
				end
				arch_output_flat.rebuild
				debug ("flatten")
					io.put_string ("<-- expand_definition_use_nodes%N")
				end
			end
		end

	flatten_definition
			-- build the flat archetype definition by traversing src_archetype and determining what
			-- nodes from flat_archetype to add; do the changes to the output archetype
		local
			def_it: C_ITERATOR
		do
			create parent_path_list.make(0)
			parent_path_list.compare_objects

			create child_grafted_path_list.make(0)
			child_grafted_path_list.compare_objects

			create def_it.make(arch_child_diff.definition)
			def_it.do_until_surface(agent node_graft, agent node_test)
			arch_output_flat.rebuild
		end

	flatten_invariants
			-- build the flat archetype invariants as the sum of parent and source invariants
		do
			if arch_parent_flat.has_invariants then
				from
					arch_parent_flat.invariants.start
				until
					arch_parent_flat.invariants.off
				loop
					arch_output_flat.add_invariant (arch_parent_flat.invariants.item.deep_twin)
					arch_parent_flat.invariants.forth
				end
			end
		end

	flatten_ontology
			-- build the flat archetype ontology as the sum of parent and source ontologies
		do
			arch_output_flat.ontology.merge(arch_parent_flat.ontology)
		end

	node_graft (a_c_node: ARCHETYPE_CONSTRAINT; depth: INTEGER)
			-- perform grafts of node from differential archetype on corresponding node in flat parent
			-- only interested in C_COMPLEX_OBJECTs
		local
			cco_output_flat, cco_output_flat_proximate, cco_csr: C_COMPLEX_OBJECT
			apa: ARCHETYPE_PATH_ANALYSER
			a_path: STRING
			c_path_in_diff: OG_PATH
			ca_child, ca_child_copy, ca_output: C_ATTRIBUTE
		do
			if attached {C_COMPLEX_OBJECT} a_c_node as cco_child_diff then
				create apa.make_from_string (cco_child_diff.path)
				a_path := apa.path_at_level (arch_parent_flat.specialisation_depth)
				debug ("flatten")
					io.put_string ("---------- at child differential object node " + cco_child_diff.path + " ---------%N")
					io.put_string ("%Tsee if output object node at " + a_path + " exists in flat parent ... ")
				end
				-- check that path exists in nodes defined by value in flat parent
				if arch_output_flat.has_path (a_path) then
					debug ("flatten")
						io.put_string ("YES%N")
					end

					if parent_path_list.has(a_path) then -- check for path that has been overlaid by a redefined node; have to graft in entire object as a sibling
						debug ("flatten")
							io.put_string ("%TObject in flat parent ALREADY REPLACED - grafting sibling object " + cco_child_diff.path + "%N")
						end
						ca_output := arch_output_flat.definition.c_attribute_at_path (cco_child_diff.parent.path)
						ca_output.put_sibling_child (cco_child_diff.safe_deep_twin)
						child_grafted_path_list.extend (cco_child_diff.path)
					else
						cco_output_flat ?= arch_output_flat.c_object_at_path (a_path)
						debug ("flatten")
							io.put_string ("%TFirst replacement in flat parent " + cco_child_diff.path + "%N")
						end

						-- if output_flat node has matches any, then just do a complete clone of the current child tree
						if cco_output_flat.any_allowed and cco_output_flat.is_addressable then
							debug ("flatten")
								io.put_string ("%T** parent matches ANY - doing complete clone of child **%N")
							end
							cco_output_flat.parent.replace_node_id (cco_output_flat.node_id, cco_child_diff.node_id)
							cco_output_flat.parent.replace_child_by_id (cco_child_diff.safe_deep_twin, cco_child_diff.node_id)
							child_grafted_path_list.extend (cco_child_diff.path)
						else
							-- firstly, add overrides from immediate child node to corresponding flat node
							debug ("flatten")
								io.put_string ("%Toverlay immediate node " + cco_child_diff.node_id + " on flat parent " + cco_output_flat.node_id + "%N")
							end
							if cco_output_flat.parent /= Void then
								cco_output_flat.parent.overlay_differential(cco_output_flat, cco_child_diff)
							else
								cco_output_flat.overlay_differential(cco_child_diff)
							end

							-- iterate through child attributes and overlay a) new nodes in existing container attributes, and b) new attributes from child
							debug ("flatten")
								io.put_string ("%T%T~~~~~~~~ iterating cco_child_diff attributes ~~~~~~~~~%N")
							end
							from cco_child_diff.attributes.start until cco_child_diff.attributes.off loop
								ca_child := cco_child_diff.attributes.item
								debug ("flatten")
									io.put_string ("%T%T~~~~ attribute = " + ca_child.rm_attribute_name + "%N")
								end

								-- now we have to figure out the 'proximate' C_COMPLEX_OBJECT in the flat parent - it is either the cco_output_flat that
								-- corresponds to the parent object from the differential child with we started this routine, or if the current attribute
								-- has a differential path, its true object parent in the flat parent archetype is given by the differential path
								if ca_child.has_differential_path then
									create apa.make_from_string (ca_child.differential_path)
									cco_output_flat_proximate ?= arch_output_flat.c_object_at_path (apa.path_at_level (arch_parent_flat.specialisation_depth))
									debug ("flatten")
										io.put_string ("%T%Tchild has differential path " + ca_child.differential_path + "; flat proximate path = " +
												cco_output_flat_proximate.path + "%N")
									end

									-- there may be object ids on the path from the original parent attribute to the proximate attribute in the flat parent
									-- that are overridden by object-ids in the differential path
									create c_path_in_diff.make_from_string (ca_child.differential_path)
									c_path_in_diff.finish
									from cco_csr := cco_output_flat_proximate until cco_csr = cco_output_flat loop
										if c_path_in_diff.item.is_addressable and then c_path_in_diff.item.object_id.count > cco_csr.node_id.count and then
												c_path_in_diff.item.object_id.starts_with (cco_csr.node_id) then
											debug ("flatten")
												io.put_string ("%T%T%Treplacing node id " + cco_csr.node_id + " in flat structure with " + c_path_in_diff.item.object_id + "%N")
											end
											cco_csr.parent.replace_node_id (cco_csr.node_id, c_path_in_diff.item.object_id)
										end
										cco_csr := cco_csr.parent.parent
										c_path_in_diff.back
									end
								else
									cco_output_flat_proximate := cco_output_flat
									debug ("flatten")
										io.put_string ("%T%Tchild has normal path; using flat path " + cco_output_flat_proximate.path + "%N")
									end
								end

								-- for attributes that are found in the flat parent tree, we need to check which of their children
								-- if any need to be cloned into the output
								if cco_output_flat_proximate.has_attribute (ca_child.rm_attribute_name) then
									debug ("flatten")
										io.put_string ("%T%Tmatched attr " + ca_child.rm_attribute_name + " in parent object in flat archetype%N")
									end

									ca_output := cco_output_flat_proximate.c_attribute (ca_child.rm_attribute_name)

									-- graft the existence if that has been changed
									if ca_child.existence /= Void and then not ca_child.existence.equal_interval (ca_output.existence) then
										ca_output.set_existence (ca_child.existence.deep_twin)
									end
									if ca_child.is_multiple then
										-- for container attributes in the source archetype, we graft in new elements; overrides will be
										-- handled by being traversed by this routine later
										-- graft the cardinality if that has been changed
										if ca_child.cardinality /= Void and then not ca_child.cardinality.interval.equal_interval (ca_output.cardinality.interval) then
											ca_output.set_cardinality (ca_child.cardinality.deep_twin)
										end
										debug ("flatten")
											io.put_string ("%T%T%Tmerge container attribute at " + ca_child.path + " into output%N")
										end
										merge_container_attribute(ca_output, ca_child)
									else -- for single-valued attributes, have to merge any non-CCO children
										debug ("flatten")
											io.put_string ("%T%T%Tmerge single attribute at " + ca_child.path + " into output%N")
										end
										merge_single_attribute(ca_output, ca_child)
									end
								else  -- otherwise just do a deep clone of the whole attribute from the child to the output
									ca_child_copy := ca_child.safe_deep_twin
									child_grafted_path_list.extend (ca_child.path)
									ca_child_copy.clear_differential_path
									debug ("flatten")
										io.put_string ("%T%Tin child only; deep_clone attribute " + ca_child.rm_attribute_name + " at " + ca_child.path +
											" from diff child and graft to " + cco_output_flat_proximate.path + " in output%N")
									end
									cco_output_flat_proximate.put_attribute (ca_child_copy)
								end
								cco_child_diff.attributes.forth
							end
							debug ("flatten")
								io.put_string ("%T%T~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~%N")
							end

							-- record path in case sibling objects turn up
						end
						parent_path_list.extend (a_path)
					end
				else
					debug ("flatten")
						io.put_string ("NO - ERROR%N")
					end
				end
			end
		end

	merge_container_attribute(ca_output, ca_child: C_ATTRIBUTE)
			-- merge new objects in container attribute `a_src_attr' into `an_output_attr', using ordering
			-- information in source attribute objects, and replacing or inserting as appropriate
		local
			insert_obj, c_obj: C_OBJECT
			i: INTEGER
			after_pending: BOOLEAN
			start_pos, end_pos: INTEGER
		do
			create merge_list.make (0)
			from
				ca_child.children.start
				start_pos := 1
				insert_obj := ca_output.children.first
			until
				ca_child.children.off
			loop
				-- find the next ordering marker, or end of list
				from until ca_child.children.off or ca_child.children.item.sibling_order /= Void loop
					ca_child.children.forth
				end

				if not ca_child.children.off then
					if after_pending then
						-- grab the series from start_pos to here -1 and make a desc for it
						end_pos := ca_child.children.index - 1
						add_merge_desc (start_pos, end_pos, insert_obj, False)
						after_pending := False
						start_pos := end_pos + 1
					end

					if ca_child.children.item.sibling_order.is_before then
						end_pos := ca_child.children.index
						insert_obj := ca_output.child_with_id (ca_child.children.item.sibling_order.sibling_node_id)
						add_merge_desc (start_pos, end_pos, insert_obj, True)
						start_pos := end_pos + 1
					else -- marker is 'after' - obtain any preceding series and make a descriptor for that
						if not ca_child.children.isfirst and ca_child.children.index > start_pos then -- create a descriptor for the preceding section
							add_merge_desc (start_pos, ca_child.children.index - 1, insert_obj, True)
						end
						-- now take care of series starting with current 'after' marker
						start_pos := ca_child.children.index
						insert_obj := ca_output.child_with_id (ca_child.children.item.sibling_order.sibling_node_id)
						after_pending := True
					end
					ca_child.children.forth
				else
					insert_obj := ca_output.children.last
					add_merge_desc (start_pos, ca_child.children.count, insert_obj, False)
					after_pending := False
				end
			end
			if after_pending then -- grab the series from start_pos to here -1 and make a desc for it
				add_merge_desc (start_pos, ca_child.children.count, insert_obj, False)
			end

			-- now use the merge descriptors to clone objects of the (differential) source list onto the target (flat) output list,
			-- ignoring any redefined nodes - only handle new ones
			from merge_list.start until merge_list.off loop
				insert_obj ?= merge_list.item.reference_item (3)
				from i := merge_list.item.integer_item (1) until i > merge_list.item.integer_item (2) loop
					if is_valid_code (ca_child.children.i_th (i).node_id) and
						specialisation_status_from_code (ca_child.children.i_th (i).node_id, arch_child_diff.specialisation_depth).value = ss_added then

						child_grafted_path_list.extend (ca_child.children.i_th (i).path)
						c_obj := ca_child.children.i_th (i).safe_deep_twin
						c_obj.clear_sibling_order
						if merge_list.item.boolean_item (4) then -- True = insert before
							ca_output.put_child_left(c_obj, insert_obj)
						else
							ca_output.put_child_right(c_obj, insert_obj)
							insert_obj := ca_output.child_after (insert_obj)
						end
					end
					i := i + 1
				end
				merge_list.forth
			end
		end

	merge_single_attribute(ca_output, ca_child: C_ATTRIBUTE)
			-- merge objects from a single-valued attribute (multiple objects if alternatives defined) which are either new
			-- in the specialised attribute, or are non C_COMPLEX_OBJECTs (if they are the latter, they will get traversed
			-- normally by node_graft())
		local
			rm_ancestors: ARRAYED_LIST [STRING]
		do
			from ca_child.children.start until ca_child.children.off loop
				if not attached {C_COMPLEX_OBJECT} ca_child.children.item as cco then
					if ca_child.children.item.is_addressable then -- if identified, find corresponding node in parent & replace completely
						ca_output.replace_child_by_id (ca_child.children.item.safe_deep_twin,
							specialisation_parent_from_code_at_level (ca_child.children.item.node_id, arch_parent_flat.specialisation_depth))
					elseif ca_output.has_child_with_rm_type_name(ca_child.children.item.rm_type_name) then -- find a node of same type, then replace completely
						ca_output.replace_child_by_rm_type_name (ca_child.children.item.safe_deep_twin)
					else -- or a RM parent type, then add
						rm_ancestors := rm_checker.ancestor_classes_of(ca_child.children.item.rm_type_name)
						from rm_ancestors.start until rm_ancestors.off or ca_output.has_child_with_rm_type_name(rm_ancestors.item) loop
							rm_ancestors.forth
						end
						if not rm_ancestors.off then
							ca_output.put_child (ca_child.children.item.safe_deep_twin)
						end
					end
					child_grafted_path_list.extend (ca_child.children.item.path)
				end
				ca_child.children.forth
			end
		end

	merge_list: ARRAYED_LIST [TUPLE [INTEGER, INTEGER, C_OBJECT, BOOLEAN]]
			-- merge descriptor list of TUPLEs of the following structure:
			--		start pos in source list: INTEGER
			--		end pos in source list: INTEGER
			-- 		insert obj in target list: C_OBJECT (can't be an index, because insertions will make the list change)
			-- 		operation: BOOLEAN; True = prepend before, False = append after

	add_merge_desc (src_start_pos, src_end_pos: INTEGER; tgt_insert_obj: C_OBJECT; before_flag: BOOLEAN)
			-- create a merge tuple for use in later merging
		require
			tgt_insert_obj /= Void
		local
			merge_desc: TUPLE [INTEGER, INTEGER, C_OBJECT, BOOLEAN]
		do
			create merge_desc
			merge_desc.put_integer (src_start_pos, 1) -- start position in source list
			merge_desc.put_integer (src_end_pos, 2) -- end position in source list
			merge_desc.put_reference (tgt_insert_obj, 3)
			merge_desc.put_boolean (before_flag, 4)
			merge_list.extend (merge_desc)
			debug ("flatten")
				io.put_string ("%T%T%T=== added MERGE DESC " + src_start_pos.out + ", " + src_end_pos.out + ", " + tgt_insert_obj.node_id + ", " + before_flag.out + "%N")
			end
		end

	node_test (a_c_node: ARCHETYPE_CONSTRAINT): BOOLEAN
			-- return True if a conformant path of a_c_node within the differential archetype is
			-- found within the flat parent archetype - i.e. a_c_node is inherited or redefined from parent (but not new)
			-- but not if the node is already in the child_grafted_path_list
		local
			apa: ARCHETYPE_PATH_ANALYSER
			np: STRING
			found_child: BOOLEAN
		do
			np := a_c_node.path
			create apa.make_from_string(np)
			if not apa.is_phantom_path_at_level (arch_parent_flat.specialisation_depth) then
				from child_grafted_path_list.start until found_child or child_grafted_path_list.off loop
					if np.starts_with(child_grafted_path_list.item) then
						found_child := True
						debug ("flatten")
							io.put_string ("%T%Tchild path " + np + " found in child_grafted_path_list - not descending%N")
						end
					end
					child_grafted_path_list.forth
				end
				Result := not found_child and arch_parent_flat.has_path (apa.path_at_level (arch_parent_flat.specialisation_depth))
			end
		end

	parent_path_list: ARRAYED_LIST [STRING]
			-- list of paths matched in parent archetype by child archetype nodes. Used to remember paths that
			-- disappear due to being overwritten by a specialised node (e.g. at0013 becomes at0013.1 in the flat output)
			-- but then specialised siblings (e.g. at0013.2, at0013.3) turn up and need to be grafted in.

	child_grafted_path_list: ARRAYED_LIST [STRING]
			-- list of root paths of child sub-trees in the child that have been completely grafted from child to parent
			-- don't descend into paths lower than any path in this list

	rm_node_flatten_enter (a_c_node: ARCHETYPE_CONSTRAINT; depth: INTEGER)
			-- copy existence, cardinality and occurrences from reference model to node if it doesn't have them set
		local
			arch_attr_type, attr_parent_path: STRING
			prop_def: BMM_PROPERTY_DEFINITION
		do
			if attached {C_ATTRIBUTE} a_c_node as ca then
				if ca.existence = Void or ca.cardinality = Void then
					arch_attr_type := ca.parent.rm_type_name -- can be a generic type like DV_INTERVAL <DV_QUANTITY>
					attr_parent_path := ca.parent.path
					prop_def := rm_checker.property_definition(arch_attr_type, ca.rm_attribute_name)
				end
				if ca.existence = Void then
					ca.set_existence(prop_def.existence.deep_twin)
				end
				if ca.is_multiple and ca.cardinality = Void then
					if attached {BMM_CONTAINER_PROPERTY} prop_def as cont_prop then
						ca.set_cardinality (create {CARDINALITY}.make(cont_prop.type.cardinality))
					end
				end
			elseif attached {C_OBJECT} a_c_node as co then
				-- here the logic is a bit trickier: there is no such thing as 'occurrences' in the reference model
				-- so it is set from the enclosing attribute cardinality if a container, or existence if not.
				if co.occurrences = Void then
					if co.is_root then -- assume 0..1
						co.set_occurrences (create {MULTIPLICITY_INTERVAL}.make_bounded(0,1))
					else
						prop_def := rm_checker.property_definition(co.parent.parent.rm_type_name, co.parent.rm_attribute_name)
						if attached {BMM_CONTAINER_PROPERTY} prop_def as cont_prop then
							co.set_occurrences (cont_prop.type.cardinality)
						else
							co.set_occurrences (prop_def.existence)
						end
					end
				end
			end
		end

	rm_node_flatten_exit (a_c_node: ARCHETYPE_CONSTRAINT; depth: INTEGER)
		do
		end

invariant
	Source_archetype_exists: arch_child_diff /= Void

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
--| The Original Code is archetype_flattener.e.
--|
--| The Initial Developer of the Original Code is Thomas Beale.
--| Portions created by the Initial Developer are Copyright (C) 2008
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
