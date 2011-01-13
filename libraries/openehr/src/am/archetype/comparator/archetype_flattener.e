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

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class ARCHETYPE_FLATTENER

inherit
	SHARED_KNOWLEDGE_REPOSITORY
		export {NONE}
			all
		end

	ARCHETYPE_TERM_CODE_TOOLS
		export {NONE}
			all
		end

	SHARED_MESSAGE_BILLBOARD
		export
			{NONE} all
		end

create
	make_specialised, make_non_specialised

feature -- Initialisation

	make_specialised (a_flat_parent_desc, a_child_desc: attached ARCH_REP_ARCHETYPE; an_rm_schema: attached SCHEMA_ACCESS)
			-- create with flat archetype of parent and source (differential) archetype of
			-- archetype for which we wish to generate a flat archetype
		require
			Flat_desc_valid: a_flat_parent_desc.is_valid
			Child_desc_valid: a_child_desc.is_valid
			Child_parent_relation_valid: a_child_desc.differential_archetype.parent_archetype_id.as_string.is_equal (a_flat_parent_desc.flat_archetype.archetype_id.as_string)
		do
			rm_schema := an_rm_schema
			flat_parent_desc := a_flat_parent_desc
			child_desc := a_child_desc
		end

	make_non_specialised (a_child_desc: attached ARCH_REP_ARCHETYPE; an_rm_schema: attached SCHEMA_ACCESS)
			-- create with source (differential) archetype
		require
			Child_desc_attached: a_child_desc.is_valid
		do
			rm_schema := an_rm_schema
			child_desc := a_child_desc
		end

feature -- Access

	flat_parent_desc: attached ARCH_REP_ARCHETYPE

	child_desc: attached ARCH_REP_ARCHETYPE

	arch_parent_flat: attached FLAT_ARCHETYPE
			-- flat archetype of parent, if applicable
		do
			Result := flat_parent_desc.flat_archetype
		end

	arch_child_diff: attached DIFFERENTIAL_ARCHETYPE
			-- archetype for which flat form is being generated
		do
			Result := child_desc.differential_archetype
		end

	arch_output_flat: FLAT_ARCHETYPE
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
				expand_definition_use_nodes
				flatten_definition
				flatten_invariants
				flatten_ontology
				flatten_annotations
				arch_output_flat.set_parent_archetype_id (arch_parent_flat.archetype_id)
				arch_output_flat.set_is_valid (True)
				arch_output_flat.rebuild
			else
				create arch_output_flat.make_non_specialised (arch_child_diff)
			end

			-- flatten RM onto archetype; must do this at the end, since otherwise the existence etc set due to
			-- this would look like duplicates during the flattening process
			if rm_flattening_on and include_rm then
				create def_it.make(arch_output_flat.definition)
				def_it.do_all(agent rm_node_flatten_enter, agent rm_node_flatten_exit)
			end

			-- now finalise template flattening
			if arch_child_diff.is_template then
				arch_output_flat.build_xrefs
				template_overlay_target_definitions
				template_overlay_target_ontologies
			end
		ensure
			arch_output_flat /= Void
		end

feature {NONE} -- Implementation

	rm_schema: SCHEMA_ACCESS
			-- utility reference to RM schema used for validation & flattening

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
	io.put_string ("%T...checking flat parent use_node path " +
	int_refs.item.path + " against child path map%N")
end
						clone_performed := False
						from child_paths_at_parent_level.start until child_paths_at_parent_level.off or clone_performed loop
							if child_paths_at_parent_level.item.starts_with (int_refs.item.path) then
debug ("flatten")
	io.put_string ("%T...cloning node at " +
	arch_output_flat.use_node_index.key_for_iteration +
	" and replacing at " + int_refs.item.path + "%N")
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
		end

	node_graft (a_c_node: attached ARCHETYPE_CONSTRAINT; depth: INTEGER)
			-- perform grafts of node from differential archetype on corresponding node in flat parent
			-- only interested in C_COMPLEX_OBJECTs; we deal with all the other node types by iterating the
			-- children of C_COMPLEX_OBJECTs
		local
			cco_output_flat, cco_output_flat_proximate, cco_csr: C_COMPLEX_OBJECT
			apa: ARCHETYPE_PATH_ANALYSER
			a_path: STRING
			c_path_in_diff: OG_PATH
			ca_child, ca_child_copy, ca_output: C_ATTRIBUTE
		do
			if attached {C_COMPLEX_OBJECT} a_c_node as cco_child_diff and not attached {C_ARCHETYPE_ROOT} a_c_node as car then
				create apa.make_from_string (cco_child_diff.path)
				a_path := apa.path_at_level (arch_parent_flat.specialisation_depth)
