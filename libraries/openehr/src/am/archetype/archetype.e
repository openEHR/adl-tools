indexing
	component:   "openEHR Archetype Project"
	description: "Archetype abstraction"
	keywords:    "archetype"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2003, 2004 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class ARCHETYPE

inherit
	ADL_DEFINITIONS
		export
			{NONE} all
		end

	AUTHORED_RESOURCE
		rename
			synchronise as synchronise_authored_resource
		redefine
			add_language
		end

create {ADL_ENGINE}
	make, make_minimal

feature -- Definitions

	Default_concept_code: STRING is "at0000"

feature  {ADL_ENGINE} -- Initialisation

	make_minimal(an_id: ARCHETYPE_ID; an_original_language: STRING) is
		require
			Id_exists: an_id /= Void
			Language_valid: an_original_language /= Void and then not an_original_language.is_empty
		local
			a_term: ARCHETYPE_TERM
		do
			archetype_id := an_id

			adl_version := 	Current_adl_version

			create concept.make(0)
			concept.append(Default_concept_code)

			create original_language.make (Default_language_code_set, an_original_language)

			create description.default_create
			create definition.make_identified(an_id.rm_entity, Default_concept_code)

			create a_term.make(concept)
			a_term.add_item("text", "unknown")
			a_term.add_item("description", "unknown")
			create ontology.make_empty(an_original_language, a_term)
		ensure
			Id_set: archetype_id = an_id
			Concept_set: concept.is_equal(Default_concept_code)
		end

	make(an_id: ARCHETYPE_ID;
			a_concept_code: STRING;
			an_original_language: STRING;
			a_description: RESOURCE_DESCRIPTION;
			a_definition: C_COMPLEX_OBJECT;
			an_ontology: ARCHETYPE_ONTOLOGY) is
		require
			Id_exists: an_id /= Void
			Concept_exists: a_concept_code /= Void
			Language_valid: an_original_language /= Void and then not an_original_language.is_empty
			Definition_exists: a_definition /= Void
			Ontology_exists: an_ontology /= Void
		do
			adl_version := 	Current_adl_version
			archetype_id := an_id
			concept := a_concept_code
			create original_language.make (Default_language_code_set, an_original_language)

			if a_description = Void then
				create description.default_create
			else
				description := a_description
			end

			definition := a_definition
			ontology := an_ontology
		ensure
			Id_set: archetype_id = an_id
			Concept_set: concept = a_concept_code
			Definition_set: definition = a_definition
			Ontology_set: ontology = an_ontology
		end

