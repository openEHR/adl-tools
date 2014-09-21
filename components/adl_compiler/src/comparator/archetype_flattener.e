note
	component:   "openEHR ADL Tools"
	description: "[
				 Generate a flat archetype from a source differential form archetype, and, if the latter is
				 specialised, its flat parent.
		         ]"
	keywords:    "archetype, comparison, constraint model"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2008- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class ARCHETYPE_FLATTENER

inherit
	SHARED_ARCHETYPE_LIBRARIES
		export
			{NONE} all;
			{ANY} deep_copy, deep_twin, is_deep_equal, standard_is_equal
		end

	ADL_15_TERM_CODE_TOOLS
		export {NONE}
			all
		end

	INTERNAL
		export
			{NONE} all
		end

	EXCEPTIONS
		rename
			class_name as exception_class_name
		export
			{NONE} all
		end

create
	make

feature -- Definitions

	Max_template_overlay_depth: INTEGER = 8
			-- max depth to go in template overlayinng process, in order to control effect of
			-- recursive use_archetype references

feature -- Initialisation

	make (a_child_desc: ARCH_LIB_ARCHETYPE; an_rm_schema: BMM_SCHEMA)
			-- create with source (differential) archetype of archetype for which we wish to generate a flat archetype
		require
			Child_desc_valid: a_child_desc.is_valid
		do
			rm_schema := an_rm_schema
			child_desc := a_child_desc
			if a_child_desc.is_specialised then
				flat_parent_desc := child_desc.specialisation_ancestor
			else
				flat_parent_desc := Void
			end
			arch_output_flat := Void
		ensure
			Parent_set: a_child_desc.is_specialised implies attached flat_parent_desc
			Child_desc_set: child_desc = a_child_desc
			Flat_output_reset: not attached arch_output_flat
		end

feature -- Access

	flat_parent_desc: detachable ARCH_LIB_ARCHETYPE

	child_desc: ARCH_LIB_ARCHETYPE

	arch_parent_flat: FLAT_ARCHETYPE
			-- flat archetype of parent, if applicable
		require
			child_desc.is_specialised
		do
			Result := flat_parent_desc.flat_archetype
		end

	arch_child_diff: DIFFERENTIAL_ARCHETYPE
			-- archetype for which flat form is being generated
		do
			check attached child_desc.differential_archetype as da then
				Result := da
			end
		end

	arch_output_flat: detachable FLAT_ARCHETYPE
			-- generated flat archetype - logically an overlay of `arch_parent_flat' and `arch_child_diff'
			-- if the `arch_child_diff' is a template, the dynamic type will be OPERATIONAL_TEMPLATE

feature -- Commands

	flatten (include_rm: BOOLEAN)
			-- flatten archetype to `arch_output_flat'; if non-specialised and `include_rm' is True,
			-- then flatten against reference model (to pick up existence and cardinality, and infer occurrences);
			-- if specialised, flatten against a flat parent archetype
		local
			def_it: C_ITERATOR
		do
			if arch_child_diff.is_specialised then
debug ("flatten")
	io.put_string ("============== flattening specialised archetype " +
		arch_child_diff.archetype_id.as_string + " with " +
		arch_parent_flat.archetype_id.as_string + " ==============%N")
end
				if arch_child_diff.is_template then
					create {OPERATIONAL_TEMPLATE} arch_output_flat.make_specialised (arch_child_diff, arch_parent_flat)
				else
					create arch_output_flat.make_specialised (arch_child_diff, arch_parent_flat)
				end
				expand_c_proxy_objects
				flatten_other_metadata
				flatten_definition
				flatten_rules
				flatten_terminology
				flatten_annotations
				arch_output_flat.set_parent_archetype_id (arch_parent_flat.archetype_id.interface_id)
				arch_output_flat.rebuild
			else
				create arch_output_flat.make_non_specialised (arch_child_diff)
			end

			-- flatten RM onto archetype; must do this at the end, since otherwise the existence etc set due to
			-- this would look like duplicates during the flattening process
			if rm_flattening_on and include_rm then
				create def_it.make (arch_output_flat.definition)
				def_it.do_all (agent rm_node_flatten_enter, agent rm_node_flatten_exit)
			end

			-- now finalise template flattening
			if arch_child_diff.is_template then
				check attached arch_output_flat as att_flat then
					template_overlay_supplier_definitions (att_flat, 0)
				end
				template_overlay_supplier_terminologies
				arch_output_flat.rebuild
			end

		ensure
			attached arch_output_flat
		end

feature {NONE} -- Implementation

	rm_schema: BMM_SCHEMA
			-- utility reference to RM schema used for validation & flattening

	expand_c_proxy_objects
			-- if there are overrides in the specialised child that are located at use_node positions, we
			-- have to expand out a copy of the structures pointed to by the use_nodes in the parent, so that
			-- the override can be correctly applied.
		local
			c_obj: C_OBJECT
			child_paths_at_parent_level: ARRAYED_LIST [STRING]
			apa: ARCHETYPE_PATH_ANALYSER
			override_path_in_flat: STRING
			clone_performed: BOOLEAN
			flat_use_node_paths: HASH_TABLE [ARRAYED_LIST [C_COMPLEX_OBJECT_PROXY], STRING]
		do
			flat_use_node_paths := arch_output_flat.use_node_index
			if not flat_use_node_paths.is_empty then
