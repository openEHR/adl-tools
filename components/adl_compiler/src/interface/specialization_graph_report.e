note
	component:   "openEHR ADL Tools"
	description: "Id-code extractor"
	keywords:    "export, archetype, ADL"
	author:      "Thomas Beale <thomas.beale@GraphiteHealth.io>"
	support:     "openEHR AWB project <http://www.openehr.org/issues/browse/AWB>"
	copyright:   "Copyright (c) 2024- openEHR International"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class SPECIALIZATION_GRAPH_REPORT

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
			Result := "Spec_graph_report"
		end

	title: STRING
		do
			Result := "Specialization graph of archetype library"
		end

	output_table: ARRAYED_LIST[TUPLE [arch_id, spec_lineage: STRING]]
		once
			create Result.make(0)
		end

feature {ARCHETYPE_REPORTER} -- Processing

	process_archetype (ara: ARCH_LIB_ARCHETYPE)
		local
			arch_csr: ARCH_LIB_ARCHETYPE
			parents: STRING
		do
			create parents.make_empty

			from
				arch_csr := ara
			until
				not attached {ARCH_LIB_ARCHETYPE} arch_csr.parent
			loop
				if attached {ARCH_LIB_ARCHETYPE} arch_csr.parent as p then
					parents.append (p.id.as_string)
					arch_csr := p
					if attached {ARCH_LIB_ARCHETYPE} arch_csr.parent then
						parents.append (", ")
					end
				end
			end

			output_table.extend ([ara.id.as_string, "%"" + parents + "%""])
		end

end
