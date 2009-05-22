note
	component:   "openEHR Archetype Project"
	description: "Archetype abstraction"
	keywords:    "archetype"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.com>"
	copyright:   "Copyright (c) 2003-2008 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL: http://www.openehr.org/svn/ref_impl_eiffel/TRUNK/libraries/openehr/src/am/archetype/differential_archetype.e $"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate: 2008-03-12 00:23:45 +0000 (Wed, 12 Mar 2008) $"

class DIFFERENTIAL_ARCHETYPE

inherit
	ARCHETYPE
		redefine
			add_language, build_xrefs, ontology
		end

create
	make, make_minimal, make_specialised_child, make_from_flat, make_all

feature -- Initialisation

	make_minimal (an_id: like archetype_id; an_original_language: STRING; a_specialisation_depth: INTEGER)
			-- make a new differential form archetype
		require
			Language_valid: an_original_language /= Void and then not an_original_language.is_empty
			Specialisation_depth_valid: a_specialisation_depth >= 0
		do
			archetype_id := an_id
			adl_version := 	Latest_adl_version
			create ontology.make_empty(an_original_language, a_specialisation_depth)
			concept := ontology.concept_code.twin
			create original_language.make (Default_language_code_set, an_original_language)
			create description.default_create
			create definition.make_identified(an_id.rm_entity, concept)
			is_dirty := True
		ensure
			Id_set: archetype_id = an_id
			Original_language_set: original_language.as_string.is_equal(an_original_language)
			Specialisation_depth_set: specialisation_depth = a_specialisation_depth
			Definition_root_node_id: definition.node_id.is_equal (concept)
			Is_dirty: is_dirty
		end

	make_specialised_child(a_parent: ARCHETYPE; a_spec_concept: STRING)
			-- make this archetype as a specialisation 1 level below the 'other'
		require
			Other_valid: a_parent /= Void and then a_parent.is_valid
			Concept_valid: a_spec_concept /= Void and then not a_spec_concept.is_empty
		do
			make_minimal (a_parent.archetype_id.create_specialised_id (a_spec_concept), a_parent.original_language.as_string, a_parent.specialisation_depth+1)
			create parent_archetype_id.make_from_string(a_parent.archetype_id.value)
		end

	make_from_flat (a_flat: FLAT_ARCHETYPE)
			-- create from a flat archetype by cloning and then removing inherited parts
		require
			Flat_archetype_valid: a_flat /= Void
		local
			cco_prev, cco_next: C_OBJECT
			c_it: C_ITERATOR
			a_flat_copy: FLAT_ARCHETYPE
		do
			a_flat_copy := a_flat.deep_twin
			make_all(a_flat_copy.adl_version, a_flat_copy.archetype_id, a_flat_copy.parent_archetype_id, a_flat_copy.is_controlled,
					a_flat_copy.concept, a_flat_copy.original_language.code_string, a_flat_copy.translations,
					a_flat_copy.description, a_flat_copy.definition, a_flat_copy.invariants,
					a_flat_copy.ontology.to_differential)

			if is_specialised then
				build_rolled_up_status

				-- using rolled_up_specialisation statuses in nodes of definition
				-- generate a list of nodes/paths for deletion from a flat-form archetype
				create inherited_subtree_list.make(0)
				create c_it.make(definition)
				c_it.do_at_surface(
					agent (a_c_node: ARCHETYPE_CONSTRAINT; depth: INTEGER) do inherited_subtree_list.put (a_c_node, a_c_node.path) end,
					agent (a_c_node: ARCHETYPE_CONSTRAINT): BOOLEAN do Result := a_c_node.rolled_up_specialisation_status.value = ss_inherited end
				)

				-- add before/after ordering markers to new nodes whose parent attributes are ordered containers
				from inherited_subtree_list.start until inherited_subtree_list.off loop
					if attached {C_OBJECT} inherited_subtree_list.item_for_iteration as cco_1 then
						if cco_1.parent /= Void and cco_1.parent.is_ordered then
							cco_next := cco_1.parent.child_after (cco_1)
							if cco_next /= Void and cco_next.specialisation_status (specialisation_depth).value = ss_added then
								cco_next.set_sibling_order_after (cco_1.node_id)
							end
							cco_prev := cco_1.parent.child_before (cco_1)
							if cco_prev /= Void and cco_prev.specialisation_status (specialisation_depth).value = ss_added then
								cco_prev.set_sibling_order_before (cco_1.node_id)
							end
						end
					end
					inherited_subtree_list.forth
				end

				-- now remove inherited subtrees
				from inherited_subtree_list.start until inherited_subtree_list.off loop
					if attached {C_OBJECT} inherited_subtree_list.item_for_iteration as cco_2 then
						if cco_2.parent /= Void then
							cco_2.parent.remove_child (cco_2)
						else
							-- cco_2 must be the parent, which means the entire definition is a copy of that from the parent archetype
						end
					elseif attached {C_ATTRIBUTE} inherited_subtree_list.item_for_iteration as c_attr then
						c_attr.parent.remove_attribute (c_attr)
					end
					inherited_subtree_list.forth
				end
			end

			-- now go and remove any existences that are the same as the reference model
