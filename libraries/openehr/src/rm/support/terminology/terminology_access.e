note
	component:   "openEHR ADL Tools"

	description: "Simple terminology interface definition"
	keywords:    "terminology, vocabulary"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2000- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class TERMINOLOGY_ACCESS

create
	make

feature -- Initialisation

	make (an_id: STRING)
			-- make a terminology interface with `an_id'
		require
			Id_valid: not an_id.is_empty
		do
			id := an_id
			create content_tables.make (0)
			create term_index.make (0)
		ensure
			Id_set: id = an_id
		end

feature -- Access

	id: STRING
			-- identifier of this terminology

	all_codes: SET [CODE_PHRASE]
		do
			create {ARRAYED_SET [CODE_PHRASE]} Result.make (0)
		end

	all_group_ids: SET [STRING]
		do
			create {ARRAYED_SET [STRING_8]} Result.make (0)
		end

	value_set (a_value_set_name, a_lang: STRING): detachable TERMINOLOGY_GROUP
		require
			has_value_set (a_value_set_name, a_lang)
		do
			Result := content_tables.item (a_lang).item (a_value_set_name)
		end

	term (a_concept_id, a_lang: STRING): detachable DV_CODED_TEXT
		require
			has_concept_id (a_concept_id, a_lang)
		do
			Result := term_index.item (a_lang).item (a_concept_id)
		end

feature -- Status Report

	has_concept (a_concept_id: STRING): BOOLEAN
			-- 	True if a_code exists in this code set
		require
			Concept_id_valid: not a_concept_id.is_empty
		do
			if not term_index.is_empty then
				term_index.start
				Result := term_index.item_for_iteration.has (a_concept_id)
			end
		end

	has_concept_id (a_concept_id, a_lang: STRING): BOOLEAN
			-- 	True if a_code exists in this code set
		require
			Concept_id_valid: not a_concept_id.is_empty
			Lang_valid: not a_lang.is_empty
		do
			Result := term_index.has (a_lang) and then term_index.item (a_lang).has (a_concept_id)
		end

	has_language (a_lang: STRING): BOOLEAN
		require
			Lang_valid: not a_lang.is_empty
		do
			Result := content_tables.has (a_lang)
		end

	has_value_set (a_name, a_lang: STRING): BOOLEAN
		require
			Group_valid: not a_name.is_empty
			Lang_valid: not a_lang.is_empty
		do
			Result := content_tables.has (a_lang) and then content_tables.item (a_lang).has (a_name)
		end

	has_code_for_value_set (a_value_set_name: STRING; a_code: CODE_PHRASE): BOOLEAN
			-- True if ‘a_code’ is known in value set `a_value_set_name' in the openEHR terminology.
		do
			-- TODO: implement when new representation is created, based on SNOMED CT
		end

feature -- Modification

	add_value_set (a_name, a_lang: STRING)
		require
			Value_set_name_valid: not a_name.is_empty
			Valid_lang: not a_lang.is_empty
		do
			if not content_tables.has (a_lang) then
				content_tables.put (create {HASH_TABLE [TERMINOLOGY_GROUP, STRING]}.make (0), a_lang)
			end
			content_tables.item (a_lang).put (create {TERMINOLOGY_GROUP}.make (a_name), a_name)
		end

	add_term (a_concept_id, a_rubric, a_value_set_name, a_lang: STRING)
			-- add the term defined by `a_concept_id' and `a_rubric' to `a_value_set_name' for `a_lang'
			-- the same term can be added to different groups, but will be added to the
			-- terminology as a whole only once
		require
			Concept_id_valid: not a_concept_id.is_empty and has_value_set (a_value_set_name, a_lang) implies not value_set (a_value_set_name, a_lang).has_term (a_concept_id)
			Rubric_valid: not a_rubric.is_empty
			Value_set_name_valid: not a_value_set_name.is_empty
			Lang_valid: not a_lang.is_empty
		local
			new_term: DV_CODED_TEXT
		do
			create new_term.make (a_rubric, create {CODE_PHRASE}.make (id, a_concept_id))
			if not has_value_set (a_value_set_name, a_lang) then
				add_value_set (a_value_set_name, a_lang)
			end
			value_set (a_value_set_name, a_lang).add_term (new_term)

			if not term_index.has (a_lang) then
				term_index.put (create {HASH_TABLE [DV_CODED_TEXT, STRING]}.make (0), a_lang)
			end
			term_index.item (a_lang).put (new_term, a_concept_id)
		end

feature {NONE} -- Implementation

	content_tables: HASH_TABLE [HASH_TABLE [TERMINOLOGY_GROUP, STRING], STRING]
			-- terminology contents as tables of {{group, group_name}, language}

	term_index: HASH_TABLE [HASH_TABLE [DV_CODED_TEXT, STRING], STRING]
			-- terminology contents as tables of {{term, concept_id}, language}

end



