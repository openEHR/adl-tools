note
	component:   "openEHR ADL Tools"
	description: "[
				 Generate a flat archetype from a source differential form archetype, and, if the latter is
				 specialised, its flat parent.
				 The flattener assumes that the input differential archetype is valid according to the rules
				 implemented in AOM_PHASE_*_VALIDATORs, and defined by the openEHR ADL 2 specification.
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

	ADL_2_TERM_CODE_TOOLS
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

	make (a_child_desc: ARCH_LIB_ARCHETYPE_ITEM; an_rm_schema: BMM_SCHEMA)
			-- create with source (differential) archetype of archetype for which we wish to generate a flat archetype
		require
			Child_desc_valid: a_child_desc.is_valid
		do
			rm_schema := an_rm_schema
			child_desc := a_child_desc
			if child_desc.is_specialised then
				flat_anc_desc := child_desc.specialisation_ancestor
			else
				flat_anc_desc := Void
			end
			arch_flat_out := Void
		ensure
			Parent_set: a_child_desc.is_specialised implies attached flat_anc_desc
			Child_desc_set: child_desc = a_child_desc
			Flat_output_reset: not attached arch_flat_out
		end

feature -- Access

	flat_anc_desc: detachable ARCH_LIB_ARCHETYPE_ITEM

	child_desc: ARCH_LIB_ARCHETYPE_ITEM

	arch_flat_anc: FLAT_ARCHETYPE
			-- flat archetype of parent, if applicable
		require
			child_desc.is_specialised
		do
			Result := flat_anc_desc.flat_archetype
		end

	arch_diff_child: DIFFERENTIAL_ARCHETYPE
			-- archetype for which flat form is being generated
		do
			check attached child_desc.differential_archetype as da then
				Result := da
			end
		end

	arch_flat_out: detachable FLAT_ARCHETYPE
			-- generated flat archetype - logically an overlay of `arch_flat_anc' and `arch_diff_child'
			-- if the `arch_diff_child' is a template, the dynamic type will be OPERATIONAL_TEMPLATE

feature -- Commands

	flatten (include_rm: BOOLEAN)
			-- flatten archetype to `arch_flat_out'; if non-specialised and `include_rm' is True,
			-- then flatten against reference model (to pick up existence and cardinality, and infer occurrences);
			-- if specialised, flatten against a flat parent archetype
		local
			def_it: C_ITERATOR
		do
			if arch_diff_child.is_specialised then
debug ("flatten")
	io.put_string ("============== flattening specialised archetype " +
		arch_diff_child.archetype_id.physical_id + " with " +
		arch_flat_anc.archetype_id.physical_id + " ==============%N")
end
				if arch_diff_child.is_template then
					create {OPERATIONAL_TEMPLATE} arch_flat_out.make_specialised (arch_diff_child, arch_flat_anc)
				else
					create arch_flat_out.make_specialised (arch_diff_child, arch_flat_anc)
				end
				expand_c_proxy_objects
				flatten_other_metadata
				flatten_definition
				flatten_rules
				flatten_terminology
				flatten_annotations
				arch_flat_out.set_parent_archetype_id (arch_flat_anc.archetype_id.semantic_id)
				arch_flat_out.rebuild
			else
				create arch_flat_out.make_non_specialised (arch_diff_child)
			end

			-- flatten RM onto archetype; must do this at the end, since otherwise the existence etc set due to
			-- this would look like duplicates during the flattening process
			if rm_flattening_on and include_rm then
				create def_it.make (arch_flat_out.definition)
				def_it.do_all (agent rm_node_flatten_enter, agent rm_node_flatten_exit)
			end

			-- now finalise template flattening
			if arch_diff_child.is_template then
				check attached arch_flat_out as att_flat then
					template_overlay_supplier_definitions (att_flat, 0)
				end
				template_overlay_supplier_terminologies
				arch_flat_out.rebuild
			end

		ensure
			attached arch_flat_out
		end

