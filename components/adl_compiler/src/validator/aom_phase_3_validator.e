note
	component:   "openEHR ADL Tools"
	description: "Phase 3 validation: validating performed on flattened archetype."
	keywords:    "constraint model"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2007- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class AOM_PHASE_3_VALIDATOR

inherit
	AOM_VALIDATOR
		redefine
			validate, initialise
		end

create
	initialise

feature {ADL_2_ENGINE, ADL_14_ENGINE} -- Initialisation

	initialise (a_target_desc: like child_desc)
			-- set target_descriptor
			-- initialise reporting variables
		do
			precursor (a_target_desc)
			target_flat := child_desc.flat_archetype
		end

feature -- Access

	target_flat: ARCHETYPE
			-- flat archetype being validated

feature -- Status Report

	is_validation_candidate (ara: ARCH_LIB_ARCHETYPE): BOOLEAN
		do
			Result := attached ara.flat_archetype
		end

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
				if attached ca.cardinality and then not ca.cardinality.interval.upper_unbounded then
					if ca.aggregate_occurrences_lower_sum > ca.cardinality.interval.upper then
						add_warning (ec_WACMCL, <<ca.path, ca.aggregate_occurrences_lower_sum.out, ca.cardinality.interval.upper.out>>)
					elseif ca.minimum_child_count > ca.cardinality.interval.upper then
						add_error (ec_VACMCO, <<ca.path, ca.minimum_child_count.out, ca.cardinality.interval.upper.out>>)
					end
				end
			end
		end

	do_validate_occ_exit (a_c_node: ARCHETYPE_CONSTRAINT; depth: INTEGER)
		do
		end

end


