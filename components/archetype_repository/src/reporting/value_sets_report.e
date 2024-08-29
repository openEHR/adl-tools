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

				-- add each ac-code
				across terminology.value_set_codes as vset_codes_csr loop
					create vset_obj.make (vset_codes_csr.item)
					add_term_def (vset_obj, vset_codes_csr.item)

					add_bindings (vset_obj, terminology.term_bindings_for_key (vset_codes_csr.item))

					arch_report.add_item (vset_obj)

					-- add internal value-set def
					if terminology.has_value_set (vset_codes_csr.item) and attached terminology.value_sets.item (vset_codes_csr.item) as vs then
						across vs.members as vset_term_code_csr loop
							create vset_term_obj.make (vset_term_code_csr.item)
							vset_obj.add_item (vset_term_obj)
							add_term_def (vset_term_obj, vset_term_code_csr.item)
						end
					end
				end

				if not arch_report.is_empty then
					output_tree.add_item (arch_report)
				end
			end
		end

	add_term_def (vset_term_obj: REPORT_DATA_NODE; a_term_code: STRING)
		do
			vset_term_obj.add_named_attribute (terminology.term_definition (default_language, a_term_code).text, "text", "definition")
			vset_term_obj.add_named_attribute (terminology.term_definition (default_language, a_term_code).description, "description", "definition")
		end

	add_bindings (vset_term_obj: REPORT_DATA_NODE; a_bindings: HASH_TABLE [URI, STRING])
		do
			across a_bindings as binding_csr loop
				vset_term_obj.add_named_attribute (binding_csr.item.as_string, binding_csr.key, "term_bindings")
			end
		end

	terminology: ARCHETYPE_TERMINOLOGY
		attribute
			create Result.make_default
		end

end
