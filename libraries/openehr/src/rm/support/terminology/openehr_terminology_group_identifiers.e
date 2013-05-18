note
	component:   "openEHR ADL Tools"
	description: "Names of terminologies defined and used internally by openEHR"
	keywords:    "terminology, vocabulary, identifiers"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2006- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class OPENEHR_TERMINOLOGY_GROUP_IDENTIFIERS

feature -- Definitions

	Terminology_id_openehr: STRING = "openehr"

	Group_id_audit_change_type: STRING = "audit change type"

	Group_id_attestation_reason: STRING = "attestation reason"

	Group_id_composition_category: STRING = "composition category"

	Group_id_event_math_function: STRING = "event math function"

	Group_id_ism_states: STRING = "ISM states"

	Group_id_ism_transitions: STRING = "ISM transitions"

	Group_id_normal_status: STRING = "normal status"

	Group_id_null_flavours: STRING = "null flavours"

	Group_id_measurable_properties: STRING = "measurable properties"

	Group_id_participation_function: STRING = "participation function"

	Group_id_participation_mode: STRING = "participation mode"

	Group_id_related_party_relationship: STRING = "related party relationship"

	Group_id_setting: STRING = "setting"

	Group_id_term_mapping_purpose: STRING = "term mapping purpose"

	Group_id_version_lifecycle_state: STRING = "version lifecycle state"

feature -- Comparison

	valid_terminology_group_id (an_id: STRING): BOOLEAN
			-- True if an_id is in the set defined by this class
		do
			-- FIXME: to be implemented
			Result := True
		end

end