debug ("flatten")
	io.put_string ("--> expand_c_proxy_objects%N")
end
				create child_paths_at_parent_level.make (0)
				child_paths_at_parent_level.compare_objects
				across arch_child_diff.all_paths as child_paths_csr loop
					create apa.make_from_string (child_paths_csr.item)
					if not apa.is_phantom_path_at_level (arch_parent_flat.specialisation_depth) then
						override_path_in_flat := apa.path_at_level (arch_parent_flat.specialisation_depth)
						if not child_paths_at_parent_level.has (override_path_in_flat) then
							child_paths_at_parent_level.extend (override_path_in_flat)
						end
					end
				end

				-- iterate through use nodes in parent and find any source paths that are matched by any paths
				-- within the child archetype (i.e. that the child archetype wants to override); clone the
				-- structure at the target location and replace the use_node in the flattened structure with it,
				-- so that the override will work properly.
				across flat_use_node_paths as flat_use_node_path_csr loop
					across flat_use_node_path_csr.item as flat_use_nodes_for_path_csr loop
debug ("flatten")
	io.put_string ("%T...checking flat parent use_node path " +
	flat_use_nodes_for_path_csr.item.path + " against child path map%N")
end
						clone_performed := False
						from child_paths_at_parent_level.start until child_paths_at_parent_level.off or clone_performed loop
							if child_paths_at_parent_level.item.starts_with (flat_use_nodes_for_path_csr.item.path) then
debug ("flatten")
	io.put_string ("%T...cloning node at " +
	flat_use_node_path_csr.key + " and replacing at " +
	flat_use_nodes_for_path_csr.item.path + "%N")
end
								c_obj := arch_output_flat.object_at_path (flat_use_node_path_csr.key).safe_deep_twin

								-- override target object's node_id in copy if it's a sibling target
								if flat_use_nodes_for_path_csr.item.has_sibling_target then
									c_obj.set_node_id (flat_use_nodes_for_path_csr.item.node_id)
								end

								-- override occurrences of the ref target object with object proxy occs, if set
								if attached flat_use_nodes_for_path_csr.item.occurrences as att_occ then
									c_obj.set_occurrences (att_occ.deep_twin)
								end
								flat_use_nodes_for_path_csr.item.parent.replace_child_by_id (c_obj, flat_use_nodes_for_path_csr.item.node_id)
								clone_performed := True
							end
							child_paths_at_parent_level.forth
						end
					end
				end
				arch_output_flat.rebuild
debug ("flatten")
	io.put_string ("<-- expand_c_proxy_objects%N")
end
			end
		end

	flatten_other_metadata
			-- flatten other_metadata so that child archetype values overwrite any parent values with same key;
			-- otherwise parent key/val pairs are preserved
		do
			if attached arch_child_diff.other_metadata as child_omd then
				across child_omd as child_omd_csr loop
					arch_output_flat.add_other_metadata_value (child_omd_csr.key, child_omd_csr.item)
				end
			end
		end

	flatten_definition
			-- build the flat archetype definition by traversing src_archetype and determining what
			-- nodes from flat_archetype to add; do the changes to the output archetype
		require
			arch_child_diff.is_specialised
		local
			def_it: C_ITERATOR
		do
			grafted_child_locations.wipe_out

			-- traverse flat output and mark every node as inherited
			arch_output_flat.definition.set_subtree_specialisation_status (ss_inherited)

			create def_it.make (arch_child_diff.definition)
			def_it.do_until_surface (agent node_graft, agent node_test)
		end

	node_graft (a_c_node: ARCHETYPE_CONSTRAINT; depth: INTEGER)
			-- perform grafts of node from differential archetype on corresponding node in flat parent
			-- only interested in C_COMPLEX_OBJECTs; we deal with all the other node types by iterating the
			-- children of C_COMPLEX_OBJECTs
		local
			cco_parent_flat, cco_output_flat, cco_output_flat_proximate, cco_csr: C_COMPLEX_OBJECT
			apa: ARCHETYPE_PATH_ANALYSER
			ca_parent_path_in_output_flat: STRING
			cco_overlay_path: detachable STRING
			c_path_in_diff, og_cco_overlay_path_in_output_flat: OG_PATH
			ca_child, ca_child_copy, ca_output, cco_csr_parent: C_ATTRIBUTE
			new_attr_tuple: C_ATTRIBUTE_TUPLE
			co_copy: C_OBJECT
			parent_node_closed, max_occurrences_is_one: BOOLEAN
			overlay_node_id_in_flat: STRING
		do
			if attached {C_COMPLEX_OBJECT} a_c_node as cco_child_diff and not attached {C_ARCHETYPE_ROOT} a_c_node then
debug ("flatten")
	io.put_string ("---------- at child differential object node " + cco_child_diff.path + " ---------%N")