feature {NONE} -- Implementation

	rm_schema: BMM_SCHEMA
			-- utility reference to RM schema used for validation & flattening

	expand_c_proxy_objects
			-- if there are overrides in the specialised child that are located at use_node positions, we
			-- have to expand out a copy of the structures pointed to by the use_nodes in the parent, so that
			-- the override can be correctly applied.
		require
			child_desc.is_specialised
		local
			c_obj: C_OBJECT
			child_paths_at_parent_level: ARRAYED_LIST [STRING]
			apa: ARCHETYPE_PATH_ANALYSER
			override_path_in_flat: STRING
			clone_performed: BOOLEAN
			flat_use_node_paths: HASH_TABLE [ARRAYED_LIST [C_COMPLEX_OBJECT_PROXY], STRING]
		do
			flat_use_node_paths := arch_flat_out.use_node_index
			if not flat_use_node_paths.is_empty then
debug ("flatten")
	io.put_string ("--> expand_c_proxy_objects%N")
end
				create child_paths_at_parent_level.make (0)
				child_paths_at_parent_level.compare_objects
				across arch_diff_child.all_paths as child_paths_csr loop
					create apa.make_from_string (child_paths_csr.item)
					if not apa.is_phantom_path_at_level (arch_flat_anc.specialisation_depth) then
						override_path_in_flat := apa.path_at_level (arch_flat_anc.specialisation_depth)
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
								c_obj := arch_flat_out.object_at_path (flat_use_node_path_csr.key).safe_deep_twin

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
				arch_flat_out.rebuild
debug ("flatten")
	io.put_string ("<-- expand_c_proxy_objects%N")
