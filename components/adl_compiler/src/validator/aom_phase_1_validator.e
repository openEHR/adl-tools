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
			validate, target
		end

	ARCHETYPE_TERM_CODE_TOOLS
		export
			{NONE} all
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

feature -- Access

	target: DIFFERENTIAL_ARCHETYPE
			-- differential archetype being validated

	flat_ancestor: detachable FLAT_ARCHETYPE
			-- flat version of ancestor archetype, if target is specialised

feature -- Status Report

	is_validation_candidate (ara: ARCH_CAT_ARCHETYPE): BOOLEAN
		do
			Result := attached ara.differential_archetype
		end

feature -- Validation

	validate
		do
			reset

			-- set flat_ancestor
			if target_descriptor.is_specialised then
				flat_ancestor := target_descriptor.specialisation_ancestor.flat_archetype
 			end

			-- basic validation
			validate_basics
			validate_structure

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

			-- basic validation ontology
			if passed then
				validate_definition_codes
				validate_ontology_languages
				validate_ontology_bindings
				report_unused_ontology_codes
				validate_ontology_code_spec_levels
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
			elseif not is_valid_concept_code (target.concept) then
				add_error (ec_VARCN, <<target.concept>>)
			elseif target_descriptor.is_specialised then
				if target.specialisation_depth /= target_descriptor.specialisation_ancestor.flat_archetype.specialisation_depth + 1 then
					add_error (ec_VACSD, <<specialisation_depth_from_code (target.concept).out, target.specialisation_depth.out>>)
				end
 			elseif specialisation_depth_from_code (target.concept) /= 0 then
 				add_error (ec_VACSDtop, <<specialisation_depth_from_code (target.concept).out>>)
			end
		end

	validate_structure
			-- validate definition structure of archetype
		local
			def_it: C_ITERATOR
		do
			create def_it.make (target.definition)
			def_it.do_until_surface (agent structure_validate_node,
				agent (a_c_node: ARCHETYPE_CONSTRAINT): BOOLEAN do Result := True end)
		end

	structure_validate_node (a_c_node: ARCHETYPE_CONSTRAINT; depth: INTEGER)
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
						create apa.make_from_string (a_c_node.path)
						if not apa.is_phantom_path_at_level (flat_ancestor.specialisation_depth) then
							flat_anc_path := apa.path_at_level (flat_ancestor.specialisation_depth)
							if not flat_ancestor.has_path (flat_anc_path) then
								create og_path.make_from_string (flat_anc_path)
								if not flat_ancestor.has_path (og_path.parent_path.as_string) then
									add_error (ec_VDIFP1, <<ca.path, flat_anc_path>>)
								end
							end
						else
							add_error (ec_VDIFP3, <<ca.path>>)
						end
					end
				end
			elseif attached {C_OBJECT} a_c_node as co and then not co.is_addressable and not attached {C_PRIMITIVE_OBJECT} a_c_node then
				check attached co.parent as parent_ca then
					add_error (ec_VSONID, <<parent_ca.path, co.rm_type_name>>)
				end
			end
		end

	validate_languages_consistency
			-- check to see that all linguistic items in ontology, description, etc are all coherent
		local
			langs: ARRAYED_SET [STRING]
			err_str: STRING
		do
			-- check that languages defined in translations section are in the archetype ontology
			langs := target.languages_available
			if not langs.is_subset (target.ontology.languages_available) then
				create err_str.make (0)
				across langs as langs_csr loop
					if not target.ontology.languages_available.has (langs_csr.item) then
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
					create filler_id.make_from_string (arch_root_csr.item.archetype_ref)
					if not (arch_root_csr.item.rm_type_name.is_equal (filler_id.rm_class) or else
						rm_schema.type_name_conforms_to (arch_root_csr.item.rm_type_name, filler_id.rm_class)) then
						add_error (ec_VARXTV, <<arch_root_csr.item.archetype_ref, arch_root_csr.item.rm_type_name>>)
					end
				end
			end
		end

	validate_ontology_code_spec_levels
			-- See if there are any codes in the ontology that should not be there - either or lower or higher
			-- level of specialisation.
		do
			across ontology.term_codes as terms_csr loop
				if specialisation_depth_from_code (terms_csr.item) /= ontology.specialisation_depth then
					add_error (ec_VONSD, <<terms_csr.item>>)
				end
			end
			across ontology.constraint_codes as terms_csr loop
				if specialisation_depth_from_code (terms_csr.item) /= ontology.specialisation_depth then
					add_error (ec_VONSD, <<terms_csr.item>>)
				end
			end
		end

	validate_ontology_languages
			-- Are all `term_codes' and `constraint_codes' found in all languages?
			-- For specialised archetypes, requires flat ancestor to be available
		local
			langs: ARRAYED_SET [STRING]
		do
			langs := ontology.languages_available
			across langs as langs_csr loop
				across ontology.term_codes as code_csr loop
					if not ontology.has_term_definition (langs_csr.item, code_csr.item) then
						add_error (ec_VONLC, <<code_csr.item, langs_csr.item>>)
					end
				end
				across ontology.constraint_codes as code_csr loop
					if not ontology.has_constraint_definition (langs_csr.item, code_csr.item) then
						add_error (ec_VONLC, <<code_csr.item, langs_csr.item>>)
					end
				end
			end
		end

	validate_definition_codes
			-- Check if all at- and ac-codes found in the definition node tree are in the ontology (including inherited items).
			-- Leave `passed' True if all found node_ids are defined in term_definitions, and term_definitions contains no extras.
			-- For specialised archetypes, requires flat ancestor to be available
		local
			arch_depth: INTEGER
			cp: TERMINOLOGY_CODE
			spec_depth: INTEGER
		do
			arch_depth := target.specialisation_depth
			across target.id_atcodes_index as codes_csr loop
				spec_depth := specialisation_depth_from_code (codes_csr.key)
				if spec_depth > arch_depth then
					add_error (ec_VONSD, <<codes_csr.key>>)
				elseif spec_depth < arch_depth then
					if not flat_ancestor.ontology.has_term_code (codes_csr.key) then
						add_error (ec_VATDF, <<codes_csr.key>>)
					end
				elseif spec_depth = arch_depth then
					if not ontology.has_term_code (codes_csr.key) then
						add_error (ec_VATDF, <<codes_csr.key>>)
					end
				end
			end

			-- see if every term code used in any C_COMPLEX_OBJECT or TERMINOLOGY_CODE is in ontology
			across target.data_codes_index as codes_csr loop
				-- validate local codes for depth & presence in ontology
				if codes_csr.key.starts_with (Term_code_leader) then
					spec_depth := specialisation_depth_from_code (codes_csr.key)
					if spec_depth > arch_depth then
						add_error (ec_VATCD, <<codes_csr.key, arch_depth.out>>)
					elseif spec_depth < arch_depth then
						if not flat_ancestor.ontology.has_term_code (codes_csr.key) then
							add_error (ec_VATDF, <<codes_csr.key>>)
						end
					elseif spec_depth = arch_depth then
						if not ontology.has_term_code (codes_csr.key) then
							add_error (ec_VATDF, <<codes_csr.key>>)
						end
					end
				else
					create cp.make_from_string (codes_csr.key)
					if ts.has_terminology (cp.terminology_id) then
						if not ts.terminology (cp.terminology_id).has_concept_id (cp.code_string) then
							add_error (ec_VETDF, <<codes_csr.key, cp.terminology_id>>)
						end
					else
						add_warning (ec_WETDF, <<cp.as_string, cp.terminology_id>>)
					end
				end
			end

			-- check if all found constraint_codes are defined in constraint_definitions,
			across target.accodes_index as codes_csr loop
				spec_depth := specialisation_depth_from_code (codes_csr.key)
				if spec_depth > arch_depth then
					add_error (ec_VATCD, <<codes_csr.key, arch_depth.out>>)
				elseif spec_depth < arch_depth then
					if not flat_ancestor.ontology.has_constraint_code (codes_csr.key) then
						add_error (ec_VACDF, <<codes_csr.key>>)
					end
				elseif spec_depth = arch_depth then
					if not ontology.has_constraint_code (codes_csr.key) then
						add_error (ec_VACDF, <<codes_csr.key>>)
					end
				end
			end
		end

	validate_ontology_bindings
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
		do
			across ontology.term_bindings as bindings_csr loop
				across bindings_csr.item as bindings_for_lang_csr loop
					if not (is_valid_code (bindings_for_lang_csr.key) and then ontology.has_term_code (bindings_for_lang_csr.key) or else
						target.has_path (bindings_for_lang_csr.key))
					then
						add_error (ec_VOTBK, <<bindings_for_lang_csr.key>>)
					end
				end
			end
			across ontology.constraint_bindings as bindings_csr loop
				across bindings_csr.item as bindings_for_lang_csr loop
					if not (is_valid_code (bindings_for_lang_csr.key) and then ontology.has_constraint_code (bindings_for_lang_csr.key)) then
						add_error (ec_VOCBK, <<bindings_for_lang_csr.key>>)
					end
				end
			end
		end

	report_unused_ontology_codes
			-- populate lists of at-codes and ac-codes found in ontology that
			-- are not referenced anywhere in the archetype definition
		do
			across target.ontology_unused_term_codes as unused_codes_csr loop
				add_warning (ec_WOUC, <<unused_codes_csr.item>>)
			end
			across target.ontology_unused_constraint_codes as unused_codes_csr loop
				add_warning (ec_WOUC, <<unused_codes_csr.item>>)
			end
		end

end


