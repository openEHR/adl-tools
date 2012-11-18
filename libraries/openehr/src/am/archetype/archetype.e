note
	component:   "openEHR Archetype Project"
	description: "Archetype abstraction"
	keywords:    "archetype"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2003-2011 Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

deferred class ARCHETYPE

inherit
	ARCHETYPE_DEFINITIONS
		export
			{NONE} all;
			{ANY} deep_twin, valid_adl_version
		end

	ARCHETYPE_TERM_CODE_TOOLS
		export
			{NONE} all;
			{ANY} is_valid_concept_code, deep_twin
		end

	AUTHORED_RESOURCE
		redefine
			synchronise_adl15, make_from_other
		end

feature -- Initialisation

	make_dt (make_args: ARRAY[ANY])
			-- basic make routine to guarantee validity on creation
		do
		end

	make (an_artefact_type: ARTEFACT_TYPE;
			an_id: like archetype_id;
			an_original_language: CODE_PHRASE;
			a_description: detachable RESOURCE_DESCRIPTION;
			a_definition: like definition;
			an_ontology: like ontology)
				-- make from pieces obtained by parsing
		do
			artefact_type := an_artefact_type
			adl_version := 	Latest_adl_version
			archetype_id := an_id
			original_language := an_original_language

			if not attached a_description then
				create description.default_create
			else
				description := a_description
			end

			definition := a_definition
			ontology := an_ontology
			is_dirty := True
		ensure
			Artefact_type_set: artefact_type = an_artefact_type
			Adl_version_set: adl_version = Latest_adl_version
			Id_set: archetype_id = an_id
			Original_language_set: original_language = an_original_language
			Definition_set: definition = a_definition
			Ontology_set: ontology = an_ontology
			Is_dirty: is_dirty
			Not_generated: not is_generated
		end

	make_all (an_artefact_type: attached ARTEFACT_TYPE;
			an_adl_version: STRING;
			an_id: like archetype_id;
			a_parent_archetype_id: ARCHETYPE_ID;
			is_controlled_flag: BOOLEAN;
			an_original_language: attached CODE_PHRASE;
			a_translations: HASH_TABLE [TRANSLATION_DETAILS, STRING];
			a_description: RESOURCE_DESCRIPTION;
			a_definition: like definition;
			an_invariants: ARRAYED_LIST[ASSERTION];
			an_ontology: like ontology;
			an_annotations: RESOURCE_ANNOTATIONS)
				-- make from all possible items
		require
			Translations_valid: a_translations /= Void implies not a_translations.is_empty
			Invariants_valid: an_invariants /= Void implies not an_invariants.is_empty
		do
			make (an_artefact_type, an_id,
					an_original_language, a_description,
					a_definition, an_ontology)
			parent_archetype_id := a_parent_archetype_id
			translations := a_translations
			adl_version := an_adl_version
			is_controlled := is_controlled_flag
			invariants := an_invariants
			annotations := an_annotations
		ensure
			Artefact_type_set: artefact_type = an_artefact_type
			Adl_version_set: adl_version = an_adl_version
			Is_controlled_set: is_controlled = is_controlled_flag
			Id_set: archetype_id = an_id
			Parent_id_set: parent_archetype_id = a_parent_archetype_id
			Original_language_set: original_language = an_original_language
			Translations_set: translations = a_translations
			Definition_set: definition = a_definition
			Invariants_set: invariants = an_invariants
			Ontology_set: ontology = an_ontology
			Is_dirty: is_dirty
			Not_generated: not is_generated
		end

	make_from_other (other: like Current)
			-- duplicate from another archetype
		local
			other_parent_arch_id: ARCHETYPE_ID
			other_annotations: RESOURCE_ANNOTATIONS
			other_translations: HASH_TABLE [TRANSLATION_DETAILS, STRING]
			other_invariants: ARRAYED_LIST [ASSERTION]
		do
			if other.is_specialised then
				other_parent_arch_id := other.parent_archetype_id.deep_twin
			end
			if other.has_translations then
				other_translations := other.translations.deep_twin
			end
			if other.has_annotations then
				other_annotations := other.annotations.safe_deep_twin
			end
			if other.has_invariants then
				other_invariants := other.invariants.deep_twin
			end
			make_all (other.artefact_type.twin, other.adl_version.twin, other.archetype_id.deep_twin,
					other_parent_arch_id, other.is_controlled,
					other.original_language.deep_twin, other_translations,
					other.description.safe_deep_twin, other.definition.deep_twin, other_invariants,
					other.ontology.safe_deep_twin, other_annotations)
			is_generated := other.is_generated
			rebuild
		ensure then
			Is_generated_preserved: other.is_generated implies is_generated
		end