end
			end
		end

	flatten_other_metadata
			-- flatten other_metadata so that child archetype values overwrite any parent values with same key;
			-- otherwise parent key/val pairs are preserved
		do
			if attached arch_diff_child.other_metadata as child_omd then
				across child_omd as child_omd_csr loop
					arch_flat_out.add_other_metadata_value (child_omd_csr.key, child_omd_csr.item)
				end
			end
		end

	flatten_definition
			-- build the flat archetype definition by traversing src_archetype and determining what
			-- nodes from flat_archetype to add; do the changes to the output archetype
		require
			arch_diff_child.is_specialised
		local
			def_it: C_ITERATOR
			og_ca_path_in_diff, og_co_parent_path_in_diff: OG_PATH
			co_parent_path_in_diff: STRING
			ca_clone: C_ATTRIBUTE
		do
			-- traverse flat output and mark every node as inherited
			arch_flat_out.definition.set_subtree_specialisation_status (ss_inherited)

			-- intialise tuple post-processing list
			tuple_objects.wipe_out

			-- do all nodes
			create def_it.make (arch_diff_child.definition)
			def_it.do_until_surface (agent overlay_node, agent overlay_test)

			-- do root node
			arch_flat_out.definition.overlay_differential_root (arch_diff_child.definition)

			-- now graft in any 'ADD' C_ATTRIBUTEs on root node
			across arch_diff_child.definition.attributes as diff_attrs_csr loop
				-- non-differential path top level attribute to be added
				if not diff_attrs_csr.item.has_differential_path then
					if not arch_flat_out.definition.has_attribute (diff_attrs_csr.item.rm_attribute_name) then
						arch_flat_out.definition.put_attribute (diff_attrs_csr.item.safe_deep_twin)
					end
				-- differential path attribute to be added deeper down
				else
					og_ca_path_in_diff := diff_attrs_csr.item.og_path
					if not arch_flat_out.definition.has_path (og_ca_path_in_diff.as_string) then
						og_co_parent_path_in_diff := og_ca_path_in_diff.parent_path
						co_parent_path_in_diff := og_co_parent_path_in_diff.as_string

						-- if parent path not findable, overlay it, it must contain some id overrides
						if not arch_flat_out.definition.has_object_path (co_parent_path_in_diff) then
							overlay_differential_path (og_co_parent_path_in_diff)
						end

						if arch_flat_out.definition.has_object_path (co_parent_path_in_diff) then
							ca_clone := diff_attrs_csr.item.safe_deep_twin
							ca_clone.clear_differential_path
							if attached {C_COMPLEX_OBJECT} arch_flat_out.definition.object_at_path (co_parent_path_in_diff) as att_cco then
								att_cco.put_attribute (ca_clone)
							end
						else
							raise ("flatten_definition loction #1 - can't find overlay location for C_COMPLEX_OBJECT at " + co_parent_path_in_diff + " %N")
						end
					end
				end
			end

			-- perform tuple post processing
			process_tuple_objects
		end

	overlay_node (ac_diff_node: ARCHETYPE_CONSTRAINT; depth: INTEGER)
			-- perform overlays of C_ATTRIBUTE node from differential archetype on corresponding node in
			-- flat parent.
		require
			attached arch_flat_out
		local
			apa: ARCHETYPE_PATH_ANALYSER
			ca_path_in_output: STRING
			ca_output, ca_in_anc_flat: C_ATTRIBUTE
			co_copy: C_OBJECT
		do
			if attached {C_ATTRIBUTE} ac_diff_node as ca_diff then
				-- --------------------- STEP 1: locate node in flat output -------------------------
				-- First we have to figure out path of overlay location in output flat. It could be:
				-- 	* the exact path of the differential C_ATTRIBUTE (including any differential path)
				-- 	* the flat parent form of this path, if no previous overlays have overridden any
				--	  object nodes in the path.
				ca_path_in_output := ca_diff.path
				if not arch_flat_out.has_path (ca_path_in_output) then
					-- --------------------- STEP 2: perform any differential path node_id overrides -------------------------
					--  this supports the ability of a differential path to contain an override of an id code in it.
					if ca_diff.has_differential_path then
						-- there must be id-code overrides in the differential path; we need to overlay these
						-- into the output archetype structure
						overlay_differential_path (ac_diff_node.og_path)
					else
						raise ("overlay_node loction #1 - can't find overlay location for C_ATTRIBUTE at " + ca_path_in_output + " %N")
					end
				end
				ca_output := arch_flat_out.attribute_at_path (ca_path_in_output)

				-- figure out the corresponding C_ATTRIBUTE node in the flat ancestor
				create apa.make (ca_diff.og_path)
				check attached {C_ATTRIBUTE} arch_flat_anc.attribute_at_path (apa.path_at_level (arch_flat_anc.specialisation_depth)) as att_ca then
					ca_in_anc_flat := att_ca
				end

				-- --------------------- STEP 3: perform C_ATTRIBUTE overrides -------------------------
				if ca_diff.is_prohibited then -- existence = {0}; remove the attribute completely
					-- mark - for correct data validation we need the attribute marked as prohibited
					-- otherwise it appears that the attribute is allowed
					-- It will be removed during full template expansion
					ca_output.set_prohibited
					ca_output.remove_all_children
					ca_output.set_specialisation_status_redefined
				else
					-- all attributes: overlay the attribute existence if that has been changed
					if attached ca_diff.existence then
						ca_output.set_existence (ca_diff.existence.deep_twin)
						ca_output.set_specialisation_status_redefined
					end

					-- --------------------- STEP 4: process C_ATTRIBUTE children -------------------------
					-- attribute in a tuple constraint: remove all chid C_OBJs and do a complete replacement
					if ca_diff.is_second_order_constrained then
						ca_output.remove_all_children
						across ca_diff.children as cpo_csr loop
							co_copy := cpo_csr.item.safe_deep_twin
							co_copy.set_specialisation_status_redefined
							ca_output.put_child (co_copy)
						end

						-- record the parent object in the output flat in the tuple post-processing list
						if attached ca_output.parent as att_cco then
							tuple_objects.extend (att_cco)
						end

					-- if a container attribute then do a merge
					elseif ca_diff.is_multiple then
						-- overlay the cardinality if that was changed
						if attached ca_diff.cardinality then
							ca_output.set_cardinality (ca_diff.cardinality.deep_twin)
							ca_output.set_specialisation_status_redefined
						end
						-- for container attributes in the source archetype, we build a merge list to properly deal with 'after'
						-- and 'before' keywords in differential archetype
						build_merge_list (ca_output, ca_diff)
						across merge_list as merge_list_csr loop
							do_merge (ca_output, ca_diff, ca_in_anc_flat, merge_list_csr.item)
						end

					-- if a single-valued attribute then do a merge of alternates
					else
						-- handle C_PRIMITVE_OBJECTs here
						if attached {C_PRIMITIVE_OBJECT} ca_diff.first_child as cpo and then attached {C_COMPLEX_OBJECT} ca_output.first_child then
							ca_output.replace_child_by_id (ca_diff.first_child, ca_output.first_child.node_id)
						else
							-- do the merge with a synthesised merge descriptor that just says merge everything to the end
							do_merge (ca_output, ca_diff, ca_in_anc_flat, [1, ca_diff.child_count, Void, False])
						end
					end
				end
			end
		end

	overlay_test (a_c_node: ARCHETYPE_CONSTRAINT): BOOLEAN
			-- return True if a conformant path of a_c_node in the differential archetype is found within the flat
			-- parent archetype - i.e. a_c_node is inherited or redefined from parent (but not new)
		local
			apa: ARCHETYPE_PATH_ANALYSER
		do
			create apa.make (a_c_node.og_path)
			Result := arch_flat_anc.has_path (apa.path_at_level (arch_flat_anc.specialisation_depth))
		end

	overlay_differential_path (an_og_diff_path: OG_PATH)
			-- overlay a differential path onto the flat output structure. Only call for paths that
			-- are not findable in the output; it means that the path contains a specialised id-code
			-- that needs to be written into the output; the path will then be findable
		require
			not arch_flat_out.definition.has_path (an_og_diff_path.as_string)
		local
			ca_csr: C_ATTRIBUTE
			cco_csr: C_COMPLEX_OBJECT
			set_spec_sts: BOOLEAN
		do
			cco_csr := arch_flat_out.definition
			across an_og_diff_path as og_path_csr loop
				-- navigate to C_ATTRIBUTE
				ca_csr := cco_csr.attribute_with_name (og_path_csr.item.attr_name)

				-- navigate to C_COMPLEX_OBJECT & adjust id if needed:
				if og_path_csr.item.is_addressable then
					set_spec_sts := False
					if specialisation_depth_from_code (og_path_csr.item.object_id) = arch_diff_child.specialisation_depth then
						ca_csr.replace_node_id (code_at_level (og_path_csr.item.object_id, arch_flat_anc.specialisation_depth), og_path_csr.item.object_id)
					end
					check attached {C_COMPLEX_OBJECT} ca_csr.child_with_id (og_path_csr.item.object_id) as att_cco then
						cco_csr := att_cco
						if set_spec_sts then
							cco_csr.set_specialisation_status_redefined
						end
					end
				elseif ca_csr.has_children then
					if attached {C_COMPLEX_OBJECT} ca_csr.first_child as att_cco then
						cco_csr := att_cco
					end
				end
			end
		ensure
			arch_flat_out.definition.has_path (an_og_diff_path.as_string)
		end

	build_merge_list (ca_output, ca_diff: C_ATTRIBUTE)
			-- build merge list for merging objects in container attribute `ca_diff' into the corresponding
			-- container attribute `ca_output' in the output structure, using ordering information in source
			-- attribute objects, and replacing or inserting as appropriate.
			-- The merge list is used like a set of transactions to be processed in the routine `do_merge'
		require
			Non_empty_attribute: ca_output.has_children
		local
			co_output_csr: C_OBJECT
			after_pending: BOOLEAN
			start_pos, end_pos: INTEGER
			sibling_anchor: SIBLING_ORDER
			co_list: ARRAYED_LIST [C_OBJECT]
		do
			merge_list.wipe_out
			start_pos := 1
			co_output_csr := ca_output.first_child
			co_list := ca_diff.children
			from co_list.start until co_list.off loop
				-- find the next ordering marker, or end of list
				from until co_list.off or attached co_list.item.sibling_order loop
					co_list.forth
				end

				if not co_list.off then
					check attached co_list.item.sibling_order as att_so then
						sibling_anchor := att_so
					end

					-- grab pending series from start_pos to here -1 and make a merge record for it
					if after_pending then
						end_pos := co_list.index - 1
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
						co_output_csr := ca_output.child_with_id (code_at_level (sibling_anchor.sibling_node_id, arch_flat_anc.specialisation_depth))
					end

					-- if the order marker is 'before', it means that the merge list is from the last
					-- point already taken care of + 1, until the current object, and the merge target in the
					-- output structure is the object with the same id as the last object just found, carrying
					-- the 'before' marker
					if sibling_anchor.is_before then
						end_pos := co_list.index
						add_merge_desc (start_pos, end_pos, co_output_csr, True)
						start_pos := end_pos + 1

					-- marker is 'after' - this means that all the objects from the last position dealt with,
					-- up until the one with the marker on it (but not including it); so we need to merge
					-- that list before the csr position object in the output list; then we need to reset the
					-- source list start_pos to the item with the 'after' marker, and the output list cursor object
					-- to the object with the same id as the object holding the 'after' marker
					else
						-- create a descriptor for the preceding section
						if not co_list.isfirst and co_list.index > start_pos then
							add_merge_desc (start_pos, co_list.index - 1, co_output_csr, True)
						end
						-- now take care of series starting with current 'after' marker
						start_pos := co_list.index
						after_pending := True
					end
					co_list.forth
				else
					-- set the co_output_insert_pos to the last item in the flat under this attribute - i.e. the child archetype
					-- object nodes will be merged after the end of the existing ones in the flat
					co_output_csr := ca_output.children.last
					add_merge_desc (start_pos, co_list.count, co_output_csr, False)
					after_pending := False
				end
			end

			-- grab the series from start_pos to here -1 and make a desc for it
			if after_pending then
				add_merge_desc (start_pos, co_list.count, co_output_csr, False)
			end
		end

	do_merge (ca_output, ca_diff, ca_anc: C_ATTRIBUTE; merge_desc: like merge_list.item)
			-- merge `ca_diff's children into `ca_output'. `ca_anc' is the corresponding flat ancestor node,
			-- needed where cloning occurs
		local
			co_child_diff, new_obj: C_OBJECT
			node_id_in_flat_anc: STRING
			co_output_insert_pos, co_override_target, co_override_candidate: detachable C_OBJECT
			i: INTEGER
			co_child_spec_sts: INTEGER
			clone_needed: BOOLEAN
		do
			co_output_insert_pos := merge_desc.co_output_insert_pos
			from i := merge_desc.start_pos until i > merge_desc.end_pos loop
				co_child_diff := ca_diff.children.i_th (i)
				co_child_spec_sts := specialisation_status_from_code (co_child_diff.node_id, arch_diff_child.specialisation_depth)
				node_id_in_flat_anc := code_at_level (co_child_diff.node_id, arch_flat_anc.specialisation_depth)
				co_override_target := Void

				-- ================== Direct REPLACE: child node id is same as that of object in ancestor  ================
				if ca_output.has_child_with_id (co_child_diff.node_id) then
					co_override_target := ca_output.child_with_id (co_child_diff.node_id)

					-- ------ REMOVE: delete node in output --------
					if co_child_diff.is_prohibited then
						-- capture insert point before doing deletion
						check attached co_override_target end
						if attached ca_output.child_after (co_override_target) as att_co then
							co_output_insert_pos := att_co
						elseif attached ca_output.child_before (co_override_target) as att_co then
							co_output_insert_pos := att_co
						end
						ca_output.remove_child (co_override_target)

					else
						overlay_child (ca_output, co_override_target, co_child_diff)
					end

				-- ===================== Logical REDEFINE: child node id is specialised in this level ========================
				elseif ca_anc.has_child_with_id (node_id_in_flat_anc) then

					clone_needed := False

					-- REDEFINE: node with parent node_id still available in flat output
					if ca_output.has_child_with_id (node_id_in_flat_anc) then
						co_override_candidate := ca_output.child_with_id (node_id_in_flat_anc)

						-- --------- REDEFINE of ARCHETYPE_SLOT by C_ARCHETYPE_ROOT: ALWAYS add filler --------
						if attached {C_ARCHETYPE_ROOT} co_child_diff and attached {ARCHETYPE_SLOT} co_override_candidate as att_slot then
							new_obj := co_child_diff.safe_deep_twin
							new_obj.set_specialisation_status_redefined
							ca_output.put_child_left (new_obj, att_slot)
						else
							co_override_target := co_override_candidate

							-- determine if clone needed: we don't clone if:
							--	* override target has max occurrences = 1 set OR
							--	* child diff obj being processed is sole child of its parent, and has max occurrences = 1
							clone_needed := not (co_override_target.is_occurrences_upper_one or
								ca_diff.aggregate_occurrences_upper_is_one (node_id_in_flat_anc))
						end

					-- REDEFINE: node with parent node_id only available in flat ancestor - this means that in the flat output,
					-- an object with the parent node id has already been overridden - cloning is unavoidable
					else
						clone_needed := True
					end

					if clone_needed then
						co_override_target := ca_anc.child_with_id (node_id_in_flat_anc).safe_deep_twin
						co_override_target.set_node_id (co_child_diff.node_id)
						co_override_target.set_subtree_specialisation_status (ss_inherited)
						co_override_target.set_specialisation_status_redefined
						if attached co_output_insert_pos as att_co_ins_pos then
							if merge_desc.before_flag then
								ca_output.put_child_left (co_override_target, att_co_ins_pos)
							else
								ca_output.put_child_right (co_override_target, att_co_ins_pos)
								co_output_insert_pos := co_override_target
							end
						else
							ca_output.put_child (co_override_target)
						end
					end

					if attached co_override_target as att_tgt then
						overlay_child (ca_output, att_tgt, co_child_diff)
					end

				-- ------- ADD new: detect via node id --------
				-- if node_id indicates it is is to be added new in this level, e.g. something like id0.3 in level 2, add the node
				elseif co_child_spec_sts = ss_added then
					new_obj := co_child_diff.safe_deep_twin
					new_obj.deep_set_specialisation_status_added
					if attached co_output_insert_pos as att_co_ins_pos then
						if merge_desc.before_flag then
							ca_output.put_child_left (new_obj, att_co_ins_pos)
						else
							ca_output.put_child_right (new_obj, att_co_ins_pos)
							co_output_insert_pos := new_obj
						end
					else
						ca_output.put_child (new_obj)
					end

				else
					raise ("do_merge location #1 - child archetype node with path " + co_child_diff.path + " can't be flattened")
				end

				-- -------- Deal with C_COMPLEX_OBJECT sub-structure in override cases ------------						
				-- graft in any C_ATTRIBUTEs under the differential C_COMPLEX_OBJECT which are new (ADDs) with respect to
				-- the flat output C_ATTRIBUTE, and have not yet been cloned or copied above
				if attached {C_COMPLEX_OBJECT} co_override_target as att_output_cco and attached {C_COMPLEX_OBJECT} co_child_diff as att_diff_cco then
					across att_diff_cco.attributes as diff_attrs_csr loop
						if not diff_attrs_csr.item.has_differential_path and not att_output_cco.has_attribute (diff_attrs_csr.item.rm_attribute_name) then
							att_output_cco.put_attribute (diff_attrs_csr.item.safe_deep_twin)
						end
					end
				end

				i := i + 1
			end
		end

	overlay_child (ca_output: C_ATTRIBUTE; co_override_target, co_child_diff: C_OBJECT)
			-- perform a node-level overlay with a target output node and a source child node
		require
			Target_is_child_of_attr_node: ca_output.has_child (co_override_target)
			Nodes_have_same_id: co_override_target.node_id.same_string (co_child_diff.node_id)
		local
			new_obj: C_OBJECT
		do
			-- ------ REPLACE C_COMPLEX_OBJECT with any_allowed - complete replace, regardless of AOM subtype -----
			-- ------ REPLACE C_PRIMITIVE_OBJECT - complete replace, regardless of AOM subtype -----
			if attached {C_COMPLEX_OBJECT} co_override_target as att_cco and then att_cco.any_allowed and then not attached {C_COMPLEX_OBJECT} co_child_diff or
				attached {C_PRIMITIVE_OBJECT} co_child_diff
			then
				new_obj := co_child_diff.safe_deep_twin
				ca_output.replace_child_by_id (new_obj, co_child_diff.node_id)
				new_obj.set_specialisation_status_redefined

			-- ------ Any other REPLACE: just do local node override ---------
			else
				ca_output.overlay_differential (co_override_target, co_child_diff)
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

	process_tuple_objects
		local
			new_attr_tuple: C_ATTRIBUTE_TUPLE
		do
			across tuple_objects as cco_csr loop
				if attached cco_csr.item.attribute_tuples as att_ca_tuples then
					across att_ca_tuples as ca_tuple_csr loop
						-- create a new attribute tuple in the output flat
						create new_attr_tuple.make

						-- connect up the attributes
						across ca_tuple_csr.item as ca_csr loop
							new_attr_tuple.put_member (cco_csr.item.attribute_with_name (ca_csr.item.rm_attribute_name))
						end

						new_attr_tuple.rebuild
						if cco_csr.item.has_comparable_attribute_tuple (new_attr_tuple) then
							cco_csr.item.replace_comparable_attribute_tuple (new_attr_tuple)
						else
							cco_csr.item.put_attribute_tuple (new_attr_tuple)
						end
					end
				end
			end
		end

	tuple_objects: ARRAYED_SET [C_COMPLEX_OBJECT]
		attribute
			create Result.make (0)
		end

	flatten_rules
			-- build the flat archetype invariants as the sum of parent and source invariants
		do
			if arch_diff_child.has_rules then
				across arch_diff_child.rules as rules_csr loop
					arch_flat_out.add_rule (rules_csr.item.deep_twin)
				end
			end
		end

	flatten_terminology
			-- build the flat archetype ontology as the sum of parent and source ontologies
		do
			arch_flat_out.terminology.merge (arch_diff_child.terminology)
		end

	flatten_annotations
			-- build a flattened form of the annotations, by merging everything found in child into flat parent annotations
		do
			arch_flat_out.merge_annotations_from_resource (arch_diff_child)
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
			matched_arch: ARCH_LIB_ARCHETYPE_ITEM
		do
debug ("flatten")
	io.put_string ("&&&&&& flattening template root nodes &&&&&&%N")
end
			-- limit depth in case of recursive inclusion
			if depth <= Max_template_overlay_depth then
				across a_flat_arch.suppliers_index as xref_idx_csr loop
					-- get the definition structure of the flat archetype corresponding to the archetype id in the suppliers list
					check attached current_library.archetype_matching_ref (xref_idx_csr.key) as att_ala then
						matched_arch := att_ala
					end

					-- prevent cycling due to inclusion of current archetype (FIXME: won't catch indirect recursion)
					if not matched_arch.id.physical_id.is_equal (a_flat_arch.archetype_id.physical_id) then
						create supp_flat_arch.make_from_other (matched_arch.flat_archetype)
						supp_arch_root_cco := supp_flat_arch.definition

						-- get list of C_ARCHETYPE_ROOT nodes in this archetype or template corresponding to the supplier
						-- archetype id xref_idx.key_for_iteration into each one of these C_ARCHETYPE_ROOT nodes, clone the
						-- flat definition structure from the supplier archetype
						across xref_idx_csr.item as c_arch_roots_csr loop
							if not c_arch_roots_csr.item.has_attributes and not c_arch_roots_csr.item.is_prohibited then -- it is empty and needs to be filled
								-- perform overlays on supplier archetype first
								template_overlay_supplier_definitions (supp_flat_arch, depth + 1)
debug ("flatten")
	io.put_string ("%T node at " + c_arch_roots_csr.item.path +
	" with " + xref_idx_csr.key + "%N")
end
								c_arch_roots_csr.item.convert_to_flat (matched_arch.id.physical_id)
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
		end

	template_overlay_supplier_terminologies
			-- process `template_ontology_overlay_list' to overlay target terminologies.
		local
			ont: FLAT_ARCHETYPE_TERMINOLOGY
		do
debug ("flatten")
	io.put_string ("&&&&&& flattening template terminologies &&&&&&%N")
end
			if attached {OPERATIONAL_TEMPLATE} arch_flat_out as opt then
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