debug ("flatten")
	io.put_string ("---------- at child differential object node " + cco_child_diff.path + " ---------%N")
	io.put_string ("%Tsee if output object node at " + a_path + " exists in flat parent ... ")
end

				-- check that path exists (in nodes defined by value) in flat parent
				if arch_output_flat.has_path (a_path) then
debug ("flatten")
	io.put_string ("YES%N")
end

					-- check for path that has been overlaid by a redefined node; have to graft in entire object as a sibling
					if parent_path_list.has(a_path) then
debug ("flatten")
	io.put_string ("%TObject in flat parent ALREADY REPLACED - grafting sibling object " + cco_child_diff.path + "%N")
end
						ca_output := arch_output_flat.definition.c_attribute_at_path (cco_child_diff.parent.path)
						ca_output.put_sibling_child (cco_child_diff.safe_deep_twin)
						child_grafted_path_list.extend (cco_child_diff.path)
					else
						-- obtain the node in the flat output to start working at
						cco_output_flat ?= arch_output_flat.c_object_at_path (a_path)
debug ("flatten")
	io.put_string ("%TFirst replacement in flat parent " +
	cco_child_diff.path + "%N")
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

						-- if output_flat node matches any, and it is addressable (which means the differential child node must also be,
						-- and must therefore be intended as an override; if it wasn't, it will be treated as an alternative)
						-- then replace it with a complete clone of the current child tree
						elseif cco_output_flat.any_allowed and cco_output_flat.is_addressable then
debug ("flatten")
	io.put_string ("%T** parent matches ANY - REPLACING node [" +
	cco_output_flat.node_id + "] with complete clone of child node [" +
	cco_child_diff.node_id + "]**%N")
end
							if not cco_output_flat.is_root then
								-- have to change the node id to the target node id, so that the replace will work
								cco_output_flat.parent.replace_node_id (cco_output_flat.node_id, cco_child_diff.node_id)
								cco_output_flat.parent.replace_child_by_id (cco_child_diff.safe_deep_twin, cco_child_diff.node_id)
							else -- the child archetype object is the root object; copy all of its attributes into the target
								from cco_child_diff.attributes.start until cco_child_diff.attributes.off loop
									ca_child := cco_child_diff.attributes.item
debug ("flatten")
	io.put_string ("%T%T~~~~ attribute = " + ca_child.rm_attribute_path + "%N")
end
									ca_child_copy := ca_child.safe_deep_twin
debug ("flatten")
	io.put_string ("%T%Tin child only; deep_clone attribute " +
		ca_child.rm_attribute_name + " at " + ca_child.path +
		" from diff child and graft to " + cco_output_flat.path +
		" in output%N")
end
									cco_output_flat.put_attribute (ca_child_copy)
									cco_child_diff.attributes.forth
								end
							end
							child_grafted_path_list.extend (cco_child_diff.path)

						else
							-- firstly, add overrides from immediate child node to corresponding flat node
debug ("flatten")
	io.put_string ("%TOVERLAY immediate node " + cco_child_diff.node_id + " on flat parent " + cco_output_flat.node_id + "%N")
end
							if cco_output_flat.parent /= Void then
								cco_output_flat.parent.overlay_differential(cco_output_flat, cco_child_diff, rm_schema)
							else
								cco_output_flat.overlay_differential(cco_child_diff, rm_schema)
							end

							-- now iterate through child attributes and overlay a) new object nodes in existing container attributes,
							-- and b) new attribute nodes from child. Note that these attributes are in general specified by paths,
							-- so they can overlay arbitrarily deep points in the flat output structure.
debug ("flatten")
	io.put_string ("%T%T~~~~~~~~ iterating cco_child_diff attributes ~~~~~~~~~%N")
end
							from cco_child_diff.attributes.start until cco_child_diff.attributes.off loop
								ca_child := cco_child_diff.attributes.item
debug ("flatten")
	io.put_string ("%T%T~~~~ attribute = " + ca_child.rm_attribute_path + "%N")