end

				-- First we have to figure out parent path of graft location in output flat, i.e. path of parent attribute
				-- It could be the flat form of the child path, if no overlay has been done already, but it also may match
				-- the child path other than the terminal node, i.e. the one we are on here, due to node redefinitions
				-- already performed that overwrote the node ids higher up in the path with ids of the level of the
				-- differential archetype
				if attached cco_child_diff.parent as ca_parent_in_child then
					create apa.make_from_string (ca_parent_in_child.path)
					ca_parent_path_in_output_flat := apa.path_at_level (arch_parent_flat.specialisation_depth)
					if arch_output_flat.has_path (ca_parent_path_in_output_flat) then
debug ("flatten")
	io.put_string ("%TDirect hit on path " +
	ca_parent_path_in_output_flat + "%N")
end
					else
						if arch_output_flat.has_path (ca_parent_in_child.path) then
debug ("flatten")
	io.put_string ("%TFound already overlaid path in output at " +
	ca_parent_in_child.path + "%N")
end
							ca_parent_path_in_output_flat := ca_parent_in_child.path
						else
debug ("flatten")
	io.put_string ("NO - ERROR%N")
end
							raise ("node_graft loction #1 - can't find overlay location for object at " + ca_parent_in_child.path + " %N")
						end
					end
					check attached ca_parent_path_in_output_flat end
					create og_cco_overlay_path_in_output_flat.make_from_string (ca_parent_path_in_output_flat)
					if is_refined_code (cco_child_diff.node_id) then
						overlay_node_id_in_flat := specialised_code_parent (cco_child_diff.node_id)
					else
						overlay_node_id_in_flat := cco_child_diff.node_id
					end
					og_cco_overlay_path_in_output_flat.last.set_object_id (overlay_node_id_in_flat)

					-- now we have a notional overlay path to the object in the output flat
					cco_overlay_path := og_cco_overlay_path_in_output_flat.as_string

					-- if node_id is redefined at this level - e.g. id4.0.1, then it is potentially a multiple override. We
					-- figure out if the parent node (e.g. id4) is:
					--	* 'closed': occurrences matches {0}, OR
					--	* max occurrences = 1:
					-- If closed or max occurrences = 1, and this is the first override node for that parent, we override the
					-- current (only) clone of the parent node (e.g. id4) in the flat, else, we clone that node first from the
					-- parent flat into the output flat, and then overlay from the diff.
					-- This has the effect of leaving the parent node intact in the flat, for further overriding lower down.
					parent_node_closed := ca_parent_in_child.has_child_with_id (overlay_node_id_in_flat) and then ca_parent_in_child.child_with_id (overlay_node_id_in_flat).is_prohibited
					create apa.make_from_string (cco_overlay_path)
					check attached {C_COMPLEX_OBJECT} arch_parent_flat.object_at_path (apa.path_at_level (arch_parent_flat.specialisation_depth)) as co_in_flat then
						cco_parent_flat := co_in_flat
					end
					max_occurrences_is_one := cco_parent_flat.is_occurrences_upper_one or (ca_parent_in_child.aggregate_occurrences_upper_is_one (overlay_node_id_in_flat))
					if arch_output_flat.has_object_path (cco_overlay_path) and
						(cco_child_diff.node_id.is_equal (overlay_node_id_in_flat) or parent_node_closed or max_occurrences_is_one)
					then
						check attached {C_COMPLEX_OBJECT} arch_output_flat.object_at_path (cco_overlay_path) as co then
							cco_output_flat := co
						end
					else
debug ("flatten")
	io.put_string ("%TObject in flat parent ALREADY REPLACED - cloning original and overlaying sibling object " + cco_child_diff.path + "%N")
end
						create apa.make_from_string (cco_child_diff.path)
						cco_output_flat := cco_parent_flat.safe_deep_twin
						cco_output_flat.set_node_id (cco_child_diff.node_id)
						cco_output_flat.set_subtree_specialisation_status (ss_inherited)
						cco_output_flat.set_specialisation_status_redefined
						ca_output := arch_output_flat.attribute_at_path (ca_parent_path_in_output_flat)
						ca_output.put_sibling_child (cco_output_flat, True)
					end
				else
					cco_output_flat := arch_output_flat.definition
				end

debug ("flatten")
	io.put_string ("YES%N")
end

				-- if it is a node on which occurrences was set to 0, remove it from the flat.
				if cco_child_diff.is_prohibited then
debug ("flatten")
	io.put_string ("%T** child occurrences is {0} - REMOVING parent node [" +
		cco_output_flat.node_id + "]**%N")
end
					if not cco_output_flat.is_root then
						cco_output_flat.parent.remove_child_by_id (cco_output_flat.node_id)
					end

				-- otherwise is it a normal override
				else
debug ("flatten")
	io.put_string ("%TOVERLAY immediate node " +
		cco_child_diff.node_id + " on flat parent " +
		cco_output_flat.node_id + "%N")
