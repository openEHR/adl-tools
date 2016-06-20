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
	SHARED_REFERENCE_MODEL_ACCESS

feature -- Access

	rm_for_archetype_id (an_id: ARCHETYPE_HRID): BMM_MODEL
			-- top-level schema for archetype id `an_id'
		require
			has_rm_for_archetype_id (an_id)
		do
			Result := ref_models_access.rm_for_closure (an_id.qualified_rm_closure)
		end

feature -- Status Report

	has_rm_for_archetype_id (an_id: ARCHETYPE_HRID): BOOLEAN
		do
			Result := ref_models_access.has_rm_for_closure (an_id.qualified_rm_closure)
		end

end



