note
	component:   "openEHR ADL Tools"

	description: "[
		       Context of clinical session, which is any business function executed
			 with or for a subject of care, including patient contact, pathology tests etc.
			 ]"
	keywords:    "composition, context, versioning"

	requirements:"ISO 18308 TS V1.0 ???"
	design:      "openEHR EHR Reference Model 5.0"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2000-2005 The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


class EVENT_CONTEXT

inherit
	PATHABLE

	EXTERNAL_ENVIRONMENT_ACCESS
		export
			{NONE} all
		end

feature -- Access

	health_care_facility: PARTY_IDENTIFIED
			-- The HCF in the health system who took part in the encounter; usually, this is
			-- where the encounter physically took place, but not in the case of patient home visits,
			-- internet contacts or emergency care.

	start_time: DV_DATE_TIME
			-- Start time of the clinical session.

	end_time: DV_DATE_TIME
			-- Optional end time of the clinical session.

	participations: LIST [PARTICIPATION]
			-- Parties involved in the clinical session. These would
			-- normally include the physician(s) and often the patient
			-- (but not the latter if the clinical session is a pathology test for example).

	location: STRING
			-- The actual location where the session occurred, e.g.
			-- "microbiol lab 2", "home", "ward A3" and so on.

	setting: DV_CODED_TEXT
			-- The setting in which the event took place.
			-- Coded using the openEHR Terminology, “setting” group.

	other_context: ITEM_STRUCTURE
			-- Other optional context which will be archetyped.

	path_of_item (a_loc: LOCATABLE): STRING
			-- The path to an item relative to the root of this archetyped structure.
		do
				-- TO_BE_IMPLEM
		end

	item_at_path (a_path: STRING): LOCATABLE
			-- The item at a path (relative to this item).
		do
				-- TO_BE_IMPLEM
		end

	parent: COMPOSITION
			-- parent node of this node in compositional structure

feature -- Status Report

	path_exists (a_path: STRING): BOOLEAN
			-- True if the path is valid with respect to the current item.
		do
				-- TO_BE_IMPLEM
		end

invariant
	Start_time_exists: start_time /= Void
	Participations_validity: participations /= Void implies not participations.is_empty
	Location_valid: location /= Void implies not location.is_empty
	Setting_valid: setting /= Void and then
			terminology("openehr").codes_for_group_name("setting", "en").has(setting.defining_code)

end



