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

			-- rebuilding might not work earlier
			if passed then
				target.rebuild
			end

			-- languages and meta-data
			if passed then
				precursor
				validate_languages
			end

			-- validation requiring the archetype xref tables
			if passed then
				validate_slots
				validate_suppliers
			end

			-- basic validation ontology
			if passed then
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
				if target.specialisation_depth /= target_descriptor.specialisation_parent.flat_archetype.specialisation_depth + 1 then
					add_error (ec_VACSD, <<specialisation_depth_from_code (target.concept).out, target.specialisation_depth.out>>)
				end
 			elseif specialisation_depth_from_code (target.concept) /= 0 then
 				add_error (ec_VACSDtop, <<specialisation_depth_from_code (target.concept).out>>)
			end
		end

	validate_languages
			-- check to see that all linguistic items in ontology, description, etc are all coherent
		local
			langs: ARRAYED_SET [STRING]
			err_str: STRING
		do
			-- check that languages defined in translations section are in the archetype ontology
			langs := target.languages_available
			if not langs.is_subset (target.ontology.languages_available) then
				create err_str.make (0)
				from langs.start until langs.off loop
					if not target.ontology.languages_available.has (langs.item) then
						if not err_str.is_empty then
							err_str.append (", ")
						end
						err_str.append (langs.item)
					end
					langs.forth
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
			-- validate all C_ARCHETYPE_ROOT objects in a basic way
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


