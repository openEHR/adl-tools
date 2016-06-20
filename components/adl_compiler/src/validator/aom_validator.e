note
	component:   "openEHR ADL Tools"
	description: "[
				 Validator of standalone archetype (i.e. without reference to parent archetypes
				 in the case of specialised archetypes). The validation done here checks the use
				 of codes defined in the terminology against their use in the definition of the 
				 archetype.
		         ]"
	keywords:    "constraint model"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2007- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

deferred class AOM_VALIDATOR

inherit
	ANY_VALIDATOR

	SHARED_ARCHETYPE_LIBRARIES
		export
			{NONE} all
		end

feature {ADL_2_ENGINE, ADL_14_ENGINE} -- Initialisation

	initialise (an_arch_diff_child: ARCHETYPE; an_arch_flat_parent: detachable ARCHETYPE; an_rm: BMM_MODEL)
		do
			ref_model := an_rm
			arch_diff_child := an_arch_diff_child
			if attached an_arch_flat_parent as att_flat then
				arch_flat_parent := an_arch_flat_parent
			end

			if aom_profiles_access.has_profile_for_rm_schema (ref_model.schema_id) and then attached aom_profiles_access.profile_for_rm_schema (ref_model.schema_id) as aom_p then
				aom_profile := aom_p
			end

			reset
		ensure
			arch_diff_child_set: arch_diff_child = an_arch_diff_child
		end

feature {NONE} -- Implementation

	arch_diff_child: ARCHETYPE
			-- differential archetype being validated

	arch_flat_parent: ARCHETYPE
			-- flat version of ancestor archetype, if target is specialised
		attribute
			create Result.default_create
		end

	terminology: ARCHETYPE_TERMINOLOGY
			-- The terminology of the current archetype.
		do
			Result := arch_diff_child.terminology
		end

	ref_model: BMM_MODEL
		attribute
			create Result.default_create
		end

	aom_profile: detachable AOM_PROFILE

	has_any_type_substitution (an_aom_type: STRING): BOOLEAN
			-- is there any type substitution for `an_aom_type'?
		do
			Result := attached aom_profile as aom_p and then aom_p.has_any_type_substitution (an_aom_type)
		end

	has_type_substitution (an_aom_type, an_rm_type: STRING): BOOLEAN
			-- is there a type substitution for `an_aom_type', `an_rm_type'?
		do
			Result := attached aom_profile as aom_p and then aom_p.has_type_substitution (an_aom_type, an_rm_type)
		end

	has_rm_aom_type_mapping (an_rm_type, an_aom_type: STRING): BOOLEAN
			-- is there a type equivalence between `an_aom_type' and `an_rm_type' according to the AOM_PROFILE?
		do
			Result := attached aom_profile as aom_p and then aom_p.has_rm_aom_primitive_type_mapping (an_rm_type, an_aom_type)
		end

	archetype_id_matches_slot (an_id: STRING; a_slot: ARCHETYPE_SLOT): BOOLEAN
			-- test an archetype id against slot spec (it might pass, even if no archetypes matching the slot were found)
		require
			Archetype_id_valid: not an_id.is_empty
		local
			includes, excludes: ARRAYED_LIST[ASSERTION]
			regex_matcher: RX_PCRE_REGULAR_EXPRESSION
		do
			-- process the includes
			includes := a_slot.includes
			excludes := a_slot.excludes
			if not includes.is_empty and not includes.first.matches_any and not excludes.is_empty then
				from includes.start until includes.off or Result loop
					if attached includes.item.regex_constraint as att_regex and then attached {STRING} att_regex.constraint_regex as a_regex then
						create regex_matcher.make
						regex_matcher.set_case_insensitive (True)
						regex_matcher.compile (a_regex)
						if regex_matcher.is_compiled then
							Result := regex_matcher.recognizes (an_id)
						end
					end
					includes.forth
				end
			elseif not excludes.is_empty and not excludes.first.matches_any and includes.is_empty then
				from excludes.start until excludes.off or not Result loop
					if attached excludes.item.regex_constraint as att_regex and then attached {STRING} att_regex.constraint_regex as a_regex then
						create regex_matcher.make
						regex_matcher.set_case_insensitive (True)
						regex_matcher.compile (a_regex)
						if regex_matcher.is_compiled then
							Result := not regex_matcher.recognizes (an_id)
						end
					end
					excludes.forth
				end
			else
				Result := True
			end
		end

end