end
					-- firstly, add node-local overrides from immediate node to corresponding flat node
					-- this if statement needed because the first branch is what we have to do in order to
					-- ensure the parent C_ATTR child link to the object is maintained properly. The else
					-- branch only for the root node, which has no parent...
					if attached cco_output_flat.parent as att_ca then
						att_ca.overlay_differential (cco_output_flat, cco_child_diff, agent rm_schema.type_conforms_to)
					else
						cco_output_flat.overlay_differential (cco_child_diff, agent rm_schema.type_conforms_to)
					end

					-- Deal with the case of the output object matches 'any' specifically here
					-- (it could be also done below, if the merge algorithms were updated to handle empty
					-- target C_ATTRIBUTEs). If output_flat node matches any, and it is addressable (which
					-- means the differential child node must also be, and must therefore be intended as
					-- an override; if it wasn't, it will be treated as an alternative) then replace it
					-- with a complete clone of the child attributes of the current C_OBJECT in the
					-- differential
					if cco_output_flat.any_allowed then
debug ("flatten")
	io.put_string ("%T** parent matches ANY - REPLACING node [" +
		cco_output_flat.node_id +
		"] with complete clone of child node [" +
		cco_child_diff.node_id + "]**%N")
end
						-- take care of the children of the object node in the differential
						across cco_child_diff.attributes as child_attrs_csr loop
							ca_child := child_attrs_csr.item
debug ("flatten")
	io.put_string ("%T%T~~~~ attribute = " + ca_child.rm_attribute_path + "%N")
end
							ca_child_copy := ca_child.safe_deep_twin
							ca_child_copy.set_subtree_specialisation_status (ss_added)
debug ("flatten")
	io.put_string ("%T%Tin child only; deep_clone attribute " +
		ca_child.rm_attribute_name + " at " + ca_child.path +
		" from diff child and graft to " + cco_output_flat.path +
		" in output%N")
end
							cco_output_flat.put_attribute (ca_child_copy)
						end

						grafted_child_locations.extend (cco_child_diff.path)

					else
debug ("flatten")
	io.put_string ("%T%T~~~~~~~~ iterating cco_child_diff attributes ~~~~~~~~~%N")
end
						-- iterate through child attributes and overlay a) new object nodes in existing container
						-- attributes, and b) new attribute nodes from child. Note that these attributes are in
						-- general specified by paths, so they can overlay arbitrarily deep points in the flat
						-- output structure.
						across cco_child_diff.attributes as child_attrs_csr loop
							ca_child := child_attrs_csr.item
debug ("flatten")
	io.put_string ("%T%T~~~~ attribute = " + ca_child.rm_attribute_path + "%N")
end

							-- first we have to figure out the 'proximate' C_COMPLEX_OBJECT in the flat parent
							-- - it is either the cco_output_flat that corresponds to the parent object from
							-- the differential child with we started this routine, or if the current attribute
							-- has a differential path, its true object parent in the flat parent archetype
							-- is given by the differential path
							if attached ca_child.differential_path as child_diff_path then
								create apa.make_from_string (child_diff_path)
								check attached {C_COMPLEX_OBJECT} arch_output_flat.object_at_path (apa.path_at_level (arch_parent_flat.specialisation_depth)) as cco then
									cco_output_flat_proximate := cco
debug ("flatten")
	io.put_string ("%T%Tchild has differential path " +
		child_diff_path + "; flat proximate path = " +
		cco_output_flat_proximate.path + "%N")
end
								end

								-- there may be object ids on the path from the original parent attribute to
								-- the proximate attribute in the flat parent that are overridden by object-ids
								-- in the differential path; for these we need to replace the node ids of the
								-- relevant nodes in the flat output
								create c_path_in_diff.make_from_string (child_diff_path)
								c_path_in_diff.finish
								from cco_csr := cco_output_flat_proximate until cco_csr = cco_output_flat loop
									check attached cco_csr.parent as p then
										cco_csr_parent := p
									end
									if c_path_in_diff.item.object_id.count > cco_csr.node_id.count and then
										c_path_in_diff.item.object_id.starts_with (cco_csr.node_id)
									then
debug ("flatten")
	io.put_string ("%T%T%Treplacing node id " + cco_csr.node_id +
		" in flat structure with " + c_path_in_diff.item.object_id + "%N")
end
										cco_csr_parent.replace_node_id (cco_csr.node_id, c_path_in_diff.item.object_id)
										cco_csr.set_specialisation_status_redefined
									end
									check attached cco_csr_parent.parent as p then
										cco_csr := p
									end
									c_path_in_diff.back
								end
							else
								cco_output_flat_proximate := cco_output_flat
debug ("flatten")
	io.put_string ("%T%Tchild has normal path; using flat path " +
	cco_output_flat_proximate.path + "%N")
end
							end

							-- for attributes that are found in the flat parent tree, we need to check which of their children
							-- if any need to be cloned into the output
							if cco_output_flat_proximate.has_attribute (ca_child.rm_attribute_name) then
debug ("flatten")
	io.put_string ("%T%Tmatched attr " +
	ca_child.rm_attribute_name +
	" in parent object in flat archetype%N")
