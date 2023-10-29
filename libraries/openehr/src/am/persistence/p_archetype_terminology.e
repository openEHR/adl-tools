note
	component:   "openEHR ADL Tools"
	description: "Persistent form of ARCHETYPE_TERMINOLOGY class"
	keywords:    "archetype, ontology, terminology"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2011- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class P_ARCHETYPE_TERMINOLOGY

create
	make

feature -- Initialisation

	make (a_terminology: ARCHETYPE_TERMINOLOGY)
		local
			tb_p_ont: HASH_TABLE [STRING, STRING]
		do
			original_language := a_terminology.original_language

			is_differential := a_terminology.is_differential

			term_definitions := a_terminology.term_definitions

			if attached a_terminology.term_bindings then
				create term_bindings.make (0)
				across a_terminology.term_bindings as terminologies_csr loop
					create tb_p_ont.make (0)
					term_bindings.put (tb_p_ont, terminologies_csr.key)
					across terminologies_csr.item as term_bindings_csr loop
						check attached term_bindings_csr.item as a_term then
							tb_p_ont.put (a_term.as_string, term_bindings_csr.key)
						end
					end
				end
			end

			if not a_terminology.value_sets.is_empty then
				value_sets := a_terminology.value_sets
			end

			terminology_extracts := a_terminology.terminology_extracts
		end

feature -- Access

	original_language: TERMINOLOGY_CODE
		attribute
			create Result.default_create
		end

	is_differential: BOOLEAN

	term_definitions: HASH_TABLE [HASH_TABLE [ARCHETYPE_TERM, STRING], STRING]
			-- table of term definitions, keyed by code, keyed by language
		attribute
			create Result.make (0)
		end

	term_bindings: detachable HASH_TABLE [HASH_TABLE [STRING, STRING], STRING]
			-- tables of bindings of external terms to internal codes, keyed by external terminology id

	value_sets: detachable HASH_TABLE [VALUE_SET, STRING]
			-- table of value set relationships keyed by ac-code

	terminology_extracts: detachable HASH_TABLE [HASH_TABLE [ARCHETYPE_TERM, STRING], STRING]
			-- table of {code, description} keyed by terminology_id containing extracted concepts from external terminologies

feature -- Factory

	populate_terminology (a_terminology: ARCHETYPE_TERMINOLOGY)
			-- populate fields not already populated from creation of a C_XXX instance
		local
			tb_ont: HASH_TABLE [HASH_TABLE [URI, STRING], STRING]
			tb_ont_code_table: HASH_TABLE [URI, STRING]
			tb_p_ont: HASH_TABLE [STRING, STRING]
		do
			a_terminology.set_original_language (original_language)
			a_terminology.set_term_definitions (term_definitions)

			if attached term_bindings as att_tb then
				create tb_ont.make (0)
				across att_tb as term_bindings_csr loop
					tb_p_ont := term_bindings_csr.item
					create tb_ont_code_table.make (0)
					tb_ont.put (tb_ont_code_table, term_bindings_csr.key)
					across tb_p_ont as p_term_bindings_csr loop
						tb_ont_code_table.put (create {URI}.make_from_string (p_term_bindings_csr.item), p_term_bindings_csr.key)
					end
				end
				a_terminology.set_term_bindings (tb_ont)
			end

			if attached terminology_extracts as t_ext then
				a_terminology.set_terminology_extracts (t_ext)
			end

			if attached value_sets as att_vs then
				a_terminology.set_value_sets (att_vs)
			end
		end

end


