note
	component:   "openEHR ADL Tools"

	description: "[
	              General model of any information-carrying entry in a Composition
				  ENTRYs are about some subject, normally 'self', but may be about
				  people related to the subject of the record. 
				  An ENTRY corresponds to a 'clinical statement' in some people's terminology.
			      ]"
	keywords:    "content, clinical"

	requirements:"ISO 18308 TS V1.0 ???"
	design:      "openEHR EHR Reference Model 5.0"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2000-2005 The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


deferred class ENTRY

inherit
	EXTERNAL_ENVIRONMENT_ACCESS
		export
			{NONE} all
		end

	CONTENT_ITEM

feature -- Definitions

	Default_subject_relationship: PARTY_SELF
		do
		end

feature -- Access

	language: CODE_PHRASE	
			-- Mandatory indicator of the localised language in which this 
			-- Entry is written. Coded from openEHR Code Set “languages”.
			
	encoding: CODE_PHRASE
			-- Name of character set in which text values in this Entry are encoded. 
			-- Coded from openEHR Code Set “character sets”.

	subject: PARTY_PROXY
			-- Identity of human subject of the information in this entry

	provider: PARTY_PROXY
			-- party providing the information
		
	other_participations: LIST [PARTICIPATION]
			-- Other participations at ENTRY level - archetypable.

	workflow_id: OBJECT_REF
			-- Identifier of externally held workflow engine data for this workflow 
			-- execution, for this subject of care.

	parent: LOCATABLE
			-- parent node of this node in compositional structure (could be a 
			-- Section or a Composition)
				
invariant
	Subject_exists: subject /= Void
	Provider_valid: provider /= Void
	Other_participations_valid: other_participations /= Void implies not other_participations.is_empty
	Archetype_root_point: is_archetype_root
	Language_valid: language /= Void and then code_set(code_set_id_languages).has(language)
	Encoding_valid: encoding /= Void and then code_set(code_set_id_character_sets).has(encoding)
	
end