--			create c_it.make(definition)
--			c_it.do_all(agent node_remove_defaults)

			-- now rebuild all internal references, path cache etc
			rebuild

			is_generated := True
		end

feature -- Access

	ontology: attached DIFFERENTIAL_ARCHETYPE_ONTOLOGY

	ontology_unused_term_codes: ARRAYED_LIST[STRING]
			-- list of at codes found in ontology that are not referenced
			-- anywhere in the archetype definition

	ontology_unused_constraint_codes: ARRAYED_LIST[STRING]
			-- list of ac codes found in ontology that are not referenced
			-- anywhere in the archetype definition

feature {ARCHETYPE_VALIDATOR, ARCHETYPE_FLATTENER, C_XREF_BUILDER} -- Validation

	build_xrefs
			-- build definition / ontology cross reference tables used for validation and
			-- other purposes
		do
			precursor

			-- populate lists of at-codes and ac-codes found in ontology that
			-- are not referenced anywhere in the archetype definition
			create ontology_unused_term_codes.make(0)
			ontology_unused_term_codes.compare_objects
			create ontology_unused_constraint_codes.make(0)
			ontology_unused_constraint_codes.compare_objects

			from ontology.term_codes.start until ontology.term_codes.off loop
				if not id_atcodes_index.has(ontology.term_codes.item) and not
						data_atcodes_index.has(ontology.term_codes.item) then
					ontology_unused_term_codes.extend(ontology.term_codes.item)
				end
				ontology.term_codes.forth
			end
			ontology_unused_term_codes.prune(concept)

			from ontology.constraint_codes.start until ontology.constraint_codes.off loop
				if not accodes_index.has(ontology.constraint_codes.item) then
					ontology_unused_constraint_codes.extend(ontology.constraint_codes.item)
				end
				ontology.constraint_codes.forth
			end
		end

