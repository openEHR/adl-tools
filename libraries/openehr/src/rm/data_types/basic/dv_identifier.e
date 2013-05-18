note
	component:   "openEHR ADL Tools"
	description: "[
				 Real-world entity identifiers, such as driver's licence number, 
			     SSN, presciption number, order number etc.
			     ]"
	keywords:    "identifier, data type"

	requirements:""
	design:      "openEHR Data Types Reference Model 1.9"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2000-2004 The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


class DV_IDENTIFIER

inherit
	DATA_VALUE

create
	default_create, make

feature -- Initialization

	make
		do
		end

	make_from_string (a_str:STRING)
			--
		do
		end

feature -- Access

	assigner: attached STRING
			-- organisation which assigned this id to the item it identifies

	issuer: attached STRING
			-- Issuing agency of these kind of ids

	id: attached STRING
			-- The identifier value. Often structured, according to the
			-- definition of the issuing authority’s rules.

	type: attached STRING
			-- The identifier type, such as “prescription”, or “SSN”.
			-- One day a controlled vocabulary might be possible for this.

feature -- Modify

feature -- Output

	as_string: STRING
		do
		end

invariant
	assigner_valid: not assigner.is_empty
	issuer_valid: not issuer.is_empty
	id_valid: not id.is_empty
	type_valid: not type.is_empty

end


