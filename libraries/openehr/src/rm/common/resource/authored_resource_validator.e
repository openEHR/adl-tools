note
	component:   "openEHR ADL Tools"
	description: "Validator for AUTHORED_RESOURCE objects"
	keywords:    "resource, validation"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2007- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class AUTHORED_RESOURCE_VALIDATOR

inherit
	ANY_VALIDATOR

	SHARED_ADL_APP_RESOURCES
		export
			{NONE} all
		end

create
	initialise

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

feature -- Commands

	validate
		do
			reset
			validate_original_language
			if passed then
				validate_translations
				validate_description
			end
		end

feature {NONE} -- Implementation

	validate_original_language
			-- True if `original_language' is not still set on the fake default value
		do
			if target.original_language.code_string.is_equal (ts.Non_existent_language) then
				add_error ({ADL_MESSAGES_IDS}.ec_VDEOL, Void)
			end
		end

	validate_translations
			-- True if `translations' structures obey their invariants
		local
			tgt_trans: HASH_TABLE [TRANSLATION_DETAILS, STRING]
		do
			-- check that AUTHORED_RESOURCE.translations items match their Hash keys
			tgt_trans := target.translations
			from
				tgt_trans.start
			until
				tgt_trans.off or not tgt_trans.key_for_iteration.is_equal (tgt_trans.item_for_iteration.language.code_string)
			loop
				tgt_trans.forth
			end
			if not tgt_trans.off then
				add_error ({ADL_MESSAGES_IDS}.ec_VTRLA, <<tgt_trans.key_for_iteration, tgt_trans.item_for_iteration.language.code_string>>)
			end
		end

	validate_description
			-- True if `description' structures obey their invariants
		do
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
					add_error ({ADL_MESSAGES_IDS}.ec_VRDLA, <<tgt_desc.details.key_for_iteration, tgt_desc.details.item_for_iteration.language.code_string>>)
				end
			end
		end

end