end
								ca_output := cco_output_flat_proximate.attribute_with_name (ca_child.rm_attribute_name)
								if ca_child.is_prohibited then -- existence = {0}; remove the attribute completely
									-- mark - for correct data validation we need the attribute marked as prohibited
									-- otherwise it appears that the attribute is allowed
									ca_output.set_prohibited
									ca_output.remove_all_children
								else
									-- graft the attribute existence if that has been changed
									if attached ca_child.existence then
										ca_output.set_existence (ca_child.existence.deep_twin)
										ca_output.set_specialisation_status_redefined
									end

									-- deal with tuples: remove all children of target C_ATTRIBUTE, and do a complete replacement
									if ca_child.is_second_order_constrained then
										ca_output.remove_all_children
										across ca_child.children as cpo_csr loop
											co_copy := cpo_csr.item.safe_deep_twin
											co_copy.set_specialisation_status_redefined
											ca_output.put_child (co_copy)
										end

									-- otherwise if a container attribute then do a merge
									elseif ca_child.is_multiple then
										-- graft the cardinality if that was changed
										if attached ca_child.cardinality then
											ca_output.set_cardinality (ca_child.cardinality.deep_twin)
											ca_output.set_specialisation_status_redefined
										end
debug ("flatten")
	io.put_string ("%T%T%Tmerge container attribute at " +
	ca_child.path + " into output%N")
end
										-- for container attributes in the source archetype, we build a merge list to properly deal with 'after'
										-- and 'before' keywords in differential archetype
										build_merge_list (ca_output, ca_child)
										across merge_list as merge_list_csr loop
											-- this loop corresponds to the sublist of objects in the source container
											-- (i.e. child archetype container node) that are to be merged either before
											-- or after the co_output_insert_pos in the flattened output, or in the case
											-- of terminal node types, i.e. nodes with no sub-structure, will modify or delete it
											do_merge (ca_output, ca_child, merge_list_csr.item)
										end

									-- for single-valued attributes, have to merge any non-CCO children
									else
debug ("flatten")
	io.put_string ("%T%T%Tmerge single attribute at " +
	ca_child.path + " into output%N")
end
										-- do the merge with a synthesised merge descriptor that just says merge everything to the end
										do_merge (ca_output, ca_child, [1, ca_child.child_count, Void, False])
									end
								end

							-- otherwise it is an add of an attribute that is not constrained in the parent on this object node;
							-- do a deep clone of the whole attribute from the child to the output
							else
								ca_child_copy := ca_child.safe_deep_twin
								ca_child_copy.set_subtree_specialisation_status (ss_added)
								grafted_child_locations.extend (ca_child.path)
								ca_child_copy.clear_differential_path
debug ("flatten")
	io.put_string ("%T%Tin child only; deep_clone attribute " +
		ca_child.rm_attribute_name + " at " + ca_child.path +
		" from diff child and graft to " + cco_output_flat_proximate.path +
		" in output%N")
end
								cco_output_flat_proximate.put_attribute (ca_child_copy)
							end -- if proximate object in flat output has attribute from diff
						end -- across c_attribute children
					end -- if flat output object is any_allowed

					-- graft any tuples objects
					if attached cco_child_diff.attribute_tuples as att_tuples then
						across att_tuples as child_tuples_csr loop
							-- create a new attribute tupe in the output flat
							create new_attr_tuple.make

							-- connect up the attributes
							across child_tuples_csr.item as ca_csr loop
								new_attr_tuple.put_member (cco_output_flat.attribute_with_name (ca_csr.item.rm_attribute_name))
							end

							new_attr_tuple.rebuild
							if cco_output_flat.has_comparable_attribute_tuple (new_attr_tuple) then
								cco_output_flat.replace_comparable_attribute_tuple (new_attr_tuple)
							else
								cco_output_flat.put_attribute_tuple (new_attr_tuple)
							end
						end
					end
debug ("flatten")
	io.put_string ("%T%T~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~%N")
