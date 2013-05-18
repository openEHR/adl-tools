note
	component:   "openEHR ADL Tools"

	description: "[
			 A DV_EHR_URI is a DV_URI which has the scheme name 'ehr., and which 
			 can only reference elements in EHRs. 
			 ]"
	keywords:    "www, uri"

	requirements:"ISO 18308 TS V1.0 STR ??"
	design:      "openEHR Data Types Reference Model 1.7"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2000-2004 The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


class DV_EHR_URI

inherit
	DV_URI
		redefine
			scheme, path, fragment_id
		end

create
	make_from_string, make_from_canonical_string
	
feature -- Definitions

	Ehr_scheme:STRING = "ehr"
		
feature -- Access

	ehr_id: STRING
			-- the EHR identification part of the URI
		do
		end

	transaction_id:STRING
			-- the Transaction identification part of the URI
		do
		end

	organiser_id:STRING
			-- the Organiser identification part of the URI
		do
		end

	entry_id:STRING
			-- the Entry identification part of the URI
		do
		end

	scheme:STRING 
		once
			create Result.make(0)
			Result.append(Ehr_scheme)
		end

	path: STRING
		do
			Result := ehr_id + transaction_id
		end

	fragment_id: STRING
		do
			Result := organiser_id + entry_id
		end

feature -- Status Report

	target_is_ehr: BOOLEAN
			-- True if target is an EHR
		do
			
		end
		
	target_is_transaction: BOOLEAN
			-- 	True if target is a Transaction
		do
			
		end
		
	target_is_organiser: BOOLEAN
			-- True if target is an Organiser
		do
			
		end
		
	target_is_entry: BOOLEAN
			-- True if target is an Entry
		do
			
		end
		
invariant
	Scheme_is_EHR: scheme.is_equal(Ehr_scheme)

end