feature {ARCH_REP_ARCHETYPE} -- Structure

	convert_to_differential_paths
			-- FIXME: only needed while differential archetype source is being created in uncompressed form
			-- compress paths of congruent nodes in specialised archetype so that equivalent paths
			-- are recorded in the `differential_path' attribute of terminal C_ATTRIBUTE nodes of congruent sections
			-- This routine only works is validation has successfully completed because the latter process sets
			-- is_conrgruent markers in the structure.
		require
			Target_specialised: is_specialised
			Is_generated: is_generated
			Is_valid: is_valid
		local
			def_it: C_ITERATOR
		do
			converted_def := definition.deep_twin
			create def_it.make(definition)
			def_it.do_at_surface(agent node_set_differential_path, agent congruent_node_test)
			definition := converted_def
			rebuild
		end

	converted_def: attached C_COMPLEX_OBJECT

	congruent_node_test (a_c_node: ARCHETYPE_CONSTRAINT): BOOLEAN
			-- FIXME: only needed while differential archetype source is being created in uncompressed form
			-- return True if node.is_congruent is True
		do
			Result := not a_c_node.is_mergeable
		end

	node_set_differential_path (a_c_node: ARCHETYPE_CONSTRAINT; depth: INTEGER)
			-- FIXME: only needed while differential archetype source is being created in uncompressed form
			-- perform validation of node against reference model
			-- This function gets executed on nodes 1 level BELOW where the is_congruent marker is True
		local
			co2: C_OBJECT
			ca2: C_ATTRIBUTE
		do
			if attached {C_ATTRIBUTE} a_c_node as ca then
				-- these are attributes that are not congruent to any node in the parent archetype,
				-- i.e. they don't exist in the parent.
				if converted_def.has_attribute_path (ca.path) then
					ca2 := converted_def.c_attribute_at_path (ca.path)
					if not ca2.has_differential_path then
						debug("compress")
							io.put_string ("Compressing path at ATTR " + ca.path + "%N")
						end
						ca2.set_differential_path_to_here
					else
						debug("compress")
							io.put_string ("Path " + ca.path + " no longer available - attribute moved (already compressed?)%N")
						end
					end
				end
			elseif attached {C_OBJECT} a_c_node as co then
				if not co.is_root then
					if converted_def.has_object_path (co.path) then
						co2 := converted_def.c_object_at_path (co.path)
						if not co2.parent.has_differential_path then
							debug("compress")
								io.put_string ("Compressing path of ATTR above OBJ with path " + co.path + "%N")
							end
							co2.parent.set_differential_path_to_here
						end
					else
						debug("compress")
							io.put_string ("Path " + co.path + " no longer available - parent moved (already compressed?)%N")
						end
					end
				end
			end
		end

feature -- Modification

	set_definition_node_id(a_term_code: STRING)
			-- set the node_id of the archetype root node to a_term_id
		require
			Valid_term_code: ontology.has_term_code(a_term_code)
		do
			definition.set_node_id(a_term_code)
		end

	reset_definition
			-- set definition back to its original state - just the root
			-- node with all children gone
		do
			definition.remove_all_attributes
		end

	add_language(a_lang: STRING)
			-- add a new language to the archetype - creates new language section in
			-- ontology, translations and resource description
		do
			precursor(a_lang)
			ontology.add_language (a_lang)
		end

	remove_ontology_unused_codes
			-- remove all term and constraint codes from ontology
		local
			code_list: ARRAYED_LIST[STRING]
		do
			-- unused codes are generated by the archetype validator
			if is_dirty then
				build_xrefs
			end

			code_list := ontology_unused_term_codes
			from code_list.start until code_list.off loop
				ontology.remove_term_definition(code_list.item)
				code_list.forth
			end

			code_list := ontology_unused_constraint_codes
			from code_list.start until code_list.off loop
				ontology.remove_constraint_definition(code_list.item)
				code_list.forth
			end
		end

feature {ARCHETYPE_VALIDATOR} -- Implementation

	set_parent_archetype (an_archetype: DIFFERENTIAL_ARCHETYPE)
			-- set `parent_archetype'
		require
			Archetype_valid: an_archetype /= Void and then an_archetype.specialisation_depth + 1 = specialisation_depth
		do
			parent_archetype := an_archetype
			ontology.set_parent_ontology (an_archetype.ontology)
		end

	parent_archetype: DIFFERENTIAL_ARCHETYPE
			-- reference to parent, if this archetype is specialised

	inherited_subtree_list: HASH_TABLE[ARCHETYPE_CONSTRAINT, STRING]
			-- table of {object_node, path} of nodes at the top of inherited subtrees,
			-- that if deleted should bring the archetype back to differential form

invariant
	Parent_archetype_validity: parent_archetype /= Void implies is_specialised

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
--| The Original Code is adl_archetype.e.
--|
--| The Initial Developer of the Original Code is Thomas Beale.
--| Portions created by the Initial Developer are Copyright (C) 2003-2004
--| the Initial Developer. All Rights Reserved.
--|
--| Contributor(s):
--|	Sam Heard
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
