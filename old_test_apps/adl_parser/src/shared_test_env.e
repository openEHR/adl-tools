note
	component:   "openEHR ADL Tools"
	description: "Test case for archetype creation"
	keywords:    "test, ADL, CADL"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2003, 2004 Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


class SHARED_TEST_ENV

inherit
	INTERNAL
		export
			{NONE} all
		end

	SHARED_DT_SERIALISERS
		export
			{NONE} all
			{ANY} has_dt_serialiser_format
		end

	SHARED_ARCHETYPE_COMPILER

	SHARED_C_ADL_INTERFACE

	TERMINOLOGY_SERVICE
		export
			{NONE} all
		end

feature -- Access

	serialise_format: STRING = "adl"

	dadl_engine: DADL_ENGINE
			--
		once
			create Result.make
		end

feature -- Conversion

	print_list (a_list: LIST[STRING]):STRING
		do
			create Result.make(0)
			from a_list.start until a_list.off loop
				Result.append(a_list.item)
				Result.append("%N")
				a_list.forth
			end
		end

end