end

								-- now we have to figure out the 'proximate' C_COMPLEX_OBJECT in the flat parent - it is either the cco_output_flat that
								-- corresponds to the parent object from the differential child with we started this routine, or if the current attribute
								-- has a differential path, its true object parent in the flat parent archetype is given by the differential path
								if ca_child.has_differential_path then
									create apa.make_from_string (ca_child.differential_path)
									cco_output_flat_proximate ?= arch_output_flat.c_object_at_path (apa.path_at_level (arch_parent_flat.specialisation_depth))
debug ("flatten")
	io.put_string ("%T%Tchild has differential path " +
		ca_child.differential_path + "; flat proximate path = " +
		cco_output_flat_proximate.path + "%N")
end

									-- there may be object ids on the path from the original parent attribute to the proximate attribute in the flat parent
									-- that are overridden by object-ids in the differential path; for these we need to replace the node ids of the relevant
									-- nodes in the flat output
									create c_path_in_diff.make_from_string (ca_child.differential_path)
									c_path_in_diff.finish
									from cco_csr := cco_output_flat_proximate until cco_csr = cco_output_flat loop
										if c_path_in_diff.item.is_addressable and then c_path_in_diff.item.object_id.count > cco_csr.node_id.count and then
												c_path_in_diff.item.object_id.starts_with (cco_csr.node_id) then
debug ("flatten")
	io.put_string ("%T%T%Treplacing node id " + cco_csr.node_id +
		" in flat structure with " + c_path_in_diff.item.object_id + "%N")
end
											cco_csr.parent.replace_node_id (cco_csr.node_id, c_path_in_diff.item.object_id)
										end
										cco_csr := cco_csr.parent.parent
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
	io.put_string ("%T%Tmatched attr " + ca_child.rm_attribute_name +
	" in parent object in flat archetype%N")
end

									ca_output := cco_output_flat_proximate.c_attribute (ca_child.rm_attribute_name)

									if ca_child.is_prohibited then -- existence = {0}; remove the attribute completely
										ca_output.parent.remove_attribute_by_name (ca_child.rm_attribute_name)
									else
										-- graft the existence if that has been changed
										if ca_child.existence /= Void then
											ca_output.set_existence (ca_child.existence.deep_twin)
										end
										if ca_child.is_multiple then
											-- for container attributes in the source archetype, we graft in new elements; overrides will be
											-- handled by being traversed by this routine later; also graft the cardinality if that was changed
											if ca_child.cardinality /= Void then
												ca_output.set_cardinality (ca_child.cardinality.deep_twin)
											end
debug ("flatten")
	io.put_string ("%T%T%Tmerge container attribute at " +
	ca_child.path + " into output%N")
end
											merge_container_attribute(ca_output, ca_child)
										else -- for single-valued attributes, have to merge any non-CCO children
debug ("flatten")
	io.put_string ("%T%T%Tmerge single attribute at " +
	ca_child.path + " into output%N")
end
											merge_single_attribute(ca_output, ca_child)
										end
									end
								else  -- otherwise just do a deep clone of the whole attribute from the child to the output
									ca_child_copy := ca_child.safe_deep_twin
									child_grafted_path_list.extend (ca_child.path)
									ca_child_copy.clear_differential_path
