note
	component:   "openEHR ADL Tools"
	description: "Archetype abstraction"
	keywords:    "archetype"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2003- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

deferred class ARCHETYPE

inherit
	ARCHETYPE_DEFINITIONS
		export
			{NONE} all;
			{ANY} deep_twin, valid_adl_version
		end

	ADL_15_TERM_CODE_TOOLS
		export
			{NONE} all;
			{ANY} deep_twin
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

	make (an_artefact_type: like artefact_type;
			an_id: like archetype_id;
			an_original_language: like original_language;
			a_uid: like uid;
			a_description: like description;
			a_definition: like definition;
			a_terminology: like terminology)
				-- make from pieces obtained by parsing
		require
			Description_valid: not an_artefact_type.is_overlay implies attached a_description
		do
			artefact_type := an_artefact_type
			adl_version := 	Latest_adl_version
			archetype_id := an_id
			original_language := an_original_language
			description := a_description
			definition := a_definition
			terminology := a_terminology
			is_dirty := True
			uid := a_uid
		ensure
			Artefact_type_set: artefact_type = an_artefact_type
			Adl_version_set: adl_version = Latest_adl_version
			Id_set: archetype_id = an_id
			Original_language_set: original_language = an_original_language
			Definition_set: definition = a_definition
			Terminology_set: terminology = a_terminology
			Is_dirty: is_dirty
			Not_generated: not is_generated
		end

	make_all (an_artefact_type: like artefact_type;
			an_adl_version: STRING;
			an_id: like archetype_id;
			a_parent_archetype_id: like parent_archetype_id;
			is_controlled_flag: BOOLEAN;
			a_uid: like uid;
			an_other_metadata: like other_metadata;
			an_original_language: like original_language;
			a_translations: like translations;
			a_description: like description;
			a_definition: like definition;
			a_rules: like rules;
			a_terminology: like terminology;
			an_annotations: like annotations)
				-- make from all possible items
		require
			Translations_valid: a_translations /= Void implies not a_translations.is_empty
			Description_valid: not an_artefact_type.is_overlay implies attached a_description
			Invariants_valid: a_rules /= Void implies not a_rules.is_empty
		do
			make (an_artefact_type, an_id,
					an_original_language, a_uid,
					a_description,
					a_definition, a_terminology)
			parent_archetype_id := a_parent_archetype_id
			translations := a_translations
			adl_version := an_adl_version
			is_controlled := is_controlled_flag
			other_metadata := an_other_metadata
			rules := a_rules
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
			Invariants_set: rules = a_rules
			Terminology_set: terminology = a_terminology
			Is_dirty: is_dirty
			Not_generated: not is_generated
		end

	make_from_other (other: like Current)
			-- duplicate from another archetype
		local
			other_parent_arch_id: detachable like archetype_id
			other_annotations: detachable RESOURCE_ANNOTATIONS
			other_description: detachable RESOURCE_DESCRIPTION
			other_translations: detachable HASH_TABLE [TRANSLATION_DETAILS, STRING]
			other_invariants: detachable  ARRAYED_LIST [ASSERTION]
			other_other_metadata: detachable HASH_TABLE [STRING, STRING]
		do
			if attached other.parent_archetype_id as other_pid then
				other_parent_arch_id := other_pid.deep_twin
			end
			if attached other.translations as other_trans then
				other_translations := other_trans.deep_twin
			end
			if attached other.description as other_desc then
				other_description := other_desc.safe_deep_twin
			end
			if attached other.annotations as other_annots then
				other_annotations := other_annots.safe_deep_twin
			end
			if other.has_rules then
				other_invariants := other.rules.deep_twin
			end
			if attached other.other_metadata then
				other_other_metadata := other.other_metadata.deep_twin
			end
			make_all (other.artefact_type.twin, other.adl_version.twin, other.archetype_id.deep_twin,
					other_parent_arch_id, other.is_controlled, other.uid, other_other_metadata,
					other.original_language.deep_twin, other_translations,
					other_description, other.definition.deep_twin, other_invariants,
					other.terminology.safe_deep_twin, other_annotations)
			is_generated := other.is_generated

			rebuild
		ensure then
			Is_generated_preserved: other.is_generated implies is_generated
		end

