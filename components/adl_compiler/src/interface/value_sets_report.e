note
	component:   "openEHR ADL Tools"
	description: "Id-code extractor"
	keywords:    "export, archetype, ADL"
	author:      "Thomas Beale <thomas.beale@GraphiteHealth.io>"
	support:     "openEHR AWB project <http://www.openehr.org/issues/browse/AWB>"
	copyright:   "Copyright (c) 2024- openEHR International"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class VALUE_SETS_REPORT

inherit
	ARCHETYPE_LIBRARY_REPORT
		export
			{NONE} all
		redefine
			output_tree
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
			Result := "Value_sets_report"
		end

	title: STRING
		do
			Result := "Archetype local value sets"
		end

	output_tree: REPORT_DATA_GROUP
		once
			create Result.make (Id)
		end

feature {ARCHETYPE_REPORTER} -- Processing

	process_archetype (auth_ara: ARCH_LIB_ARCHETYPE)
			-- Generate structure of the form:
			--  {
			--		id: "Value_sets_report"
			--		items: [
			--			{
			--				id: "arch_id1"
			--				items: [
			--					{
			--						id: "ac-code1"
			--						items: [
			--							{
			--								id: "at-code1"
			--								items: [
			--								]
			--							},
			--							{
			--								id: "at-code2"
			--								items: []
			--							}
			--						]
			--					},
			--					{
			--						id: "ac-code2"
			--						items: []
			--					}			
			--				]
			--			},
			--			{
			--				id: "arch_id2"
			--				items: []
			--			}			
			--		]
			--	}
		local
			arch_id: STRING
			arch_report: REPORT_DATA_GROUP
			vset_obj: REPORT_DATA_GROUP
			vset_term_obj: REPORT_DATA_NODE
		do
			if not attached {ARCH_LIB_TEMPLATE} auth_ara then
				terminology := auth_ara.differential_archetype.terminology

				-- find the language key
				check terminology.languages_available.has (Default_language) end

				create arch_report.make (auth_ara.id.as_string)

				across terminology.value_sets as vset_csr loop
					create vset_obj.make (vset_csr.key)
					add_term_def (vset_obj, vset_csr.key)
					arch_report.add_item (vset_obj)

					across vset_csr.item.members as vset_term_code_csr loop
						create vset_term_obj.make (vset_term_code_csr.item)
						vset_obj.add_item (vset_term_obj)
						add_term_def (vset_term_obj, vset_term_code_csr.item)
					end
				end

				if not arch_report.items.is_empty then
					output_tree.add_item (arch_report)
				end
			end
		end

	add_term_def (vset_term_obj: REPORT_DATA_NODE; a_term_code: STRING)
		do
			vset_term_obj.add_attribute (terminology.term_definition (default_language, a_term_code).text, "text")
			vset_term_obj.add_attribute (terminology.term_definition (default_language, a_term_code).description, "description")
		end

	terminology: ARCHETYPE_TERMINOLOGY
		attribute
			create Result.make_default
		end

end
