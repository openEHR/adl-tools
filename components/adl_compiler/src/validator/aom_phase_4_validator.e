note
	component:   "openEHR ADL Tools"
	description: "Phase 4 validation: validating performed on flattened archetype and suppliers."
	keywords:    "constraint model"
	author:      "Thomas Beale <thomas.beale@openehr.org>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2007- The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class AOM_PHASE_4_VALIDATOR

inherit
	AOM_VALIDATOR
		rename
			initialise as aom_validator_initialise
		end

create
	initialise

feature {ADL_2_ENGINE, ADL_14_ENGINE} -- Initialisation

	initialise (an_arch_diff_child: ARCHETYPE; an_arch_flat_parent: detachable ARCHETYPE; an_arch_flat: TEMPLATE; an_rm: BMM_MODEL)
			-- set target_descriptor
			-- initialise reporting variables
		do
			aom_validator_initialise (an_arch_diff_child, an_arch_flat_parent, an_rm)
			target_flat := an_arch_flat
		end

feature -- Access

	target_flat: TEMPLATE
			-- flat archetype being validated

feature -- Validation

	validate
		do
			reset
			validate_template_fillers
		end

feature {NONE} -- Implementation

	validate_template_fillers
			-- validate template fillers as being consistent for flattenin
		do
			do_all_template_fillers (target_flat, 0, agent do_validate_template_filler)
		end

feature {NONE} -- Implementation

	do_all_template_fillers (a_flat_arch: ARCHETYPE; depth: INTEGER; agt: PROCEDURE [ANY, TUPLE[ARCHETYPE]])
			-- check if fillers can be overlaid, e.g. if there is a common language etc
		require
			a_flat_arch.is_flat
		local
			matched_arch: ARCHETYPE
		do
			-- limit depth in case of recursive inclusion
			if depth <= Max_template_overlay_depth then
				across a_flat_arch.suppliers_index as xref_idx_csr loop
					-- get the definition structure of the flat archetype corresponding to the archetype id in the suppliers list
					check attached current_library.archetype_matching_ref (xref_idx_csr.key) as att_ala then
						matched_arch := att_ala.flat_archetype
					end

					-- call the agent
					agt (matched_arch)

					-- prevent cycling due to inclusion of current archetype (FIXME: won't catch indirect recursion)
					if not matched_arch.archetype_id.physical_id.is_equal (target_flat.archetype_id.physical_id) then
						do_all_template_fillers (matched_arch, depth + 1, agt)
					end
				end
			end
		end

	do_validate_template_filler (an_arch: ARCHETYPE)
			-- validate a template filler as being consistent for flattening
		do
			-- check that there the original language of the root archetype
			-- is among the languages of the filler
			if not an_arch.has_language (target_flat.original_language.code_string) then
				add_error ({ADL_MESSAGES_IDS}.ec_VTPL, <<target_flat.archetype_id.physical_id, an_arch.archetype_id.physical_id, target_flat.original_language.code_string>>)
			end
		end

end


