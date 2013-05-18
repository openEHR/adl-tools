note
	component:   "openEHR ADL Tools"
	
	description: "Abstract model of attestation of a party to some information"
	keywords:    "attestation"

	design:      "openEHR Common Reference Model 2.0"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2000-2005 The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


class ATTESTATION

inherit
	AUDIT_DETAILS

	EXTERNAL_ENVIRONMENT_ACCESS
		export
			{NONE} all
		end

feature -- Initialization

feature -- Access

	proof: DV_ENCAPSULATED	
			-- Proof of attestation.
			
	attested_view: DV_MULTIMEDIA
			-- Optional visual representation of content attested e.g. screen image.

	items: SET [DV_EHR_URI]
			-- Items attested. Although not recommended, these may include fine-grained 
			-- items which have been attested in some other system. Otherwise the attestation 
			-- is for the entire Version with which it is associated.

	reason: DV_TEXT	
			-- reason of attestation; coded by openEHR terminology group
			-- "attestation reason"

	is_pending: BOOLEAN
			-- True if this attestation is pending

invariant
	Items_validity: items /= Void implies not items.is_empty
	-- re-instate when we can state an expression which includes an assignment attempt
	--Reason_validity: reason /= Void and then
	--	(reason.generating_type.is_equal("DV_CODED_TEXT") implies
	--	terminology(Terminology_openehr).codes_for_group_name(Group_id_attestation_status,
	--	reason.defining_code))

end



