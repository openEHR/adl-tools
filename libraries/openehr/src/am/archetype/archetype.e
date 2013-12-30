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
			Ontology_set: terminology = a_terminology
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
			Ontology_set: terminology = a_terminology
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
			if other.has_invariants then
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
			Result := specialisation_depth_from_code (concept)
		ensure
			non_negative: Result >= 0
		end

	concept: STRING
			-- at-code of concept of the archetype as a whole and the code of its root node
		do
			Result := definition.node_id
		end

	definition: C_COMPLEX_OBJECT

	rules: detachable ARRAYED_LIST [ASSERTION]

	terminology: ARCHETYPE_TERMINOLOGY

feature -- Paths

	physical_paths: ARRAYED_LIST [STRING]
			-- physical paths from definition structure for all objects; if no changes made on archetype,
			-- return cached value
		do
			if not attached physical_paths_cache then
				build_physical_paths
			end
			check attached physical_paths_cache as ppc then
				Result := ppc
			end
		end

	physical_leaf_paths: ARRAYED_LIST [STRING]
			-- physical paths from definition structure for leaf objects only; if no changes made on archetype,
			-- return cached value
		do
			if not attached physical_leaf_paths_cache then
				build_physical_paths
			end
			check attached physical_leaf_paths_cache as plpc then
				Result := plpc
			end
		end

	object_path_map: HASH_TABLE [detachable C_OBJECT, STRING]
			-- physical paths from definition structure for leaf objects only; if no changes made on archetype,
			-- return cached value
		do
			if not attached object_path_map_cache then
				build_physical_paths
			end
			check attached object_path_map_cache as opmc then
				Result := opmc
			end
		end

	logical_paths (a_lang: STRING; leaves_only: BOOLEAN): ARRAYED_LIST [STRING]
			-- paths with human readable terms substituted
		require
			has_language: terminology.has_language (a_lang)
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
				Result.extend (terminology.physical_to_logical_path (phys_paths_csr.item, a_lang, True))
			end
		end

	matching_logical_paths (a_lang, rm_type: STRING): ARRAYED_LIST [STRING]
			-- paths to nodes which have type `rm_type', with human readable terms substituted
		require
			has_language: terminology.has_language (a_lang)
		do
			create Result.make (0)
			Result.compare_objects
			across object_path_map as object_path_map_csr loop
				if attached object_path_map_csr.item and then object_path_map_csr.item.rm_type_name.is_equal (rm_type) then
					Result.extend (terminology.physical_to_logical_path (object_path_map_csr.key, a_lang, True))
				end
			end
		end

	c_object_at_path (a_path: STRING): C_OBJECT
			-- find the c_object from the path_map matching the path; uses path map so as to pick up
			-- paths generated by internal references
		require
			a_path_valid: has_object_path (a_path)
		do
			check attached object_path_map.item (a_path) as co then
				Result := co
			end
		end

	c_attr_at_path (a_path: STRING): C_ATTRIBUTE
			-- find the C_ATTRIBUTE from the path_map matching the path; uses path map so as to pick up
			-- paths generated by internal references
		require
			a_path_valid: has_attr_path (a_path)
		do
			check attached attr_path_map.item (a_path) as ca then
				Result := ca
			end
		end

	matching_path (a_path: STRING): detachable STRING
			-- Find longest path that matches a_path in this archetype. Useful for processing paths
			-- to primitive leaf objects, where the path refers to an object or attribute that is
			-- not actually specified within the archetype, i.e. only a parent object is.
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

	has_invariants: BOOLEAN
			-- true if there are invariants
		do
			Result := attached rules
		end

	has_path (a_path: STRING): BOOLEAN
			-- True if a_path exists in this archetype. If asked on a flat archetype, result indicates whether path exists
			-- anywhere in inheritance-flattened archetype. ; uses path map so as to pick up paths generated by internal references
		do
			Result := physical_paths.has (a_path)
		end

	has_object_path (a_path: STRING): BOOLEAN
			-- True if a_path exists in this archetype and refers to a C_OBJECT node
		do
			Result := physical_paths.has (a_path) and then attached object_path_map.item (a_path)
		end

	has_matching_path (a_path: STRING): BOOLEAN
			-- True if a path that matches all or some of `a_path' exists in this archetype. If asked on a flat archetype
		local
			og_path: OG_PATH
		do
			Result := physical_paths.has (a_path)
			if not Result then
				create og_path.make_from_string (a_path)
				from until og_path.count = 1 or og_path.last.is_addressable or Result loop
					og_path.remove_last
					Result := has_path (og_path.as_string)
				end
			end
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
								if path_csr.item.is_addressable and is_valid_id_code (path_csr.item.object_id) then
									if not idx.has (path_csr.item.object_id) then
										idx.put (create {ARRAYED_LIST[ARCHETYPE_CONSTRAINT]}.make(0), path_csr.item.object_id)
									end
									idx.item (path_csr.item.object_id).extend (ca)
								end
							end
						elseif attached {C_OBJECT} a_c_node as co then
							if co.is_addressable and is_valid_id_code (co.node_id) then
								if not idx.has (co.node_id) then
									idx.put (create {ARRAYED_LIST [C_OBJECT]}.make(0), co.node_id)
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
			-- keys are either local codes, e.g. "at0044" or fully qualified non-local code strings
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
						if attached {C_TERMINOLOGY_CODE} a_c_node as ccp and then (not ccp.any_allowed and ccp.code_count > 0) then
							across ccp.code_list as codes_csr loop
								if ccp.is_local then
									key := codes_csr.item
								else
									key := (create {TERMINOLOGY_CODE}.make (ccp.terminology_id, codes_csr.item)).as_string
								end
								if not idx.has (key) then
									idx.put (create {ARRAYED_LIST[C_TERMINOLOGY_CODE]}.make(0), key)
								end
								idx.item (key).extend (ccp)
							end
						end
					end (?, ?, Result),
				Void)
		end

	constraint_codes_index: HASH_TABLE [ARRAYED_LIST [CONSTRAINT_REF], STRING]
			-- table of {list<node>, code} for constraint codes in archetype
		local
			def_it: C_ITERATOR
		do
			create Result.make (0)
			create def_it.make (definition)
			def_it.do_all (
				agent (a_c_node: ARCHETYPE_CONSTRAINT; depth: INTEGER; idx: HASH_TABLE [ARRAYED_LIST [CONSTRAINT_REF], STRING])
					do
						if attached {CONSTRAINT_REF} a_c_node as cref then
							if not idx.has (cref.target) then
								idx.put (create {ARRAYED_LIST [CONSTRAINT_REF]}.make(0), cref.target)
							end
							idx.item (cref.target).extend (cref)
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

	invariants_index: HASH_TABLE [ARRAYED_LIST [EXPR_LEAF], STRING]
			-- table of {list<EXPR_LEAF>, target_path}
			-- i.e. <list of invariant leaf nodes> keyed by path they point to
		local
			def_it: EXPR_ITERATOR
		do
			create Result.make (0)
			if has_invariants then
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

	set_definition (a_node: attached like definition)
		do
			definition := a_node
		end

	set_invariants (an_assertion_list: ARRAYED_LIST[ASSERTION])
			-- set invariants
		do
			rules := an_assertion_list
		end

	set_ontology (an_ont: attached like terminology)
		do
			terminology := an_ont
		end

	add_invariant (an_inv: ASSERTION)
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
			build_physical_paths
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

	build_physical_paths
			-- generate physical paths from definition structure
		local
			src_node_path: OG_PATH
			src_node_path_str: STRING
			src_nodes: ARRAYED_LIST [ARCHETYPE_INTERNAL_REF]
			tgt_path_c_objects: HASH_TABLE [detachable C_OBJECT, STRING]
			tgt_path_str: STRING
			tgt_path: OG_PATH
			c_o: C_OBJECT
			sorted_physical_paths, sorted_physical_leaf_paths: SORTED_TWO_WAY_LIST [STRING]
		do
			object_path_map_cache := definition.all_paths

			-- Add full paths of internal references thus giving full set of actual paths
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
					c_o := definition.c_object_at_path (tgt_path_str)
					-- now add the paths below it
					across src_nodes as src_nodes_csr loop
						check attached src_nodes_csr.item.representation as rep and then attached rep.path as p then
							src_node_path := p
						end

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

	object_path_map_cache: detachable HASH_TABLE [detachable C_OBJECT, STRING]
			-- complete map of paths available in this archetype, including paths implied by
			-- use_nodes in definition structure; paths to C_OBJECTs have the C_OBJECT reference

	attr_path_map: HASH_TABLE [C_ATTRIBUTE, STRING]
			-- complete map of attribute nodes keyed by path, including paths implied by
			-- use_nodes in definition structure. Built on demand
		local
			attr_path: STRING
		do
			if attached attr_path_map_cache as apmc and not is_dirty then
				Result := apmc
			else
				create Result.make(0)
				-- the following finds C_ATTRIBUTEs that have objects under them
				across object_path_map as c_obj_csr loop
					if attached c_obj_csr.item as c_obj and then not c_obj.is_root then
						attr_path := c_obj_csr.key.twin
						-- remove any trailing predicate part from object path
						if attr_path.item (attr_path.count) = {OG_PATH_ITEM}.predicate_right_delim then
							attr_path.remove_tail (attr_path.count - attr_path.last_index_of ({OG_PATH_ITEM}.predicate_left_delim, attr_path.count) + 1)
						end
						if not Result.has (attr_path) and attached c_obj.parent as ca then
							Result.put (ca, attr_path)
						end
					end
				end

				-- there can be be C_ATTRIBUTEs that are under a C_OBJECT that have no children
				across object_path_map as c_obj_csr loop
					if not attached c_obj_csr.item and not Result.has (c_obj_csr.key) and then attached definition.c_attribute_at_path (c_obj_csr.key) as ca then
						Result.put (ca, c_obj_csr.key.twin)
					end
				end

				attr_path_map_cache := Result
			end
		end

	attr_path_map_cache: detachable HASH_TABLE [C_ATTRIBUTE, STRING]

invariant
	Description_valid: not artefact_type.is_overlay implies attached description
	Concept_valid: concept.is_equal (terminology.concept_code)
	Invariants_valid: attached rules implies not rules.is_empty
	RM_type_validity: definition.rm_type_name.as_lower.is_equal (archetype_id.rm_class.as_lower)
	Specialisation_validity: is_specialised implies (specialisation_depth > 0 and attached parent_archetype_id)

end