feature -- Access

	rm_release: STRING
			-- Semver.org compatible release of the reference model on which the archetype was based.
			-- This does not imply conformance limited only to this release, since an archetype may
			-- be valid with respect to multiple releases of a reference model. Conformance is captured
			-- outside of the archetype.
		attribute
			create Result.make_from_string ("1.0.2")
		end

	uid: detachable HIER_OBJECT_ID
			-- optional UID identifier of this artefact
			-- FIXME: should really be in AUTHORED_RESOURCE

	archetype_id: ARCHETYPE_HRID

	other_metadata: detachable HASH_TABLE [STRING, STRING]

	adl_version: STRING
			-- ADL version of this archetype

	artefact_type: ARTEFACT_TYPE
			-- design type of artefact, archetype, template, template-component, etc

	version: STRING
			-- version of this archetype, according to its id
		do
			Result := archetype_id.version_id
		end

	parent_archetype_id: detachable ARCHETYPE_HRID
			-- id of specialisation parent of this archetype

	specialisation_depth: INTEGER
			-- infer number of levels of specialisation from concept code
		do
			Result := specialisation_depth_from_code (concept_id)
		ensure
			non_negative: Result >= 0
		end

	concept_id: STRING
			-- at-code of concept of the archetype as a whole and the code of its root node
		do
			Result := definition.node_id
		end

	definition: C_COMPLEX_OBJECT

	rules: detachable ARRAYED_LIST [ASSERTION]

	terminology: ARCHETYPE_TERMINOLOGY

feature -- Paths

	path_map: HASH_TABLE [ARCHETYPE_CONSTRAINT, STRING]
		do
			if attached path_map_cache as pmc then
				Result := pmc
			else
				Result := definition.path_map
				path_map_cache := Result
			end
		end

	all_paths: ARRAYED_LIST [STRING]
			-- all paths from definition structure
		do
			create Result.make_from_array (path_map.current_keys)
			Result.compare_objects
		ensure
			Result.object_comparison
		end

	all_paths_filtered (a_filter: FUNCTION [ANY, TUPLE [ARCHETYPE_CONSTRAINT], BOOLEAN]): ARRAYED_LIST [STRING]
			-- all paths from definition structure filtered by `a_filter'; inclusion if filter
			-- returns True
		do
			create Result.make (0)
			Result.compare_objects
			across path_map as all_paths_csr loop
				if a_filter.item ([all_paths_csr.item]) then
					Result.extend (all_paths_csr.key)
				end
			end
		ensure
			Result.object_comparison
		end

	leaf_paths: ARRAYED_LIST [STRING]
			-- paths from definition structure C_PRIMITIVE_OBJECTs only
		do
			Result := all_paths_filtered (agent (ac: ARCHETYPE_CONSTRAINT): BOOLEAN do Result := attached {C_PRIMITIVE_OBJECT} ac end)
		ensure
			Result.object_comparison
		end

	leaf_paths_annotated (a_lang: STRING): ARRAYED_LIST [STRING]
			-- paths from definition structure C_PRIMITIVE_OBJECTs only; annotated from terminology
		do
			create Result.make (0)
			Result.compare_objects
			across leaf_paths as paths_csr loop
				Result.extend (terminology.annotated_path (paths_csr.item, a_lang, True))
			end
		ensure
			Result.object_comparison
		end

	all_paths_annotated (a_lang: STRING): ARRAYED_LIST [STRING]
			-- all paths from definition structure; annotated from terminology
		do
			create Result.make (0)
			Result.compare_objects
			across all_paths as paths_csr loop
				Result.extend (terminology.annotated_path (paths_csr.item, a_lang, True))
			end
		ensure
			Result.object_comparison
		end

	rm_type_paths_annotated (a_lang, rm_type: STRING): ARRAYED_LIST [STRING]
			-- paths to C_OBJECT nodes which have type `rm_type', with human readable terms substituted
		require
			has_language: terminology.has_language (a_lang)
		local
			filt_paths: ARRAYED_LIST [STRING]
		do
			filt_paths := all_paths_filtered (
				agent (ac: ARCHETYPE_CONSTRAINT; an_rm_type: STRING): BOOLEAN
					do
						Result := attached {C_OBJECT} ac as co and then co.rm_type_name.is_equal (an_rm_type)
					end (?, rm_type)
			)
			create Result.make (0)
			Result.compare_objects
			across filt_paths as paths_csr loop
				Result.extend (terminology.annotated_path (paths_csr.item, a_lang, True))
			end
		end

	object_at_path (a_path: STRING): C_OBJECT
			-- find the c_object from the path_map matching the path; uses path map so as to pick up
			-- paths generated by internal references
		require
			a_path_valid: has_object_path (a_path)
		do
			Result := definition.object_at_path (a_path)
		end

	attribute_at_path (a_path: STRING): C_ATTRIBUTE
			-- find the C_ATTRIBUTE from the path_map matching the path; uses path map so as to pick up
			-- paths generated by internal references
		require
			a_path_valid: has_attribute_path (a_path)
		do
			Result := definition.attribute_at_path (a_path)
		end

	matching_path (a_path: STRING): detachable STRING
			-- Find longest path that matches a_path in this archetype. Useful for processing paths
			-- to primitive leaf objects, where the path refers to an object or attribute that is
			-- not actually specified within the archetype, i.e. only a parent object is.
			-- If asked on a flat archetype, result is a path anywhere in inheritance-flattened archetype;
			-- Will pick up paths generated by internal references
		local
			match_len: INTEGER
		do
			-- only compare paths of length > 1 to avoid matching '/'
			match_len := 1
			across all_paths as paths_csr loop
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

	has_rules: BOOLEAN
			-- true if there are invariants
		do
			Result := attached rules
		end

	has_path (a_path: STRING): BOOLEAN
			-- True if a_path exists in this archetype. If asked on a flat archetype, result indicates whether path exists
			-- anywhere in inheritance-flattened archetype. ; uses path map so as to pick up paths generated by internal references
		do
			Result := definition.has_path (a_path)
		end

	has_object_path (a_path: STRING): BOOLEAN
			-- True if a_path exists in this archetype and refers to a C_OBJECT node
		do
			Result := definition.has_object_path (a_path)
		end

	has_attribute_path (a_path: STRING): BOOLEAN
			-- True if a_path exists in this archetype. If asked on a flat archetype, result indicates whether path exists
			-- anywhere in inheritance-flattened archetype. ; uses path map so as to pick up paths generated by internal references
		do
			Result := definition.has_attribute_path (a_path)
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

	set_is_dirty
			-- set is_dirty flag
		do
			is_dirty := True
		end

	clear_is_dirty
			-- unset is_dirty flag
		do
			is_dirty := False
		end

