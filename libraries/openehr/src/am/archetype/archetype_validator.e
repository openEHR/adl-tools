indexing
	component:   "openEHR Archetype Project"
	description: "[
				 Validator of standalone archetype (i.e. without reference to parent archetypes
				 in the case of specialised archetypes). The validation done here checks the use
				 of codes defined in the ontology against their use in the definition of the 
				 archetype.
		         ]"
	keywords:    "constraint model"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.com>"
	copyright:   "Copyright (c) 2007 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class ARCHETYPE_VALIDATOR

inherit
	AUTHORED_RESOURCE_VALIDATOR
		rename
			make as make_authored_resource
		redefine
			target, validate
		end

	ARCHETYPE_TERM_CODE_TOOLS
		export
			{NONE} all
		end

	ADL_SYNTAX_CONVERTER
		export
			{NONE} all
		end

	OPERATOR_TYPES
		export
			{NONE} all
		end

	SHARED_ARCHETYPE_DIRECTORY
		export
			{NONE} all
		end

	SHARED_REFERENCE_MODEL_ACCESS
		export
			{NONE} all
		end

	INTERNAL
		export
			{NONE} all
		end

create
	make

feature {NONE} -- Initialisation

	make (a_target_desc: like target_descriptor) is
			-- set target_descriptor
			-- initialise reporting variables
		require
			target_desc_attached: a_target_desc /= Void
			target_desc_valid: a_target_desc.archetype_differential /= Void
		do
			target_descriptor := a_target_desc
			make_authored_resource(target_descriptor.archetype_differential)
			if target_descriptor.is_specialised then
				if target_descriptor.specialisation_parent = Void then
					add_error("validate_e1", Void)
				elseif not target_descriptor.specialisation_parent.is_valid then
					add_error("validate_e2", Void)
				else
					flat_parent := target_descriptor.specialisation_parent.archetype_flat
				end
			end
		ensure
			target_descriptor_set: target_descriptor = a_target_desc
			target_set: target = a_target_desc.archetype_differential
			Parent_set: (passed and target_descriptor.is_specialised) implies flat_parent /= Void
		end

feature -- Access

	target_descriptor: ARCH_REP_ARCHETYPE
			-- differential archetype being validated

	target: DIFFERENTIAL_ARCHETYPE
			-- differential archetype being validated

	compressed_definition: !C_COMPLEX_OBJECT
			-- path-compressed form of definition of target archetype

	flat_parent: FLAT_ARCHETYPE
			-- flat version of parent archetype, if target is specialised

	ontology: !ARCHETYPE_ONTOLOGY is
			-- The ontology of the current archetype.
		do
			Result := target.ontology
		end

feature -- Validation

	validate is
		do
			if passed then
				validate_basics
				validate_ontology_code_spec_levels
			end

			if passed then
				target.build_xrefs
				report_unused_ontology_codes

				if target.has_slots then
					build_slot_id_index
				end

				Precursor
				validate_languages
				check_unidentified_nodes
			end

			-- validation requiring valid specialisation parent
			if passed and target.is_specialised then
	 			target.set_parent_archetype (target_descriptor.specialisation_parent.archetype_differential)
			end

			-- validation requiring parent links in place for specialised archetype
			if passed then
				validate_definition_codes

				if target.is_specialised then
					target.build_rolled_up_status
					validate_specialised_definition
				end

				validate_internal_references
				validate_invariants
			end

			if passed and rm_checker.model_loaded then
				validate_reference_model
			end
		end