feature -- Access

	archetype_id: ARCHETYPE_ID

	adl_version: STRING
			-- ADL version of this archetype

	version: STRING is
			-- version of this archetype, according to its id
		do
			Result := archetype_id.version_id
		end

	parent_archetype_id: ARCHETYPE_ID
			-- id of specialisation parent of this archetype

	specialisation_depth: INTEGER is
			-- infer number of levels of specialisation from concept code
		do
			Result := ontology.specialisation_depth
		end

	concept: STRING

	definition: C_COMPLEX_OBJECT

	invariants: ARRAYED_LIST[ASSERTION]

	ontology: ARCHETYPE_ONTOLOGY

	physical_paths: ARRAYED_LIST [STRING] is
			-- generate physical paths from definition structure
		require
			validation_done
		local
			src_node_path: OG_PATH
			src_node_path_str: STRING
			src_nodes: ARRAYED_LIST [ARCHETYPE_INTERNAL_REF]
			tgt_path_c_objects: HASH_TABLE [C_OBJECT, STRING]
			tgt_path_str: STRING
			tgt_path: OG_PATH
			c_o: C_OBJECT
		do
			if path_map = Void or not is_readonly then
				path_map := definition.all_paths

				-- Add full paths of internal references thus giving full set of actual paths
				from
					use_node_path_xref_table.start
				until
					use_node_path_xref_table.off
				loop
					-- Hash table with arrayed list of ARCHETYPE_INTERNAL_REFs and Key of target
					-- (ie the ref path of the internal reference)
					src_nodes := use_node_path_xref_table.item_for_iteration
					tgt_path_str := use_node_path_xref_table.key_for_iteration
					create tgt_path.make_from_string(tgt_path_str)
					tgt_path_c_objects := definition.all_paths_at_path (tgt_path_str)
					c_o ?= definition.c_object_at_path (tgt_path_str)

					-- now add the paths below it
					from
						src_nodes.start
					until
						src_nodes.off
					loop
						src_node_path := src_nodes.item.representation.path
						src_node_path.last.set_object_id(tgt_path.last.object_id)
						src_node_path_str := src_node_path.as_string

						path_map.put (c_o, src_node_path_str)

						from
							tgt_path_c_objects.start
						until
							tgt_path_c_objects.off
						loop
							path_map.put (tgt_path_c_objects.item_for_iteration,
								src_node_path_str + "/" + tgt_path_c_objects.key_for_iteration)
							tgt_path_c_objects.forth
						end
						src_nodes.forth
					end
					use_node_path_xref_table.forth
				end

				create physical_paths_cache.make
				from
					path_map.start
				until
					path_map.off
				loop
					physical_paths_cache.extend(path_map.key_for_iteration)
					path_map.forth
				end
			end

			create Result.make (0)
			Result.append (physical_paths_cache)
		end

	logical_paths (a_lang: STRING): ARRAYED_LIST [STRING] is
			-- paths with human readable terms substituted
		require
			language_attached: a_lang /= Void
			has_language: ontology.languages_available.has (a_lang)
		local
			phys_paths: ARRAYED_LIST [STRING]
		do
			-- CHANGE Sam Heard 2004-05-19
			-- made logical paths call physical paths directly
			-- cache is held within physical paths
			create Result.make (0)
			Result.compare_objects
			phys_paths := physical_paths

			from
				phys_paths.start
			until
				phys_paths.off
			loop
				Result.extend (ontology.physical_to_logical_path (phys_paths.item, a_lang))
				phys_paths.forth
			end
		end

	physical_to_logical_path (a_phys_path: STRING; a_lang: STRING): STRING is
			-- generate a logical path in 'a_lang' from a physical path
		require
			Phys_path_valid: a_phys_path /= Void and then not a_phys_path.is_empty
			Lang_valid: a_lang /= Void and then not a_lang.is_empty
		do
			Result := ontology.physical_to_logical_path(a_phys_path, a_lang)
		end

	c_object_at_path (a_path: STRING): C_OBJECT is
			-- find the c_object from the path_map matching the path
		require
			a_path_valid: a_path /= Void
		do
			if path_map.has(a_path) then
				Result := path_map.item(a_path)
			end
		end

