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

create {ADL_ENGINE}
	make, make_minimal
	
feature -- Definitions

	Default_concept_code: STRING is "at0000"

feature  {ADL_ENGINE} -- Initialisation

	make_minimal(an_id: ARCHETYPE_ID; a_primary_lang: STRING) is
		require
			Id_exists: an_id /= Void
			Language_valid: a_primary_lang /= Void and then not a_primary_lang.is_empty
		local
			a_term: ARCHETYPE_TERM
		do
			archetype_id := an_id
			
			adl_version := 	Current_adl_version
	
			create concept_code.make(0)
			concept_code.append(Default_concept_code)
			
			create description.make
			create definition.make_identified(an_id.rm_entity, Default_concept_code)
			
			create a_term.make(concept_code)
			a_term.add_item("text", "unknown")
			a_term.add_item("description", "unknown")
			create ontology.make_empty(a_primary_lang, a_term)
		ensure
			Id_set: archetype_id = an_id
			Concept_set: concept_code.is_equal(Default_concept_code)
		end

	make(an_id: ARCHETYPE_ID; 
			a_concept_code: STRING; 
			a_description: ARCHETYPE_DESCRIPTION; 
			a_definition: C_COMPLEX_OBJECT; 
			an_ontology: ARCHETYPE_ONTOLOGY) is
		require
			Id_exists: an_id /= Void
			Concept_exists: a_concept_code /= Void
			Definition_exists: a_definition /= Void
			Ontology_exists: an_ontology /= Void
		do
			adl_version := 	Current_adl_version
			archetype_id := an_id
			concept_code := a_concept_code
			if a_description = Void then
				create description.make
			else
				description := a_description
			end

			definition := a_definition
			ontology := an_ontology
		ensure
			Id_set: archetype_id = an_id
			Concept_set: concept_code = a_concept_code
			Definition_set: definition = a_definition
			Ontology_set: ontology = an_ontology
		end

