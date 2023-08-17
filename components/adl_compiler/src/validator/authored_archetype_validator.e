note
	component:   "openEHR ADL Tools"
	description: "Validator for AUTHORED_RESOURCE objects"
	keywords:    "archetype"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2007- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class AUTHORED_ARCHETYPE_VALIDATOR

inherit
	AUTHORED_RESOURCE_VALIDATOR
		rename
			initialise as initialise_resource
		redefine
			target, validate, default_create, validate_original_language
		end

create
	initialise, default_create

feature {NONE} -- Initialisation

	default_create
		do
			create target.default_create
			create ref_model.default_create
			reset
		end

	initialise (a_target: like target; an_arch_flat_parent: like arch_flat_parent; an_rm: BMM_MODEL)
			-- set target and initialise reporting variables
		do
			initialise_resource (a_target)
			arch_flat_parent := an_arch_flat_parent
			ref_model := an_rm
		ensure
			target_set: target = a_target
			arch_flat_parent = an_arch_flat_parent
			Passed: passed
		end

feature -- Access

	target: AUTHORED_ARCHETYPE

	arch_flat_parent: detachable AUTHORED_ARCHETYPE

	ref_model: BMM_MODEL

feature -- Commands

	validate
		do
			validate_original_language
			if passed then
				validate_metadata
				validate_translations
				validate_description
			end

			if passed then
				validate_languages_consistency
			end
		end

	validate_annotations
			-- for each language, ensure that annotations are proper translations of each other (if present)
			-- For specialised archetypes, requires flat ancestor to be available
			-- Typically has to be run after other validation on archetype terminology to produce sensible results
		local
			ann_path: STRING
			apa: ARCHETYPE_PATH_ANALYSER
		do
			if attached target.annotations as att_targ_annots then
				across att_targ_annots.documentation as annots_csr loop
					across annots_csr.item as annots_for_lang_csr loop
						ann_path := annots_for_lang_csr.key
						create apa.make_from_string (ann_path)

						-- firstly see if annotation path is valid
						if apa.is_archetype_path then
							if not (target.has_path (ann_path) or else attached arch_flat_parent as att_fa and then att_fa.has_path (ann_path)) then
								add_error ({ADL_MESSAGES_IDS}.ec_VRANP1, <<annots_csr.key, ann_path>>)
							end
						elseif not ref_model.has_property_path (target.definition.rm_type_name, ann_path) then
							add_error ({ADL_MESSAGES_IDS}.ec_VRANP2, <<annots_csr.key, ann_path>>)
						end

						-- FIXME: now we should do some other checks to see if contents are of same structure as annotations in other languages
					end
				end
			end
		end

feature {NONE} -- Implementation

	validate_original_language
		do
			precursor
			if passed then
				if not target.terminology.languages_available.has (target.original_language.code_string) then
					add_error ({ADL_MESSAGES_IDS}.ec_VOLT, <<target.original_language.code_string>>)
				end
			end
		end

	validate_metadata
			-- check metadata items
		do
			if not valid_standard_version (target.adl_version) then
				add_error ({ADL_MESSAGES_IDS}.ec_VARAV, <<target.adl_version>>)

			elseif not valid_standard_version (target.rm_release) then
				add_error ({ADL_MESSAGES_IDS}.ec_VARRV, <<target.rm_release>>)
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
				add_error ({ADL_MESSAGES_IDS}.ec_VOTM, <<err_str>>)
			end
		end

end