debug ("flatten")
	io.put_string ("%T%Tin child only; deep_clone attribute " +
		ca_child.rm_attribute_name + " at " + ca_child.path +
		" from diff child and graft to " + cco_output_flat_proximate.path +
		" in output%N")
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

	merge_container_attribute(ca_output, ca_child: attached C_ATTRIBUTE)
			-- merge objects in container attribute `a_src_attr' into the equivalent container attribute
			-- `an_output_attr' in the output structure, using ordering information in source attribute
			-- objects, and replacing or inserting as appropriate. Essentially, we can think of both the
			-- source and output structures as two linear lists of objects; the challenge is to figure out
			-- how to merge those from the source structure that are NEW only. Overrides are ignored here,
			-- because they are dealt with by the normal traversal.
			-- The work is done in two parts:
			-- 	* work out a set of 'merge descriptors' containing sub-lists of the source list to be
			--	  merged into a particular location in the target list, either before or after
			--	* do the actual merging work, taking only 'new' (added) items from the source list.
		local
			insert_obj, merge_obj: C_OBJECT
			i: INTEGER
			after_pending: BOOLEAN
			start_pos, end_pos: INTEGER
		do
			--
			-- Phase 1: figure out the merge records
			--
			create merge_list.make (0)
			start_pos := 1
			insert_obj := ca_output.children.first
			from ca_child.children.start until ca_child.children.off loop
				-- find the next ordering marker, or end of list
				from until ca_child.children.off or ca_child.children.item.sibling_order /= Void loop
					ca_child.children.forth
				end

				if not ca_child.children.off then
					if after_pending then
						-- grab the series from start_pos to here -1 and make a merge record for it
						end_pos := ca_child.children.index - 1
						add_merge_desc (start_pos, end_pos, insert_obj, False)
						after_pending := False
						start_pos := end_pos + 1
					end

					-- if the order marker is 'before', it means that the merge list is from the last
					-- point already taken care of + 1, until the current object, and the merge target in the
					-- output structure is the object with the same id as the last object just found, carrying
					-- the 'before' marker
					if ca_child.children.item.sibling_order.is_before then
						end_pos := ca_child.children.index
						insert_obj := ca_output.child_with_id (ca_child.children.item.sibling_order.sibling_node_id)
						add_merge_desc (start_pos, end_pos, insert_obj, True)
						start_pos := end_pos + 1

					-- marker is 'after' - this means that all the objects from the last position dealt with,
					-- up until the one with the marker on it (but not including it); so we need to merge
					-- that list before the csr position object in the output list; then we need to reset the
					-- source list start_pos to the item with the 'after' marker, and the output list cursor object
					-- to the object with the same id as the object holding the 'after' marker
					else
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

			--
			-- Phase 2: do the merging, using the merge descriptors to clone objects of the (differential) source list onto
			-- the target (flat) output list, ignoring any redefined nodes - only merge new ones
			--
			from merge_list.start until merge_list.off loop
				insert_obj ?= merge_list.item.insert_obj
				-- this loop corresponds to the sublist of objects in the source container (i.e. child archetype container node) that are
				-- to be merged either before or after the insert_obj in the flattened output.
				from i := merge_list.item.start_pos until i > merge_list.item.end_pos loop
					if is_valid_code (ca_child.children.i_th(i).node_id) 																						-- identified nodes only
								and specialisation_status_from_code (ca_child.children.i_th(i).node_id, arch_child_diff.specialisation_depth).value = ss_added 	-- that have been added
								or attached {C_ARCHETYPE_ROOT} ca_child.children.i_th(i) as car then 															-- or else C_ARCHETYPE_ROOTs
							child_grafted_path_list.extend (ca_child.children.i_th(i).path) -- remember the path, so we don't try to do it again later on

						-- now we either merge the object, or deal with the special case of occurrences = 0,
						-- in which case, remove the target object
						if ca_child.children.i_th(i).is_prohibited then
							ca_output.remove_child (insert_obj)
						else
							merge_obj := ca_child.children.i_th(i).safe_deep_twin
							merge_obj.clear_sibling_order -- no sibling_order markers in flat archetypes!
							if merge_list.item.before_flag then -- True = insert before
								ca_output.put_child_left(merge_obj, insert_obj)
							else
								ca_output.put_child_right(merge_obj, insert_obj)
								insert_obj := ca_output.child_after (insert_obj) -- move 1 to the right, so adding occurs after
							end
						end

					elseif attached {ARCHETYPE_SLOT} ca_child.children.i_th(i) as arch_slot then	-- ARCHETYPE_SLOT override
						child_grafted_path_list.extend (ca_child.children.i_th(i).path) -- remember the path, so we don't try to do it again later on
						if arch_slot.is_closed then
							ca_output.remove_child_by_id (code_at_level (ca_child.children.i_th(i).node_id, arch_parent_flat.specialisation_depth))
						else
							ca_output.replace_child_by_id (ca_child.children.item.safe_deep_twin,
									code_at_level (ca_child.children.i_th(i).node_id, arch_parent_flat.specialisation_depth))
						end
					else
						debug("flatten")
							io.put_string ("%T%T%TARCHETYPE_FLATTENER.merge_container_attribute location 1; IGNORING " +
								ca_child.children.i_th(i).path + " (" + i.out + "-th child)%N")
						end
					end
					i := i + 1
				end
				merge_list.forth
			end
		end

	merge_single_attribute(ca_output, ca_child: C_ATTRIBUTE)
			-- merge objects from a single-valued attribute (multiple objects if alternatives defined) which are either new
			-- in the specialised attribute, or are C_COMPLEX_OBJECTs (if they are the latter, they will get traversed
			-- normally by node_graft())
		local
			rm_ancestors: ARRAYED_LIST [STRING]
			merge_obj: C_OBJECT
		do
			from ca_child.children.start until ca_child.children.off loop
				if attached {ARCHETYPE_SLOT} ca_child.children.item as arch_slot then
					if arch_slot.is_closed then
						ca_output.remove_child_by_id (code_at_level (ca_child.children.item.node_id, arch_parent_flat.specialisation_depth))
					elseif specialisation_status_from_code (ca_child.children.item.node_id, arch_child_diff.specialisation_depth).value = ss_added then
						ca_output.put_child(ca_child.children.item.safe_deep_twin)
					else
						ca_output.replace_child_by_id (ca_child.children.item.safe_deep_twin,
								code_at_level (ca_child.children.item.node_id, arch_parent_flat.specialisation_depth))
					end

				elseif attached {C_ARCHETYPE_ROOT} ca_child.children.item as car then
					merge_obj := ca_child.children.item.safe_deep_twin
					ca_output.put_child (merge_obj)
					child_grafted_path_list.extend (ca_child.children.item.path)

				elseif not attached {C_COMPLEX_OBJECT} ca_child.children.item as cco then
					if ca_child.children.item.is_addressable then -- if identified, find corresponding node in parent & replace completely
						ca_output.replace_child_by_id (ca_child.children.item.safe_deep_twin,
							code_at_level (ca_child.children.item.node_id, arch_parent_flat.specialisation_depth))
					elseif ca_output.has_child_with_rm_type_name(ca_child.children.item.rm_type_name) then -- find a node of same type, then replace completely
						ca_output.replace_child_by_rm_type_name (ca_child.children.item.safe_deep_twin)
					else -- or a RM parent type, then add
						rm_ancestors := rm_schema.all_ancestor_classes_of(ca_child.children.item.rm_type_name)
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

	merge_list: ARRAYED_LIST [like merge_desc]
			-- merge descriptor list of TUPLEs of the following structure:
			--	start pos in source list: INTEGER
			--	end pos in source list: INTEGER
			-- 	insert obj in target list: C_OBJECT (can't be an index, because insertions will make the list change)
			-- 	operation: BOOLEAN; True = prepend before, False = append after

	merge_desc: TUPLE [start_pos: INTEGER; end_pos: INTEGER; insert_obj: C_OBJECT; before_flag: BOOLEAN]

	add_merge_desc (src_start_pos, src_end_pos: INTEGER; tgt_insert_obj: attached C_OBJECT; before_flag: BOOLEAN)
			-- create a merge tuple for use in later merging
		do
			create merge_desc
			merge_desc.start_pos := src_start_pos
			merge_desc.end_pos := src_end_pos
			merge_desc.insert_obj := tgt_insert_obj
			merge_desc.before_flag := before_flag
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
--			if not apa.is_phantom_path_at_level (arch_parent_flat.specialisation_depth) then
				from child_grafted_path_list.start until found_child or child_grafted_path_list.off loop
					if np.starts_with(child_grafted_path_list.item) then
						found_child := True
						debug ("flatten")
							io.put_string ("%T%Tchild path " + np + " matches path " + child_grafted_path_list.item + " in child_grafted_path_list - not descending%N")
						end
					end
					child_grafted_path_list.forth
				end
				Result := not found_child and arch_parent_flat.has_path (apa.path_at_level (arch_parent_flat.specialisation_depth))
--			end
		end

	parent_path_list: ARRAYED_LIST [STRING]
			-- list of paths matched in parent archetype by child archetype nodes. Used to remember paths that
			-- disappear due to being overwritten by a specialised node (e.g. at0013 becomes at0013.1 in the flat output)
			-- but then specialised siblings (e.g. at0013.2, at0013.3) turn up and need to be grafted in.

	child_grafted_path_list: ARRAYED_LIST [STRING]
			-- list of root paths of child sub-trees in the child that have been completely grafted from child to parent
			-- don't descend into paths lower than any path in this list

	flatten_invariants
			-- build the flat archetype invariants as the sum of parent and source invariants
		do
			if arch_child_diff.has_invariants then
				from arch_child_diff.invariants.start until arch_child_diff.invariants.off loop
					arch_output_flat.add_invariant (arch_child_diff.invariants.item.deep_twin)
					arch_child_diff.invariants.forth
				end
			end
		end

	flatten_ontology
			-- build the flat archetype ontology as the sum of parent and source ontologies
		do
			arch_output_flat.ontology.merge(arch_parent_flat.ontology)
		end

	flatten_annotations
			-- build a flattened form of the annotations, by merging everything found in child into flat parent annotations
		do
			arch_output_flat.merge_annotations_from_resource (arch_child_diff)
		end

	rm_node_flatten_enter (a_c_node: ARCHETYPE_CONSTRAINT; depth: INTEGER)
			-- copy existence and cardinality from reference model to node if it doesn't have them set; infer occurrences
		local
			rm_attr_desc: BMM_PROPERTY_DEFINITION
		do
			if attached {C_ATTRIBUTE} a_c_node as ca then
				rm_attr_desc := rm_schema.property_definition (ca.parent.rm_type_name, ca.rm_attribute_name)
				if ca.existence = Void then
					ca.set_existence(rm_attr_desc.existence)
				end
				if ca.is_multiple and ca.cardinality = Void then
					if attached {BMM_CONTAINER_PROPERTY} rm_attr_desc as cont_prop then
						ca.set_cardinality (create {CARDINALITY}.make(cont_prop.cardinality))
					else -- should never get here

					end
				end
			elseif attached {C_OBJECT} a_c_node as co then
				-- here the logic is a bit trickier: there is no such thing as 'occurrences' in the reference model
				-- so it is set from the enclosing attribute cardinality if a container, or left Void if not.
				if co.occurrences = Void and not co.is_root then
					rm_attr_desc := rm_schema.property_definition (co.parent.parent.rm_type_name, co.parent.rm_attribute_name)
					if attached {BMM_CONTAINER_PROPERTY} rm_attr_desc as cont_prop then
						if cont_prop.cardinality.upper_unbounded then
							co.set_occurrences (create {MULTIPLICITY_INTERVAL}.make_upper_unbounded (0))
						else
							co.set_occurrences (create {MULTIPLICITY_INTERVAL}.make_bounded(0, cont_prop.cardinality.upper))
						end
					end
				end
			end
		end

	rm_node_flatten_exit (a_c_node: ARCHETYPE_CONSTRAINT; depth: INTEGER)
		do
		end

	template_overlay_target_definitions
			-- process `template_arch_root_list' to overlay target definitions.
		local
			arch_root_cco: attached C_COMPLEX_OBJECT
			ca_clone: C_ATTRIBUTE
			xref_idx: HASH_TABLE[ARRAYED_LIST[C_ARCHETYPE_ROOT], STRING]
			xref_list: ARRAYED_LIST[C_ARCHETYPE_ROOT]
		do
debug ("flatten")
	io.put_string ("&&&&&& flattening template root nodes &&&&&&%N")
end
			xref_idx := arch_output_flat.suppliers_index
			from xref_idx.start until xref_idx.off loop
				arch_root_cco := current_arch_dir.archetype_index.item (xref_idx.key_for_iteration).flat_archetype.definition
				xref_list := xref_idx.item_for_iteration
				from xref_list.start until xref_list.off loop
					if not xref_list.item.has_attributes then -- it is empty and needs to be filled
debug ("flatten")
	io.put_string ("%T node at " + xref_list.item.path +
	" with " + xref_idx.key_for_iteration + "%N")
end
						from arch_root_cco.attributes.start until arch_root_cco.attributes.off loop
							ca_clone := arch_root_cco.attributes.item.safe_deep_twin
							xref_list.item.put_attribute (ca_clone)
debug ("flatten")
	io.put_string ("%T%T cloning attribute " +
	ca_clone.rm_attribute_path + "%N")
end
							arch_root_cco.attributes.forth
						end
					end
					xref_list.forth
				end
				xref_idx.forth
			end
		end

	template_overlay_target_ontologies
			-- process `template_ontology_overlay_list' to overlay target ontologies.
		local
			ont: FLAT_ARCHETYPE_ONTOLOGY
		do
debug ("flatten")
	io.put_string ("&&&&&& flattening template ontologies &&&&&&%N")
end
			if attached {OPERATIONAL_TEMPLATE} arch_output_flat as opt then
				from child_desc.suppliers_index.start until child_desc.suppliers_index.off loop
					ont := child_desc.suppliers_index.item_for_iteration.flat_archetype.ontology
					opt.add_component_ontology (ont, child_desc.suppliers_index.key_for_iteration)
debug ("flatten")
	io.put_string ("%T adding ontology from " +
	child_desc.suppliers_index.key_for_iteration + "%N")
end
					child_desc.suppliers_index.forth
				end
			end
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
