note
	component:   "openEHR ADL Tools"
	description: "Archetype access to reference models"
	keywords:    "ADL, archetype, reference model"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2010- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class SHARED_ARCHETYPE_RM_ACCESS

inherit
	SHARED_MODEL_ACCESS

feature -- Access

	model_for_archetype_id (an_id: ARCHETYPE_HRID): BMM_MODEL
			-- top-level schema for archetype id `an_id'
		require
			has_model_for_archetype_id (an_id)
		do
			Result := models_access.model_for_namespace (an_id.qualified_namespace)
		end

feature -- Status Report

	has_model_for_archetype_id (an_id: ARCHETYPE_HRID): BOOLEAN
		do
			Result := models_access.has_model_for_namespace (an_id.qualified_namespace)
		end

end



