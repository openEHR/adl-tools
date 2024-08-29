note
	component:   "openEHR ADL Tools"
	description: "Id-code extractor"
	keywords:    "export, archetype, ADL"
	author:      "Thomas Beale <thomas.beale@GraphiteHealth.io>"
	support:     "openEHR AWB project <http://www.openehr.org/issues/browse/AWB>"
	copyright:   "Copyright (c) 2024- openEHR International"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class ARCH_ID_TO_TPL_ID_MAP

inherit
	ARCHETYPE_LIBRARY_REPORT
		export
			{NONE} all
		redefine
			output_table
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
			Result := "Arch_id_to_tpl_id_map"
		end

	title: STRING
		do
			Result := "Archetype ID to Template ID map"
		end

	output_table: ARRAYED_LIST[TUPLE [arch_id, tpl_id: READABLE_STRING_8]]
		once
			create Result.make(0)
		end

feature {ARCHETYPE_REPORTER} -- Processing

	process_archetype (auth_ara: ARCH_LIB_ARCHETYPE)
			-- Generate serialised output under `output_dir' from `ara', optionally building it first if necessary.
		local
			arch_id: STRING
		do
			if attached {ARCH_LIB_TEMPLATE} auth_ara then
				across auth_ara.suppliers_index as suppliers_csr loop
					if attached {ARCH_LIB_TEMPLATE_OVERLAY} suppliers_csr.item as tpl_ovl then
						arch_id := tpl_ovl.parent_id.as_string
					else
						arch_id := suppliers_csr.key
					end
					output_table.extend ([arch_id, auth_ara.id.as_string])
				end
			end
		end

end
