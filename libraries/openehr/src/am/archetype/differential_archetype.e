note
	component:   "openEHR Archetype Project"
	description: "Archetype abstraction"
	keywords:    "archetype"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2003- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "See notice at bottom of class"

class DIFFERENTIAL_ARCHETYPE

inherit
	ARCHETYPE
		redefine
			add_language_tag, ontology, make_from_other
		end

create
	make, make_minimal, make_minimal_child, make_from_legacy_flat, make_all, make_from_other

feature -- Initialisation

	make_from_other (other: like Current)
			-- duplicate from another archetype
		do
			precursor (other)
			is_valid := other.is_valid
		ensure then
			Is_valid_preserved: other.is_valid implies is_valid
		end

	make_minimal (an_artefact_type: ARTEFACT_TYPE; an_id: like archetype_id; an_original_language: STRING)
			-- make a new differential form archetype
		require
			Language_valid: not an_original_language.is_empty
		do
			artefact_type := an_artefact_type
			archetype_id := an_id
			adl_version := 	Latest_adl_version
			create ontology.make_empty(an_original_language, 0)
			create original_language.make (ts.Default_language_code_set, an_original_language)
			create description.default_create
			create definition.make_identified (an_id.rm_entity, ontology.concept_code.twin)
			is_dirty := True
			is_valid := True
		ensure
			Artefact_type_set: artefact_type = an_artefact_type
			Adl_version_set: adl_version = Latest_adl_version
			Id_set: archetype_id = an_id
			Original_language_set: original_language.code_string.is_equal (an_original_language)
			Ontology_original_language_set: original_language.code_string.is_equal (ontology.original_language)
			Not_specialised: not is_specialised
			Definition_root_node_id: definition.node_id.is_equal (concept)
			Not_generated: not is_generated
			Is_dirty: is_dirty
			Is_valid: is_valid
		end

	make_minimal_child (an_artefact_type: ARTEFACT_TYPE; an_id: like archetype_id; an_original_language: STRING; a_parent: ARCHETYPE)
			-- make a new differential form archetype as a child of `a_parent'
		require
			Language_valid: not an_original_language.is_empty
		do
			artefact_type := an_artefact_type
			archetype_id := an_id
			adl_version := 	Latest_adl_version
			create ontology.make_empty (an_original_language, a_parent.specialisation_depth + 1)
			create original_language.make (ts.Default_language_code_set, an_original_language)
			create description.default_create
			create definition.make_identified (an_id.rm_entity, ontology.concept_code.twin)
			parent_archetype_id := a_parent.archetype_id.deep_twin
			is_dirty := True
			is_valid := True
		ensure
			Artefact_type_set: artefact_type = an_artefact_type
			Adl_version_set: adl_version = Latest_adl_version
			Id_set: archetype_id = an_id
			Original_language_set: original_language.code_string.is_equal (an_original_language)
			Ontology_original_language_set: original_language.code_string.is_equal (ontology.original_language)
			Specialisation_depth_valid: specialisation_depth = a_parent.specialisation_depth + 1
			Parent_set: parent_archetype_id.as_string.same_string (a_parent.archetype_id.as_string)
			Definition_root_node_id: definition.node_id.is_equal (concept)
			Not_generated: not is_generated
			Is_dirty: is_dirty
			Is_valid: is_valid
		end

	make_from_legacy_flat (a_flat: FLAT_ARCHETYPE)
			-- create from a legacy flat archetype (which has no overlay markers) by cloning and then removing inherited parts
			-- the pieces of `a_flat' will be used, without cloning
		require
			not a_flat.is_generated
		local
			c_it: C_ITERATOR
			inherited_subtree_list: HASH_TABLE [ARCHETYPE_CONSTRAINT, STRING]
		do
			make_all (a_flat.artefact_type, Latest_adl_version, a_flat.archetype_id, a_flat.parent_archetype_id,
					a_flat.is_controlled, a_flat.original_language, a_flat.translations,
					a_flat.description, a_flat.definition, a_flat.invariants,
					a_flat.ontology.to_differential, a_flat.annotations)

			if is_specialised then
				build_rolled_up_status

				-- using rolled_up_specialisation statuses in nodes of definition
				-- generate a list of nodes/paths for deletion from a flat-form archetype
				create inherited_subtree_list.make (0)
				create c_it.make (definition)
				c_it.do_at_surface (
					agent (a_c_node: ARCHETYPE_CONSTRAINT; depth: INTEGER; subtree_list: HASH_TABLE [ARCHETYPE_CONSTRAINT, STRING])
						do
							subtree_list.put (a_c_node, a_c_node.path)
						end (?, ?, inherited_subtree_list),
					agent (a_c_node: ARCHETYPE_CONSTRAINT): BOOLEAN do Result := a_c_node.inferred_rolled_up_specialisation_status.value = ss_inherited end
				)

				-- add before/after ordering markers to new nodes whose parent attributes are ordered containers
				across inherited_subtree_list as subtree_csr loop
					if attached {C_OBJECT} subtree_csr.item as cco_1 then
						-- FIXME: in the following statement, we are assuming that if the cardinality of the parent attribute
						-- does not exist (typical for a differential archetype), that it is ordered; really we should look up
						-- the RM schema
						if attached cco_1.parent and (cco_1.parent.cardinality = Void or cco_1.parent.is_ordered) then
							if attached {C_OBJECT} cco_1.parent.child_after (cco_1) as cco_next and then
								cco_next.inferred_specialisation_status (specialisation_depth).value = ss_added
							then
								cco_next.set_sibling_order_after (cco_1.node_id)
							end
							if attached {C_OBJECT} cco_1.parent.child_before (cco_1) as cco_prev and then
								cco_prev.inferred_specialisation_status (specialisation_depth).value = ss_added
							then
								cco_prev.set_sibling_order_before (cco_1.node_id)
							end
						end
					end
				end

				-- now remove inherited subtrees
				across inherited_subtree_list as subtree_csr loop
					if attached {C_OBJECT} subtree_csr.item as cco_2 then
						if cco_2.parent /= Void then
							cco_2.parent.remove_child (cco_2)
						else
							-- cco_2 must be the parent, which means the entire definition is a copy of that from the parent archetype
						end
					elseif attached {C_ATTRIBUTE} subtree_csr.item as c_attr then
						c_attr.parent.remove_attribute (c_attr)
					end
				end
			end

			is_generated := True

			-- rebuild all internal references, path cache etc
			rebuild
		end

