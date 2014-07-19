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
	AUTHORED_RESOURCE_VALIDATOR
		rename
			initialise as initialise_authored_resource
		redefine
			target
		end

	SHARED_ARCHETYPE_LIBRARIES
		export
			{NONE} all
		end

feature {ADL_15_ENGINE, ADL_14_ENGINE} -- Initialisation

	initialise (ara: ARCH_LIB_ARCHETYPE)
			-- set target_descriptor
			-- initialise reporting variables
		require
			valid_candidate: is_validation_candidate (ara)
		do
			rm_schema := ara.rm_schema
			target_descriptor := ara
			check attached target_descriptor.differential_archetype as da then
				initialise_authored_resource (da)
			end
			if aom_profiles_access.has_profile_for_rm_schema (rm_schema.schema_id) and then attached aom_profiles_access.profile_for_rm_schema (rm_schema.schema_id) as aom_p then
				aom_profile := aom_p
			end

			-- set flat_ancestor
			if target_descriptor.is_specialised then
				flat_ancestor := target_descriptor.specialisation_ancestor.flat_archetype
 			end
		ensure
			target_descriptor_set: target_descriptor = ara
			flat_ancestor_set: ara.is_specialised implies attached flat_ancestor
		end

feature -- Status Report

	is_validation_candidate (ara: ARCH_LIB_ARCHETYPE): BOOLEAN
		deferred
		end

feature {NONE} -- Implementation

	target: DIFFERENTIAL_ARCHETYPE
			-- differential archetype being validated

	flat_ancestor: detachable FLAT_ARCHETYPE
			-- flat version of ancestor archetype, if target is specialised

	target_descriptor: ARCH_LIB_ARCHETYPE
			-- differential archetype being validated

	terminology: ARCHETYPE_TERMINOLOGY
			-- The terminology of the current archetype.
		do
			Result := target.terminology
		end

	rm_schema: BMM_SCHEMA
		attribute
			create Result.make (unknown_value, unknown_value, unknown_value)
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
					if attached {STRING} includes.item.regex_constraint.constraint_regex as a_regex then
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
					if attached {STRING} excludes.item.regex_constraint.constraint_regex as a_regex then
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


