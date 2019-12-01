note
	component:   "openEHR ADL Tools"
	description: "Validator of basic archetype structure, and terminology."
	keywords:    "constraint model"
	author:      "Thomas Beale <thomas.beale@openehr.org>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2007- The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class AOM_PHASE_1_VALIDATOR

inherit
	AOM_VALIDATOR
		redefine
			initialise
		end

	ADL_SYNTAX_CONVERTER
		export
			{NONE} all
		end

	STRING_UTILITIES
		export
			{NONE} all
		end

create
	initialise

feature {ADL_2_ENGINE, ADL_14_ENGINE} -- Initialisation

	initialise (an_arch_diff_child: ARCHETYPE; an_arch_flat_parent: detachable ARCHETYPE; an_rm: BMM_MODEL)
		local
			an_auth_flat_parent: detachable AUTHORED_ARCHETYPE
		do
			precursor (an_arch_diff_child, an_arch_flat_parent, an_rm)
			if attached {AUTHORED_ARCHETYPE} an_arch_diff_child as auth_arch then
				if attached {AUTHORED_ARCHETYPE} an_arch_flat_parent as auth_arch_flat_parent then
					an_auth_flat_parent := auth_arch_flat_parent
				end
				create auth_arch_validator.initialise (auth_arch, an_auth_flat_parent, an_rm)
			else
				create auth_arch_validator.default_create
			end
		end

feature -- Validation

	validate
		do
			reset

			-- basic validation
			validate_basics
			validate_languages_consistency
			if passed and attached {AUTHORED_ARCHETYPE} arch_diff_child as auth_arch then
				auth_arch_validator.validate
				merge_errors (auth_arch_validator.errors)
			end

			-- definition and terminology validation
			if passed then
				validate_definition_structure
				validate_terminology
			end

			-- rebuilding might not work earlier because there might be invalid node ids
			if passed then
				arch_diff_child.rebuild

				-- validation requiring the archetype xref tables
				validate_slots
				validate_suppliers
			end

			-- validation that assumes terminology is valid
			if passed then
				validate_definition_codes
			end

			-- annotations
			if passed and attached {AUTHORED_ARCHETYPE} arch_diff_child as auth_arch then
				auth_arch_validator.validate_annotations
				merge_errors (auth_arch_validator.errors)
			end

			if passed then
				report_unused_terminology_codes
			end
		end

