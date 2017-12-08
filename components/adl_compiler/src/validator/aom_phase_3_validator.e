note
	component:   "openEHR ADL Tools"
	description: "Phase 3 validation: validating performed on flattened archetype."
	keywords:    "constraint model"
	author:      "Thomas Beale <thomas.beale@openehr.org>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2007- The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class AOM_PHASE_3_VALIDATOR

inherit
	AOM_VALIDATOR
		rename
			initialise as aom_validator_initialise
		redefine
			validate
		end

create
	initialise

feature {ADL_2_ENGINE, ADL_14_ENGINE} -- Initialisation

	initialise (an_arch_diff_child: ARCHETYPE; an_arch_flat_parent: detachable ARCHETYPE; an_arch_flat: ARCHETYPE; an_rm: BMM_MODEL)
			-- set target_descriptor
			-- initialise reporting variables
		do
			aom_validator_initialise (an_arch_diff_child, an_arch_flat_parent, an_rm)
			target_flat := an_arch_flat
		end

feature -- Access

	target_flat: ARCHETYPE
			-- flat archetype being validated

feature -- Validation

	validate
		do
			reset
			validate_c_object_proxy_references
			validate_occurrences
		end

feature {NONE} -- Implementation

	validate_c_object_proxy_references
			-- Validate items in `found_internal_references'.
			-- For specialised archetypes, requires flat ancestor to be available
		do
			across target_flat.use_node_index as use_refs_csr loop
				if not target_flat.definition.has_path (use_refs_csr.key) then
					add_error (ec_VUNP, <<use_refs_csr.key>>)
				end
			end
		end

	validate_occurrences
			-- validate occurrences under container attributes, in flat definition
		local
			def_it: C_ITERATOR
		do
			create def_it.make (target_flat.definition)
			def_it.do_all (agent do_validate_occ_enter, agent do_validate_occ_exit)
		end

feature {NONE} -- Implementation

	do_validate_occ_enter (a_c_node: ARCHETYPE_CONSTRAINT; depth: INTEGER)
		do
			if attached {C_ATTRIBUTE} a_c_node as ca then
				if attached ca.cardinality as att_card and then not att_card.interval.upper_unbounded then
					if ca.aggregate_occurrences_lower_sum > att_card.interval.upper then
						add_warning (ec_WACMCL, <<ca.path, ca.aggregate_occurrences_lower_sum.out, att_card.interval.upper.out>>)
					elseif ca.minimum_child_count > att_card.interval.upper then
						add_error (ec_VACMCO, <<ca.path, ca.minimum_child_count.out, att_card.interval.upper.out>>)
					end
				end
			end
		end

	do_validate_occ_exit (a_c_node: ARCHETYPE_CONSTRAINT; depth: INTEGER)
		do
		end

end


