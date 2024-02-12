note
	component:   "openEHR ADL Tools"
	description: "Perform post parse conversion of the AOM structure to upgrade archetype to ADL 1.5.1."
	keywords:    "ADL, AOM"
	author:      "Thomas Beale <thomas.beale@openehr.org>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2012- openEHR Foundation <http://www.openehr.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class AOM_151_CONVERTER

inherit
	ADL_SYNTAX_CONVERTER
		export
			{NONE} all;
			{ANY} deep_copy, deep_twin, is_deep_equal, standard_is_equal
		end

	SHARED_AOM_PROFILES_ACCESS
		export
			{NONE} all;
		end

	ARCHETYPE_DEFINITIONS
		export
			{NONE} all;
			{ANY} version_less_than, Adl_id_code_version, valid_standard_version
		end

	ADL_2_TERM_CODE_TOOLS
		export
			{NONE} all;
		end

	SHARED_COMPILER_BILLBOARD
		export
			{NONE} all
		end

	EXCEPTIONS
		export
			{NONE} all
		end

create
	make

feature -- Definitions

	Adl_14_legacy_fake_code_text: STRING = "@ internal @"

	Synthesised_string: STRING = "(added by post-parse processor)"

	Empty_string_found: STRING = "(empty string found in original archetype)"

	Synthesised_specialised_string: STRING = " (synthesised)"

	Es_initial: INTEGER = 0
	Es_id_codes_converted: INTEGER = 1
	Es_at_codes_converted: INTEGER = 2
	Es_ac_codes_converted: INTEGER = 3

	Rm_releases: HASH_TABLE [STRING, STRING]
		once
			create Result.make (0)
			Result.put ("1.0.3", "openehr")
			Result.put ("1.0.0", "cen")
		end

feature {ADL_2_ENGINE, ADL_14_ENGINE} -- Initialisation

	make (a_target: AUTHORED_ARCHETYPE; a_flat_parent: detachable AUTHORED_ARCHETYPE; an_rm: BMM_MODEL)
			-- set target_descriptor
			-- initialise reporting variables
			-- a_parser_context may contain unhandled structures needed in this stage
		require
			Sub_151_version: version_less_than (a_target.adl_version, Adl_id_code_version)
		do
			initialise (a_target, a_flat_parent, an_rm)
		ensure
			attached arch_flat_parent as aaf implies aaf.is_flat
		end

	initialise (a_target: AUTHORED_ARCHETYPE; a_flat_parent: detachable AUTHORED_ARCHETYPE; an_rm: BMM_MODEL)
			-- set target_descriptor
			-- initialise reporting variables
		require
			Sub_151_version: version_less_than (a_target.adl_version, Adl_id_code_version)
		do
			target := a_target
			ref_model := an_rm
			arch_flat_parent := a_flat_parent
			if attached arch_flat_parent as afp then
				afp.rebuild
			end
			execution_state := Es_initial
		ensure
			attached arch_flat_parent as afp implies afp.is_flat
		end

feature -- Access

	target: AUTHORED_ARCHETYPE
			-- differential archetype being processed

	arch_flat_parent: detachable AUTHORED_ARCHETYPE

	ref_model: BMM_MODEL

	Execution_state: INTEGER
			-- has value of one of the Es_* constants

feature -- Commands

	execute
		local
			rm_pub_key: STRING
		do
			if version_less_than (target.adl_version, Adl_id_code_version) then
				-- add value-sets extracted from definition; these value sets originally consisted of a synthesised
				-- ac-code and synthesised at-codes which need to be converted
				if not compiler_billboard.value_sets.is_empty then
					target.terminology.set_value_sets (compiler_billboard.value_sets)
				end

				-- find C_TERMINOLOGY_CODE constraints containing id-codes, and convert to at-codes
				convert_reused_id_codes

				-- term bindings have already been created for inline external codes and value sets
				-- However, these contain fake at-codes, as do some C_TERMINOLOGY_CODE objects
				-- the fake at-codes have to be rewritten to normal at-codes
				convert_external_term_constraints

				-- add new id-codes on nodes with no codes
				convert_fake_id_codes

				-- for ADL 1.4 and non ADL 1.5.1 archetypes, remove terminology definitions for "@ internal @"
				remove_fake_id_codes

				-- value sets have already been added to the terminology at this point by the parser
				-- however they contain fake ac-codes; also the inline C_TERMINOLOGY_CODE objects have
				-- the fake ac-code; these codes have to be rewritten to normal ac-codes
				convert_fake_ac_codes

				-- for non-1.5.1 archetypes, synthesise ac-codes and value sets for any C_ATTRIBUTE_TUPLE containing
				-- at-codes not already in a value set (mainly ordinals)
				synthesise_ordinal_value_sets

				-- update archetype ADL version
				target.set_adl_version (latest_adl_version)

				-- if there is a version available for rm_release, use it
				rm_pub_key := ref_model.rm_publisher.as_lower
				if Rm_releases.has (rm_pub_key) and then attached Rm_releases.item (rm_pub_key) as att_rel_str then
					target.set_rm_release (att_rel_str)
				end
			end
		end

