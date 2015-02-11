note
	component:   "openEHR ADL Tools"
	description: "Assertoin serialisers"
	keywords:    "assertoin"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2005 Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


class SHARED_ASSERTION_SERIALISERS

feature -- Access

	assertion_serialiser_formats: ARRAYED_LIST[STRING]
			-- list of format names
		once
			create Result.make (0)
			Result.compare_objects
			from assertion_serialisers.start until assertion_serialisers.off loop
				Result.extend (assertion_serialisers.key_for_iteration)
				assertion_serialisers.forth
			end
		end

	assertion_serialiser_for_format (a_format: STRING): ASSERTION_SERIALISER
			-- get a specific ADL serialiser
		require
			Format_valid: has_assertion_serialiser_format (a_format)
		do
			check attached assertion_serialisers.item (a_format) as att_ser then
				Result := att_ser
			end
		end

feature -- Status Report

	has_assertion_serialiser_format (a_format: STRING): BOOLEAN
		do
			Result := assertion_serialisers.has (a_format)
		end

feature {NONE} -- Implementation

	assertion_serialisers: HASH_TABLE [ASSERTION_SERIALISER, STRING]
		once
			create Result.make (0)
		end

end


