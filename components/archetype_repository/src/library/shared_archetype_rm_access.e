note
	component:   "openEHR ADL Tools"
	description: "Archetype access to BMM reference models"
	keywords:    "ADL, archetype, reference model"
	author:      "Thomas Beale <thomas.beale@openehr.org>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2010- The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class SHARED_ARCHETYPE_RM_ACCESS

inherit
	SHARED_BMM_MODEL_ACCESS

	SHARED_AOM_PROFILES_ACCESS
		export
			{NONE} all
		end

feature -- Access

	model_for_archetype_id (an_id: ARCHETYPE_HRID): BMM_MODEL
			-- top-level schema for archetype id `an_id'
		require
			has_model_for_archetype_id (an_id)
		do
			Result := bmm_model (an_id.qualified_model_name)
		end

feature -- Status Report

	has_model_for_archetype_id (an_id: ARCHETYPE_HRID): BOOLEAN
		do
			Result := has_bmm_model (an_id.qualified_model_name)
		end

end