feature {NONE} -- Implementation

	convert_reused_id_codes
			-- there are some instances where an at-code from the 1.4 archetype was used as both a node id
			-- and a value id. These show up as id-codes in C_TERMINOLOGY_CODE objects. We have to add new
			-- at-coded terms for them, created as copies of id-codes
			-- This routine only solves single code values, not id-codes that occur inside value sets. For
			-- now, these have to be dealt with manually.
		local
			arch_terms: HASH_TABLE [ARCHETYPE_TERM, STRING]
			converted_code: STRING
		do
			across term_constraints_with_id_codes as ctc_csr loop
				if target.terminology.has_code (ctc_csr.key) then
					arch_terms := target.terminology.term_definitions_for_code (ctc_csr.key).deep_twin
					converted_code := ctc_csr.key.twin
					converted_code.replace_substring_all (id_code_leader, value_code_leader)
					across arch_terms as terms_csr loop
						terms_csr.item.set_code (converted_code)
					end
					target.terminology.put_definition_and_translations (arch_terms, converted_code)
				end
				ctc_csr.item.constraint.replace_substring_all (id_code_leader, value_code_leader)
			end
		end

	term_constraints_with_id_codes: HASH_TABLE [C_TERMINOLOGY_CODE, STRING]
			-- obtain all C_TERMINOLOGY_CODEs that have single id-codes instead of at- or ac-codes in them
		local
			def_it: C_ITERATOR
		do
			create Result.make (0)
			create def_it.make (target.definition)
			def_it.do_all_on_entry (
				agent (a_c_node: ARCHETYPE_CONSTRAINT; depth: INTEGER; idx: HASH_TABLE [C_TERMINOLOGY_CODE, STRING])
					do
						if attached {C_TERMINOLOGY_CODE} a_c_node as ctc then
							if is_id_code (ctc.constraint) then
								idx.put (ctc, ctc.constraint)
							end
						end
					end (?, ?, Result))
		end

	convert_external_term_constraints
			-- Here we convert synthesised at-codes created due to conversion of single external
			-- codes (i.e. not archetype-local at-codes) and also inline value-sets.
			-- For single codes, conversions needed:
			--   * add new at-term to terminology and get its code
			--   * rewrite synthesised at-code in  C_TERMINOLOGY_CODE object
			--   * add parser-synthesised term binding to terminology with new code
			-- For value-sets, conversions needed:
			--   * traverse synthesised value set, creating new at-term def for each
			--   * rewrite code in value set
			--   * add parser-synthesised term binding to terminology with new code
		local
			arch_c_terms: HASH_TABLE [ARRAYED_LIST [C_TERMINOLOGY_CODE], STRING]
			at_code, old_at_code: STRING
	 		vset_members: ARRAYED_LIST [STRING]
	 		orig_lang: STRING
	 		replaced_at_codes: HASH_TABLE [STRING, STRING]
		do
			arch_c_terms := target.value_codes_index
			orig_lang := target.terminology.original_language.code_string
			create replaced_at_codes.make (0)

			if not arch_c_terms.is_empty then

				-- First take care of single-code external code conversions
				-- for each synthesised at-code in a C_TERMINOLOGY_CODE object, generate a new
				-- term definition, get its code, and write that into the C_TERMINOLOGY_CODE
				across arch_c_terms as arch_c_terms_csr loop
					old_at_code := arch_c_terms_csr.key
					if old_at_code.starts_with (Fake_adl_14_at_code_base) then
						target.terminology.create_added_value_definition (Synthesised_string, Synthesised_string)
						at_code := target.terminology.last_new_definition_code

						-- traverse the C_TERMINOLOGY_CODE object(s) having this code
						across arch_c_terms_csr.item as ctc_csr loop
							ctc_csr.item.replace_code (old_at_code, at_code)
						end

						-- write the parser's term bindings in to the terminology
						across compiler_billboard.term_bindings as bindings_csr loop
							across bindings_csr.item as bindings_list_csr loop
								if bindings_list_csr.key.is_equal (old_at_code) then
									target.terminology.put_term_binding (bindings_list_csr.item, bindings_csr.key, at_code)
								end
							end
						end
						replaced_at_codes.put (at_code, old_at_code)
					end
				end
			end

			-- Now take care of value-set at-codes - rewrite value set synthesised codes & do bindings
			across target.terminology.value_sets as vsets_csr loop
				vset_members := vsets_csr.item.members
				from vset_members.start until vset_members.off or not vset_members.item.starts_with (Fake_adl_14_at_code_base) loop
					old_at_code := vset_members.item
					if replaced_at_codes.has (old_at_code) and then attached replaced_at_codes.item (old_at_code) as att_code then
						at_code := att_code
					else
						target.terminology.create_added_value_definition (Synthesised_string, Synthesised_string)
						at_code := target.terminology.last_new_definition_code
					end
					vset_members.replace (at_code)
					convert_bindings (old_at_code, at_code)
					replaced_at_codes.remove (old_at_code)
					vset_members.forth
				end
			end

			-- Rewrite codes for remaining single terms
			across replaced_at_codes as old_at_codes_csr loop
				convert_bindings (old_at_codes_csr.key, old_at_codes_csr.item)
			end
		end

	convert_bindings (old_at_code, new_at_code: STRING)
		local
			orig_lang, new_text, new_desc, new_trans_text, new_trans_desc: STRING
		do
			orig_lang := target.terminology.original_language.code_string

			-- write the parser's term bindings in to the terminology
			across compiler_billboard.term_bindings as bindings_csr loop
				across bindings_csr.item as bindings_list_csr loop
					if bindings_list_csr.key.is_equal (old_at_code) then
						if not target.terminology.has_term_binding (bindings_csr.key, new_at_code) then
							target.terminology.put_term_binding (bindings_list_csr.item, bindings_csr.key, new_at_code)
						end

						-- update term_definition meaning if possible
						if ts.has_terminology (bindings_csr.key) and then ts.terminology (bindings_csr.key).has_concept_id_for_language (bindings_list_csr.item.value, orig_lang) then
							new_text := ts.terminology (bindings_csr.key).term (bindings_list_csr.item.value, orig_lang).text
							new_desc := ts.terminology (bindings_csr.key).term (bindings_list_csr.item.value, orig_lang).text
							target.terminology.replace_term_definition_item (orig_lang, new_at_code, {ARCHETYPE_TERM}.text_key, new_text)
							target.terminology.replace_term_definition_item (orig_lang, new_at_code, {ARCHETYPE_TERM}.description_key, new_desc)

							across target.terminology.languages_available as langs_csr loop
								if not langs_csr.item.is_equal (orig_lang) then
									new_trans_text := "*" + new_text + " (" + orig_lang + ")"
									new_trans_desc := "*" + new_desc + " (" + orig_lang + ")"
									target.terminology.replace_term_definition_item (langs_csr.item, new_at_code, {ARCHETYPE_TERM}.text_key, new_trans_text)
									target.terminology.replace_term_definition_item (langs_csr.item, new_at_code, {ARCHETYPE_TERM}.description_key, new_trans_desc)
								end
							end
						end
					end
				end
			end
		end

	convert_fake_ac_codes
			-- when this is called, synthesised value sets are in the archetype terminology, but containing
			-- synthesised ac-codes, which are also in the originating C_TERMINOLOGY_CODE objects in the
			-- main definition. A real ac-code is created, written into each value set, into the
			-- C_TERMINOLOGY_CODE and a new ac-term definition synthesised for the terminology, based on the
			-- text/description copied from the proximate id-code backing up the tree from the
			-- C_TERMINOLOGY_CODE.
		require
			execution_state = Es_id_codes_converted
		local
			term_vsets: HASH_TABLE [VALUE_SET, STRING]
			arch_c_terms: HASH_TABLE [C_TERMINOLOGY_CODE, STRING]
			ac_code, old_ac_code, parent_ac_code, old_path, path_in_flat: STRING
	 		apa: ARCHETYPE_PATH_ANALYSER
	 		parent_co_in_anc_flat: C_OBJECT
	 		og_path: OG_PATH
	 		ctc: C_TERMINOLOGY_CODE
			new_arch_terms: HASH_TABLE [ARCHETYPE_TERM, STRING]
		do
			term_vsets := target.terminology.value_sets
			arch_c_terms := target.term_constraints_index

			if not arch_c_terms.is_empty then
				across arch_c_terms as arch_c_terms_csr loop
					old_ac_code := arch_c_terms_csr.key
					ctc := arch_c_terms_csr.item
					if old_ac_code.starts_with (Fake_adl_14_ac_code_base) then

						-- now determine the new ac-code. If it's a specialised archetype, we need to figure out
						-- if it's a redefinition of an existing node, in which case we use either the parent
						-- node code or a redefinition code; otherwise, we stick with the new code generated just
						-- below.
			 			create og_path.make_from_string (ctc.path)
			 			og_path.last.set_object_id ("")
			 			old_path := og_path.as_string
			 			if target.is_specialised then
			 				-- generate a path; since the terminal object doesn't currently have any node_id,
			 				-- the path will actually just point to the parent C_ATTRIBUTE
			 				create apa.make_from_string (old_path)
			 				if not apa.is_phantom_path_at_level (target.specialisation_depth - 1) then
				 				path_in_flat := apa.path_at_level (target.specialisation_depth - 1)
				 				check attached arch_flat_parent end
				 				if arch_flat_parent.has_path (path_in_flat) then
				 					parent_co_in_anc_flat := arch_flat_parent.object_at_path (path_in_flat)

				 					-- since we can be dealing with ADL 1.4 archetypes without reliable node ids here
				 					-- we need to find matching node in parent via its RM type, which is a surrogate
				 					-- for the AOM type C_TERMINOLOGY_CODE
				 					if attached {C_TERMINOLOGY_CODE} parent_co_in_anc_flat as parent_ctc then
					 					parent_ac_code := parent_ctc.constraint

				 						-- check if any overrides; if so, a refined code & definition is needed
					 					if not ctc.c_congruent_to_sans_code_check (parent_ctc) then
					 						new_arch_terms := arch_flat_parent.terminology.term_definitions_for_code (parent_ac_code).deep_twin
					 						across new_arch_terms as terms_csr loop
					 							terms_csr.item.text.append (Synthesised_specialised_string)
					 							terms_csr.item.description.append (Synthesised_specialised_string)
					 						end
					 						target.terminology.merge_refined_constraint_definition_and_translations (new_arch_terms, parent_ac_code)
							 				ac_code := target.terminology.last_new_definition_code
							 			else
					 						ac_code := parent_ac_code
					 					end
					 				else
					 					raise ("convert_fake_ac_codes: node in parent at path " + path_in_flat + " should be C_TERMINOLOGY_CODE but is " + parent_co_in_anc_flat.rm_type_name + " instead %N")
					 					create ac_code.make_empty
					 				end
					 			else
					 				-- create a new definition at the specialisation level of this archteype
									target.terminology.merge_new_constraint_definition_and_translations (create_new_terms_from_proximal (ctc))
					 				ac_code := target.terminology.last_new_definition_code
				 				end
				 			else
				 				-- create a new definition at the specialisation level of this archteype
								target.terminology.merge_new_constraint_definition_and_translations (create_new_terms_from_proximal (ctc))
				 				ac_code := target.terminology.last_new_definition_code
			 				end
			 			else
			 				-- create a definition for the new code; here we obtain an approximate definition for it from
							-- obtain the nearest id-code that is defined in the terminology, to use in creating a definition
							target.terminology.merge_new_constraint_definition_and_translations (create_new_terms_from_proximal (ctc))
			 				ac_code := target.terminology.last_new_definition_code
			 			end

			 			-- update the originating C_TERMINOLOGY_CODE object with the new ac-code
						ctc.set_code (ac_code)

						-- now we update value set in terminology
						if term_vsets.has (old_ac_code) then
							term_vsets.replace_key (ac_code, old_ac_code)
							check attached term_vsets.item (ac_code) as vsd then
								vsd.set_id (ac_code)
							end
						end
					end
				end
			end
			execution_state := Es_ac_codes_converted
		ensure
			execution_state = Es_ac_codes_converted
		end

	proximal_node_id (origin_node: C_OBJECT): STRING
			-- obtain the nearest id-code that is defined in the terminology, backing up from `origin_node'
		local
	 		co_csr: C_OBJECT
		do
			from co_csr := origin_node until not (co_csr.node_id.starts_with (Primitive_node_id) or co_csr.node_id.starts_with (fake_adl_14_node_id_base)) and target.terminology.has_code (co_csr.node_id) loop
				if attached co_csr.parent as ca_csr and then attached ca_csr.parent as co then
					co_csr := co
				end
			end
			Result := co_csr.node_id
 		end

	create_new_terms_from_proximal (origin_node: C_OBJECT): HASH_TABLE [ARCHETYPE_TERM, STRING]
		do
			Result := target.terminology.term_definitions_for_code (proximal_node_id (origin_node)).deep_twin
			across Result as terms_csr loop
				terms_csr.item.set_code ("ac1")
				if not terms_csr.item.text.is_empty then
					terms_csr.item.text.append (Synthesised_specialised_string)
				else
					terms_csr.item.set_text (Empty_string_found.twin)
				end
				if not terms_csr.item.description.is_empty then
					terms_csr.item.description.append (Synthesised_specialised_string)
				else
					terms_csr.item.set_description (Empty_string_found.twin)
				end
			end
 		end

	convert_fake_id_codes
			-- add id-codes on nodes with no code
		require
			execution_state = Es_initial
		local
			def_it: C_ITERATOR
		do
			-- make a copy of current C_COMPLEX_OBJECT_PROXYs and rules lists
			-- so that any paths can be corrected
			use_node_index := target.use_node_index
			rules_index := target.rules_index

			create def_it.make (target.definition)
			if is_valid_code (target.definition.node_id) then
				-- now add missing codes
				def_it.do_all_on_entry (agent do_replace_fake_id_code)

				-- update C_ATTRIBUTE differential paths. This has the effect of interpolating
				-- nodes ids on path segments that previously had none
				if target.is_specialised and then attached arch_flat_parent as pf then
					def_it.do_all_on_entry (agent do_rewrite_diff_path (?, ?, pf))
				end
			end

			execution_state := Es_id_codes_converted
		ensure
			execution_state = Es_id_codes_converted
		end

	do_rewrite_diff_path (a_node: ARCHETYPE_CONSTRAINT; depth: INTEGER; anc_flat: ARCHETYPE)
			-- update path so that missing node_ids are added
		local
	 		apa: ARCHETYPE_PATH_ANALYSER
	 		path_in_flat: STRING
	 		og_path_in_flat: OG_PATH
		do
	 		if attached {C_ATTRIBUTE} a_node as ca and then attached ca.differential_path as dp then
	 			create apa.make_from_string (dp)
	 			if not apa.is_phantom_path_at_level (target.specialisation_depth - 1) then
		 			path_in_flat := apa.path_at_level (target.specialisation_depth - 1)
		 			create og_path_in_flat.make_from_string (path_in_flat)
		 			across apa.target as path_csr loop
		 				if not path_csr.item.is_addressable then
							path_csr.item.set_object_id (og_path_in_flat.i_th (path_csr.cursor_index).object_id)
		 				end
		 			end
		 			ca.set_differential_path (apa.target.as_string)
		 		end
			end
		end

	 do_replace_fake_id_code (a_node: ARCHETYPE_CONSTRAINT; depth: INTEGER)
	 		-- add id-codes to nodes that have no id-code. For specialised archetypes, make sure the id-code is
	 		-- correct with respect to the parent, if it's on an existing path
	 	local
	 		apa: ARCHETYPE_PATH_ANALYSER
	 		path_in_flat, id_code, parent_id_code, old_path, use_node_path_str, rule_path_str: STRING
	 		parent_ca_in_anc_flat: C_ATTRIBUTE
	 		parent_co: C_OBJECT
	 		og_path, use_node_path, rule_path: OG_PATH
	 		spec_depth, children_with_rm_type_name_count: INTEGER
	 	do
	 		if attached {C_OBJECT} a_node as c_obj and then not attached {C_PRIMITIVE_OBJECT} c_obj and then c_obj.node_id.starts_with (fake_adl_14_node_id_base) then
	 			-- default to a new code; if node is inherited, or redefined an appropriate code will be used
	 			spec_depth := target.specialisation_depth

	 			create og_path.make_from_string (c_obj.path)
	 			og_path.last.clear_object_id
	 			old_path := og_path.as_string

				-- will get overwritten below
	 			create id_code.make_from_string ("INITIAL CONDITION")

	 			if target.is_specialised then
	 				-- generate a path; since the terminal object doesn't currently have any node_id,
	 				-- the path will actually just point to the parent C_ATTRIBUTE
	 				create apa.make_from_string (old_path)
	 				if not apa.is_phantom_path_at_level (spec_depth - 1) then
		 				path_in_flat := apa.path_at_level (spec_depth - 1)
		 				if attached arch_flat_parent as att_flat_parent and then att_flat_parent.has_path (path_in_flat) then
		 					parent_ca_in_anc_flat := att_flat_parent.attribute_at_path (path_in_flat)

		 					-- we look for a single child of same RM type as in parent, typically something
		 					-- like DV_CODED_TEXT with an internal redefinition. However, there are some other
		 					-- odd cases like redefinition into multiple ELEMENTs where some are use_nodes,
		 					-- and therefore have no id-codes in ADL 1.4, and thus will have synthesised codes here.
		 					children_with_rm_type_name_count := parent_ca_in_anc_flat.children_with_rm_type_name_count (c_obj.rm_type_name)
		 					if children_with_rm_type_name_count > 0 then
		 						parent_co := parent_ca_in_anc_flat.child_with_rm_type_name (c_obj.rm_type_name)
			 					parent_id_code := parent_co.node_id

			 					if children_with_rm_type_name_count = 1 then
			 						id_code := parent_id_code

		 						-- in this case, it must be multiple objects under a container attribute
								elseif children_with_rm_type_name_count > 1 then
				 					target.terminology.create_refined_definition (parent_id_code, Synthesised_string, Synthesised_string)
				 					id_code := target.terminology.last_new_definition_code
				 				end

				 			elseif parent_ca_in_anc_flat.child_count = 1 then
					 			-- case where a single RM conformant type redefines an RM parent type
				 				if ref_model.type_conforms_to (c_obj.rm_type_name, parent_ca_in_anc_flat.children.first.rm_type_name) then
			 						parent_id_code := parent_ca_in_anc_flat.children.first.node_id
			 						if parent_ca_in_anc_flat.is_single then
			 							-- id code not needed in terminology; create one locally
			 							id_code := target.create_refined_id_code (parent_id_code)
				 					else
					 					target.terminology.create_refined_definition (parent_id_code, Synthesised_string, Synthesised_string)
					 					id_code := target.terminology.last_new_definition_code
			 						end

			 					-- doesn't conform to parent type, but we assume does to RM type.
			 					-- E.g. DV_INTERVAL<> being added alongside a DV_QUANTITY
			 					else
					 				id_code := target.create_new_id_code
			 					end
		 					else
								raise ("do_replace_fake_id_code ERROR: " + target.archetype_id.physical_id + " node at path " + c_obj.path +
									" RM type " + c_obj.rm_type_name + " unhandled redefinition%N")
				 			end
				 		-- its a new node off the end of an existing path
				 		elseif attached c_obj.parent as p and then p.is_multiple then
				 			target.terminology.create_added_id_definition (Synthesised_string, Synthesised_string)
				 			id_code := target.terminology.last_new_definition_code
			 			else
			 				id_code := target.create_new_id_code
		 				end
		 			-- new objects at this level; don't have to worry about ids, but need to add definitions in
		 			-- terminology if parent C_ATTRIBUTE is multiple
		 			elseif attached c_obj.parent as p and then p.is_multiple then
			 			target.terminology.create_added_id_definition (Synthesised_string, Synthesised_string)
			 			id_code := target.terminology.last_new_definition_code
		 			else
		 				id_code := target.create_new_id_code
		 			end

		 		-- target not a specialised archetype;
		 		-- if parent object is a container we need to add id-code definitions to treminology
	 			elseif attached c_obj.parent as p and then p.is_multiple then
		 			target.terminology.create_added_id_definition (Synthesised_string, Synthesised_string)
		 			id_code := target.terminology.last_new_definition_code

		 		-- single-valued parent - can add new id-code with no definition in terminology
	 			else
		 			id_code := target.create_new_id_code
	 			end

	 			check attached c_obj.parent as att_parent_ca then
					att_parent_ca.replace_node_id (c_obj.node_id, id_code)
	 			end

				-- fix any matching use nodes with this path; primarily where the path contains a segment
				-- for e.g. Observation/data which has no object id in some ADL 1.4 archetypes
				across use_node_index as use_node_idx_csr loop
					-- to work out if we need to replace anything in old use_node paths, we are looking
					-- for paths that a) match the path we are at now, and b) have a segment with no
					-- object id, at the corresponding place as the end of the current path where we
					-- just replaced the fake node id
					create use_node_path.make_from_string (use_node_idx_csr.key)
					if use_node_idx_csr.key.starts_with (old_path) and not use_node_path.i_th (og_path.count).is_addressable then
						use_node_path.i_th (og_path.count).set_object_id (id_code)
						use_node_path_str := use_node_path.as_string

						-- now replace the paths in each of the use_nodes containing that path
						across use_node_idx_csr.item as use_nodes_csr loop
							use_nodes_csr.item.set_target_path (use_node_path_str)
						end
					end
				end

				-- fix any matching rules nodes with this path: same logic as above for use_nodes
				across rules_index as rules_idx_csr loop
					create rule_path.make_from_string (rules_idx_csr.key)
					if rules_idx_csr.key.starts_with (old_path) and not rule_path.i_th (og_path.count).is_addressable then
						rule_path.i_th (og_path.count).set_object_id (id_code)
						rule_path_str := rule_path.as_string
						across rules_idx_csr.item as rules_csr loop
							if attached {EXPR_ARCHETYPE_REF} rules_csr.item as aref and then aref.is_archetype_definition_ref then
								aref.set_path (rule_path_str)
							end
						end
					end
				end

				-- fix any matching annotations nodes with this path
				if attached target.annotations as att_ann then
					att_ann.update_annotation_path (old_path, c_obj.path)
				end
	 		end
	 	end

	use_node_index: HASH_TABLE [ARRAYED_LIST [C_COMPLEX_OBJECT_PROXY], STRING]
		attribute
			create Result.make (0)
		end

	rules_index: HASH_TABLE [ARRAYED_LIST [EXPR_LEAF], STRING]
		attribute
			create Result.make (0)
		end

	remove_fake_id_codes
			-- remove term code definitions with text = "@ internal @"
		do
			if target.terminology.term_definitions.has_key ("en") then
				across target.terminology.id_codes as id_code_csr loop
					if target.terminology.term_definition ("en", id_code_csr.item).description.is_equal (Adl_14_legacy_fake_code_text) then
						target.terminology.remove_definition (id_code_csr.item)
					end
				end
			end
		end

	synthesise_ordinal_value_sets
		local
			vset: ARRAYED_LIST [STRING]
		do
			create vset.make (0)
			vset.compare_objects
			-- iterate list of C_C_Os that have attribute_tuples
			across target.tuple_parent_index as tuples_cco_csr loop
				-- iterate C_C_O's C_ATTRIBUTE_TUPLEs
				if attached tuples_cco_csr.item.attribute_tuples as att_attr_tuples then
					across att_attr_tuples as c_attr_tuples_csr loop
						-- C_A_T's C_ATTRIBUTEs
						across c_attr_tuples_csr.item.members as c_attr_csr loop
							if c_attr_csr.item.has_children and then attached {C_TERMINOLOGY_CODE} c_attr_csr.item.first_child then
								vset.wipe_out
								-- iterate C_OBJECTs in this C_ATTRIBUTE; should all be of same AOM meta-type
								across c_attr_csr.item.children as c_obj_csr loop
									if attached {C_TERMINOLOGY_CODE} c_obj_csr.item as ctc and then ctc.is_constraint_value_code then
										vset.extend (ctc.constraint.twin)
									end
								end
				 				-- create a definition for the new code; here we obtain an approximate definition for it from
								-- obtain the nearest id-code that is defined in the terminology, to use in creating a definition
								if not vset.is_empty then
									target.terminology.merge_new_constraint_definition_and_translations (create_new_terms_from_proximal (tuples_cco_csr.item))
					 				target.terminology.put_value_set (create {VALUE_SET}.make (target.terminology.last_new_definition_code, vset))
					 			end
							end
						end
					end
				end
			end
		end

end