feature -- Access

	ontology: DIFFERENTIAL_ARCHETYPE_ONTOLOGY

	ontology_unused_term_codes: ARRAYED_LIST [STRING]
			-- list of at codes found in ontology that are not referenced anywhere in the archetype definition
		local
			data_atcodes: HASH_TABLE [ARRAYED_LIST [C_OBJECT], STRING]
			id_atcodes: HASH_TABLE [ARRAYED_LIST [ARCHETYPE_CONSTRAINT], STRING]
		do
			create Result.make (0)
			data_atcodes := data_atcodes_index
			id_atcodes := id_atcodes_index
			across ontology.term_codes as term_codes_csr loop
				if not id_atcodes.has (term_codes_csr.item) and not data_atcodes.has (term_codes_csr.item) then
					Result.extend (term_codes_csr.item)
				end
			end
			Result.prune (concept)
		end

	ontology_unused_constraint_codes: ARRAYED_LIST [STRING]
			-- list of ac codes found in ontology that are not referenced
			-- anywhere in the archetype definition
		local
			accodes: HASH_TABLE [ARRAYED_LIST [CONSTRAINT_REF], STRING]
		do
			create Result.make (0)
			accodes := accodes_index
			across ontology.constraint_codes as constraint_codes_csr loop
				if not accodes.has (constraint_codes_csr.item) then
					Result.extend (constraint_codes_csr.item)
				end
			end
		end

feature -- Status Report

	is_valid: BOOLEAN
			-- True if archetype is completely validated, including with respect to specialisation parents, where they exist

feature -- Status Setting

	set_is_valid (a_validity: BOOLEAN)
			-- set is_valid flag
		do
			is_valid := a_validity
			is_dirty := False
		end

feature {ARCH_CAT_ARCHETYPE} -- Structure

	convert_to_differential_paths
			-- FIXME: only needed while differential archetype source is being created in uncompressed form
			-- compress paths of congruent nodes in specialised archetype so that equivalent paths
			-- are recorded in the `differential_path' attribute of terminal C_ATTRIBUTE nodes of congruent sections
			-- This routine only works if validation has successfully completed because the latter process sets
			-- is_mergeable markers in the structure.
		require
			Target_specialised: is_specialised
			Is_generated: is_generated
			Is_valid: is_valid
		local
			def_it: C_ITERATOR
		do
			converted_def := definition.deep_twin
			create def_it.make (definition)
			def_it.do_at_surface (agent node_set_differential_path,
				agent (a_c_node: ARCHETYPE_CONSTRAINT): BOOLEAN
					do
						Result := not a_c_node.is_path_compressible
					end
			)
			if attached converted_def as conv_def then
				definition := conv_def
				rebuild
			end
		end

	converted_def: detachable C_COMPLEX_OBJECT

	node_set_differential_path (a_c_node: ARCHETYPE_CONSTRAINT; depth: INTEGER)
			-- FIXME: only needed while differential archetype source is being created in uncompressed form
			-- perform validation of node against reference model
			-- This function gets executed on nodes 1 level BELOW where the is_congruent marker is True
		do
			if attached {C_ATTRIBUTE} a_c_node as ca then
				-- these are attributes that are not congruent to any node in the parent archetype,
				-- i.e. they don't exist in the parent.
				if converted_def.has_attribute_path (ca.path) and then attached converted_def.c_attribute_at_path (ca.path) as ca2 then
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
					if converted_def.has_object_path (co.path) and then attached converted_def.c_object_at_path (co.path) as co2 then
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

	set_definition_node_id (a_term_code: STRING)
			-- set the node_id of the archetype root node to a_term_id
		require
			Valid_term_code: ontology.has_term_code (a_term_code)
		do
			definition.set_node_id (a_term_code)
		end

	reset_definition
			-- set definition back to its original state - just the root
			-- node with all children gone
		do
			definition.remove_all_attributes
		end

	add_language_tag (a_lang_tag: STRING)
			-- add a new language to the archetype - creates new language section in
			-- ontology, translations and resource description
		do
			precursor (a_lang_tag)
			ontology.add_language (a_lang_tag)
		end

	remove_ontology_unused_codes
			-- remove all term and constraint codes from ontology
		do
			across ontology_unused_term_codes as codes_csr loop
				ontology.remove_term_definition (codes_csr.item)
			end
			across ontology_unused_constraint_codes as codes_csr loop
				ontology.remove_constraint_definition (codes_csr.item)
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
