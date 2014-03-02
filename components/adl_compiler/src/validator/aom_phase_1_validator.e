note
	component:   "openEHR ADL Tools"
	description: "[
				 Validator of standalone archetype i.e. without need of flattened parent archetype
				 in the case of specialised archetypes.
		         ]"
	keywords:    "constraint model"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2007- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class AOM_PHASE_1_VALIDATOR

inherit
	AOM_VALIDATOR
		redefine
			validate
		end

	ADL_SYNTAX_CONVERTER
		export
			{NONE} all
		end

	SHARED_ARCHETYPE_CATALOGUES
		export
			{NONE} all
		end

create
	initialise

feature -- Status Report

	is_validation_candidate (ara: ARCH_CAT_ARCHETYPE): BOOLEAN
		do
			Result := attached ara.differential_archetype
		end

feature -- Validation

	validate
		do
			reset

			-- basic validation
			validate_basics
			if passed then
				validate_structure
			end

			-- rebuilding might not work earlier because there might be invalid
			-- node ids
			if passed then
				target.rebuild
			end

			-- languages and meta-data
			if passed then
				precursor
				validate_languages_consistency
			end

			-- validation requiring the archetype xref tables
			if passed then
				validate_slots
				validate_suppliers
			end

			-- basic validation terminology
			if passed then
				validate_terminology_code_formats
				validate_terminology_languages
				validate_definition_codes
				validate_terminology_bindings
				validate_value_sets
				validate_annotations
				report_unused_terminology_codes
			end
		end