feature {NONE} -- Implementation

	auth_arch_validator: AUTHORED_ARCHETYPE_VALIDATOR

	validate_basics
			-- are basic features of archetype structurally intact and correct?
			-- into account validity with respect to parent archetypes.
		do
			if not arch_diff_child.definition.rm_type_name.is_equal (arch_diff_child.archetype_id.rm_class) then
				add_error (ec_VARDT, <<arch_diff_child.archetype_id.rm_class, arch_diff_child.definition.rm_type_name>>)

			elseif not is_valid_root_id_code (arch_diff_child.concept_id) then
				add_error (ec_VARCN, <<arch_diff_child.concept_id, root_id_code_regex_pattern>>)

			-- empty terminology
			elseif arch_diff_child.terminology.term_definitions.is_empty then
				add_error (ec_STCNT, Void)

			-- if specialised according to declaration of parent archetype id
			elseif arch_diff_child.is_specialised then
				if arch_diff_child.specialisation_depth /= arch_flat_parent.specialisation_depth + 1 then
					add_error (ec_VACSD, <<specialisation_depth_from_code (arch_diff_child.concept_id).out, arch_diff_child.specialisation_depth.out>>)
				end

			else -- not specialised
				if specialisation_depth_from_code (arch_diff_child.concept_id) /= 0 then
 					add_error (ec_VACSDtop, <<specialisation_depth_from_code (arch_diff_child.concept_id).out>>)
 				end
			end
		end

	validate_languages_consistency
			-- check to see that languages in child archetype are a subset of those in flat parent
		do
			if arch_diff_child.is_specialised then
				if not arch_diff_child.languages_available.is_subset (arch_flat_parent.languages_available) then
					add_error (ec_VALC, <<arrayed_list_out (arch_diff_child.languages_available), arrayed_list_out (arch_flat_parent.languages_available)>>)
				end
			end
		end

	validate_definition_structure
			-- validate definition structure of archetype
		local
			def_it: C_ITERATOR
		do
			create def_it.make (arch_diff_child.definition)
			def_it.do_until_surface (agent do_validate_structure_node,
				agent (a_c_node: ARCHETYPE_CONSTRAINT): BOOLEAN do Result := passed end)
		end

	do_validate_structure_node (a_c_node: ARCHETYPE_CONSTRAINT; depth: INTEGER)
			-- perform validation of paths against flat parent.
		local
			apa: ARCHETYPE_PATH_ANALYSER
			flat_anc_path: STRING
			og_path: OG_PATH
		do
			if attached {C_ATTRIBUTE} a_c_node as ca then
				if ca.has_differential_path then
					-- if differntial path found in non-specialised archetype, it's an error
					if not arch_diff_child.is_specialised then
						add_error (ec_VDIFV, <<ca.path>>)
					else
						-- if path doesn't exist in flat parent or path of immediate parent node doesn't exist in flat parent either
						-- then it's an error
						create apa.make (ca.og_path)
						if not apa.is_phantom_path_at_level (arch_flat_parent.specialisation_depth) then
							flat_anc_path := apa.path_at_level (arch_flat_parent.specialisation_depth)
							if not arch_flat_parent.has_path (flat_anc_path) then
								-- allow for a terminal attribute under a parent object, but not if parent is the root ie. '/'
								-- (since parent archetype is guaranteed to have that)
								create og_path.make_from_string (flat_anc_path)
								if og_path.parent_path.is_root or else not arch_flat_parent.has_path (og_path.parent_path.as_string) then
									add_error (ec_VDIFP1, <<ca.path, flat_anc_path>>)
								end
							end
						else
							add_error (ec_VDIFP3, <<ca.path>>)
						end
					end
				end
			end
		end

	validate_slots
			-- check that all slot definitions are valid, according to logic:
			-- 	IF includes not empty and = 'any' THEN
			--		not (excludes empty or /= 'any') ==> Error
			-- 	ELSEIF includes not empty and /= 'any' THEN
			--		not (excludes empty or = 'any') ==> Error
			--	END
		local
			includes, excludes: ARRAYED_LIST [ASSERTION]
		do
			across arch_diff_child.slot_index as slot_csr loop
				includes := slot_csr.item.includes
				excludes := slot_csr.item.excludes

				if not includes.is_empty then
					if includes.first.matches_any then
						if not (excludes.is_empty or not excludes.first.matches_any) then
							add_error (ec_VDSEV1, <<slot_csr.item.rm_type_name, slot_csr.item.path>>)
						end
					else
						if not (excludes.is_empty or excludes.first.matches_any) then
							add_error (ec_VDSEV2, <<slot_csr.item.rm_type_name, slot_csr.item.path>>)
						end
					end
				end
			end
		end

	validate_suppliers
			-- check that all C_ARCHETYPE_ROOT objects have an archetype id
		local
			filler_id: ARCHETYPE_HRID
		do
			across arch_diff_child.suppliers_index as supp_csr loop
				-- check that supplier is known in archetype library
				if not current_library.has_archetype_matching_ref (supp_csr.key) then
					add_error (ec_VARXRA, <<supp_csr.item.first.path, supp_csr.key>>)
				-- we could detect supplier loop here if we want