feature -- Access

	uid: HIER_OBJECT_ID
			-- optional UID identifier of this artefact
			-- FIXME: should really be in AUTHORED_RESOURCE

	archetype_id: attached ARCHETYPE_ID

	adl_version: attached STRING
			-- ADL version of this archetype

	artefact_type: attached ARTEFACT_TYPE
			-- design type of artefact, archetype, template, template-component, etc

	version: STRING
			-- version of this archetype, according to its id
		do
			Result := archetype_id.version_id
		end

	parent_archetype_id: ARCHETYPE_ID
			-- id of specialisation parent of this archetype

	specialisation_depth: INTEGER
			-- infer number of levels of specialisation from concept code
		do
			Result := specialisation_depth_from_code (concept)
		ensure
			non_negative: Result >= 0
		end

	concept: attached STRING
			-- at-code of concept of the archetype as a whole and the code of its root node
		do
			Result := definition.node_id
		end

	definition: attached C_COMPLEX_OBJECT

	invariants: detachable ARRAYED_LIST [ASSERTION]

	ontology: attached ARCHETYPE_ONTOLOGY

feature -- Paths

	physical_paths: ARRAYED_LIST [STRING]
			-- physical paths from definition structure for all objects; if no changes made on archetype,
			-- return cached value
		do
			if not attached physical_paths_cache then
				build_physical_paths
			end
			Result := physical_paths_cache
		end

	physical_leaf_paths: ARRAYED_LIST [STRING]
			-- physical paths from definition structure for leaf objects only; if no changes made on archetype,
			-- return cached value
		do
			if not attached physical_leaf_paths_cache then
				build_physical_paths
			end
			Result := physical_leaf_paths_cache
		end

	object_path_map: HASH_TABLE [C_OBJECT, STRING]
			-- physical paths from definition structure for leaf objects only; if no changes made on archetype,
			-- return cached value
		do
			if not attached object_path_map_cache then
				build_physical_paths
			end
			Result := object_path_map_cache
		end

	logical_paths (a_lang: attached STRING; leaves_only: BOOLEAN): ARRAYED_LIST [STRING]
			-- paths with human readable terms substituted
		require
			has_language: ontology.has_language(a_lang)
		local
			phys_paths: ARRAYED_LIST [STRING]
		do
			create Result.make (0)
			Result.compare_objects
			if leaves_only then
				phys_paths := physical_leaf_paths
			else
				phys_paths := physical_paths
			end

			across phys_paths as phys_paths_csr loop
				Result.extend (ontology.physical_to_logical_path (phys_paths_csr.item, a_lang, True))
			end
		end

	matching_logical_paths (a_lang, rm_type: STRING): ARRAYED_LIST [STRING]
			-- paths to nodes which have type `rm_type', with human readable terms substituted
		require
			has_language: ontology.has_language(a_lang)
		local
			phys_paths: ARRAYED_LIST [STRING]
		do
			create Result.make (0)
			Result.compare_objects
			across object_path_map as object_path_map_csr loop
				if attached object_path_map_csr.item and then object_path_map_csr.item.rm_type_name.is_equal (rm_type) then
					Result.extend (ontology.physical_to_logical_path (object_path_map_csr.key, a_lang, True))
				end
			end
		end

	c_object_at_path (a_path: attached STRING): attached C_OBJECT
			-- find the c_object from the path_map matching the path; uses path map so as to pick up
			-- paths generated by internal references
		require
			a_path_valid: has_path (a_path)
		do
			Result := object_path_map.item (a_path)
		end

	c_attr_at_path (a_path: attached STRING): attached C_ATTRIBUTE
			-- find the C_ATTRIBUTE from the path_map matching the path; uses path map so as to pick up
			-- paths generated by internal references
		require
			a_path_valid: has_attr_path (a_path)
		do
			Result := attr_path_map.item (a_path)
		end

	matching_path (a_path: STRING): detachable STRING
			-- Find longest path that matches a_path in this archetype. Useful for processing paths to primitive leaf objects, where
			-- the path refers to an object or attribute that is not actually specified within the archetype, i.e. only a parent object is.
			-- If asked on a flat archetype, result is a path anywhere in inheritance-flattened archetype;
			-- uses path map so as to pick up paths generated by internal references
		local
			match_len: INTEGER
		do
			match_len := 1
			across physical_paths as paths_csr loop
				-- only compare paths of length > 1 to avoid matching '/'
				if paths_csr.item.count > match_len and a_path.starts_with (paths_csr.item) then
					Result := paths_csr.item
					match_len := Result.count
				end
			end
		end

feature -- Status Report

	has_adl_version: BOOLEAN
			-- True if adl_version is set
		do
			Result := attached adl_version
		end

	is_specialised: BOOLEAN
			-- 	True if this archetype identifies a specialisation parent
		do
			Result := specialisation_depth > 0
		end

	has_physical_path (a_path: STRING): BOOLEAN
			-- true if physical path `a_path' exists in this archetype
		do
			Result := physical_paths.has (a_path)
		end

	has_slots: BOOLEAN
			-- true if there are any slots
		do
			Result := attached slot_index and then slot_index.count > 0
		end

	has_suppliers: BOOLEAN
			-- true if there are any external references / fillers, i.e. any C_ARCHETYPE_ROOTs
		do
			Result := attached suppliers_index and then suppliers_index.count > 0
		end

	has_invariants: BOOLEAN
			-- true if there are invariants
		do
			Result := attached invariants
		end

	has_path (a_path: STRING): BOOLEAN
			-- True if a_path exists in this archetype. If asked on a flat archetype, result indicates whether path exists
			-- anywhere in inheritance-flattened archetype. ; uses path map so as to pick up paths generated by internal references
		do
			Result := physical_paths.has (a_path)
		end

	has_attr_path (a_path: STRING): BOOLEAN
			-- True if a_path exists in this archetype. If asked on a flat archetype, result indicates whether path exists
			-- anywhere in inheritance-flattened archetype. ; uses path map so as to pick up paths generated by internal references
		do
			Result := attr_path_map.has (a_path)
		end

	is_dirty: BOOLEAN
			-- marker to be used to indicate if structure has changed in such a way that cached elements have to be regenerated,
			-- or re-validation is needed. Set to False after validation

	is_generated: BOOLEAN
			-- True if this archetype was generated from another one, rather than being an original authored archetype

	is_template: BOOLEAN
			-- True if `artefact_type' is any type other than archetype
		do
			Result := artefact_type.is_template
		end

feature -- Status Setting

	set_is_generated
			-- set is_generated flag
		do
			is_generated := True
		end

	clear_is_generated
			-- unset is_generated flag
		do
			is_generated := False
		end

feature {AOM_POST_COMPILE_PROCESSOR, AOM_POST_PARSE_PROCESSOR, ARCHETYPE_VALIDATOR, ARCHETYPE_FLATTENER, C_XREF_BUILDER, EXPR_XREF_BUILDER, ARCH_CAT_ARCHETYPE} -- Validation

	build_xrefs
			-- build definition / ontology cross reference tables used for validation and
			-- other purposes
		local
			a_c_iterator: OG_CONTENT_ITERATOR
			definition_xref_builder: C_XREF_BUILDER
			expr_iterator: EXPR_VISITOR_ITERATOR
			invariants_xref_builder: EXPR_XREF_BUILDER
		do
			create id_atcodes_index.make(0)
			create data_atcodes_index.make(0)
			create use_node_index.make(0)
			create suppliers_index.make(0)
			create accodes_index.make(0)
			create slot_index.make(0)

			create definition_xref_builder.make (Current)
			create a_c_iterator.make (definition.representation, definition_xref_builder)
			a_c_iterator.do_all

			if has_invariants then
				create invariants_index.make(0)
				create invariants_xref_builder
				across invariants as inv_csr loop
					invariants_xref_builder.initialise (Current, inv_csr.item)
					create expr_iterator.make (inv_csr.item, invariants_xref_builder)
					expr_iterator.do_all
				end
			end
		end

	build_rolled_up_status
			-- set rolled_up_specialisation statuses in nodes of definition
			-- only useful to call for specialised archetypes
		require
			is_specialised
		local
			a_c_iterator: OG_CONTENT_ITERATOR
			rollup_builder: C_ROLLUP_BUILDER
		do
			create rollup_builder.make (Current)
			create a_c_iterator.make (definition.representation, rollup_builder)
			a_c_iterator.do_all
		end

	id_atcodes_index: HASH_TABLE [ARRAYED_LIST [ARCHETYPE_CONSTRAINT], STRING]
			-- table of {list<node>, code} for term codes which identify nodes in archetype (note that there
			-- are other uses of term codes from the ontology, which is why this attribute is not just called
			-- 'term_codes_xref_table')

	data_atcodes_index: HASH_TABLE [ARRAYED_LIST [C_OBJECT], STRING]
			-- table of {list<node>, code} for term codes which appear in archetype nodes as data,
			-- e.g. in C_DV_ORDINAL and C_CODE_PHRASE types

	accodes_index: HASH_TABLE [ARRAYED_LIST [CONSTRAINT_REF], STRING]
			-- table of {list<node>, code} for constraint codes in archetype

	use_node_index: HASH_TABLE [ARRAYED_LIST [ARCHETYPE_INTERNAL_REF], STRING]
			-- table of {list<ARCHETYPE_INTERNAL_REF>, target_path}
			-- i.e. <list of use_nodes> keyed by path they point to

	suppliers_index: HASH_TABLE [ARRAYED_LIST [C_ARCHETYPE_ROOT], STRING]
			-- table of {list<C_ARCHETYPE_ROOT>, archetype_id}
			-- i.e. <list of use_archetype nodes> keyed by archetype id they refer to

	invariants_index: HASH_TABLE [ARRAYED_LIST [EXPR_LEAF], STRING]
			-- table of {list<EXPR_LEAF>, target_path}
			-- i.e. <list of invariant leaf nodes> keyed by path they point to

	slot_index: ARRAYED_LIST [ARCHETYPE_SLOT]
			-- list of archetype slots in this archetype

feature -- Modification

	set_adl_version(a_ver: STRING)
			-- set adl_version with a string containing only '.' and numbers,
			-- not commencing or finishing in '.'
		require
			Valid_version: a_ver /= Void and then valid_adl_version(a_ver)
		do
			adl_version := a_ver
		end

	set_archetype_id (an_id: like archetype_id)
		do
			archetype_id := an_id
		end

	set_artefact_type_from_string (s: attached STRING)
		require
			(create {ARTEFACT_TYPE}).valid_type_name(s)
		do
			create artefact_type.make_from_type_name(s)
		end

	set_parent_archetype_id (an_id: attached ARCHETYPE_ID)
		do
			parent_archetype_id := an_id
		end

	set_definition (a_node: attached like definition)
		do
			definition := a_node
		end

	set_invariants (an_assertion_list: attached ARRAYED_LIST[ASSERTION])
			-- set invariants
		do
			invariants := an_assertion_list
		end

	set_ontology (a_node: attached like ontology)
		do
			ontology := a_node
		end

	add_invariant (an_inv: attached ASSERTION)
			-- add a new invariant
		do
			if invariants = Void then
				create invariants.make(0)
			end
			invariants.extend(an_inv)
		end

	rebuild
			-- rebuild any cached state after changes to definition or invariant structure
		do
			build_xrefs
			build_physical_paths
			if is_specialised then
				build_rolled_up_status
			end
			is_dirty := False
		end

feature {ADL15_ENGINE} -- ADL 1.5 Serialisation

	synchronise_adl15
			-- synchronise object representation of archetype to forms suitable for
			-- serialisation
		do
			precursor
			ontology.synchronise_to_tree
		end

feature {NONE} -- Implementation

	build_physical_paths
			-- generate physical paths from definition structure; if no changes made on archetype
		local
			src_node_path: OG_PATH
			src_node_path_str: STRING
			src_nodes: ARRAYED_LIST [ARCHETYPE_INTERNAL_REF]
			tgt_path_c_objects: HASH_TABLE [C_OBJECT, STRING]
			tgt_path_str: STRING
			tgt_path: OG_PATH
			use_refs_csr: CURSOR
			sorted_physical_paths, sorted_physical_leaf_paths: SORTED_TWO_WAY_LIST [STRING]
		do
			object_path_map_cache := definition.all_paths

			-- Add full paths of internal references thus giving full set of actual paths
			use_refs_csr := use_node_index.cursor
			across use_node_index as use_node_csr loop
				-- Hash table with arrayed list of ARCHETYPE_INTERNAL_REFs and Key of target
				-- (ie the ref path of the internal reference)
				src_nodes := use_node_csr.item
				tgt_path_str := use_node_csr.key

				-- only generate derived paths if we are in a flat archetype that has them all, or else in a
				-- differential archetype that happens to have them
				if definition.has_object_path (tgt_path_str) then
					create tgt_path.make_from_string (tgt_path_str)
					tgt_path_c_objects := definition.all_paths_at_path (tgt_path_str)
					if attached {C_OBJECT} definition.c_object_at_path (tgt_path_str) as c_o then
						-- now add the paths below it
						across src_nodes as src_nodes_csr loop
							src_node_path := src_nodes_csr.item.representation.path

							-- pick up the node id from the root node of the target path
							-- unless the source location has its own node id and is a sibling child of the target node of the reference
							if src_nodes_csr.item.is_addressable and then src_node_path.parent_path.is_equal (tgt_path.parent_path) then
								src_node_path.last.set_object_id (src_nodes_csr.item.node_id)
							else
								src_node_path.last.set_object_id (tgt_path.last.object_id)
							end
							src_node_path_str := src_node_path.as_string

							object_path_map_cache.force (c_o, src_node_path_str)

							across tgt_path_c_objects as c_objs_csr loop
								object_path_map_cache.put (c_objs_csr.item, src_node_path_str + "/" + c_objs_csr.key)
							end
						end
					end
				end
			end
			use_node_index.go_to (use_refs_csr)

			create sorted_physical_paths.make
			create sorted_physical_leaf_paths.make
			across object_path_map_cache as c_objs_csr loop
				sorted_physical_paths.extend (c_objs_csr.key)
				if attached c_objs_csr.item and then c_objs_csr.item.is_leaf then
					sorted_physical_leaf_paths.extend (c_objs_csr.key)
				end
			end

			create physical_paths_cache.make(0)
			physical_paths_cache.append (sorted_physical_paths)
			physical_paths_cache.compare_objects

			create physical_leaf_paths_cache.make(0)
			physical_leaf_paths_cache.append (sorted_physical_leaf_paths)
			physical_leaf_paths_cache.compare_objects

			attr_path_map_cache := Void
		ensure
			attached object_path_map_cache
			attached physical_leaf_paths_cache
			attached physical_paths_cache
			not attached attr_path_map_cache
		end

	physical_paths_cache: detachable ARRAYED_LIST [STRING]

	physical_leaf_paths_cache: detachable ARRAYED_LIST [STRING]

	object_path_map_cache: detachable HASH_TABLE [C_OBJECT, STRING]
			-- complete map of object nodes keyed by path, including paths implied by
			-- use_nodes in definition structure.

	attr_path_map: HASH_TABLE [C_ATTRIBUTE, STRING]
			-- complete map of attribute nodes keyed by path, including paths implied by
			-- use_nodes in definition structure. Built on demand
		local
			attr_path: STRING
		do
			if not attached attr_path_map_cache then
				create attr_path_map_cache.make(0)
				across object_path_map as c_obj_csr loop
					if attached c_obj_csr.item and then not c_obj_csr.item.is_root then
						attr_path := c_obj_csr.key.twin
						if attr_path.item (attr_path.count) = {OG_PATH_ITEM}.predicate_right_delim then
							attr_path.remove_tail (attr_path.count - attr_path.last_index_of ({OG_PATH_ITEM}.predicate_left_delim, attr_path.count) + 1)
							if not attr_path_map_cache.has (attr_path) then
								attr_path_map_cache.put (c_obj_csr.item.parent, attr_path)
							end
						end
					end
				end
			end
			Result := attr_path_map_cache
		end

	attr_path_map_cache: HASH_TABLE [C_ATTRIBUTE, STRING]

invariant
	Concept_valid: concept.is_equal (ontology.concept_code)
	Invariants_valid: attached invariants implies not invariants.is_empty
	RM_type_validity: definition.rm_type_name.as_lower.is_equal (archetype_id.rm_entity.as_lower)
	Specialisation_validity: is_specialised implies (specialisation_depth > 0 and attached parent_archetype_id)

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