feature {NONE} -- Implementation

	validate_basics
			-- are basic features of archetype structurally intact and correct?
			-- into account validity with respect to parent archetypes.
		do
			if not target_descriptor.id.as_string.is_equal (target.archetype_id.as_string) then
				-- this is a serious error, because it means that the archteype and its descriptor are
				-- out of sync, due to some uncontrolled modification on the archetype
				add_warning (ec_validate_e3, <<target_descriptor.id.as_string, target.archetype_id.as_string>>)
			elseif not target.definition.rm_type_name.is_equal (target.archetype_id.rm_class) then
				add_error (ec_VARDT, <<target.archetype_id.rm_class, target.definition.rm_type_name>>)
			elseif not is_valid_root_id_code (target.concept_id) then
				add_error (ec_VARCN, <<target.concept_id, root_id_code_regex_pattern>>)
			elseif target_descriptor.is_specialised then
				if target.specialisation_depth /= target_descriptor.specialisation_ancestor.flat_archetype.specialisation_depth + 1 then
					add_error (ec_VACSD, <<specialisation_depth_from_code (target.concept_id).out, target.specialisation_depth.out>>)
				end
 			elseif specialisation_depth_from_code (target.concept_id) /= 0 then
 				add_error (ec_VACSDtop, <<specialisation_depth_from_code (target.concept_id).out>>)
			end
		end

	validate_structure
			-- validate definition structure of archetype
		local
			def_it: C_ITERATOR
		do
			create def_it.make (target.definition)
			def_it.do_until_surface (agent do_validate_structure_node,
				agent (a_c_node: ARCHETYPE_CONSTRAINT): BOOLEAN do Result := passed end)
		end

	do_validate_structure_node (a_c_node: ARCHETYPE_CONSTRAINT; depth: INTEGER)
			-- perform validation of node against reference model.
		local
			apa: ARCHETYPE_PATH_ANALYSER
			flat_anc_path: STRING
			og_path: OG_PATH
		do
			if attached {C_ATTRIBUTE} a_c_node as ca then
				if ca.has_differential_path then
					-- if differntial path found in non-specialised archetype, it's an error
					if not target.is_specialised then
						add_error (ec_VDIFV, <<ca.path>>)
					else
						-- if path doesn't exist in ancestor and path of immediate parent node doesn't exist in ancestor either
						-- then it's an error
						create apa.make_from_string (ca.path)
						if not apa.is_phantom_path_at_level (flat_ancestor.specialisation_depth) then
							flat_anc_path := apa.path_at_level (flat_ancestor.specialisation_depth)
							if not flat_ancestor.has_path (flat_anc_path) then
								-- allow for a terminal attribute under a parent object, but not if parent is the root ie. '/'
								-- (since parent archetype is guaranteed to have that)
								create og_path.make_from_string (flat_anc_path)
								if og_path.parent_path.is_root or else not flat_ancestor.has_path (og_path.parent_path.as_string) then
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

	validate_languages_consistency
			-- check to see that all linguistic items in terminology, description, etc are all coherent
		local
			langs: ARRAYED_SET [STRING]
			err_str: STRING
		do
			-- check that languages defined in translations section are in the archetype terminology
			langs := target.languages_available
			if not langs.is_subset (target.terminology.languages_available) then
				create err_str.make (0)
				across langs as langs_csr loop
					if not target.terminology.languages_available.has (langs_csr.item) then
						if not err_str.is_empty then
							err_str.append (", ")
						end
						err_str.append (langs_csr.item)
					end
				end
				add_error (ec_VOTM, <<err_str>>)
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
			across target.slot_index as slot_csr loop
				includes := slot_csr.item.includes
				excludes := slot_csr.item.excludes

				if not includes.is_empty and includes.first.matches_any then
					if not (excludes.is_empty or not excludes.first.matches_any) then
						add_error (ec_VDSEV1, <<slot_csr.item.rm_type_name, slot_csr.item.path>>)
					end
				elseif not includes.is_empty and not includes.first.matches_any then
					if not (excludes.is_empty or excludes.first.matches_any) then
						add_error (ec_VDSEV2, <<slot_csr.item.rm_type_name, slot_csr.item.path>>)
					end
				end
			end
		end

	validate_suppliers
			-- check that all C_ARCHETYPE_ROOT objects have an archetype id
		local
			c_ar_list: ARRAYED_LIST [C_ARCHETYPE_ROOT]
			filler_id: ARCHETYPE_HRID
		do
			across target.suppliers_index as supp_csr loop
				if not current_arch_cat.has_archetype_id_for_ref (supp_csr.key) then
					add_error (ec_VARXR, <<supp_csr.item.first.parent.path, supp_csr.key>>)
				end

				-- check that the RM type in the archetype references is compatible with the RM type of the C_ARCHETYPE_ROOT node
				c_ar_list := supp_csr.item
				across c_ar_list as arch_root_csr loop
					create filler_id.make_from_string (arch_root_csr.item.node_id)
					if not (arch_root_csr.item.rm_type_name.is_equal (filler_id.rm_class) or else
						rm_schema.type_name_conforms_to (arch_root_csr.item.rm_type_name, filler_id.rm_class)) then
						add_error (ec_VARXTV, <<arch_root_csr.item.node_id, arch_root_csr.item.rm_type_name>>)
					end
				end
			end
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
			-- Are all `value_codes' and `constraint_codes' found in all languages?
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
				across terminology.constraint_codes as code_csr loop
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
			arch_depth := target.specialisation_depth
			across target.id_codes_index as codes_csr loop
				code_spec_depth := specialisation_depth_from_code (codes_csr.key)
				-- since id-codes are only required to be defined in the terminology if they identify
				-- nodes under multiply-valued C_ATTRIBUTEs, we have to check their parent C_ATTRIBUTE type
				-- to decide. There can be more than one C_OBJECT with the same id-code.
				across codes_csr.item as ac_csr loop
					if code_spec_depth > arch_depth then
						add_error (ec_VTSD, <<codes_csr.key>>)
					elseif attached {C_OBJECT} ac_csr.item as co and then (co.is_root or else attached co.parent as parent_ca and then parent_ca.is_multiple) then
						if code_spec_depth < arch_depth and not flat_ancestor.terminology.has_id_code (codes_csr.key) or else
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
			across target.value_codes_index as codes_csr loop
				-- validate local codes for depth & presence in terminology
				code := codes_csr.key
				code_spec_depth := specialisation_depth_from_code (code)
				if code_spec_depth > arch_depth then
					add_error (ec_VATCD, <<code, arch_depth.out>>)
				elseif code_spec_depth < arch_depth and not flat_ancestor.terminology.has_code (code) or else
					code_spec_depth = arch_depth and not terminology.has_code (code)
				then
					add_error (ec_VATDF, <<code, codes_csr.item.first.path>>)
				end
			end

			across target.term_constraints_index as term_constraints_csr loop
				code := term_constraints_csr.key
				code_spec_depth := specialisation_depth_from_code (code)
				if code_spec_depth > arch_depth then
					add_error (ec_VATCD, <<code, arch_depth.out>>)
				elseif code_spec_depth < arch_depth and not flat_ancestor.terminology.has_constraint_code (code) or else
					code_spec_depth = arch_depth and not terminology.has_constraint_code (code)
				then
					add_error (ec_VACDF, <<code, term_constraints_csr.item.path>>)
				elseif attached term_constraints_csr.item.assumed_value as att_av then
					if attached terminology.value_sets.item (code) as vset and then not vset.has_member_code (att_av) then
						add_error (ec_VATDA, <<att_av, term_constraints_csr.item.path, code>>)
					end
				end
			end
		end

	validate_value_sets
			-- see if every code in value set definitions is in the terminology
		do
			across terminology.value_sets as vsets_csr loop
				if not terminology.has_constraint_code (vsets_csr.item.id) then
					add_error (ec_VTVSID, <<vsets_csr.item.id>>)
				end
				across vsets_csr.item.members as vset_at_codes_csr loop
					-- check if at-code exists
					if not (terminology.has_value_code (vset_at_codes_csr.item) or else attached flat_ancestor as att_fa and then att_fa.terminology.has_code (vset_at_codes_csr.item)) then
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
			-- 		is every term mentioned in the constraint_definitions?
			--
		local
			binding_target_code, arch_code, terminology_id: STRING
		do
			across terminology.term_bindings as bindings_for_terminology_csr loop
				terminology_id := bindings_for_terminology_csr.key
				across bindings_for_terminology_csr.item as bindings_csr loop
					arch_code := bindings_csr.key
					if not (is_valid_code (arch_code) and then
						(terminology.has_code (arch_code) or attached flat_ancestor as att_fa and then att_fa.terminology.has_code (arch_code)) or else
						target.has_path (arch_code))
					then
						add_error (ec_VTBK, <<arch_code>>)
					else
						binding_target_code := terminology_code_from_uri (bindings_csr.item.as_string)
						if ts.has_terminology (terminology_id) then
							if not ts.terminology (terminology_id).has_concept_id (binding_target_code) then
								add_error (ec_WETDF, <<binding_target_code, terminology_id>>)
							end
						else
							add_warning (ec_WETDF, <<binding_target_code, terminology_id>>)
						end
					end
				end
			end
		end

	validate_annotations
			-- for each language, ensure that annotations are proper translations of each other (if present)
			-- For specialised archetypes, requires flat ancestor to be available
		local
			ann_path: STRING
			apa: ARCHETYPE_PATH_ANALYSER
		do
			if target.has_annotations then
				across target.annotations.items as annots_csr loop
					across annots_csr.item.items as annots_for_lang_csr loop
						ann_path := annots_for_lang_csr.key
						create apa.make_from_string (ann_path)

						-- firstly see if annotation path is valid
						if apa.is_archetype_path then
							if not (target.has_path (ann_path) or else attached flat_ancestor as att_fa and then att_fa.has_path (ann_path)) then
								add_error (ec_VRANP1, <<annots_csr.key, ann_path>>)
							end
						elseif not rm_schema.has_property_path (target.definition.rm_type_name, ann_path) then
							add_error (ec_VRANP2, <<annots_csr.key, ann_path>>)
						end

						-- FIXME: now we should do some other checks to see if contents are of same structure as annotations in other languages
					end
				end
			end
		end

	report_unused_terminology_codes
			-- populate lists of at-codes and ac-codes found in terminology that
			-- are not referenced anywhere in the archetype definition
		do
			across target.terminology_unused_term_codes as unused_codes_csr loop
				add_warning (ec_WOUC, <<unused_codes_csr.item>>)
			end
		end

end


