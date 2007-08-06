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
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2007 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class ARCHETYPE_VALIDATOR

inherit
	ANY_VALIDATOR
		rename
			make as make_validator
		end

create
	make

feature -- Initialisation

	make(an_archetype: ARCHETYPE) is
			-- set archetype required for interpreting meaning of object nodes
		require
			Archetype_valid: an_archetype /= Void
		do
			make_validator
			archetype := an_archetype
		end

feature -- Access

	archetype: ARCHETYPE
			-- differential archetype

	ontology: ARCHETYPE_ONTOLOGY is
			-- the ontology of the current archetype
		do
			Result := archetype.ontology
		end

	ontology_unused_term_codes: ARRAYED_LIST[STRING]
			-- list of at codes found in ontology that are not referenced
			-- anywhere in the archetype definition

	ontology_unused_constraint_codes: ARRAYED_LIST[STRING]
			-- list of ac codes found in ontology that are not referenced
			-- anywhere in the archetype definition

feature -- Validation

	validate is
		do
			passed := True

			validate_basics

			if passed then
				build_xrefs
				validate_xrefs
				find_unused_ontology_codes
				validate_internal_references
			end

			if passed then
				validate_languages
				check_unidentified_nodes
				warnings.append(unidentified_node_finder.warnings)
			end
		end

feature {ARCHETYPE} -- Access

	xref_builder: C_XREF_BUILDER
			-- C_OBJECT structure visitor that builds up cross-reference tables of
			-- at- and ac-codes to support validation done here

feature {NONE} -- Implementation

	unidentified_node_finder: C_UNIDENTIFIED_NODE_CHECKER
			-- C_OBJECT structure visitor that finds nodes that should have at-code
			-- identifiers on them

	validate_basics is
			-- are basic features of archetype structurally intact and correct?
			-- into account validity with respect to parent archetypes.
		do
			passed := False
			if archetype.archetype_id = Void then
				errors.append("No archetype_id%N")
			elseif archetype.definition = Void then
				errors.append("No definition%N")
			elseif archetype.invariants /= Void and archetype.invariants.is_empty then
				errors.append("invariants cannot be empty if specified")
			elseif ontology = Void then
				errors.append("No ontology%N")
			elseif not archetype.definition.rm_type_name.is_equal (archetype.archetype_id.rm_entity) then
					errors.append("Archetype id type %"" + archetype.archetype_id.rm_entity +
								"%" does not match type %"" + archetype.definition.rm_type_name +
								"%" in definition section%N")
			elseif not archetype.definition.is_valid then
				-- FIXME - need to check definition validation
					errors.append(archetype.definition.invalid_reason + "%N")
			else
				passed := True
			end
		end

	build_xrefs is
			--
		local
			a_c_iterator: C_ITERATOR
		do
			create xref_builder
			xref_builder.initialise(archetype.ontology)
			create a_c_iterator.make(archetype.definition, xref_builder)
			a_c_iterator.do_all
			xref_builder.finalise
		end

	validate_languages is
			-- check to see that all linguistic items in ontology, description, etc
			-- are all coherent
		do
			-- is languages_available list same as languages in description.details?

			-- is languages_available list same as languages in ontology?
		end

	validate_xrefs is
			-- True if all found node_ids are defined in term_definitions,
			-- and term_definitions contains no extras
		local
			a_codes: HASH_TABLE[ARRAYED_LIST[C_OBJECT], STRING]
		do
			-- see if all found codes are in each language table
			a_codes := xref_builder.node_ids_xref_table
			from
				a_codes.start
			until
				a_codes.off
			loop
				if not ontology.has_term_code(a_codes.key_for_iteration) then
					passed := False
					errors.append("Node id at-code " + a_codes.key_for_iteration + " not defined in ontology%N")
				end
				a_codes.forth
			end

			-- see if every found leaf term code (in an ORDINAL or a CODED_TERM) is in ontology
			a_codes := xref_builder.code_nodes_code_xref_table
			from
				a_codes.start
			until
				a_codes.off
			loop
				if not ontology.has_term_code(a_codes.key_for_iteration) then
					passed := False
					errors.append("Leaf at-code " + a_codes.key_for_iteration + " not defined in ontology%N")
				end
				a_codes.forth
			end

			-- check if all found constraint_codes are defined in constraint_definitions,
			a_codes := xref_builder.constraint_codes_xref_table
			from
				a_codes.start
			until
				a_codes.off
			loop
				if not ontology.has_constraint_code(a_codes.key_for_iteration) then
					passed := False
					errors.append("Found ac-code " + a_codes.key_for_iteration + " not defined in all languages in ontology%N")
				end
				a_codes.forth
			end
		end

	validate_internal_references is
			-- validate items in `found_internal_references'
		local
			use_refs: HASH_TABLE[ARRAYED_LIST[ARCHETYPE_INTERNAL_REF], STRING]
		do
			use_refs := xref_builder.use_node_path_xref_table
			from
				use_refs.start
			until
				use_refs.off
			loop
				if not archetype.definition.has_path(use_refs.key_for_iteration) then
					passed := False
					errors.append("Error: path " + use_refs.key_for_iteration + " not found in archetype%N")
				end
				use_refs.forth
			end
		end

	find_unused_ontology_codes is
			-- populate lists of at-codes and ac-codes found in ontology that
			-- are not referenced anywhere in the archetype definition
		do
			create ontology_unused_term_codes.make(0)
			ontology_unused_term_codes.compare_objects

			-- FIXME: this test will go when we are using differential archetypes
			-- if not is_specialised then
				from
					ontology.term_codes.start
				until
					ontology.term_codes.off
				loop
					if not xref_builder.node_ids_xref_table.has(ontology.term_codes.item) and not
							xref_builder.code_nodes_code_xref_table.has(ontology.term_codes.item) then
						ontology_unused_term_codes.extend(ontology.term_codes.item)
						warnings.append("Term code " + ontology.term_codes.item + " in ontology not used in archetype definition%N")
					end
					ontology.term_codes.forth
				end
				ontology_unused_term_codes.prune(archetype.concept)
			-- end

			create ontology_unused_constraint_codes.make(0)
			ontology_unused_constraint_codes.compare_objects
			-- FIXME: this test will go when we are using differential archetypes
			-- if not is_specialised then

				from
					ontology.constraint_codes.start
				until
					ontology.constraint_codes.off
				loop
					if not xref_builder.constraint_codes_xref_table.has(ontology.constraint_codes.item) then
						ontology_unused_constraint_codes.extend(ontology.constraint_codes.item)
						warnings.append("Constraint code " + ontology.constraint_codes.item + " in ontology not used in archetype definition%N")
					end
					ontology.constraint_codes.forth
				end
			-- end
		ensure
			Ontology_unused_term_codes_exists: ontology_unused_term_codes /= Void
			Ontology_unused_constraint_codes_exists: ontology_unused_constraint_codes /= Void
		end

	check_unidentified_nodes is
			-- look for attributes that are either multiple or have multiple alternatives, whose
			-- child objects are not identified, but only if the children are not C_PRIMITIVEs or
			-- C_C_Os whose values are C_PRMITIVEs. Record any such nodes as warnings
		local
			a_c_iterator: C_ITERATOR
		do
			create unidentified_node_finder
			unidentified_node_finder.initialise(ontology)
			create a_c_iterator.make(archetype.definition, unidentified_node_finder)
			a_c_iterator.do_all
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