feature {AOM_POST_COMPILE_PROCESSOR, AOM_POST_PARSE_PROCESSOR, AOM_VALIDATOR, ARCHETYPE_FLATTENER, EXPR_XREF_BUILDER, ARCH_CAT_ARCHETYPE} -- Validation

	id_codes_index: HASH_TABLE [ARRAYED_LIST [ARCHETYPE_CONSTRAINT], STRING]
			-- table of {list<node>, code} for at-codes that identify nodes in archetype
			-- for later checking in ontology. Doesn't include id-codes.
			-- (note that there are other uses of term codes from the ontology, which is
			-- why this attribute is not just called 'term_codes_xref_table')
		local
			def_it: C_ITERATOR
		do
			create Result.make (0)
			create def_it.make (definition)
			def_it.do_all (
				agent (a_c_node: ARCHETYPE_CONSTRAINT; depth: INTEGER; idx: HASH_TABLE [ARRAYED_LIST [ARCHETYPE_CONSTRAINT], STRING])
					local
						og_path: OG_PATH
					do
						-- if it's a differential path, get the id-codes from the path
						if attached {C_ATTRIBUTE} a_c_node as ca and then attached ca.differential_path as diff_path then
							create og_path.make_from_string (diff_path)
							across og_path as path_csr loop
								if path_csr.item.is_addressable and is_id_code (path_csr.item.object_id) then
									if not idx.has (path_csr.item.object_id) then
										idx.put (create {ARRAYED_LIST [ARCHETYPE_CONSTRAINT]}.make(0), path_csr.item.object_id)
									end
									idx.item (path_csr.item.object_id).extend (ca)
								end
							end
						-- note this will include all C_PRIMITIVE_OBJECTs under same id
						elseif attached {C_OBJECT} a_c_node as co then
							if co.is_addressable and is_id_code (co.node_id) then
								if not idx.has (co.node_id) then
									idx.put (create {ARRAYED_LIST [ARCHETYPE_CONSTRAINT]}.make(0), co.node_id)
								end
								idx.item (co.node_id).extend (co)
							end
						end
					end (?, ?, Result),
				Void)
		end

	term_codes_index: HASH_TABLE [ARRAYED_LIST [C_TERMINOLOGY_CODE], STRING]
			-- table of {list<node>, code} for term codes which appear in archetype nodes as data,
			-- in C_TERMINOLOGY_CODE types
			-- keys are either local codes, e.g. "at44" or fully qualified non-local code strings
			-- e.g. "openehr::233", "snomedct_20100601::20000349" etc
		local
			def_it: C_ITERATOR
		do
			create Result.make (0)
			create def_it.make (definition)
			def_it.do_all (
				agent (a_c_node: ARCHETYPE_CONSTRAINT; depth: INTEGER; idx: HASH_TABLE [ARRAYED_LIST [C_OBJECT], STRING])
					local
						key: STRING
					do
						if attached {C_TERMINOLOGY_CODE} a_c_node as ccp and then ccp.code_count > 0 then
							across ccp.code_list as codes_csr loop
								if ccp.is_local then
									key := codes_csr.item
								else
									key := (create {TERMINOLOGY_CODE}.make (ccp.terminology_id, codes_csr.item)).as_string
								end
								if not idx.has (key) then
									idx.put (create {ARRAYED_LIST [C_TERMINOLOGY_CODE]}.make(0), key)
								end
								idx.item (key).extend (ccp)
							end
						end
					end (?, ?, Result),
				Void)
		end

	use_node_index: HASH_TABLE [ARRAYED_LIST [ARCHETYPE_INTERNAL_REF], STRING]
			-- table of {list<ARCHETYPE_INTERNAL_REF>, target_path}
			-- i.e. <list of use_nodes> keyed by path they point to
		local
			def_it: C_ITERATOR
		do
			create Result.make (0)
			create def_it.make (definition)
			def_it.do_all (
				agent (a_c_node: ARCHETYPE_CONSTRAINT; depth: INTEGER; idx: HASH_TABLE [ARRAYED_LIST [ARCHETYPE_INTERNAL_REF], STRING])
					do
						if attached {ARCHETYPE_INTERNAL_REF} a_c_node as air then
							if not idx.has (air.target_path) then
								idx.put (create {ARRAYED_LIST[ARCHETYPE_INTERNAL_REF]}.make(0), air.target_path)
							end
							idx.item (air.target_path).extend (air)
						end
					end (?, ?, Result),
				Void)
		end

	suppliers_index: HASH_TABLE [ARRAYED_LIST [C_ARCHETYPE_ROOT], STRING]
			-- table of {list<C_ARCHETYPE_ROOT>, archetype_ref}
			-- i.e. <list of use_archetype nodes> keyed by archetype ref from template they refer to
		local
			def_it: C_ITERATOR
		do
			create Result.make (0)
			create def_it.make (definition)
			def_it.do_all (
				agent (a_c_node: ARCHETYPE_CONSTRAINT; depth: INTEGER; idx: HASH_TABLE [ARRAYED_LIST [C_ARCHETYPE_ROOT], STRING])
					do
						if attached {C_ARCHETYPE_ROOT} a_c_node as car then
							if not idx.has (car.archetype_ref) then
								idx.put (create {ARRAYED_LIST [C_ARCHETYPE_ROOT]}.make(0), car.archetype_ref)
							end
							idx.item (car.archetype_ref).extend (car)
						end
					end (?, ?, Result),
				Void)
		end

	rules_index: HASH_TABLE [ARRAYED_LIST [EXPR_LEAF], STRING]
			-- table of {list<EXPR_LEAF>, target_path}
			-- i.e. <list of invariant leaf nodes> keyed by path they point to
		local
			def_it: EXPR_ITERATOR
		do
			create Result.make (0)
			if has_rules then
				across rules as inv_csr loop
					create def_it.make (inv_csr.item)
					def_it.do_all (
						agent (a_node: EXPR_ITEM; depth: INTEGER; idx: HASH_TABLE [ARRAYED_LIST [EXPR_LEAF], STRING])
							do
								if attached {EXPR_LEAF} a_node as el then
									if el.is_archetype_definition_ref and attached {STRING} el.item as tgt_path then
										if not idx.has (tgt_path) then
											idx.put (create {ARRAYED_LIST[EXPR_LEAF]}.make(0), tgt_path)
										end
										idx.item (tgt_path).extend (el)
									end
								end
							end (?, ?, Result),
						Void)
				end
			end
		end

	slot_index: ARRAYED_LIST [ARCHETYPE_SLOT]
			-- list of archetype slots in this archetype
		local
			def_it: C_ITERATOR
		do
			create Result.make (0)
			create def_it.make (definition)
			def_it.do_all (
				agent (a_c_node: ARCHETYPE_CONSTRAINT; depth: INTEGER; idx: ARRAYED_LIST [ARCHETYPE_SLOT])
					do
						if attached {ARCHETYPE_SLOT} a_c_node as a_slot then idx.extend (a_slot) end
					end (?, ?, Result),
				Void)
		end

