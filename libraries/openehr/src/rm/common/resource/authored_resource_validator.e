note
	component:   "openEHR ADL Tools"
	description: "Validator for AUTHORED_RESOURCE objects"
	keywords:    "archetype"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2007- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"
	void_safety: "initial"

deferred class AUTHORED_RESOURCE_VALIDATOR

inherit
	ANY_VALIDATOR

	SHARED_ADL_APP_RESOURCES
		export
			{NONE} all
		end

feature {NONE} -- Initialisation

	initialise (a_target: like target)
			-- set target and initialise reporting variables
		do
			target := a_target
			reset
		ensure
			target_set: target = a_target
			Passed: passed
		end

feature -- Access

	target: AUTHORED_RESOURCE
			-- target of this validator

	validate
			-- True if all structures obey their invariants
		do
			if target.original_language = Void then
				add_error (ec_VDEOL, Void)
			end

			-- check that AUTHORED_RESOURCE.translations items match their Hash keys
			if attached target.translations as tgt_trans then
				from
					tgt_trans.start
				until
					tgt_trans.off or not tgt_trans.key_for_iteration.is_equal (tgt_trans.item_for_iteration.language.code_string)
				loop
					tgt_trans.forth
				end
				if not tgt_trans.off then
					add_error (ec_VTRLA, <<tgt_trans.key_for_iteration, tgt_trans.item_for_iteration.language.code_string>>)
				end
			end

			-- check that RESOURCE_DESCRIPTION.details items match their Hash keys
			if attached target.description as tgt_desc then
				from
					tgt_desc.details.start
				until
					tgt_desc.details.off or not tgt_desc.details.key_for_iteration.is_equal (tgt_desc.details.item_for_iteration.language.code_string)
				loop
					tgt_desc.details.forth
				end
				if not tgt_desc.details.off then
					add_error (ec_VRDLA, <<tgt_desc.details.key_for_iteration, tgt_desc.details.item_for_iteration.language.code_string>>)
				end
			end
		end

end