end

				end -- if diff object.is_prohibited
			end -- if C_COMPLEX_OBJECT
		end

	build_merge_list (ca_output, ca_child: C_ATTRIBUTE)
			-- build merge list for merging objects in container attribute `ca_child' into the corresponding
			-- container attribute `ca_output' in the output structure, using ordering information in source
			-- attribute objects, and replacing or inserting as appropriate. Essentially, we can think of both the
			-- source and output structures as two linear lists of objects; the challenge is to figure out
			-- how to merge those from the source structure that are NEW only, or alternatively, are slot
			-- redefinitions. New nodes are those whose identifier indicates addition at this level
			-- (i.e. a code like at0002.1.4 is not new in spec level 3, but at0.0.4 is)
		require
			Non_empty_attribute: ca_output.has_children
		local
			co_output_csr: C_OBJECT
			after_pending: BOOLEAN
			start_pos, end_pos: INTEGER
			sibling_anchor: SIBLING_ORDER
		do
			merge_list.wipe_out
			start_pos := 1
			co_output_csr := ca_output.first_child
			from ca_child.children.start until ca_child.children.off loop

				-- find the next ordering marker, or end of list
				from until ca_child.children.off or attached ca_child.children.item.sibling_order loop
					ca_child.children.forth
				end

				if not ca_child.children.off then
					check attached ca_child.children.item.sibling_order as att_so then
						sibling_anchor := att_so
					end

					-- grab pending series from start_pos to here -1 and make a merge record for it
					if after_pending then
						end_pos := ca_child.children.index - 1
						add_merge_desc (start_pos, end_pos, co_output_csr, False)
						after_pending := False
						start_pos := end_pos + 1
					end

					-- Obtain the sibling anchor in the output flat:
					-- if overlay has already occurred, we look for sibling anchor using child level node id
					-- otherwise use flat parent level id
					if ca_output.has_child_with_id (sibling_anchor.sibling_node_id) then
						co_output_csr := ca_output.child_with_id (sibling_anchor.sibling_node_id)
					else
						co_output_csr := ca_output.child_with_id (code_at_level (sibling_anchor.sibling_node_id, arch_parent_flat.specialisation_depth))
					end

					-- if the order marker is 'before', it means that the merge list is from the last
					-- point already taken care of + 1, until the current object, and the merge target in the
					-- output structure is the object with the same id as the last object just found, carrying
					-- the 'before' marker
					if sibling_anchor.is_before then
						end_pos := ca_child.children.index
						add_merge_desc (start_pos, end_pos, co_output_csr, True)
						start_pos := end_pos + 1

					-- marker is 'after' - this means that all the objects from the last position dealt with,
					-- up until the one with the marker on it (but not including it); so we need to merge
					-- that list before the csr position object in the output list; then we need to reset the
					-- source list start_pos to the item with the 'after' marker, and the output list cursor object
					-- to the object with the same id as the object holding the 'after' marker
					else
						-- create a descriptor for the preceding section
						if not ca_child.children.isfirst and ca_child.children.index > start_pos then
							add_merge_desc (start_pos, ca_child.children.index - 1, co_output_csr, True)
						end
						-- now take care of series starting with current 'after' marker
						start_pos := ca_child.children.index
						after_pending := True
					end
					ca_child.children.forth
				else
					-- set the co_output_insert_pos to the last item in the flat under this attribute - i.e. the child archetype
					-- object nodes will be merged after the end of the existing ones in the flat
					co_output_csr := ca_output.children.last
					add_merge_desc (start_pos, ca_child.children.count, co_output_csr, False)
					after_pending := False
				end
			end
			if after_pending then -- grab the series from start_pos to here -1 and make a desc for it
				add_merge_desc (start_pos, ca_child.children.count, co_output_csr, False)
			end
		end

	do_merge (ca_output, ca_child: C_ATTRIBUTE; merge_desc: like merge_list.item)
			-- merge `co_child_diff' into `ca_output', either after or before `co_output_insert_pos' child of `ca_output'.
		local
			co_child_diff, new_obj: C_OBJECT
			node_id_in_flat: STRING
			co_output_insert_pos, co_output_del_pos_sibling: detachable C_OBJECT
			ca_parent_in_child: C_ATTRIBUTE
			i: INTEGER
		do
			co_output_insert_pos := merge_desc.co_output_insert_pos
			from i := merge_desc.start_pos until i > merge_desc.end_pos loop
				co_child_diff := ca_child.children.i_th (i)
				node_id_in_flat := code_at_level (co_child_diff.node_id, arch_parent_flat.specialisation_depth)

				-- if node_id indicates it is is to be added new in this level, e.g. something like id0.3 in level 2, add the node
				if specialisation_status_from_code (co_child_diff.node_id, arch_child_diff.specialisation_depth) = ss_added then
					-- now we merge the object
					new_obj := co_child_diff.safe_deep_twin
					new_obj.deep_set_specialisation_status_added
					if attached co_output_insert_pos as co_ins_obj then
						if merge_desc.before_flag then
							ca_output.put_child_left (new_obj, co_ins_obj)
						else
							ca_output.put_child_right (new_obj, co_ins_obj)
							co_output_insert_pos := new_obj
						end
					else
						ca_output.put_child (new_obj)
					end

					-- remember the path, so we don't try to do it again later on
					grafted_child_locations.extend (co_child_diff.path)

				-- for non CCO by CCO overrides we still have to check if there is a parent node to be overridden, because in the case where
				-- multiple children override one parent (e.g. id10.1 and id10.2 override id10) the parent may have already
				-- been replaced by one of the children, and won't be visible anymore; in which case do an add with the
				-- subsequent children
				elseif not ca_output.has_child_with_id (node_id_in_flat) then
					new_obj := co_child_diff.safe_deep_twin
					new_obj.set_specialisation_status (ss_redefined)
					ca_output.put_sibling_child (new_obj, not merge_desc.before_flag)
					co_output_insert_pos := new_obj

					-- remember the path, so we don't try to do it again later on
					grafted_child_locations.extend (co_child_diff.path)

				-- don't do anything with a C_COMPLEX_OBJECT that overrides a C_COMPLEX_OBJECT, since the main
				-- graft routine will take care of it
				elseif is_c_complex_object_type (co_child_diff) and is_c_complex_object_type (ca_output.child_with_id (node_id_in_flat)) then
					-- do nothing - rely on main graft routine

				-- otherwise it's an override by a terminal node type
				else
					co_output_insert_pos := ca_output.child_with_id (node_id_in_flat)

					-- if child node prohibited, remove corresponding node from parent
					if co_child_diff.is_prohibited then
						-- capture insert point before doing deletion
						if attached ca_output.child_after (co_output_insert_pos) as ch then
							co_output_del_pos_sibling := ch
						elseif attached ca_output.child_before (co_output_insert_pos) as ch then
							co_output_del_pos_sibling := ch
						end
						ca_output.remove_child (co_output_insert_pos)
						co_output_insert_pos := co_output_del_pos_sibling

					else
						new_obj := co_child_diff.safe_deep_twin
						new_obj.set_specialisation_status_redefined

						-- C_ARCHETYPE_ROOT redefines ARCHETYPE_SLOT - add it after the slot
						if attached {C_ARCHETYPE_ROOT} co_child_diff as child_car and attached {ARCHETYPE_SLOT} co_output_insert_pos as flat_slot then
							ca_output.put_child_right (new_obj, flat_slot)

						-- any other combination of AOM types
						else
							-- decide on whether to replace the parent node in the output flat, or to add next to it
							-- based on effective aggregated max occurrences
							check attached co_child_diff.parent as att_parent then
								ca_parent_in_child := att_parent
							end
							if co_output_insert_pos.is_occurrences_upper_one or (ca_parent_in_child.aggregate_occurrences_upper_is_one (node_id_in_flat)) then
								ca_output.replace_child_by_id (new_obj, node_id_in_flat)
							else
								ca_output.put_child_right (new_obj, co_output_insert_pos)
							end
						end
						co_output_insert_pos := new_obj
					end

					-- remember the path, so we don't try to do it again later on
					grafted_child_locations.extend (co_child_diff.path)
				end
				i := i + 1
			end
		end

	merge_list: ARRAYED_LIST [TUPLE [start_pos: INTEGER; end_pos: INTEGER; co_output_insert_pos: detachable C_OBJECT; before_flag: BOOLEAN]]
			-- merge descriptor list of TUPLEs of the following structure:
			--	start pos in source list: INTEGER
			--	end pos in source list: INTEGER
			-- 	insert obj in target list: C_OBJECT (can't be an index, because insertions will make the list change)
			-- 	insert side: BOOLEAN; True = prepend before, False = append after
		attribute
			create Result.make (0)
		end

	add_merge_desc (src_start_pos, src_end_pos: INTEGER; tgt_co_output_insert_pos: C_OBJECT; before_flag: BOOLEAN)
			-- create a merge tuple for use in later merging
		local
			merge_desc: like merge_list.item
		do
			create merge_desc
			merge_desc.start_pos := src_start_pos
			merge_desc.end_pos := src_end_pos
			merge_desc.co_output_insert_pos := tgt_co_output_insert_pos
			merge_desc.before_flag := before_flag
			merge_list.extend (merge_desc)
			debug ("flatten")
				io.put_string ("%T%T%T=== added MERGE DESC " + src_start_pos.out + ", " + src_end_pos.out + ", " + tgt_co_output_insert_pos.node_id + ", " + before_flag.out + "%N")
			end
		end

	node_test (a_c_node: ARCHETYPE_CONSTRAINT): BOOLEAN
			-- return True if a conformant path of a_c_node in the differential archetype is found within the flat
			-- parent archetype - i.e. a_c_node is inherited or redefined from parent (but not new)
			-- unless the node is already in the child_grafted_path_list
		local
			apa: ARCHETYPE_PATH_ANALYSER
			ac_path, path_in_flat: STRING
		do
			ac_path := a_c_node.path
			create apa.make_from_string (ac_path)
			path_in_flat := apa.path_at_level (arch_parent_flat.specialisation_depth)
			Result := arch_parent_flat.has_path (path_in_flat) and
				not across grafted_child_locations as grafted_paths_csr some ac_path.starts_with (grafted_paths_csr.item) end
		end

	grafted_child_locations: ARRAYED_SET [STRING]
			-- list of root paths of child sub-trees in the child that have been completely grafted from child to parent
			-- don't descend into paths lower than any path in this list
		attribute
			create Result.make(0)
			Result.compare_objects
		end

	flatten_rules
			-- build the flat archetype invariants as the sum of parent and source invariants
		do
			if arch_child_diff.has_rules then
				across arch_child_diff.rules as rules_csr loop
					arch_output_flat.add_rule (rules_csr.item.deep_twin)
				end
			end
		end

	flatten_terminology
			-- build the flat archetype ontology as the sum of parent and source ontologies
		do
			arch_output_flat.terminology.merge (arch_child_diff.terminology)
		end

	flatten_annotations
			-- build a flattened form of the annotations, by merging everything found in child into flat parent annotations
		do
			arch_output_flat.merge_annotations_from_resource (arch_child_diff)
		end

	rm_node_flatten_enter (a_c_node: ARCHETYPE_CONSTRAINT; depth: INTEGER)
			-- copy existence and cardinality from reference model to node if it doesn't have them set; infer occurrences
		local
			rm_attr_desc: BMM_PROPERTY [BMM_TYPE]
		do
			if attached {C_ATTRIBUTE} a_c_node as ca then
				rm_attr_desc := rm_schema.property_definition (ca.parent.rm_type_name, ca.rm_attribute_name)
				if ca.existence = Void then
					ca.set_existence (rm_attr_desc.existence)
				end
				if ca.is_multiple and ca.cardinality = Void then
					if attached {BMM_CONTAINER_PROPERTY} rm_attr_desc as cont_prop and then attached cont_prop.cardinality as card then
						ca.set_cardinality (create {CARDINALITY}.make (card))
					else -- should never get here
						raise ("rm_node_flatten_enter location #1")
					end
				end
			elseif attached {C_OBJECT} a_c_node as co then
				-- here the logic is a bit trickier: there is no such thing as 'occurrences' in the reference model
				-- so it is set from the enclosing attribute cardinality if a container, or set to RM existence if not a container
				if co.occurrences = Void and not co.is_root then
					rm_attr_desc := rm_schema.property_definition (co.parent.parent.rm_type_name, co.parent.rm_attribute_name)
					if attached {BMM_CONTAINER_PROPERTY} rm_attr_desc as cont_prop then
						if cont_prop.cardinality.upper_unbounded then
							co.set_occurrences (create {MULTIPLICITY_INTERVAL}.make_upper_unbounded (0))
						else
							co.set_occurrences (create {MULTIPLICITY_INTERVAL}.make_bounded (0, cont_prop.cardinality.upper))
						end
					else
						co.set_occurrences (rm_attr_desc.existence)
					end
				end
			end
		end

	rm_node_flatten_exit (a_c_node: ARCHETYPE_CONSTRAINT; depth: INTEGER)
		do
		end

	template_overlay_supplier_definitions (a_flat_arch: FLAT_ARCHETYPE; depth: INTEGER)
			-- process `a_flat_arch.suppliers_index' to overlay target definitions.
		local
			supp_flat_arch: FLAT_ARCHETYPE
			supp_arch_root_cco: C_COMPLEX_OBJECT
			matched_arch: ARCH_LIB_ARCHETYPE
		do