feature -- Status Report

	has_adl_version: BOOLEAN is
			-- True if adl_version is set
		do
			Result := adl_version /= Void
		end

	is_readonly: BOOLEAN
			-- set True in circumstances where Archetype will not be modified in memory

	is_specialised: BOOLEAN is
			-- 	True if this archetype identifies a specialisation parent
		do
			Result := parent_archetype_id /= Void
		end

	has_physical_path(a_path: STRING): BOOLEAN is
			-- true if physical path `a_path' exists in this archetype
		do
			Result := physical_paths.has(a_path)
		end

	has_invariants: BOOLEAN is
			-- true if there are invariants
		do
			Result := invariants /= Void
		end

feature -- Comparison

	valid_adl_version(a_ver: STRING): BOOLEAN is
			-- set adl_version with a string containing only '.' and numbers,
			-- not commencing or finishing in '.'
		require
			Valid_string: a_ver /= Void and then not a_ver.is_empty
		local
			str: STRING
		do
			str := a_ver.twin
			str.prune_all ('.')
			Result := str.is_integer and a_ver.item(1) /= '.' and a_ver.item (a_ver.count) /= '.'
		end

feature -- Validation

	is_valid: BOOLEAN is
			-- is archetype locally in valid state? For specialised archetypes, this does not take
			-- into account validity with respect to parent archetypes.
		require
			validation_done
		do
			Result := validator.passed
		end

	validation_done: BOOLEAN is
			-- has the validator been run? Need to call validate if not.
			-- FIXME - need to implement a dirty flag for calls to modifier routines
			-- that forces revalidation
		do
			Result := validator /= Void
		end

	build_xrefs is
			-- build definition / ontology cross reference tables used for validation and
			-- other purposes
		local
			a_c_iterator: C_ITERATOR
			xref_builder: C_XREF_BUILDER
		do
			create id_at_codes_xref_table.make(0)
			create data_at_codes_xref_table.make(0)
			create use_node_path_xref_table.make(0)
			create ac_codes_xref_table.make(0)

			create ontology_unused_term_codes.make(0)
			ontology_unused_term_codes.compare_objects
			create ontology_unused_constraint_codes.make(0)
			ontology_unused_constraint_codes.compare_objects

			create xref_builder
			xref_builder.initialise(ontology, Current)
			create a_c_iterator.make(definition, xref_builder)
			a_c_iterator.do_all
			xref_builder.finalise
		end

	validate is
			-- perform various levels validation of archetype
			-- FIXME: this may stay here, or it may be moved out of the ARCHETYPE classes
			-- to the compiler environment. Also have to decide on whether to have several
			-- validators
		do
			create validator.make(Current)
			validator.validate
		ensure
			validation_done
		end

	validator: ARCHETYPE_VALIDATOR
			-- validation object for this archetype

	id_at_codes_xref_table: HASH_TABLE[ARRAYED_LIST[C_OBJECT], STRING]
			-- table of {list<node>, code} for term codes which identify nodes in archetype (note that there
			-- are other uses of term codes from the ontology, which is why this attribute is not just called
			-- 'term_codes_xref_table')

	ac_codes_xref_table: HASH_TABLE[ARRAYED_LIST[C_OBJECT], STRING]
			-- table of {list<node>, code} for constraint codes in archetype

	data_at_codes_xref_table: HASH_TABLE[ARRAYED_LIST[C_OBJECT], STRING]
			-- table of {list<node>, code} for term codes which appear in archetype nodes as data,
			-- e.g. in C_DV_ORDINAL and C_CODE_PHRASE types

	use_node_path_xref_table: HASH_TABLE[ARRAYED_LIST[ARCHETYPE_INTERNAL_REF], STRING]
			-- table of {list<ARCHETYPE_INTERNAL_REF>, target_path}
			-- i.e. <list of use_nodes> keyed by path they point to
			-- FIXME - maybe should move back to ARCHETYPE

	ontology_unused_term_codes: ARRAYED_LIST[STRING]
			-- list of at codes found in ontology that are not referenced
			-- anywhere in the archetype definition

	ontology_unused_constraint_codes: ARRAYED_LIST[STRING]
			-- list of ac codes found in ontology that are not referenced
			-- anywhere in the archetype definition

feature -- Modification

	set_adl_version(a_ver: STRING) is
			-- set adl_version with a string containing only '.' and numbers,
			-- not commencing or finishing in '.'
		require
			Valid_version: a_ver /= Void and then valid_adl_version(a_ver)
		do
			adl_version := a_ver
		end

	convert_to_specialised(a_spec_concept: STRING) is
			-- convert this arcehtype to being a specialised version of itself
			-- one level down
		require
			Concept_valid: a_spec_concept /= Void and then not a_spec_concept.is_empty
		local
			chg_root_node: BOOLEAN
		do
			create parent_archetype_id.make_from_string(archetype_id.value)

			-- check if node id of root node of archetype is same as concept code of
			-- whole archetype; if so, change it once ontology converted
			chg_root_node := concept.is_equal(definition.node_id)

			ontology.convert_to_specialised
			if chg_root_node then
				definition.set_object_id(ontology.concept_code)
			end
			archetype_id := archetype_id.create_specialised_id(a_spec_concept)
			concept := ontology.concept_code
		ensure
			Archetype_id_updated: not archetype_id.is_equal(old archetype_id)
			Concept_code_updated: not concept.is_equal(old concept)
			Specialisation_depth_valid: specialisation_depth = old specialisation_depth + 1
		end

	set_archetype_id(an_id: ARCHETYPE_ID) is
		require
			an_id_valid: an_id /= Void
		do
			archetype_id := an_id
		end

	set_concept(str: STRING) is
		require
			str_valid: str /= Void and then not str.is_empty
		do
			concept := str
		end

	set_parent_archetype_id(an_id: ARCHETYPE_ID) is
		require
			an_id_valid: an_id /= Void
		do
			parent_archetype_id := an_id
		end

	set_definition(a_node: C_COMPLEX_OBJECT) is
		require
			a_node /= Void
		do
			definition := a_node
		end

	set_definition_node_id(a_term_code: STRING) is
			-- set the node_id of the archetype root node to a_term_id
		require
			Valid_term_code: ontology.has_term_code(a_term_code)
		do
			definition.set_object_id(a_term_code)
		end

	reset_definition is
			-- set definition back to its original state - just the root
			-- node with all children gone
		do
			definition.remove_all_attributes
		end

	add_invariant(an_inv: ASSERTION) is
			-- add a new invariant
		require
			Invariant_exists: an_inv /= Void
		do
			if invariants = Void then
				create invariants.make(0)
			end
			invariants.extend(an_inv)
		end

	set_invariants(assn_list: ARRAYED_LIST[ASSERTION]) is
			-- set invariants
		require
			assn_list /= Void
		do
			invariants := assn_list
		end

	set_ontology(a_node: ARCHETYPE_ONTOLOGY) is
		require
			a_node /= Void
		do
			ontology := a_node
		end

	ontology_remove_unused_codes is
			-- remove all term and constraint codes from ontology
		local
			code_list: ARRAYED_LIST[STRING]
		do
			-- unused codes are generated by the archetype validator
			build_xrefs

			code_list := ontology_unused_term_codes
			from
				code_list.start
			until
				code_list.off
			loop
				ontology.remove_term_definition(code_list.item)
				code_list.forth
			end

			code_list := ontology_unused_constraint_codes
			from
				code_list.start
			until
				code_list.off
			loop
				ontology.remove_constraint_definition(code_list.item)
				code_list.forth
			end
		end

	add_language(a_lang: STRING) is
			-- add a new language to the archetype - creates new language section in
			-- ontology, translations and resource description
		do
			precursor(a_lang)
			ontology.add_language (a_lang)
		end

feature -- Status setting

	set_readonly is
			-- set is_readonly to True
		do
			is_readonly := True
		end

feature -- Output

-- FIXME: this is probably used in some test app; if so, a simple display_hash_table_keys
-- routine should be implemented to generate the keys of each of the archetype_validator.xref tables
--
--	found_terms: STRING is
--		local
--			str_lst: ARRAYED_LIST[STRING]
--   		do
--   			create Result.make(0)
--
--			Result.append("%N--------------- found node term codes -------------%N")
--			Result.append(display_arrayed_list(found_id_node_codes))
--			Result.append("%N")
--
--			Result.append("%N--------------- found leaf term codes -------------%N")
--			Result.append(display_arrayed_list(found_code_node_codes))
--			Result.append("%N")
--
--			Result.append("%N--------------- found constraint codes -----------%N")
--			str_lst := found_constraint_codes
--			Result.append(display_arrayed_list(str_lst))
--			Result.append("%N")
--
--			Result.append("%N--------------- found use refs -----------%N")
--			create str_lst.make(0)
--			from
--				found_internal_references.start
--			until
--				found_internal_references.off
--			loop
--				str_lst.extend(found_internal_references.item)
--				found_internal_references.forth
--			end
--			Result.append(display_arrayed_list(str_lst))
--			Result.append("%N")
--		end

	as_string: STRING is
   		do
   			create Result.make(0)

			Result.append("%N--------------- physical paths -------------%N")
			Result.append(display_paths(physical_paths))

			Result.append("%N--------------- logical paths(en) -------------%N")
			Result.append(display_paths(logical_paths("en")))
		end

feature -- Serialisation

	synchronise is
			-- synchronise object representation of archetype to forms suitable for
			-- serialisation
		do
			synchronise_authored_resource
			ontology.synchronise_to_tree
		end

feature {NONE} -- Implementation

	physical_paths_cache: SORTED_TWO_WAY_LIST [STRING]

	path_map: HASH_TABLE [C_OBJECT, STRING]
			-- complete map of object nodes keyed by path, including paths implied by
			-- use_nodes in definition structure.

	display_arrayed_list(str_lst: ARRAYED_LIST[STRING]):STRING is
			--
		require
			str_lst /= Void
		do
			create Result.make(0)
			from
				str_lst.start
			until
				str_lst.off
			loop
				if not str_lst.isfirst then
					Result.append(", ")
				end
				Result.append(str_lst.item)
				str_lst.forth
			end
		end

	display_paths(path_list: ARRAYED_LIST[STRING]):STRING is
			-- display terminal paths
		require
			path_list /= Void
		do
			create Result.make(0)
			from
				path_list.start
			until
				path_list.off
			loop
				if path_list.islast then
					Result.append(path_list.item)
					Result.append("%N")
				end
				path_list.forth
			end
		end

invariant
	Id_exists: archetype_id /= Void
	Concept_exists: concept /= Void
	Description_exists: description /= Void
	Definition_exists: definition /= Void
	Invariants_valid: invariants /= Void implies not invariants.is_empty
	Ontology_exists: ontology /= Void
	RM_type_validity: definition.rm_type_name.as_lower.is_equal(archetype_id.rm_entity.as_lower)
	Specialisation_validity: is_specialised implies specialisation_depth > 0

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