feature {NONE} -- Implementation

	validate_basics
			-- are basic features of archetype structurally intact and correct?
			-- into account validity with respect to parent archetypes.
		do
			passed := False

			if not target_descriptor.id.as_string.is_equal (target.archetype_id.as_string) then
				add_error("validate_e3", <<target_descriptor.id.as_string, target.archetype_id.as_string>>)
			elseif not target.definition.rm_type_name.is_equal (target.archetype_id.rm_entity) then
				add_error("VARDT", <<target.archetype_id.rm_entity, target.definition.rm_type_name>>)
			elseif specialisation_depth_from_code (target.concept) /= target.specialisation_depth then
				add_error("VACSD", <<specialisation_depth_from_code (target.concept).out, target.specialisation_depth.out>>)
			elseif not target.definition.node_id.is_equal (target.concept) then
				add_error("VACCD", <<target.concept>>)
			elseif not target.definition.is_valid then
				-- FIXME - need to check definition validation; possibly this should be
				-- done using another visitor pattern?
				add_error("general_error", <<target.definition.invalid_reason>>)
			elseif not target.ontology.is_valid then
				add_error("general_error", <<target.ontology.errors>>)
			else
				passed := True
			end
		end

	validate_languages is
			-- check to see that all linguistic items in ontology, description, etc
			-- are all coherent
		do
			passed := False

			if not target.languages_available.is_subset (target.ontology.languages_available) then
				add_error("VOTM", Void)
				-- FIXME: Report exactly which languages are missing from the ontology.
			else
				passed := True
			end

			-- FIXME: Check whether languages_available list same as languages in description.details?
		end

	validate_ontology_code_spec_levels
			-- See if there are any codes in the ontology that should not be there - either or lower or higher
			-- level of specialisation.
		local
			code_list: TWO_WAY_SORTED_SET [STRING]
		do
			code_list := ontology.term_codes

			from
				code_list.start
			until
				code_list.off
			loop
				if specialisation_depth_from_code (code_list.item) > ontology.specialisation_depth then
					add_error("VONSD", <<code_list.item>>)
				end

				code_list.forth
			end

			code_list := ontology.constraint_codes

			from
				code_list.start
			until
				code_list.off
			loop
				if specialisation_depth_from_code (code_list.item) > ontology.specialisation_depth then
					add_error("VONSD", <<code_list.item>>)
				end

				code_list.forth
			end
		end

	validate_definition_codes
			-- Check if all at- and ac-codes found in the definition node tree are in the ontology (including inherited items).
			-- Leave `passed' True if all found node_ids are defined in term_definitions,
			-- and term_definitions contains no extras.
		local
			a_codes: HASH_TABLE [ARRAYED_LIST [C_OBJECT], STRING]
			depth: INTEGER
		do
			depth := ontology.specialisation_depth

			a_codes := target.id_atcodes_index
			from
				a_codes.start
			until
				a_codes.off
			loop
				if specialisation_depth_from_code (a_codes.key_for_iteration) > depth then
					add_error("VATCD", <<a_codes.key_for_iteration>>)
				elseif not ontology.has_term_code (a_codes.key_for_iteration) then
					add_error("VATDF", <<a_codes.key_for_iteration>>)
				end
				a_codes.forth
			end

			-- see if every found leaf term code (in an ORDINAL or a CODED_TERM) is in ontology
			a_codes := target.data_atcodes_index

			from
				a_codes.start
			until
				a_codes.off
			loop
				if specialisation_depth_from_code (a_codes.key_for_iteration) > depth then
					add_error("VATCD", <<a_codes.key_for_iteration>>)
				elseif not ontology.has_term_code (a_codes.key_for_iteration) then
					add_error("VATDF", <<a_codes.key_for_iteration>>)
				end

				a_codes.forth
			end

			-- check if all found constraint_codes are defined in constraint_definitions,
			a_codes := target.accodes_index

			from
				a_codes.start
			until
				a_codes.off
			loop
				if specialisation_depth_from_code (a_codes.key_for_iteration) > depth then
					add_error("VATCD", <<a_codes.key_for_iteration>>)
				elseif not ontology.has_constraint_code (a_codes.key_for_iteration) then
					add_error("VATDF", <<a_codes.key_for_iteration>>)
				end

				a_codes.forth
			end
		end

	validate_internal_references
			-- Validate items in `found_internal_references'.
		local
			use_refs: HASH_TABLE [ARRAYED_LIST [ARCHETYPE_INTERNAL_REF], STRING]
		do
			use_refs := target.use_node_index

			from
				use_refs.start
			until
				use_refs.off
			loop
				-- check on paths in the current archetype
				if target.definition.has_path (use_refs.key_for_iteration) then
					convert_use_ref_paths (use_refs.item_for_iteration, use_refs.key_for_iteration, target)
				elseif target.is_specialised and flat_parent.definition.has_path (use_refs.key_for_iteration) then
					convert_use_ref_paths (use_refs.item_for_iteration, use_refs.key_for_iteration, flat_parent)
				else
					add_error("VUNP", <<use_refs.key_for_iteration>>)
				end
				use_refs.forth
			end
		end

	validate_invariants is
			-- validate the invariants if any, which entails checking that all path references are valid against
			-- the flat archetype
		do
			if target.has_invariants then
				from
					target.invariants_index.start
				until
					target.invariants_index.off
				loop
					convert_invariant_paths (target.invariants_index.item_for_iteration, target)
					target.invariants_index.forth
				end
			end
		end

	report_unused_ontology_codes is
			-- populate lists of at-codes and ac-codes found in ontology that
			-- are not referenced anywhere in the archetype definition
		do
			from
				target.ontology_unused_term_codes.start
			until
				target.ontology_unused_term_codes.off
			loop
				add_warning("WOUC", <<target.ontology_unused_term_codes.item>>)
				target.ontology_unused_term_codes.forth
			end

			from
				target.ontology_unused_constraint_codes.start
			until
				target.ontology_unused_constraint_codes.off
			loop
				add_warning("WOUC", <<target.ontology_unused_constraint_codes.item>>)
				target.ontology_unused_constraint_codes.forth
			end
		end

	check_unidentified_nodes is
			-- look for attributes that are either multiple or have multiple alternatives, whose
			-- child objects are not identified, but only if the children are not C_PRIMITIVEs or
			-- C_C_Os whose values are C_PRMITIVEs. Record any such nodes as warnings
		local
			a_c_iterator: C_VISITOR_ITERATOR
			unidentified_node_finder: C_UNIDENTIFIED_NODE_CHECKER
		do
			create unidentified_node_finder.initialise(ontology)
			create a_c_iterator.make(target.definition, unidentified_node_finder)
			a_c_iterator.do_all
			warnings.append(unidentified_node_finder.warnings)
		end

	build_slot_id_index is
			-- build slot_id_index in ARCH_REP_ARCHETYPE
		require
			target.has_slots
		local
			assn_list: ARRAYED_LIST[ASSERTION]
			a_regex: STRING
			id_list: ARRAYED_LIST[STRING]
		do
			from
				target.slot_index.start
			until
				target.slot_index.off
			loop
				-- process the includes
				assn_list := target.slot_index.item.includes
				from
					assn_list.start
				until
					assn_list.off
				loop
					a_regex := extract_regex(assn_list.item)
					if a_regex /= Void then
						target_descriptor.add_slot_ids(archetype_directory.matching_ids (a_regex, target.slot_index.item.rm_type_name), target.slot_index.item.path)
					end
					assn_list.forth
				end

				-- if there are still no ids at all for this path, the implication is that all ids match, and that exclusions will remove some
				if not target_descriptor.has_slots or else not target_descriptor.slot_id_index.has (target.slot_index.item.path) then
					target_descriptor.add_slot_ids (archetype_directory.matching_ids (".*", target.slot_index.item.rm_type_name), target.slot_index.item.path)
				end

				-- process the excludes
				assn_list := target.slot_index.item.excludes
				from
					assn_list.start
				until
					assn_list.off
				loop
					a_regex := extract_regex(assn_list.item)
					if a_regex /= Void then
						id_list := archetype_directory.matching_ids (a_regex, target.slot_index.item.rm_type_name)

						-- go through existing id list and remove any matched by the exclusion list
						from
							id_list.start
						until
							id_list.off
						loop
							target_descriptor.slot_id_index.item (target.slot_index.item.path).prune (id_list.item)
							id_list.forth
						end
					end
					assn_list.forth
				end

				-- now post the results in the reverse indexes
				id_list := target_descriptor.slot_id_index.item (target.slot_index.item.path)
				from
					id_list.start
				until
					id_list.off
				loop
					if not archetype_directory.archetype_id_index.item (id_list.item).is_used or else not
						archetype_directory.archetype_id_index.item (id_list.item).used_by_index.has (target.archetype_id.as_string) then
						archetype_directory.archetype_id_index.item (id_list.item).add_used_by_item (target.archetype_id.as_string)
					end
					id_list.forth
				end

				target.slot_index.forth
			end
		end

	extract_regex(an_assertion: ASSERTION): STRING is
			-- extract regex from id matches {/regex/} style assertion used in slots
		local
			bin_op: EXPR_BINARY_OPERATOR
			a_leaf: EXPR_LEAF
			c_str: C_STRING
		do
			bin_op ?= an_assertion.expression
			if bin_op /= Void and then bin_op.operator.value = op_matches then
				a_leaf ?= bin_op.right_operand
				if a_leaf /= Void then
					c_str ?= a_leaf.item
					Result := c_str.regexp
				end
			end
		end

	validate_reference_model is
			-- validate definition of archetype against reference model
		require
			rm_checker.model_loaded
		local
			def_it: C_ITERATOR
		do
			create unknown_types.make(0)
			unknown_types.compare_objects
			create def_it.make(target.definition)
			def_it.do_all(agent rm_node_validate_enter, agent rm_node_validate_exit)
		end

	validate_specialised_definition is
			-- validate definition of specialised archetype against flat parent
		require
			Target_specialised: target.is_specialised
		local
			def_it: C_ITERATOR
		do
			create def_it.make(target.definition)
			def_it.do_until_surface(agent specialised_node_validate, agent node_test)
		end

	specialised_node_validate (a_c_node: ARCHETYPE_CONSTRAINT; depth: INTEGER)  is
			-- perform grafts of node from differential archetype on corresponding node in flat parent
			-- only interested in C_COMPLEX_OBJECTs
		local
			co_parent_flat: !C_OBJECT
			co_parent_flat_detachable: ?C_OBJECT
			apa: ARCHETYPE_PATH_ANALYSER
		do
			create apa.make_from_string (a_c_node.path)

			if {ca_child_diff: C_ATTRIBUTE} a_c_node then
				if {ca_parent_flat: C_ATTRIBUTE} flat_parent.definition.c_attribute_at_path (apa.path_at_level (flat_parent.specialisation_depth)) then
					if not ca_child_diff.node_conforms_to(ca_parent_flat) then
						passed := False
						if ca_child_diff.is_single /= ca_parent_flat.is_single then
							add_error("VSAM", <<ca_child_diff.path>>)
						elseif not ca_child_diff.existence_conforms_to (ca_parent_flat) then
							add_error("VSANCE", <<ca_child_diff.path, ca_child_diff.existence.as_string,
										ca_parent_flat.path, ca_parent_flat.existence.as_string>>)
						elseif not ca_child_diff.cardinality_conforms_to (ca_parent_flat) then
							add_error("VSANCC", <<ca_child_diff.path, ca_child_diff.cardinality.as_string,
										ca_parent_flat.path, ca_parent_flat.cardinality.as_string>>)
						end
					elseif ca_child_diff.node_congruent_to (ca_parent_flat) and ca_child_diff.parent.is_congruent then
						ca_child_diff.set_is_congruent
					end
				else
					check ca_parent_flat_void: False end
				end
			elseif {co_child_diff: C_OBJECT} a_c_node then
				co_parent_flat_detachable := flat_parent.c_object_at_path (apa.path_at_level (flat_parent.specialisation_depth))
				check co_parent_flat_detachable /= Void end
				co_parent_flat := co_parent_flat_detachable

				-- C_CODE_PHRASE conforms to CONSTRAINT_REF, but is not testable in any way; sole exception in ADL/AOM; just warn
				if {ccr: CONSTRAINT_REF} co_parent_flat and then not {ccr2: CONSTRAINT_REF} co_child_diff then
					if {ccp: C_CODE_PHRASE} co_child_diff then
						add_warning("WCRC", <<co_child_diff.path>>)
					else
						add_error("VSCNR", <<co_parent_flat.generating_type, co_parent_flat.path, co_child_diff.generating_type, co_child_diff.path>>)
					end
				else
					-- if the child is a redefine of a parent use_node, then we have to do the comparison to the use_node target,
					-- unless they both are use_nodes, in which case leave them as is
					if {air_p: ARCHETYPE_INTERNAL_REF} co_parent_flat and not {air_c: ARCHETYPE_INTERNAL_REF} co_child_diff then
						co_parent_flat_detachable := flat_parent.c_object_at_path (air_p.path)
						check co_parent_flat_detachable /= Void end
						co_parent_flat := co_parent_flat_detachable
					end

					-- now determine if child object is same as or a specialisation of flat object
					if dynamic_type (co_child_diff) /= dynamic_type (co_parent_flat) then
						add_error("VSONT", <<co_child_diff.path, co_child_diff.generating_type, co_parent_flat.path, co_parent_flat.generating_type>>)
					elseif not co_child_diff.node_conforms_to(co_parent_flat) then
						if not co_child_diff.rm_type_conforms_to (co_parent_flat) then
							add_error("VSONCT", <<co_child_diff.path, co_child_diff.rm_type_name, co_parent_flat.path, co_parent_flat.rm_type_name>>)
						elseif not co_child_diff.occurrences_conforms_to (co_parent_flat) then
							add_error("VSONCO", <<co_child_diff.path, co_child_diff.occurrences.as_string, co_parent_flat.path, co_parent_flat.occurrences.as_string>>)
						elseif co_child_diff.is_addressable then
							if not co_child_diff.node_id_conforms_to (co_parent_flat) then
								add_error("VSONCI", <<co_child_diff.path, co_child_diff.node_id, co_parent_flat.path, co_parent_flat.node_id>>)
							elseif co_child_diff.node_id.is_equal(co_parent_flat.node_id) then
								add_error("VSONIR", <<co_child_diff.path, co_parent_flat.path, co_child_diff.node_id>>)
							end
						else
							add_error("VSONNC", <<co_child_diff.rm_type_name, co_child_diff.path, co_parent_flat.rm_type_name, co_parent_flat.path>>)
						end
					else
						-- nodes are at least conformant; check for congruence for specalisation path replacement
						if {cco: C_COMPLEX_OBJECT} co_child_diff and co_child_diff.node_congruent_to (co_parent_flat) and (co_child_diff.is_root or else co_child_diff.parent.is_congruent) then
							co_child_diff.set_is_congruent
						end

						if co_child_diff.sibling_order /= Void and then not co_parent_flat.parent.has_child_with_id (co_child_diff.sibling_order.sibling_node_id) then
							add_error("VSSM", <<co_child_diff.path, co_child_diff.sibling_order.sibling_node_id>>)
						end
					end
				end
			end
		end

	rm_node_validate_enter (a_c_node: ARCHETYPE_CONSTRAINT; depth: INTEGER)  is
			-- perform validation of node against reference model
		local
			arch_attr_type, attr_parent_path, model_attr_class: STRING
			co_parent_flat: C_OBJECT
			apa: ARCHETYPE_PATH_ANALYSER
		do
			if {co: C_OBJECT} a_c_node then
				if not unknown_types.has(co.rm_type_name) then
					if not rm_checker.has_class_definition(co.rm_type_name) then
						add_error("VCORM", <<co.rm_type_name, co.path>>)
						unknown_types.extend (co.rm_type_name)
					elseif not co.is_root then -- now check if this object a valid type of its owning attribute
						if target.is_specialised and then co.parent.has_differential_path then
							attr_parent_path := co.parent.differential_path
							create apa.make_from_string (attr_parent_path)
							co_parent_flat := flat_parent.c_object_at_path (apa.path_at_level (flat_parent.specialisation_depth))
							arch_attr_type := co_parent_flat.rm_type_name
						else
							arch_attr_type := co.parent.parent.rm_type_name
							attr_parent_path := co.parent.parent.path
						end
						if rm_checker.has_property (arch_attr_type, co.parent.rm_attribute_name) and not
											rm_checker.valid_property_type (arch_attr_type, co.parent.rm_attribute_name, co.rm_type_name) then
							model_attr_class := rm_checker.property_type (arch_attr_type, co.parent.rm_attribute_name)
							if rm_checker.substitutions.has (co.rm_type_name) and then rm_checker.substitutions.item (co.rm_type_name).is_equal (model_attr_class) then
								add_info("ICORMTS", <<co.rm_type_name, co.path, model_attr_class,
									arch_attr_type, co.parent.rm_attribute_name>>)
							else
								add_error("VCORMT", <<co.rm_type_name, co.path, model_attr_class,
									arch_attr_type, co.parent.rm_attribute_name>>)
							end
						end
					end
				end
			elseif {ca: C_ATTRIBUTE} a_c_node then
				if target.is_specialised and then ca.has_differential_path then
					attr_parent_path := ca.differential_path
					create apa.make_from_string (attr_parent_path)
					co_parent_flat := flat_parent.c_object_at_path (apa.path_at_level (flat_parent.specialisation_depth))
					arch_attr_type := co_parent_flat.rm_type_name
				else
					arch_attr_type := ca.parent.rm_type_name -- can be a generic type like DV_INTERVAL <DV_QUANTITY>
					attr_parent_path := ca.parent.path
				end
				if not unknown_types.has(arch_attr_type) then
					if rm_checker.has_class_definition(arch_attr_type) and then
												not rm_checker.has_property(arch_attr_type, ca.rm_attribute_name) then
						add_error("VCARM", <<ca.rm_attribute_name, ca.path , arch_attr_type>>)
					elseif rm_checker.property_definition(arch_attr_type, ca.rm_attribute_name).is_computed then
						add_info("ICARMC", <<ca.rm_attribute_name, ca.path , arch_attr_type>>)
					end
				end
			end
		end

	rm_node_validate_exit (a_c_node: ARCHETYPE_CONSTRAINT; depth: INTEGER)  is
		do
		end

	unknown_types: ARRAYED_LIST [STRING]

	node_test (a_c_node: ARCHETYPE_CONSTRAINT): BOOLEAN  is
			-- return True if a conformant path of a_c_node within the differential archetype is
			-- found within the flat parent archetype - i.e. a_c_node is inherited or redefined from parent (but not new)
			-- and no previous errors encountered
		local
			apa: ARCHETYPE_PATH_ANALYSER
		do
			create apa.make_from_string(a_c_node.path)
			Result := passed and flat_parent.has_path (apa.path_at_level (flat_parent.specialisation_depth))
		end

invariant
	target_descriptor_attached: target_descriptor /= Void

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
--| The Original Code is archetype_local_validator.e.
--|
--| The Initial Developer of the Original Code is Thomas Beale.
--| Portions created by the Initial Developer are Copyright (C) 2007
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