feature -- Modification

	set_adl_version (a_ver: STRING)
			-- set adl_version with a string containing only '.' and numbers,
			-- not commencing or finishing in '.'
		require
			Valid_version: valid_adl_version(a_ver)
		do
			adl_version := a_ver
		end

	set_archetype_id (an_id: like archetype_id)
		do
			archetype_id := an_id
		end

	set_uid (a_uid: STRING)
		do
			create uid.make_from_string (a_uid)
		end

	set_artefact_type_from_string (s: STRING)
		require
			(create {ARTEFACT_TYPE}).valid_type_name(s)
		do
			create artefact_type.make_from_type_name(s)
		end

	set_other_metadata (a_metadata: like other_metadata)
		do
			other_metadata := a_metadata
		end

	add_other_metadata_value (a_key, a_value: STRING)
			-- add the pair `a_key' / `a_value' to `other_metadata', overwriting any value
			-- with the same key if necessary.
		local
			o_metadata: HASH_TABLE [STRING, STRING]
		do
			if attached other_metadata as omd then
				o_metadata := omd
			else
				create o_metadata.make (0)
			end
			o_metadata.force (a_value, a_key)
			other_metadata := o_metadata
		ensure
			other_metadata.item (a_key) = a_value
		end

	add_other_metadata_flag (a_key: STRING)
			-- add a meta-data item of the form of a flag, whose value is implied to be 'true',
			-- overwriting any value with the same key if necessary.
		local
			o_metadata: HASH_TABLE [STRING, STRING]
			any_flag: BOOLEAN
		do
			if attached other_metadata as omd then
				o_metadata := omd
			else
				create o_metadata.make (0)
			end
			any_flag := True
			o_metadata.force (any_flag.out, a_key)
			other_metadata := o_metadata
		ensure
			other_metadata.item (a_key).is_equal ((True).out)
		end

	set_parent_archetype_id (an_id: like archetype_id)
		do
			parent_archetype_id := an_id
		end

	set_definition (a_node: like definition)
		do
			definition := a_node
		end

	set_rules (an_assertion_list: ARRAYED_LIST[ASSERTION])
			-- set invariants
		do
			rules := an_assertion_list
		end

	set_terminology (an_ont: attached like terminology)
		do
			terminology := an_ont
		end

	add_rule (an_inv: ASSERTION)
			-- add a new invariant
		do
			if rules = Void then
				create rules.make(0)
			end
			rules.extend(an_inv)
		end

	rebuild
			-- rebuild any cached state after changes to definition or invariant structure
		do
			path_map_cache := definition.path_map
			if is_specialised then
				roll_up_inheritance_status
			end
			is_dirty := False
		end

feature {ADL_15_ENGINE} -- ADL 1.5 Serialisation

	synchronise_adl15
			-- synchronise object representation of archetype to forms suitable for
			-- serialisation
		do
			precursor
			terminology.synchronise_to_tree
		end

feature {NONE} -- Implementation

	roll_up_inheritance_status
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

	path_map_cache: detachable HASH_TABLE [ARCHETYPE_CONSTRAINT, STRING]
			-- complete map of paths available in this archetype, including paths implied by
			-- use_nodes in definition structure; paths to C_OBJECTs have the C_OBJECT reference

invariant
	Description_valid: not artefact_type.is_overlay implies attached description
	Concept_valid: concept_id.is_equal (terminology.concept_code)
	Invariants_valid: attached rules implies not rules.is_empty
	RM_type_validity: definition.rm_type_name.as_lower.is_equal (archetype_id.rm_class.as_lower)
	Specialisation_validity: is_specialised implies (specialisation_depth > 0 and attached parent_archetype_id)

end


