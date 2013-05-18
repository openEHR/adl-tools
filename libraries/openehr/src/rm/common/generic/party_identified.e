note
	component:   "openEHR ADL Tools"
	
	description: "[
				 Proxy data for an identified party other than the subject of the 
				 record, minimally consisting of human-readable identifier(s), 
				 such as name, formal (and possibly computable) identifiers such 
				 as NHS number, and an optional link to external data. There must 
				 be at least one of name, identifier or external_ref present.	
				 
				 Used to describe parties where only identifiers may be known, and 
				 there is no entry at all in the demographic system (or even no 
				 demographic system). Typically for health care providers, e.g. 
				 name and provider number of an institution.
				 ]"
	keywords:    "attestation"

	design:      "openEHR Common Reference Model 2.0"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2005 The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


class PARTY_IDENTIFIED

inherit
	PARTY_PROXY

feature -- Initialization

feature -- Access

	name: STRING	
			-- optional human-readable name

	identifiers: LINKED_LIST [DV_IDENTIFIER]
			-- optional machine-readable / administrative identifiers

feature -- Conversion
	
	as_string: STRING
			-- generate string form of identifier
		do
			create Result.make(0)
			Result.append(name)
		end
		
invariant
	Basic_validity: name /= Void or identifiers /= Void or external_ref /= Void
	Name_validity: name /= Void implies not name.is_empty
	Identifiers_validity: identifiers /= Void implies not identifiers.is_empty
	
end


