note
	component:   "openEHR ADL Tools"
	description: "Keywords frequency report"
	keywords:    "export, archetype, ADL"
	author:      "Thomas Beale <thomas.beale@GraphiteHealth.io>"
	support:     "openEHR AWB project <http://www.openehr.org/issues/browse/AWB>"
	copyright:   "Copyright (c) 2024- openEHR International"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class KEYWORDS_FREQUENCY_REPORT

inherit
	ARCHETYPE_LIBRARY_REPORT
		export
			{NONE} all
		redefine
			output_table, finalise
		end

	SHARED_ARCHETYPE_LIBRARIES
		export
			{NONE} all
		end

	EXCEPTIONS
		export
			{NONE} all
		end

create
	make

feature -- Access

	id: STRING
		do
			Result := "keywords_fequency_report"
		end

	title: STRING
		do
			Result := "Keywords frequency in archetype library"
		end

	output_table: ARRAYED_LIST[TUPLE [keyword, arch_count: READABLE_STRING_8]]
		once
			create Result.make(0)
		end

feature {ARCHETYPE_REPORTER} -- Processing

	process_archetype (auth_ara: ARCH_LIB_ARCHETYPE)
			-- Generate serialised output under `output_dir' from `ara', optionally building it first if necessary.
		local
			description: RESOURCE_DESCRIPTION
		do
			if attached {ARCH_LIB_AUTHORED_ARCHETYPE} auth_ara as aca and then attached aca.differential_archetype as arch then
				if attached arch.description as desc and then attached desc.detail_for_language(Default_language) as desc_details then
					if attached desc_details.keywords as kws then
						across kws as kws_csr loop
							if not keywords_table.has (kws_csr.item) then
								keywords_table.put (1, kws_csr.item)
							else
								keywords_table.force (keywords_table.item (kws_csr.item) + 1, kws_csr.item)
							end
						end
					end
				end
			end
		end

	finalise
		do
			across keywords_table as kw_csr loop
				output_table.extend ([text_quote_agent.item([kw_csr.key.as_string_8]), kw_csr.item.out])
			end
		end

feature {NONE} -- Implementation

	keywords_table: STRING_TABLE[INTEGER]
		attribute
			create Result.make(0)
		end

end