debug ("flatten")
	io.put_string ("&&&&&& flattening template root nodes &&&&&&%N")
end
			if depth <= Max_template_overlay_depth then
				across a_flat_arch.suppliers_index as xref_idx_csr loop
					-- get the definition structure of the flat archetype corresponding to the archetype id in the suppliers list
					matched_arch := current_library.matching_archetype (xref_idx_csr.key)
					create supp_flat_arch.make_from_other (matched_arch.flat_archetype)
					supp_arch_root_cco := supp_flat_arch.definition

					-- get list of C_ARCHETYPE_ROOT nodes in this archetype or template corresponding to the supplier
					-- archetype id xref_idx.key_for_iteration into each one of these C_ARCHETYPE_ROOT nodes, clone the
					-- flat definition structure from the supplier archetype
					across xref_idx_csr.item as c_arch_roots_csr loop
						if not c_arch_roots_csr.item.has_attributes then -- it is empty and needs to be filled
							-- perform overlays on supplier archetype first
							template_overlay_supplier_definitions (supp_flat_arch, depth + 1)
	debug ("flatten")
		io.put_string ("%T node at " + c_arch_roots_csr.item.path +
		" with " + xref_idx_csr.key + "%N")
	end
							c_arch_roots_csr.item.convert_to_flat (matched_arch.id.as_string)
							across supp_arch_root_cco.attributes as attrs_csr loop
								c_arch_roots_csr.item.put_attribute (attrs_csr.item)
	debug ("flatten")
		io.put_string ("%T%T cloning attribute " +
		attrs_csr.item.rm_attribute_path + "%N")
	end
							end
						end
					end
				end
			end
		end

	template_overlay_supplier_terminologies
			-- process `template_ontology_overlay_list' to overlay target terminologies.
		local
			ont: FLAT_ARCHETYPE_TERMINOLOGY
		do
debug ("flatten")
	io.put_string ("&&&&&& flattening template terminologies &&&&&&%N")
end
			if attached {OPERATIONAL_TEMPLATE} arch_output_flat as opt then
				across child_desc.suppliers_index as supp_idx_csr loop
					ont := supp_idx_csr.item.flat_archetype.terminology
					opt.add_component_terminology (ont, supp_idx_csr.key)
debug ("flatten")
	io.put_string ("%T adding terminology from " +
	supp_idx_csr.key + "%N")
end
				end
			end
		end

	is_c_complex_object_type (co: C_OBJECT): BOOLEAN
			-- True if `co' has dynamic type attached C_COMPLEX_OBJECT
		do
			Result := attached_type (dynamic_type (co)) = ({C_COMPLEX_OBJECT}).type_id
		end

end


