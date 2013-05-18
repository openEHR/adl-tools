note
	component:   "openEHR ADL Tools"
	description: "cADL serialisers"
	keywords:    "serialise, ADL"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2003- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class SHARED_C_SERIALISERS

feature -- Access

	c_serialiser_formats: ARRAYED_LIST [STRING]
			-- list of format names
		once
			create Result.make(0)
			Result.compare_objects
			across c_serialisers as serialisers_csr loop
				Result.extend (serialisers_csr.key)
			end
		end

	c_serialiser_for_format (an_archetype: ARCHETYPE; a_lang, a_format: STRING): detachable C_SERIALISER
			-- get a specific ADL serialiser
		require
			Format_valid: has_c_serialiser_format (a_format)
		do
			Result := c_serialisers.item (a_format)
		end

feature -- Status Report

	has_c_serialiser_format (a_format: STRING): BOOLEAN
			--
		do
			Result := c_serialisers.has (a_format)
		end

feature {NONE} -- Implementation

	c_serialisers: HASH_TABLE [C_SERIALISER, STRING]
		once
			create Result.make(0)
		end

end


