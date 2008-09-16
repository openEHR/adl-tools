indexing
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
		export {NONE}
			all
		end

create
	make

feature -- Initialisation

	make(a_flat_archetype: FLAT_ARCHETYPE; a_src_archetype: DIFFERENTIAL_ARCHETYPE) is
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

feature -- Access

	arch_parent_flat: FLAT_ARCHETYPE
			-- flat archetype of parent, if applicable

	arch_child_diff: DIFFERENTIAL_ARCHETYPE
			-- archetype for which flat form is being generated

	arch_output_flat: FLAT_ARCHETYPE
			-- generated flat archetype - logically an overlay of `arch_parent_flat' and `arch_child_diff'

feature -- Commands

	flatten_archetype is
			-- create a flat form archetype in `arch_output_flat'
		do
			debug ("flatten")
				io.put_string ("============== flattening archetype " + arch_child_diff.archetype_id.as_string + " with " +
						arch_parent_flat.archetype_id.as_string + " ==============%N")
			end
			create arch_output_flat.make_staging (arch_child_diff, arch_parent_flat)

			expand_definition_use_nodes
			flatten_definition
			flatten_invariants
			flatten_ontology
			arch_output_flat.set_parent_archetype_id (arch_parent_flat.archetype_id)
			arch_output_flat.set_is_valid (True)
		ensure
			arch_output_flat /= Void
		end

feature -- Comparison

	comparable_archetypes(a_flat_archetype: FLAT_ARCHETYPE; a_src_archetype: DIFFERENTIAL_ARCHETYPE): BOOLEAN is
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

	expand_definition_use_nodes is
			-- if there are overrides in the specialised child that are located at use_node positions, we
			-- have to expand out a copy of the structures pointed to by the use_nodes in the parent, so that
			-- the override can be correctly applied.
		local
			int_refs: ARRAYED_LIST[ARCHETYPE_INTERNAL_REF]
			c_obj: C_OBJECT
			child_paths: ARRAYED_LIST [STRING]
			apa: ARCHETYPE_PATH_ANALYSER
			a_path: STRING
		do
			child_paths := arch_child_diff.physical_paths.deep_twin
			child_paths.compare_objects
			from
				child_paths.start
			until
				child_paths.off
			loop
				create apa.make_from_string (child_paths.item)
				a_path := apa.path_at_level (arch_parent_flat.specialisation_depth)
				child_paths.replace (a_path)
				child_paths.forth
			end

			-- iterate through use nodes in parent and find any source paths that are matched by any paths
			-- within the child archetype; clone the structure at the target location and replace the use_node
			-- the flattened structure with it, so that the override will work properly.
			from
				arch_output_flat.use_node_index.start
			until
				arch_output_flat.use_node_index.off
			loop
				int_refs := arch_output_flat.use_node_index.item_for_iteration
				from
					int_refs.start
				until
					int_refs.off
				loop
					debug ("flatten")
						io.put_string ("%T...checking path " + int_refs.item.path + "%N")
					end
					if child_paths.has (int_refs.item.path) then
						debug ("flatten")
							io.put_string ("%T...cloning node at " + arch_output_flat.use_node_index.key_for_iteration + " and replacing at " + int_refs.item.path + "%N")
						end
						c_obj := arch_output_flat.c_object_at_path (arch_output_flat.use_node_index.key_for_iteration).safe_deep_twin
						int_refs.item.parent.replace_child_by_id (c_obj, int_refs.item.node_id)
					end
					int_refs.forth
				end
				arch_output_flat.use_node_index.forth
			end
			arch_output_flat.rebuild
		end

	flatten_definition is
			-- build the flat archetype definition by traversing src_archetype and determining what
			-- nodes from flat_archetype to add; do the changes to the output archetype
		local
			def_it: C_ITERATOR
		do
			create path_list.make(0)
			path_list.compare_objects
			create def_it.make(arch_child_diff.definition)
			def_it.do_until_surface(agent node_graft, agent node_test)
			arch_output_flat.rebuild
		end

	flatten_invariants is
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

	flatten_ontology is
			-- build the flat archetype ontology as the sum of parent and source ontologies
		do
			arch_output_flat.ontology.merge(arch_parent_flat.ontology)
		end

	node_graft (a_c_node: ARCHETYPE_CONSTRAINT; depth: INTEGER)  is
			-- perform grafts of node from differential archetype on corresponding node in flat parent
			-- only interested in C_COMPLEX_OBJECTs
		local
			cco_output_flat: C_COMPLEX_OBJECT
			apa: ARCHETYPE_PATH_ANALYSER
			a_path: STRING
			child_attr_name: STRING
			c_attr_child, c_attr_output: C_ATTRIBUTE
			int_refs: ARRAYED_LIST[ARCHETYPE_INTERNAL_REF]
			found: BOOLEAN
		do
			if {cco_child_diff: !C_COMPLEX_OBJECT} a_c_node then
				create apa.make_from_string (cco_child_diff.path)
				a_path := apa.path_at_level (arch_parent_flat.specialisation_depth)
				debug ("flatten")
					io.put_string ("---------- at child differential object node " + cco_child_diff.path + " ---------%N")
					io.put_string ("%Tsee if output object node at " + a_path + " exists ... ")
				end
				-- check that path exists in nodes defined by value in flat parent
				if arch_output_flat.has_path (a_path) then
					debug ("flatten")
						io.put_string ("YES%N")
					end

					if path_list.has(a_path) then -- check for path that has been overlaid by a redefined node; have to graft in entire object as a sibling
						debug ("flatten")
							io.put_string ("WAS REPLACED - grafting sibling object " + cco_child_diff.path + "%N")
						end
						c_attr_output := arch_output_flat.definition.c_attribute_at_path (cco_child_diff.parent.path)
						c_attr_output.put_sibling_child(cco_child_diff.safe_deep_twin)
					else
						cco_output_flat ?= arch_output_flat.c_object_at_path (a_path)

						-- firstly, add overrides from immediate child node to corresponding flat node
						if cco_output_flat.parent /= Void then
							cco_output_flat.parent.overlay_differential(cco_output_flat, cco_child_diff)
						else
							cco_output_flat.overlay_differential(cco_child_diff)
						end

						-- iterate through child attributes and overlay a) new nodes in existing container attributes, and b) new attributes from child
						from
							cco_child_diff.attributes.start
						until
							cco_child_diff.attributes.off
						loop
							child_attr_name := cco_child_diff.attributes.item.rm_attribute_name
							debug ("flatten")
								io.put_string ("%T%Tattribute in child: " + child_attr_name + " ... ")
							end

							-- for attributes that are found in the flat parent tree, we need to check which of their children
							-- if any need to be cloned into the output
							if cco_output_flat.has_attribute (child_attr_name) then
								debug ("flatten")
									io.put_string ("found attr " + child_attr_name + " in parent %N")
								end

								-- for container attributes in the source archetype, we graft in new elements; overrides will be
								-- handled by being traversed by this routine later
								c_attr_child := cco_child_diff.c_attribute_at_path (child_attr_name)
								c_attr_output := cco_output_flat.c_attribute_at_path(child_attr_name)
								if c_attr_child.is_multiple then
									-- graft the cardinality if that has been changed
									if not c_attr_child.cardinality.interval.is_equal (c_attr_output.cardinality.interval) then
										c_attr_output.set_cardinality (c_attr_child.cardinality.deep_twin)
									end
									debug ("flatten")
										io.put_string ("%T merge container attribute at " + c_attr_child.path + " into output%N")
									end
									merge_container_attribute(c_attr_output, c_attr_child)
								else -- for single-valued attributes, have to merge any non-CCO children
									debug ("flatten")
										io.put_string ("%T merge single attribute at " + c_attr_child.path + " into output%N")
									end
									merge_single_attribute(c_attr_output, c_attr_child)
								end
							else  -- otherwise just do a deep clone of the whole attribute from the child flat to the output
								c_attr_child := cco_child_diff.attributes.item.safe_deep_twin
								debug ("flatten")
									io.put_string ("in child only; deep_clone attribute at " + c_attr_child.path +
										" from diff child and graft to " + cco_output_flat.path + " in output%N")
								end
								cco_output_flat.put_attribute (c_attr_child)
							end
							cco_child_diff.attributes.forth
						end

						-- record path in case sibling objects turn up
						path_list.extend(a_path)
					end
				else
					debug ("flatten")
						io.put_string ("NO - ERROR%N")
					end
				end
			end
		end

	merge_container_attribute(c_attr_output, c_attr_child: C_ATTRIBUTE) is
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
				c_attr_child.children.start
				start_pos := 1
				insert_obj := c_attr_output.children.first
			until
				c_attr_child.children.off
			loop
				-- find the next ordering marker, or end of list
				from
				until
					c_attr_child.children.off or c_attr_child.children.item.sibling_order /= Void
				loop
					c_attr_child.children.forth
				end

				if not c_attr_child.children.off then
					if after_pending then
						-- grab the series from start_pos to here -1 and make a desc for it
						end_pos := c_attr_child.children.index - 1
						add_merge_desc(start_pos, end_pos, insert_obj, False)
						after_pending := False
						start_pos := end_pos + 1
					end

					if c_attr_child.children.item.sibling_order.is_before then
						end_pos := c_attr_child.children.index
						insert_obj := c_attr_output.child_with_id(c_attr_child.children.item.sibling_order.sibling_node_id)
						add_merge_desc(start_pos, end_pos, insert_obj, True)
						start_pos := end_pos + 1
					else -- marker is 'after' - obtain any preceding series and make a descriptor for that
						if not c_attr_child.children.isfirst and c_attr_child.children.index > start_pos then -- create a descriptor for the preceding section
							add_merge_desc(start_pos, c_attr_child.children.index - 1, insert_obj, True)
						end
						-- now take care of series starting with current 'after' marker
						start_pos := c_attr_child.children.index
						insert_obj := c_attr_output.child_with_id(c_attr_child.children.item.sibling_order.sibling_node_id)
						after_pending := True
					end
					c_attr_child.children.forth
				else
					insert_obj := c_attr_output.children.last
					add_merge_desc(start_pos, c_attr_child.children.count, insert_obj, False)
					after_pending := False
				end
			end
			if after_pending then -- grab the series from start_pos to here -1 and make a desc for it
				add_merge_desc(start_pos, c_attr_child.children.count, insert_obj, False)
			end

			-- now use the merge descriptors to clone objects of the (differential) source list onto the target (flat) output list,
			-- ignoring any redefined nodes - only handle new ones
			from
				merge_list.start
			until
				merge_list.off
			loop
				insert_obj ?= merge_list.item.reference_item (3)
				from
					i := merge_list.item.integer_item (1)
				until
					i > merge_list.item.integer_item (2)
				loop
					if is_valid_code (c_attr_child.children.i_th (i).node_id) and
						specialisation_status_from_code (c_attr_child.children.i_th (i).node_id, arch_child_diff.specialisation_depth).value = ss_added then

						c_obj := c_attr_child.children.i_th (i).safe_deep_twin
						c_obj.clear_sibling_order
						if merge_list.item.boolean_item (4) then -- True = insert before
							c_attr_output.put_child_left(c_obj, insert_obj)
						else
							c_attr_output.put_child_right(c_obj, insert_obj)
							insert_obj := c_attr_output.child_after (insert_obj)
						end
					end
					i := i + 1
				end
				merge_list.forth
			end
		end

	merge_single_attribute(c_attr_output, c_attr_child: C_ATTRIBUTE) is
			-- merge objects from a single-valued attribute (multiple objects if alternatives defined) which are either new
			-- in the specialised attribute, or are non C_COMPLEX_OBJECTs (if they are the latter, they will get traversed
			-- normally by node_graft())
		local
			rm_super_classes: ARRAYED_LIST [STRING]
		do
			from
				c_attr_child.children.start
			until
				c_attr_child.children.off
			loop
				if not {cco: !C_COMPLEX_OBJECT} c_attr_child.children.item then
					if c_attr_child.children.item.is_addressable then -- if identified, find corresponding node in parent & replace completely
						c_attr_output.replace_child_by_id (c_attr_child.children.item.deep_twin,
							specialisation_parent_from_code_at_level (c_attr_child.children.item.node_id, arch_parent_flat.specialisation_depth))
					elseif c_attr_output.has_child_with_rm_type_name(c_attr_child.children.item.rm_type_name) then -- find a node of same type, then replace completely
						c_attr_output.replace_child_by_rm_type_name (c_attr_child.children.item.deep_twin)
					else -- or a RM parent type, then add
						rm_super_classes := rm_checker.super_classes_of(c_attr_child.children.item.rm_type_name)
						from
							rm_super_classes.start
						until
							rm_super_classes.off or c_attr_output.has_child_with_rm_type_name(rm_super_classes.item)
						loop
							rm_super_classes.forth
						end
						if not rm_super_classes.off then
							c_attr_output.put_child (c_attr_child.children.item.deep_twin)
						end
					end
				end
				c_attr_child.children.forth
			end
		end

	merge_list: ARRAYED_LIST [TUPLE [INTEGER, INTEGER, C_OBJECT, BOOLEAN]]
			-- merge descriptor list of TUPLEs of the following structure:
			--		start pos in source list: INTEGER
			--		end pos in source list: INTEGER
			-- 		insert obj in target list: C_OBJECT (can't be an index, because insertions will make the list change)
			-- 		operation: BOOLEAN; True = prepend before, False = append after

	add_merge_desc(src_start_pos, src_end_pos: INTEGER; tgt_insert_obj: C_OBJECT; before_flag: BOOLEAN) is
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
				io.put_string ("%T%T=== added MERGE DESC " + src_start_pos.out + ", " + src_end_pos.out + ", " + tgt_insert_obj.node_id + ", " + before_flag.out + "%N")
			end
		end

	node_test (a_c_node: ARCHETYPE_CONSTRAINT): BOOLEAN  is
			-- return True if a conformant path of a_c_node within the differential archetype is
			-- found within the flat parent archetype - i.e. a_c_node is inherited or redefined from parent (but not new)
		local
			apa: ARCHETYPE_PATH_ANALYSER
		do
			create apa.make_from_string(a_c_node.path)
			Result := arch_parent_flat.has_path (apa.path_at_level (arch_parent_flat.specialisation_depth))
		end

	path_list: ARRAYED_LIST [STRING]
			-- list of paths matched in parent archetype by child archetype nodes. Used to remember paths that
			-- disappear due to being overwritten by a specialised node (e.g. at0013 becomes at0013.1 in the flat output)
			-- but then specialised siblings (e.g. at0013.2, at0013.3) turn up and need to be grafted in.

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
