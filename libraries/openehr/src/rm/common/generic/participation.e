note
	component:   "openEHR ADL Tools"

	description: "[
				 Used to represent any participation of a Party in some activity, 
				 which is not explicitly in the model, e.g. assisting nurse. 
				 Can be used to record past or future participations.
				 ]"
	keywords:    "participation"

	design:      "openEHR Common Reference Model 2.0"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2000-2005 The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class PARTICIPATION

inherit
	EXTERNAL_ENVIRONMENT_ACCESS
		export
			{NONE} all
		end

feature -- Initialization

feature -- Access

	performer: PARTY_PROXY
			-- The party participating in the activity.

	function: DV_TEXT
			-- The function of the Party in this participation (a given party might
			-- participate in more than one way in a given activity).

	mode: DV_CODED_TEXT
			-- The modality of the performer / activity interaction, e.g. present,
			-- by telephone, by email etc.

	time: DV_INTERVAL [DV_DATE_TIME]
			-- The time interval during which the participation took place,
			-- if it is used in an observational context (i.e. recording facts about
			-- the past); or the intended time interval of the participation when used
			-- in future contexts, such as EHR Instructions.

invariant
	Performer_exists: performer /= Void
	Mode_valid: terminology (Terminology_id_openehr).has_code_for_group_id (Group_id_participation_mode, mode.defining_code)
	Function_valid: function /= Void and then function.generating_type.is_equal("DV_CODED_TEXT")
-- FIXME: re-instate when a simple way is found to do an 'inline cast'
--		implies terminology("openehr").codes_for_group_name("participation function", "en")
--		.has(function.defining_code)

end