feature -- Access

	archetype_id: ARCHETYPE_ID
	
	adl_version: STRING
			-- ADL version of this archetype
			
	is_controlled: BOOLEAN
			-- True if this archetype is controlled in a versioning or document system;
			-- if True, revision_history is included in archetype
	
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
	
	concept_code: STRING

	description: ARCHETYPE_DESCRIPTION
					-- meta-data from 'description' section of archetype

	definition: C_COMPLEX_OBJECT

	invariants: ARRAYED_LIST[ASSERTION]

	ontology: ARCHETYPE_ONTOLOGY

	revision_history: ARRAYED_LIST [ARCHETYPE_AUDIT]
			-- only included in archetype if 'is_controlled' is True

	physical_paths: ARRAYED_LIST [STRING] is
			-- generate physical paths from definition structure
		local
			src_node_path: OG_PATH
			paths_below_tgt_path: HASH_TABLE [C_OBJECT, STRING]
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
	
	logical_paths(a_lang: STRING): ARRAYED_LIST [STRING] is
			-- paths with human readable terms substituted 
		require
			a_lang /= Void and then ontology.languages_available.has(a_lang)
		local
			phys_paths: ARRAYED_LIST [STRING]	
		do
			-- CHANGE Sam Heard 2004-05-19
			-- made logical paths call physical paths directly
			-- cache is held within physical paths
			create Result.make(0)
			Result.compare_objects
			phys_paths := physical_paths
			from
				phys_paths.start
			until
				phys_paths.off
			loop
				Result.extend(ontology.physical_to_logical_path(phys_paths.item, a_lang))
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
	
	ontology_unused_term_codes: ARRAYED_LIST[STRING] is
			-- list of at codes found in ontology that are not referenced 
			-- anywhere in the archetype definition
		local
			ont_codes: SORTED_TWO_WAY_LIST[STRING]
			found_codes: ARRAYED_LIST[STRING]
		do
			create Result.make(0)
			Result.compare_objects
			if not is_specialised then
				ont_codes := ontology.term_codes
				found_codes := found_id_node_codes
				found_codes.append(found_code_node_codes)
				from
					ont_codes.start
				until
					ont_codes.off
				loop
					if not found_codes.has(ont_codes.item) then 
						Result.extend(ont_codes.item)
					end
					ont_codes.forth
				end
				Result.prune(concept_code)
			end
		ensure
			Result_exists: Result /= Void
		end
		
	ontology_unused_constraint_codes: ARRAYED_LIST[STRING] is
			-- list of ac codes found in ontology that are not referenced 
			-- anywhere in the archetype definition
		local
			ont_codes: SORTED_TWO_WAY_LIST[STRING]
			found_codes: ARRAYED_LIST[STRING]
		do
			create Result.make(0)
			if not is_specialised then
				ont_codes := ontology.constraint_codes
				found_codes := found_constraint_codes
				from
					ont_codes.start
				until
					ont_codes.off
				loop
					if not found_codes.has(ont_codes.item) then 
						Result.extend(ont_codes.item)
					end
					ont_codes.forth
				end
			end
		ensure
			Result_exists: Result /= Void
		end

	errors: STRING
			-- validity errors in this archetype
	
	warnings: STRING
			-- validity warnings for this archetype
	
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
		
	is_valid: BOOLEAN is
			-- is archetype in valid state?
		local
			node_list_validity, constraint_references_validity, internal_references_validity: BOOLEAN
		do
			create errors.make(0)
			create warnings.make(0)
			
			if archetype_id = Void then
				errors.append("No archetype_id%N")
			elseif definition = Void then
				errors.append("No definition%N")
			elseif invariants /= Void and invariants.is_empty then
				errors.append("invariants cannot be empty if specified")
			elseif ontology = Void then
				errors.append("No ontology%N")
			elseif not ontology.is_valid then
				errors.append("Ontology errors:-%N" + ontology.errors)
				warnings.append("Ontology warnings:-%N: " + ontology.warnings)
			else
				if not definition.rm_type_name.is_equal (archetype_id.rm_entity) then
					errors.append("Archetype id type %"" + archetype_id.rm_entity + 
								"%" does not match type %"" + definition.rm_type_name + 
								"%" in definition section%N")
				end
				
				update_node_lists

				check_definition
				
				check_unidentified_nodes
			
				-- currently we don't use the results of these functions - we just
				-- check whether any errors were set. We want to see all the errors, 
				-- which is why these results are not anded together, because the
				-- first failure will prevent the execution of the later vality calls
				-- in the expression (maybe a not( x or y or z) would work, but I don't
				-- know how smart the compiler is
				node_list_validity := node_ids_valid
				
				constraint_references_validity := constraint_references_valid
			
				internal_references_validity := internal_references_valid
			end
			Result := errors.is_empty
		end		
	
	has_warnings: BOOLEAN is
			-- True if warnings from last call to validate
		do
			Result := warnings /= Void and then not warnings.is_empty
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

feature {ARCHETYPE} -- Validation

	check_definition is
			-- check validity of definition part of archetype
		do
			if not definition.is_valid then
				errors.append(definition.invalid_reason + "%N")
			end
		end
		
	node_ids_valid: BOOLEAN is
			-- True if all found node_ids are defined in term_definitions, 
			-- and term_definitions contains no extras
		local
			a_codes: ARRAYED_LIST[STRING]
		do
			-- see if all found codes are in each language table
			a_codes := found_id_node_codes
			Result := True
			from
				a_codes.start
			until
				a_codes.off
			loop
				if not ontology.has_term_code(a_codes.item) then
					Result := False
					errors.append("Found node term code " + a_codes.item + " not defined in ontology%N")
				end
				a_codes.forth
			end
				
			-- see if every found leaf term code (in an ORDINAL or a CODED_TERM) is in ontology
			a_codes := found_code_node_codes
			from
				a_codes.start
			until
				a_codes.off
			loop
				if not ontology.has_term_code(a_codes.item) then
					Result := False
					errors.append("Found leaf term code " + a_codes.item + " not defined in ontology%N")
				end
				a_codes.forth
			end

			-- unused term codes
			a_codes := ontology_unused_term_codes
			from
				a_codes.start
			until
				a_codes.off
			loop
				warnings.append("Term code " + a_codes.item + " in ontology not used in archetype definition%N")
				a_codes.forth
			end

			-- unused constraint codes
			a_codes := ontology_unused_constraint_codes
			from
				a_codes.start
			until
				a_codes.off
			loop
				warnings.append("Constraint code " + a_codes.item + " in ontology not used in archetype definition%N")
				a_codes.forth
			end
		end		
		
	constraint_references_valid: BOOLEAN is
			-- True if all found constraint_codes are defined in constraint_definitions, 
			-- and constraint_definitions contains no extras
		local
			term_codes: ARRAYED_LIST[STRING]
			ont_term_codes: SORTED_TWO_WAY_LIST[STRING]
		do
			Result := True
			term_codes := found_constraint_codes
			from
				term_codes.start
			until
				term_codes.off
			loop
				if not ontology.has_constraint_code(term_codes.item) then
					Result := True
					errors.append("Found constraint code " + term_codes.item + " not defined in all languages in ontology%N")
				end
				term_codes.forth
			end
				
			-- see if each code in this definitions table is in found list
			ont_term_codes := ontology.constraint_codes
			from
				ont_term_codes.start
			until
				ont_term_codes.off
			loop
				if not term_codes.has(ont_term_codes.item) then
					warnings.append("Constraint code " + ont_term_codes.item + " in ontology not used in archetype definition%N")
				end
				ont_term_codes.forth
			end
		end		
		
	internal_references_valid: BOOLEAN is
			-- validate items in `found_internal_references'
		local
			use_refs: LIST[STRING]
		do
			Result := True
			use_refs := found_internal_references
			from
				use_refs.start
			until
				use_refs.off
			loop
				if not definition.has_path(use_refs.item) then
					Result := False
					errors.append("Error: path " + use_refs.item + " not found in archetype%N")
				end
				use_refs.forth
			end
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
			chg_root_node := concept_code.is_equal(definition.node_id)

			ontology.convert_to_specialised
			if chg_root_node then
				definition.set_object_id(ontology.concept_code)
			end
			archetype_id := archetype_id.create_specialised_id(a_spec_concept)
			concept_code := ontology.concept_code
		ensure
			Archetype_id_updated: not archetype_id.is_equal(old archetype_id)
			Concept_code_updated: not concept_code.is_equal(old concept_code)
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
			concept_code := str
		end

	set_parent_archetype_id(an_id: ARCHETYPE_ID) is
		require
			an_id_valid: an_id /= Void
		do
			parent_archetype_id := an_id
		end

	set_description(a_desc: ARCHETYPE_DESCRIPTION) is
		require
			a_desc /= Void
		do
			description := a_desc
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
			update_node_lists
		end

	reset_definition is
			-- set definition back to its original state - just the root
			-- node with all children gone
		do
			definition.remove_all_attributes
			update_node_lists
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
			update_node_lists
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
		
feature -- Status setting

	set_is_controlled is
			-- set 'is_controlled'
		do
			is_controlled := True
		end

	set_readonly is
			-- set is_readonly to True
		do
			is_readonly := True
		end
		
feature -- Output
	
	found_terms: STRING is
		local
			str_lst: ARRAYED_LIST[STRING]
   		do
   			create Result.make(0)
   			
			Result.append("%N--------------- found node term codes -------------%N")
			Result.append(display_arrayed_list(found_id_node_codes))
			Result.append("%N")

			Result.append("%N--------------- found leaf term codes -------------%N")
			Result.append(display_arrayed_list(found_code_node_codes))
			Result.append("%N")

			Result.append("%N--------------- found constraint codes -----------%N")
			str_lst := found_constraint_codes
			Result.append(display_arrayed_list(str_lst))
			Result.append("%N")

			Result.append("%N--------------- found use refs -----------%N")
			create str_lst.make(0)
			from 
				found_internal_references.start
			until
				found_internal_references.off
			loop
				str_lst.extend(found_internal_references.item)
				found_internal_references.forth
			end
			Result.append(display_arrayed_list(str_lst))
			Result.append("%N")
		end

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
			if description /= Void then
				description.synchronise_to_tree			
			end
			ontology.synchronise_to_tree
		end
		
feature {NONE} -- Implementation

	physical_paths_cache: SORTED_TWO_WAY_LIST [STRING]
	
	path_map: HASH_TABLE [C_OBJECT, STRING]
			-- complete map of object nodes keyed by path
	
	update_node_lists is
			-- 
		local
			cadl_iterator: OG_ITERATOR
		do
			create node_ids_xref_table.make(0)
			create code_nodes_code_xref_table.make(0)
			create use_node_path_xref_table.make(0)
			create constraint_nodes_code_xref_table.make(0)
			
			create cadl_iterator.make (definition.representation)
			cadl_iterator.do_all (agent update_node_lists_node_enter_action (?, ?), agent node_exit_action (?, ?))
		end
		
	update_node_lists_node_enter_action (a_node: OG_ITEM; indent_level: INTEGER) is
			-- FIXME: this should be re-implemented as functions in each C_OBJECT subtype,
			-- same approach as enter_block/exit_block approach used in serialisation
		require
			node_exists: a_node /= void
		local
			a_c_obj: C_OBJECT
			a_c_co: C_COMPLEX_OBJECT
			a_c_as: ARCHETYPE_SLOT
			a_c_o: C_ORDINAL
			a_c_ct: C_CODE_PHRASE
			a_i_r: ARCHETYPE_INTERNAL_REF
			a_c_r: CONSTRAINT_REF
		do
			a_c_co ?= a_node.content_item
			a_c_as ?= a_node.content_item
			if a_c_co /= Void or a_c_as /= Void then
				a_c_obj ?= a_node.content_item
				if a_c_obj.is_addressable then
					if not node_ids_xref_table.has(a_c_obj.node_id) then
						node_ids_xref_table.put(create {ARRAYED_LIST[C_OBJECT]}.make(0), a_c_obj.node_id)
					end
					node_ids_xref_table.item(a_c_obj.node_id).extend(a_c_obj)
				end
			else
				a_c_o ?= a_node.content_item
				if a_c_o /= Void then
					if a_c_o.is_local then
						from
							a_c_o.items.start
						until
							a_c_o.items.off
						loop
							if not code_nodes_code_xref_table.has(a_c_o.items.item.symbol.code_string) then
								code_nodes_code_xref_table.put(create {ARRAYED_LIST[C_OBJECT]}.make(0), a_c_o.items.item.symbol.code_string)
							end
							code_nodes_code_xref_table.item(a_c_o.items.item.symbol.code_string).extend(a_c_o)
							a_c_o.items.forth
						end
					end
				else
					a_c_ct ?= a_node.content_item
					if a_c_ct /= Void then
						if not a_c_ct.any_allowed and then (a_c_ct.is_local and a_c_ct.code_count > 0) then
							from
								a_c_ct.code_list.start
							until
								a_c_ct.code_list.off
							loop
								if not code_nodes_code_xref_table.has(a_c_ct.code_list.item) then
									code_nodes_code_xref_table.put(create {ARRAYED_LIST[C_OBJECT]}.make(0), a_c_ct.code_list.item)
								end
								code_nodes_code_xref_table.item(a_c_ct.code_list.item).extend(a_c_ct)
								a_c_ct.code_list.forth
							end
						end
					else
						a_i_r ?= a_node.content_item
						if a_i_r /= Void then
							if not use_node_path_xref_table.has(a_i_r.target_path) then
								use_node_path_xref_table.put(create {ARRAYED_LIST[ARCHETYPE_INTERNAL_REF]}.make(0), a_i_r.target_path)
							end	
							use_node_path_xref_table.item(a_i_r.target_path).extend(a_i_r)	
						else
							a_c_r ?= a_node.content_item
							if a_c_r /= Void then
								if not constraint_nodes_code_xref_table.has(a_c_r.target) then
									constraint_nodes_code_xref_table.put(create {ARRAYED_LIST[C_OBJECT]}.make(0), a_c_r.target)
								end
								constraint_nodes_code_xref_table.item(a_c_r.target).extend(a_c_r)			
							end
						end
					end			
				end
			end
		end
		
	node_exit_action (a_node: OG_ITEM; indent_level: INTEGER) is
		require
			node_exists: a_node /= void
		do
		end

	check_unidentified_nodes_node_enter_action (a_node: OG_ITEM; indent_level: INTEGER) is
			-- FIXME: this should be re-implemented as functions in each C_OBJECT subtype,
			-- same approach as enter_block/exit_block approach used in serialisation
		require
			node_exists: a_node /= void
		local
			a_c_c_o, a_c_c_o_2: C_COMPLEX_OBJECT
			a_c_attr, a_c_attr2: C_ATTRIBUTE
			found: BOOLEAN
		do
			a_c_attr ?= a_node.content_item

			-- only check nodes that are either multiple or are single but have multiple alternate children					
			if a_c_attr /= Void and (a_c_attr.is_multiple or else a_c_attr.child_count > 1) then
				from
					a_c_attr.children.start
				until
					a_c_attr.children.off
				loop
					a_c_c_o ?= a_c_attr.children.item

					if a_c_c_o /= Void and not a_c_c_o.is_addressable then
						-- see if it has children other than C_LEAF_OBJECTs
						from
							found := False
							a_c_c_o.attributes.start
						until
							a_c_c_o.attributes.off or found
						loop
							a_c_attr2 := a_c_c_o.attributes.item
							
							from
								a_c_attr2.children.start
							until
								a_c_attr2.children.off or found
							loop
								a_c_c_o_2 ?= a_c_attr2.children.item
								if a_c_c_o_2 /= Void then
									warnings.append("child node of type " + a_c_c_o.rm_type_name + " at path " + 
										a_c_attr.path + " has no id.%N")
									found := True
								end
								a_c_attr2.children.forth
							end
							
							a_c_c_o.attributes.forth
						end
					end
					a_c_attr.children.forth
				end
			else
					
			end
		end

	check_unidentified_nodes is
			-- look for attributes that are either multiple or have multiple alternatives, whose
			-- child objects are not identified, but only if the children are not C_PRIMITIVEs or 
			-- C_C_Os whose values are C_PRMITIVEs. Record any such nodes as warnings
		local
			cadl_iterator: OG_ITERATOR
		do			
			create cadl_iterator.make (definition.representation)
			cadl_iterator.do_all (agent check_unidentified_nodes_node_enter_action (?, ?), agent node_exit_action (?, ?))
		end
		
	node_ids_xref_table: HASH_TABLE[ARRAYED_LIST[C_OBJECT], STRING]
			-- table of {list<node>, code} for term codes which identify nodes in archetype
			
	constraint_nodes_code_xref_table: HASH_TABLE[ARRAYED_LIST[C_OBJECT], STRING]
			-- table of {list<node>, code} for constraint codes in archetype
			
	code_nodes_code_xref_table: HASH_TABLE[ARRAYED_LIST[C_OBJECT], STRING]
			-- table of {list<node>, code} for term codes which appear in archetype nodes as data,
			-- e.g. in C_ORDINAL and C_CODE_PHRASE types
			
	use_node_path_xref_table: HASH_TABLE[ARRAYED_LIST[ARCHETYPE_INTERNAL_REF], STRING]
			-- table of {list<ARCHETYPE_INTERNAL_REF>, target_path} 
			-- i.e. <list of use_nodes> keyed by path they point to
	
	found_id_node_codes: ARRAYED_LIST[STRING] is
			-- term codes found as identifiers on definition nodes in archetype
		do
			create Result.make(0)
			from
				node_ids_xref_table.start
			until
				node_ids_xref_table.off
			loop
				Result.extend(node_ids_xref_table.key_for_iteration)
				node_ids_xref_table.forth
			end
			Result.compare_objects
		end

	found_code_node_codes: ARRAYED_LIST[STRING] is
			-- term codes found in leaf nodes in definition, e.g. in C_CODE_PHRASE and C_ORDINAL constraints
		do
			create Result.make(0)
			from
				code_nodes_code_xref_table.start
			until
				code_nodes_code_xref_table.off
			loop
				Result.extend(code_nodes_code_xref_table.key_for_iteration)
				code_nodes_code_xref_table.forth
			end
			Result.compare_objects
		end

	found_constraint_codes: ARRAYED_LIST[STRING] is
			-- constraint codes (acNNNN codes) found in body
		do
			create Result.make(0)
			from
				constraint_nodes_code_xref_table.start
			until
				constraint_nodes_code_xref_table.off
			loop
				Result.extend(constraint_nodes_code_xref_table.key_for_iteration)
				constraint_nodes_code_xref_table.forth
			end
			Result.compare_objects
		end
		
	found_internal_references: ARRAYED_LIST[STRING] is
			-- use references found in body
		do
			create Result.make(0)
			from
				use_node_path_xref_table.start
			until
				use_node_path_xref_table.off
			loop
				Result.extend(use_node_path_xref_table.key_for_iteration)
				use_node_path_xref_table.forth
			end
			Result.compare_objects
		end
		
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
	Concept_exists: concept_code /= Void
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
