note
	component:   "openEHR ADL Tools"
	description: "Record missing codes for a templated archetype"
	keywords:    "export, archetype, ADL"
	author:      "Thomas Beale <thomas.beale@GraphiteHealth.io>"
	support:     "openEHR AWB project <http://www.openehr.org/issues/browse/AWB>"
	copyright:   "Copyright (c) 2024 Graphite Health"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class ARCHETYPE_MISSING_CODES

inherit
	ADL_2_TERM_CODE_TOOLS
		export
			{NONE} all
		end

create
	make

feature -- Initialisation

	make (an_archetype_root: C_COMPLEX_OBJECT; an_archetype_id, a_template_id, a_template_path: STRING)
		do
			archetype_root := an_archetype_root
			archetype_id := an_archetype_id
			template_id := a_template_id
			template_path := a_template_path

			create missing_id_code_bindings_table.make(0)
			create missing_value_sets_table.make(0)

			create missing_id_code_bindings.make(0)
			create missing_value_sets.make(0)
		end

feature -- Access

	archetype_root: C_COMPLEX_OBJECT

	archetype_id: STRING

	template_id: STRING

	template_path: STRING

	missing_id_code_bindings: STRING_TABLE [STRING]
			-- nodes with missing id-code bindings, keyed by id-code

	missing_value_sets: STRING_TABLE [TUPLE [c_terminology_node_ac_code: STRING; value_set: detachable ARRAYED_LIST[STRING]]]
			-- coded nodes with missing value-set bindings, keyed by id-code of owning object

	add_missing_id_code_binding (a_c_node: C_OBJECT; a_term_desc: STRING)
		do
			missing_id_code_bindings_table.put ([a_c_node, a_term_desc], a_c_node.path_to_node (archetype_root))
			missing_id_code_bindings.put (a_term_desc, a_c_node.path_to_node (archetype_root))
		end

	add_missing_value_set (a_c_terminology_node: C_TERMINOLOGY_CODE; identified_parent: C_COMPLEX_OBJECT; a_terminology: ARCHETYPE_TERMINOLOGY)
		local
			value_set_terms: ARRAYED_LIST[STRING]
			identified_parent_term_desc: STRING
		do
			identified_parent_term_desc := a_terminology.term_definition (default_language, identified_parent.node_id).text
			if a_terminology.value_sets.has (a_c_terminology_node.constraint) and attached a_terminology.value_sets.item (a_c_terminology_node.constraint) as vset then
				create value_set_terms.make (0)
				across vset.members as vset_csr loop
					value_set_terms.extend (annotated_code (vset_csr.item, a_terminology.term_definition (a_terminology.default_language, vset_csr.item).text, ""))
				end
			end
			missing_value_sets_table.put ([a_c_terminology_node, identified_parent_term_desc, value_set_terms], identified_parent.node_id)
			missing_value_sets.put ([annotated_code (a_c_terminology_node.constraint, a_terminology.term_definition (default_language, a_c_terminology_node.constraint).text, ""), value_set_terms],
				annotated_code (identified_parent.node_id, identified_parent_term_desc, ""))
		end

	as_report: ARCHETYPE_MISSING_CODES_REPORT
		do
			create Result.make (Current)
		end

feature -- Status Report

	is_empty: BOOLEAN
		do
			Result := missing_id_code_bindings_table.is_empty and missing_value_sets_table.is_empty
		end

feature {NONE} -- Implementation

	missing_id_code_bindings_table: STRING_TABLE [TUPLE [c_node: C_OBJECT; term_desc: STRING]]
			-- nodes with missing id-code bindings, keyed by id-code

	missing_value_sets_table: STRING_TABLE [TUPLE [c_terminology_node: C_TERMINOLOGY_CODE; term_desc: STRING; value_set: detachable ARRAYED_LIST[STRING]]]
			-- coded nodes with missing value-set bindings, keyed by id-code of owning object

end