--				elseif current_library.matching_archetype (supp_csr.key).is_equal (child_desc) then
--					add_error (ec_VSUP, <<arch_diff_child.archetype_id.as_string, supp_csr.item.first.parent.path>>)
				end

				-- check that the RM type in the archetype reference is compatible with the RM type of the C_ARCHETYPE_ROOT node
				across supp_csr.item as car_csr loop
					create filler_id.make_from_string (car_csr.item.archetype_ref)
					if not (car_csr.item.rm_type_name.is_equal (filler_id.rm_class) or else
						ref_model.type_conforms_to (filler_id.rm_class, car_csr.item.rm_type_name))
					then
						add_error (ec_VARXTV, <<car_csr.item.path, car_csr.item.archetype_ref, car_csr.item.rm_type_name>>)
					end
				end
			end
		end

	validate_terminology
		do
			validate_terminology_code_formats
			validate_terminology_languages
			validate_terminology_bindings
			validate_terminology_value_sets
		end

	validate_terminology_code_formats
			-- check syntax of codes in terminology.
		local
			code: STRING
		do
			across terminology.term_definitions as terms_for_lang_csr loop
				across terms_for_lang_csr.item as term_defs_csr loop
					code := term_defs_csr.key
					if not is_valid_code (code) then
						add_error (ec_VATCV, <<code, any_code_regex_pattern>>)
					elseif specialisation_depth_from_code (code) /= terminology.specialisation_depth then
						add_error (ec_VTSD, <<code>>)
					end
				end
			end
		end

	validate_terminology_languages
			-- Are all `value_codes' and `value_set_codes' found in all languages?
			-- For specialised archetypes, requires flat ancestor to be available
		local
			langs: ARRAYED_SET [STRING]
		do
			langs := terminology.languages_available
			across langs as langs_csr loop
				across terminology.id_codes as code_csr loop
					if not terminology.has_term_definition (langs_csr.item, code_csr.item) then
						add_error (ec_VTLC, <<code_csr.item, langs_csr.item>>)
					end
				end
				across terminology.value_codes as code_csr loop
					if not terminology.has_term_definition (langs_csr.item, code_csr.item) then
						add_error (ec_VTLC, <<code_csr.item, langs_csr.item>>)
					end
				end
				across terminology.value_set_codes as code_csr loop
					if not terminology.has_term_definition (langs_csr.item, code_csr.item) then
						add_error (ec_VTLC, <<code_csr.item, langs_csr.item>>)
					end
				end
			end
		end

	validate_definition_codes
			-- Check if all id-, at- and ac-codes found in the definition node tree are in the terminology (including inherited items).
			-- Note that id-codes are optional in the terminology for objects under single-valued C_ATTRIBUTEs.
			-- Leave `passed' True if all found node_ids are defined in term_definitions, and term_definitions contains no extras.
			-- For specialised archetypes, requires flat ancestor to be available
		local
			arch_depth: INTEGER
			code_spec_depth: INTEGER
			code: STRING
		do
			arch_depth := arch_diff_child.specialisation_depth
			across arch_diff_child.id_codes_index as codes_csr loop
				code_spec_depth := specialisation_depth_from_code (codes_csr.key)
				-- since id-codes are only required to be defined in the terminology if they identify
				-- nodes under multiply-valued C_ATTRIBUTEs, we have to check their parent C_ATTRIBUTE type
				-- to decide. There can be more than one C_OBJECT with the same id-code.
				across codes_csr.item as ac_csr loop
					if code_spec_depth > arch_depth then
						add_error (ec_VTSD, <<codes_csr.key>>)
					elseif attached {C_OBJECT} ac_csr.item as co and then (co.is_root or else attached co.parent as parent_ca and then parent_ca.is_multiple) then
						if code_spec_depth < arch_depth and not arch_flat_parent.terminology.has_id_code (codes_csr.key) or else
							code_spec_depth = arch_depth and not terminology.has_id_code (codes_csr.key)
						then
							add_error (ec_VATID, <<codes_csr.key, co.path>>)
						end
					end
				end
			end

			-- Are all C_TERMINOLOGY_CODE constraints in definition valid?
			-- A C_TERMINOLOGY_CODE can only be one of the following:
			--	* a single at-code => check if at-code in term definitions
			--	* a single ac-code => check if ac-code in term definitions
			--	* a single ac-code and at-code assumed value pair => both checks above
			across arch_diff_child.value_codes_index as codes_csr loop
				-- validate local codes for depth & presence in terminology
				code := codes_csr.key
				code_spec_depth := specialisation_depth_from_code (code)
				if code_spec_depth > arch_depth then
					add_error (ec_VATCD, <<code, arch_depth.out>>)
				elseif code_spec_depth < arch_depth and not arch_flat_parent.terminology.has_code (code) or else
					code_spec_depth = arch_depth and not terminology.has_code (code)
				then
					add_error (ec_VATDF, <<code, codes_csr.item.first.path>>)
				end
			end

			across arch_diff_child.term_constraints_index as term_constraints_csr loop
				code := term_constraints_csr.key
				code_spec_depth := specialisation_depth_from_code (code)
				if code_spec_depth > arch_depth then
					add_error (ec_VATCD, <<code, arch_depth.out>>)
				elseif code_spec_depth < arch_depth and not arch_flat_parent.terminology.has_value_set_code (code) or else
					code_spec_depth = arch_depth and not terminology.has_value_set_code (code)
				then
					add_error (ec_VACDF, <<code, term_constraints_csr.item.path>>)
				elseif attached term_constraints_csr.item.assumed_value as att_av then
					if attached terminology.value_sets.item (code) as vset and then not vset.has_member_code (att_av) then
						add_error (ec_VATDA, <<att_av, code, term_constraints_csr.item.path>>)
					end
				end
			end
		end

	validate_terminology_value_sets
			-- see if every code in terminology value set definitions is in the terminology
		do
			across terminology.value_sets as vsets_csr loop
				if not terminology.has_value_set_code (vsets_csr.item.id) then
					add_error (ec_VTVSID, <<vsets_csr.item.id>>)
				end
				across vsets_csr.item.members as vset_at_codes_csr loop
					-- check if at-code exists
					if not (terminology.has_value_code (vset_at_codes_csr.item) or else arch_diff_child.is_specialised and then  arch_flat_parent.terminology.has_code (vset_at_codes_csr.item)) then
						add_error (ec_VTVSMD, <<vset_at_codes_csr.item>>)

					-- check if at-code duplicated
					elseif vsets_csr.item.members.occurrences (vset_at_codes_csr.item) > 1 then
						add_error (ec_VTVSUQ, <<vset_at_codes_csr.item, vsets_csr.item.id>>)
					end
				end
			end
		end

	validate_terminology_bindings
			-- Are all `term_bindings' valid, i.e.
			-- for atomic bindings:
			-- 		is every term mentioned in the term_definitions?
			-- for path bindings:
			-- 		does every path mentioned exist in flat archetype?
			--
			-- Are all `constraint_bindings' valid, i.e.
			-- for atomic bindings:
			-- 		is every term mentioned in the term_definitions?
			--
		local
			binding_target_code, binding_key, terminology_id: STRING
		do
			across terminology.term_bindings as bindings_for_terminology_csr loop
				terminology_id := bindings_for_terminology_csr.key
				across bindings_for_terminology_csr.item as bindings_csr loop
					binding_key := bindings_csr.key

					-- if it is not a code, it must be a path that is valid in archetype or at least RM for the archetyped class
					if not is_valid_code (binding_key) and then not (arch_diff_child.has_path (binding_key) or else ref_model.has_property_path (arch_diff_child.definition.rm_type_name, binding_key)) then
						add_error (ec_VTTBK, <<binding_key>>)

					-- it must be code; check it exists
					elseif is_valid_code (binding_key) and then not (terminology.has_code (binding_key) or else arch_diff_child.is_specialised and then arch_flat_parent.terminology.has_code (binding_key)) then
						add_error (ec_VTTBK, <<binding_key>>)

					-- key is valid; check validity of RHS
					else
						binding_target_code := terminology_code_from_uri (bindings_csr.item.as_string)
						if ts.has_terminology (terminology_id) then
							if not ts.terminology (terminology_id).has_concept_id (binding_target_code) then
								add_warning (ec_VETDF, <<binding_target_code, terminology_id>>)
							end
						else
							add_warning (ec_WETDF, <<binding_target_code, terminology_id>>)
						end
					end
				end
			end
		end

	report_unused_terminology_codes
			-- populate lists of at-codes and ac-codes found in terminology that
			-- are not referenced anywhere in the archetype definition
		do
			across arch_diff_child.terminology_unused_term_codes as unused_codes_csr loop
				add_warning (ec_WOUC, <<unused_codes_csr.item>>)
			end
		end

end
