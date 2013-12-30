note
	component:   "openEHR ADL Tools"
	description: "ADL Terminology class"
	keywords:    "archetype, ontology, terminology"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2003- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

deferred class ARCHETYPE_TERMINOLOGY

inherit
	DT_CONVERTIBLE
		redefine
			finalise_dt
		end

	ADL_15_TERM_CODE_TOOLS
		export
			{NONE} all;
			{ANY} is_valid_root_id_code, is_valid_id_code, is_valid_term_code, is_valid_constraint_code,
				is_valid_code, specialisation_depth_from_code
		end

	ARCHETYPE_DEFINITIONS
		export
			{NONE} all
		end

feature -- Definitions

	Sym_term_definitions: STRING = "term_definitions"

	Sym_constraint_definitions: STRING = "constraint_definitions"

feature -- Initialisation

	make (an_original_lang, a_concept_code: STRING)
			-- make terminology from concept code and original language
		require
			Original_language_valid: not an_original_lang.is_empty
			root_code_valid: is_valid_root_id_code (a_concept_code)
		do
			concept_code := a_concept_code
			original_language := an_original_lang
		ensure
			concept_code_set: concept_code.is_equal (a_concept_code)
			original_language_set: original_language.is_equal (an_original_lang)
		end

	make_dt (make_args: detachable ARRAY[ANY])
			-- assumed args are <<original_language, concept_code>>
		do
			if attached {STRING} make_args[1] as str then
				original_language := str
			end
			if attached {STRING} make_args[2] as str then
				concept_code := str
			end
		end

feature -- Access

	original_language:  STRING
			-- original language of the terminology, as set at archetype creation or parsing time; must
			-- be a code in the ISO 639-1 2 character language code-set.

	concept_code: STRING
			-- term code of the concept of the terminology as a whole

	languages_available: ARRAYED_SET [STRING]
		do
			create Result.make(0)
			Result.compare_objects
			across id_definitions as ids_csr loop
				Result.extend (ids_csr.key)
			end
		end

	terminologies_available: ARRAYED_SET [STRING]
			-- set of all terminology names that appear in `term_bindings' or `constraint_bindings'
		local
			terminologies: ARRAY [STRING]
		do
			create Result.make(0)
			Result.compare_objects
			terminologies := term_bindings.current_keys
			terminologies.compare_objects
			Result.merge (terminologies)
			terminologies := constraint_bindings.current_keys
			terminologies.compare_objects
			Result.merge (terminologies)
		end

	id_codes: TWO_WAY_SORTED_SET [STRING]
			-- list of term codes
        attribute
            create Result.make
            Result.compare_objects
        end

	term_codes: TWO_WAY_SORTED_SET [STRING]
			-- list of term codes
        attribute
            create Result.make
            Result.compare_objects
        end

	constraint_codes: TWO_WAY_SORTED_SET [STRING]
			-- list of constraint codes
        attribute
            create Result.make
            Result.compare_objects
        end

	id_definitions: HASH_TABLE [HASH_TABLE [ARCHETYPE_TERM, STRING], STRING]
			-- table of id definitions, keyed by code, keyed by language
        attribute
            create Result.make (0)
        end

	term_definitions: HASH_TABLE [HASH_TABLE [ARCHETYPE_TERM, STRING], STRING]
			-- table of term definitions, keyed by code, keyed by language
        attribute
            create Result.make (0)
        end

	constraint_definitions: HASH_TABLE [HASH_TABLE [ARCHETYPE_TERM, STRING], STRING]
			-- table of constraint definitions, keyed by code, keyed by language
        attribute
            create Result.make (0)
        end

	term_bindings: HASH_TABLE [HASH_TABLE [TERMINOLOGY_CODE, STRING], STRING]
			-- tables of bindings of external terms to internal codes and/or paths, keyed by external terminology id
        attribute
            create Result.make (0)
        end

	constraint_bindings: HASH_TABLE [HASH_TABLE [URI, STRING], STRING]
			-- table of constraint bindings in the form of strings "service::query", keyed by terminology
        attribute
            create Result.make (0)
        end

	terminology_extracts: detachable HASH_TABLE [HASH_TABLE [ARCHETYPE_TERM, STRING], STRING]
			-- table of {code, description} keyed by terminology_id containing extracted concepts from external terminologies

	specialisation_depth: INTEGER
			-- depth of this terminology with relation to ontologies in other archetypes
		do
			Result := specialisation_depth_from_code (concept_code)
		ensure
			non_negative: Result >= 0
		end

	id_definition (a_language, a_code: STRING): ARCHETYPE_TERM
			-- retrieve the term definition in language `a_language' for code `a_code'
		require
			Id_definition_exists: has_id_definition (a_language, a_code)
		do
			check attached id_definitions.item (a_language) as tl and then attached tl.item (a_code) as term then
				Result := term
			end
		end

	term_definition (a_language, a_code: STRING): ARCHETYPE_TERM
			-- retrieve the term definition in language `a_language' for code `a_code'
		require
			Term_definition_exists: has_term_definition (a_language, a_code)
		do
			check attached term_definitions.item (a_language) as tl and then attached tl.item (a_code) as term then
				Result := term
			end
		end

	constraint_definition (a_language, a_code: STRING): ARCHETYPE_TERM
			-- retrieve the constraint definition in language `a_language' for code `a_code'
		require
			Term_definition_exists: has_constraint_definition (a_language, a_code)
		do
			check attached constraint_definitions.item (a_language) as tl and then attached tl.item (a_code) as term then
				Result := term
			end
		end

	term_binding (a_terminology, a_key: STRING): TERMINOLOGY_CODE
			-- retrieve the term binding from terminology `a_terminology' for code `a_key'
		require
			Term_code_valid: has_term_binding (a_terminology, a_key)
		do
			check attached term_bindings.item (a_terminology) as tbs and then attached tbs.item (a_key) as tb then
				Result := tb
			end
		end

	constraint_binding (a_terminology, a_code: STRING): URI
			-- retrieve the constraint binding from terminology `a_terminology' for code `a_code'
			-- in form of a string: "service::query"
		require
			Term_code_valid: has_constraint_binding (a_terminology, a_code)
		do
			check attached constraint_bindings.item (a_terminology) as cbs and then attached cbs.item (a_code) as cb then
				Result := cb
			end
		end

	terminology_extract_term (a_terminology, a_code: STRING): ARCHETYPE_TERM
			-- true if there is an extract from terminology `a_terminology'
		require
			Terminology_valid: has_terminology_extract (a_terminology)
			Term_code_valid: has_terminology_extract_code (a_terminology, a_code)
		do
			check attached terminology_extracts.item (a_terminology) as textrs and then attached textrs.item (a_code) as term then
				Result := term
			end
		end

	term_bindings_for_terminology (a_terminology: STRING): HASH_TABLE [TERMINOLOGY_CODE, STRING]
			-- retrieve the term bindings for a particular terminology
		require
			Terminology_valid: term_bindings.has (a_terminology)
		do
			check attached term_bindings.item (a_terminology) as tbs then
				Result := tbs
			end
		end

	term_bindings_for_key (a_key: STRING): HASH_TABLE [TERMINOLOGY_CODE, STRING]
			-- retrieve the term bindings for a key (code or path) as a table of bound terms keyed by terminology_id
		require
			Terminology_valid: has_any_term_binding (a_key)
		do
			create Result.make (0)
			across term_bindings as bindings_for_terminology_csr loop
				if attached bindings_for_terminology_csr.item.item (a_key) as binding_for_key then
					Result.put (binding_for_key, bindings_for_terminology_csr.key)
				end
			end
		end

	constraint_bindings_for_terminology (a_terminology: STRING): detachable HASH_TABLE [URI, STRING]
			-- retrieve the term bindings for a particular terminology
		require
			Terminology_valid: constraint_bindings.has (a_terminology)
		do
			check attached constraint_bindings.item (a_terminology) as cbs then
				Result := cbs
			end
		end

	physical_to_logical_path (a_phys_path, a_language: STRING; with_codes: BOOLEAN): STRING
			-- generate a logical path in 'a_language' from a physical path
			-- if `with_code' then generate annotated form of each code, i.e. "code|text|"
		require
			a_lang_valid: not a_language.is_empty
		local
			id_code, log_str: STRING
			og_phys_path, og_log_path: OG_PATH
		do
			create og_phys_path.make_from_string (a_phys_path)
			create og_log_path.make_from_other (og_phys_path)
			from
				og_phys_path.start
				og_log_path.start
			until
				og_phys_path.off
			loop
				if og_phys_path.item.is_addressable then
					id_code := og_phys_path.item.object_id
					if is_valid_id_code (id_code) and then has_id_code (id_code) then
						if with_codes then
							log_str := annotated_code (id_code, id_definition (a_language, id_code).text)
						else
							log_str := id_definition (a_language, id_code).text
						end
						og_log_path.item.set_object_id (log_str)
					else
						og_log_path.item.set_object_id (id_code)
					end
				end
				og_phys_path.forth
				og_log_path.forth
			end

			Result := og_log_path.as_string
		end

	definition_for_code (a_lang, a_code: STRING): detachable ARCHETYPE_TERM
			-- extract the term or constraint definition for `a_code'; Void if no
			-- code for `a_lang' and 'a_code'
		do
			if is_valid_code (a_code) and has_language (a_lang) then
				if is_id_code (a_code) and has_id_code (a_code) then
					Result := id_definition (a_lang, a_code)
				elseif is_term_code (a_code) and has_term_code (a_code) then
					Result := term_definition (a_lang, a_code)
				elseif is_constraint_code (a_code) and has_constraint_code (a_code) then
					Result := constraint_definition (a_lang, a_code)
				end
			end
		end

	last_new_id_definition_code: STRING
		attribute
			create Result.make_empty
		end

	last_new_term_definition_code: STRING
		attribute
			create Result.make_empty
		end

	last_new_constraint_definition_code: STRING
		attribute
			create Result.make_empty
		end

feature -- Status Report

	has_language (a_language: STRING): BOOLEAN
			-- check that `a_language' supported
		require
			Language_valid: not a_language.is_empty
		do
			Result := id_definitions.has (a_language)
		end

	has_terminology (a_terminology: STRING): BOOLEAN
			-- is `a_terminology' known in this terminology?
		require
			Terminology_valid: not a_terminology.is_empty
		do
			Result := terminologies_available.has (a_terminology)
		end

	has_code (a_code: STRING): BOOLEAN
			-- is `a_code' known in this terminology
		do
			Result := id_codes.has (a_code) or else term_codes.has (a_code) or else constraint_codes.has (a_code)
		end

	has_id_code (an_id_code: STRING): BOOLEAN
			-- is `a_code' known in this terminology
		do
			Result := id_codes.has (an_id_code)
		end

	has_term_code (a_code: STRING): BOOLEAN
			-- is `a_code' known in the terms list of this terminology
		do
			Result := term_codes.has (a_code)
		end

	has_constraint_code (a_code: STRING): BOOLEAN
			-- is `a_code' known in the terms list of this terminology
		do
			Result := constraint_codes.has (a_code)
		end

	has_definition (a_language, a_code: STRING): BOOLEAN
			-- is `a_code' defined in `a_language' in the relevant code table of this terminology?
		require
			Language_valid: not a_language.is_empty
		local
			refs: like refs_tuple
		do
			refs := refs_tuple (a_code)
			if refs.definitions.has (a_language) and then attached refs.definitions.item (a_language) as term_def_for_lang then
				Result := term_def_for_lang.has (a_code)
			end
		end

	has_id_definition (a_language, a_code: STRING): BOOLEAN
			-- is `a_code' defined in `a_language' in the id-codes of this terminology?
		require
			Language_valid: not a_language.is_empty
		do
			if id_definitions.has (a_language) and then attached id_definitions.item (a_language) as term_def_for_lang then
				Result := term_def_for_lang.has (a_code)
			end
		end

	has_term_definition (a_language, a_code: STRING): BOOLEAN
			-- is `a_code' defined in `a_language' in the at-codes of this terminology?
		require
			Language_valid: not a_language.is_empty
		do
			if term_definitions.has (a_language) and then attached term_definitions.item (a_language) as term_def_for_lang then
				Result := term_def_for_lang.has (a_code)
			end
		end

	has_constraint_definition (a_language, a_code: STRING): BOOLEAN
			-- is `a_code' defined in `a_language' in the ac-codes of this terminology?
		require
			Language_valid: not a_language.is_empty
		do
			if constraint_definitions.has (a_language) and then attached constraint_definitions.item (a_language) as term_def_for_lang then
				Result := term_def_for_lang.has (a_code)
			end
		end

	has_any_term_binding (a_key: STRING): BOOLEAN
			-- true if there is any term binding for code or path `a_key' for any terminology
		do
			Result := across term_bindings as bindings_csr some bindings_csr.item.has (a_key) end
		end

	has_term_binding (a_terminology, a_key: STRING): BOOLEAN
			-- true if there is a term binding for key `a_key' in `a_terminology'
		do
			Result := term_bindings.has (a_terminology) and then term_bindings.item (a_terminology).has (a_key)
		end

	has_any_constraint_binding (a_code: STRING): BOOLEAN
			-- true if there is any constraint binding for code `a_code' for any terminology
		do
			Result := across constraint_bindings as bindings_csr some bindings_csr.item.has (a_code) end
		end

	has_constraint_binding (a_terminology, a_code: STRING): BOOLEAN
			-- true if there is a term binding for code `a_code' in `a_terminology'
		do
			Result := constraint_bindings.has (a_terminology) and then constraint_bindings.item (a_terminology).has (a_code)
		end

	has_terminology_extract (a_terminology: STRING): BOOLEAN
			-- true if there is an extract from terminology `a_terminology'
		require
			Terminology_valid: not a_terminology.is_empty
		do
			Result := terminology_extracts.has (a_terminology)
		end

	has_terminology_extract_code (a_terminology, a_code: STRING): BOOLEAN
			-- true if there is a term binding for code `a_code' in `a_terminology'
		require
			Terminology_valid: not has_terminology_extract (a_terminology)
			Term_code_valid: not a_code.is_empty
		do
			Result := terminology_extracts.item (a_terminology).has (a_code)
		end

	has_term_bindings (a_terminology: STRING): BOOLEAN
			-- true if there are term bindings `a_terminology'
		do
			Result := term_bindings.has (a_terminology)
		end

	has_constraint_bindings (a_terminology: STRING): BOOLEAN
			-- true if there are term bindings `a_terminology'
		do
			Result := constraint_bindings.has (a_terminology)
		end

	semantically_conforms_to (other: FLAT_ARCHETYPE_TERMINOLOGY): BOOLEAN
			-- True if this terminology conforms to `other' by having the same or subset of languages
		do
			Result := languages_available.is_subset (other.languages_available)
		end

feature -- Conversion

	substitute_codes (str, lang: STRING): STRING
			-- substitute all occurrences of archetype codes in 'str'
			-- with their term texts from this terminology, in 'lang'
		require
			Str_valid: not str.is_empty
			Lang_valid: has_language(lang)
		local
			code: STRING
			start_pos, end_pos: INTEGER
		do
			create Result.make(0)
			Result.append (str)
			from
				start_pos := str.substring_index ("[" + Term_code_leader, 1)
			until
				start_pos <= 0
			loop
				end_pos := str.index_of (']', start_pos)
				code := str.substring (start_pos+1, end_pos-1)
				if has_term_code (code) then
					Result.replace_substring_all (code, term_definition (lang, code).text)
				end
				start_pos := str.substring_index ("[" + Term_code_leader, end_pos)
			end
		end

feature -- Modification

	create_added_id_definition (a_text, a_description: STRING)
			-- add a new term definition with 'text' = `a_text', 'description = `a_description',
			-- assumed to be in the original language;
			-- automatically add translation placeholders in all other languages
			-- return the new code in `last_added_term_definition'
		local
			new_term: ARCHETYPE_TERM
		do
			create new_term.make_all (new_added_id_code_at_level (specialisation_depth, highest_term_code), a_text, a_description)
			put_new_definition (original_language, new_term)
			last_new_id_definition_code := new_term.code
		end

	create_refined_id_definition (a_parent_code, a_text, a_description: STRING)
			-- add a new term definition as child of `a_parent_code'
			-- with 'text' = `a_text', 'description = `a_description',
			-- automatically add translation placeholders in all other languages
			-- return the new code in `last_added_term_definition'
		require
			Term_valid: specialisation_depth_from_code (a_parent_code) < specialisation_depth
		local
			new_term: ARCHETYPE_TERM
			high_code: INTEGER
		do
			if highest_refined_code_index.has (a_parent_code) then
				high_code := highest_refined_code_index [a_parent_code]
			else
				high_code := 1
			end
			create new_term.make_all (new_refined_code_at_level (a_parent_code, specialisation_depth, high_code), a_text, a_description)
			put_new_definition (original_language, new_term)
			last_new_id_definition_code := new_term.code
		end

	create_added_term_definition (a_text, a_description: STRING)
			-- add a new term definition with 'text' = `a_text', 'description = `a_description',
			-- assumed to be in the original language;
			-- automatically add translation placeholders in all other languages
			-- return the new code in `last_added_term_definition'
		local
			new_term: ARCHETYPE_TERM
		do
			create new_term.make_all (new_added_term_code_at_level (specialisation_depth, highest_term_code), a_text, a_description)
			put_new_definition (original_language, new_term)
			last_new_term_definition_code := new_term.code
		end

	create_refined_term_definition (a_parent_code, a_text, a_description: STRING)
			-- add a new term definition as child of `a_parent_code'
			-- with 'text' = `a_text', 'description = `a_description',
			-- automatically add translation placeholders in all other languages
			-- return the new code in `last_added_term_definition'
		require
			Term_valid: specialisation_depth_from_code (a_parent_code) < specialisation_depth
		local
			new_term: ARCHETYPE_TERM
			high_code: INTEGER
		do
			if highest_refined_code_index.has (a_parent_code) then
				high_code := highest_refined_code_index [a_parent_code]
			else
				high_code := 1
			end
			create new_term.make_all (new_refined_code_at_level (a_parent_code, specialisation_depth, high_code), a_text, a_description)
			put_new_definition (original_language, new_term)
			last_new_term_definition_code := new_term.code
		end

	create_added_constraint_definition (a_text, a_description: STRING)
			-- add a new constraint definition with 'text' = `a_text', 'description = `a_description';
			-- automatically add translation placeholders in all other languages
			-- return the new code in `last_added_constraint_definition'
		local
			new_term: ARCHETYPE_TERM
		do
			create new_term.make_all (new_added_term_code_at_level (specialisation_depth, highest_constraint_code), a_text, a_description)
			put_new_definition (original_language, new_term)
			last_new_constraint_definition_code := new_term.code
		end

	create_refined_constraint_definition (a_parent_code, a_text, a_description: STRING)
			-- add a new constraint definition as child of `a_parent_code'
			-- with 'text' = `a_text', 'description = `a_description';
			-- automatically add translation placeholders in all other languages
			-- return the new code in `last_added_constraint_definition'
		require
			Term_valid: specialisation_depth_from_code (a_parent_code) < specialisation_depth
		local
			new_term: ARCHETYPE_TERM
			high_code: INTEGER
		do
			if highest_refined_code_index.has (a_parent_code) then
				high_code := highest_refined_code_index [a_parent_code]
			else
				high_code := 1
			end
			create new_term.make_all (new_refined_code_at_level (a_parent_code, specialisation_depth, high_code), a_text, a_description)
			put_new_definition (original_language, new_term)
			last_new_constraint_definition_code := new_term.code
		end

	put_term_binding (a_term_code: TERMINOLOGY_CODE; a_code: STRING)
			-- add a new term binding to local code a_code, in the terminology
			-- group corresponding to the a_term_code.terminology
		require
			Local_code_valid: has_term_code (a_code)
			Not_already_added: not has_term_binding (a_term_code.terminology_id, a_code)
		do
			if not has_term_bindings (a_term_code.terminology_id) then
				term_bindings.put (create {HASH_TABLE [TERMINOLOGY_CODE, STRING]}.make(0), a_term_code.terminology_id)
			end
			if attached term_bindings.item (a_term_code.terminology_id) as bindings then
				bindings.put (a_term_code, a_code)
			end
		ensure
			Binding_added: has_term_binding (a_term_code.terminology_id, a_code)
		end

	put_constraint_binding (a_uri: URI; a_terminology, a_code: STRING)
			-- add a new constraint binding to local code a_code, in the terminology
			-- group corresponding to the a_term_code.terminology
		require
			Local_code_valid: has_constraint_code (a_code)
			Not_already_added: not has_constraint_binding (a_terminology, a_code)
		do
			if not has_constraint_bindings (a_terminology) then
				constraint_bindings.put (create {HASH_TABLE[URI, STRING]}.make(0), a_terminology)
			end
			if attached constraint_bindings.item (a_terminology) as bindings then
				bindings.put (a_uri, a_code)
			end
		ensure
			Binding_added: has_constraint_binding (a_terminology, a_code)
		end

	replace_id_definition_item (a_language: STRING; a_code, a_key, a_value: STRING)
			-- replace a field denoted by `a_key' of the term with code `a_code'
		require
			Language_valid: has_language (a_language)
			Term_valid: has_id_code (a_code)
		do
			if attached id_definitions.item (a_language) as defs_for_lang and then
				attached defs_for_lang.item (a_code) as term and then term.has_key (a_key)
			then
				term.set_value (a_value, a_key)
			end
		end

	replace_term_definition_item (a_language: STRING; a_code, a_key, a_value: STRING)
			-- replace a field denoted by `a_key' of the term with code `a_code'
		require
			Language_valid: has_language (a_language)
			Term_valid: has_term_code (a_code)
		do
			if attached term_definitions.item (a_language) as defs_for_lang and then
				attached defs_for_lang.item (a_code) as term and then term.has_key (a_key)
			then
				term.set_value (a_value, a_key)
			end
		end

	replace_constraint_definition_item (a_language: STRING; a_code, a_key, a_value: STRING)
			-- replace a field denoted by `a_key' of the term with code `a_code'
		require
			Language_valid: has_language (a_language)
			Term_valid: has_constraint_code (a_code)
		do
			if attached constraint_definitions.item (a_language) as defs_for_lang and then
				attached defs_for_lang.item (a_code) as term and then term.has_key (a_key)
			then
				term.set_value (a_value, a_key)
			end
		end

	replace_term_binding (a_term_code: TERMINOLOGY_CODE; a_code: STRING)
			-- replaces existing a term binding to local code a_code, in group a_terminology
		require
			Local_code_valid: has_term_code (a_code)
			Already_added: has_term_binding (a_term_code.terminology_id, a_code)
		do
			term_bindings.item (a_term_code.terminology_id).replace (a_term_code, a_code)
		ensure
			Binding_added: has_term_binding (a_term_code.terminology_id, a_code)
		end

	replace_constraint_binding (a_uri: URI; a_terminology, a_code: STRING)
			-- replaces existing constraint binding to local code a_code, in group a_terminology
		require
			Local_code_valid: has_constraint_code (a_code)
			Already_added: has_constraint_binding (a_terminology, a_code)
		do
			constraint_bindings.item (a_terminology).replace (a_uri, a_code)
		ensure
			Binding_added: has_constraint_binding (a_terminology, a_code)
		end

feature {DIFFERENTIAL_ARCHETYPE} -- Modification

	remove_definition (a_code: STRING)
			-- completely remove the term from the terminology
		require
			Code_found: has_code (a_code)
		local
			terminologies: ARRAYED_LIST[STRING]
			langs_to_remove: ARRAYED_LIST[STRING]
			refs: like refs_tuple
		do
			refs := refs_tuple (a_code)
			create langs_to_remove.make(0)
			across refs.definitions as defs_csr loop
				defs_csr.item.remove (a_code)
				if defs_csr.item.count = 0 then
					langs_to_remove.extend (defs_csr.key)
				end
			end

			across langs_to_remove as lang_terms_csr loop
				refs.definitions.remove (lang_terms_csr.item)
			end

			-- make a copy of terminologies list, since the next action might modify it...
			create terminologies.make_from_array (term_bindings.current_keys)
			if has_any_term_binding (a_code) then
				across terminologies as terminologies_csr loop
					if term_bindings.has (terminologies_csr.item) and then
						term_bindings.item (terminologies_csr.item).has (a_code)
					then
						remove_term_binding (a_code, terminologies_csr.item)
					end
				end
			end
			refs.codes.prune (a_code)
		ensure
			not has_code (a_code)
		end

	remove_term_binding (a_code, a_terminology: STRING)
			-- remove term binding to local code in group a_terminology
		require
			Local_code_exists: has_term_code (a_code)
			Has_binding: has_term_binding (a_terminology, a_code)
		do
			term_bindings.item (a_terminology).remove (a_code)
			if term_bindings.item (a_terminology).count = 0 then
				term_bindings.remove (a_terminology)
			end
		ensure
			Binding_removed: not has_term_binding(a_terminology, a_code)
		end

	remove_constraint_binding (a_code, a_terminology: STRING)
			-- remove constraint binding to local code in group a_terminology
		require
			Local_code_valid: has_constraint_code (a_code)
			Has_binding: has_constraint_binding (a_terminology, a_code)
		do
			constraint_bindings.item (a_terminology).remove (a_code)
			if constraint_bindings.item (a_terminology).count = 0 then
				constraint_bindings.remove (a_terminology)
			end
		ensure
			Binding_removed: not has_constraint_binding (a_terminology, a_code)
		end

feature {DIFFERENTIAL_ARCHETYPE_TERMINOLOGY} -- Modification

	put_new_definition (a_language: STRING; a_term: ARCHETYPE_TERM)
			-- add a new term definition for language `a_language' and
			-- automatically add translation placeholders in all other languages
		require
			Term_valid: not has_code (a_term.code) and specialisation_depth_from_code (a_term.code) <= specialisation_depth
			Definition_is_new: not has_definition (a_language, a_term.code)
		local
			refs: like refs_tuple
			trans_term: ARCHETYPE_TERM
		do
			refs := refs_tuple (a_term.code)
			if not refs.definitions.has (a_language) then
				refs.definitions.put (create {HASH_TABLE[ARCHETYPE_TERM, STRING]}.make(0), a_language)
			end
			refs.definitions.item (a_language).force (a_term, a_term.code)
			trans_term := a_term.create_translated_term (original_language)
			across refs.definitions as term_defs_csr loop
				if not term_defs_csr.key.is_equal (a_language) then
					if not refs.definitions.has (term_defs_csr.key) then
						refs.definitions.put (create {HASH_TABLE[ARCHETYPE_TERM, STRING]}.make(0), term_defs_csr.key)
					end
					term_defs_csr.item.force (trans_term.deep_twin, trans_term.code)
				end
			end

			refs.codes.extend (a_term.code)
			update_highest_refined_codes (a_term.code)
			update_highest_code (a_term.code)
		ensure
			Code_valid: has_code (a_term.code)
			Definition_added: has_definition (a_language, a_term.code)
		end

	replace_definition (a_language: STRING; a_term: ARCHETYPE_TERM; replace_translations: BOOLEAN)
			-- replace the definition of an existing term code; replace all translations
			-- if flag set and `a_language' is the primary language
		require
			Language_valid: has_language (a_language)
			Term_valid: has_code (a_term.code)
		local
			refs: like refs_tuple
		do
			refs := refs_tuple (a_term.code)
			if a_language.is_equal (original_language) and replace_translations then
				put_new_definition (a_language, a_term) -- replace all translations as well
			else
				refs.definitions.item (a_language).replace (a_term, a_term.code) -- just do this translation
			end
		end

feature {ARCHETYPE_TERMINOLOGY} -- Modification

	has_path (a_path: STRING): BOOLEAN
			-- True if path `a_path' exists in structure
		require
			a_path_valid: not a_path.is_empty
		do
			Result := dt_representation.has_path (a_path)
		end

	highest_refined_code_index: HASH_TABLE [INTEGER, STRING]
			-- Table of current highest code keyed by its parent code, for all specialised codes
			-- in this terminology at its level of specialisation.
			-- For example the entry for key 'at0007' could be 5, meaning that current top child
			-- code of 'at7' is 'at7.5'
        attribute
            create Result.make (0)
        end

	highest_id_code: INTEGER
			-- highest added id code at the level of this terminology; 0 if none so far

	highest_term_code: INTEGER
			-- highest added term code at the level of this terminology; 0 if none so far

	highest_constraint_code: INTEGER
			-- highest added constraint code at the level of this terminology; 0 if none so far

	update_highest_refined_codes (a_code: STRING)
			-- Update `highest_refined_code_index' list with `a_code', if it happens to be refined at this level.
		require
			Code_valid: is_valid_code (a_code)
		local
			parent_code: STRING
			idx: INTEGER
		do
			if is_refined_code (a_code) then
				parent_code := specialisation_parent_from_code (a_code)
				idx := specialised_code_tail (a_code).to_integer
				if idx > highest_refined_code_index [parent_code] then
					highest_refined_code_index [parent_code] := idx
				end
			end
		end

	update_highest_code (a_code: STRING)
			-- update highest added term code index at the specialisation depth of this archetype
			-- spec depth = 0: id47 -> use the 47 & compare with current highest
			-- spec depth = 3: id0.0.12 -> use the 12 & compare with current highest
		require
			Code_valid: is_valid_code (a_code)
		local
			idx: INTEGER
			idx_string: STRING
			refs: like refs_tuple
		do
			refs := refs_tuple (a_code)
			if not is_refined_code (a_code) and then specialisation_depth_from_code (a_code) = specialisation_depth then
				idx_string := index_from_code_at_level (a_code, specialisation_depth)
				if idx_string.is_integer then
					idx := idx_string.to_integer
					if idx > highest_id_code then
						refs.update_highest_code_agt.call ([idx])
					end
				end
			end
		end

	valid_term_code (a_code: STRING): BOOLEAN
			-- True if `a_code' is found in all languages
		require
			Code_valid: not a_code.is_empty
		local
			t_path: STRING
		do
			Result := True
			from term_definitions.start until term_definitions.off or not Result loop
				create t_path.make(0)
				t_path.append ("/" + Sym_term_definitions + "[" + term_definitions.key_for_iteration + "]/items[" + a_code + "]")
				Result := Result and has_path(t_path)
				term_definitions.forth
			end
		end

	valid_constraint_code (a_code: STRING): BOOLEAN
			-- True if `a_code' is found in all languages
		require
			Code_valid: not a_code.is_empty
		local
			t_path: STRING
		do
			Result := True
			from constraint_definitions.start until constraint_definitions.off or not Result loop
				create t_path.make(0)
				t_path.append ("/" + Sym_constraint_definitions + "[" + constraint_definitions.key_for_iteration + "]/items[" + a_code + "]")
				Result := Result and has_path(t_path)
				constraint_definitions.forth
			end
		end

	sync_stored_properties
			-- update various stored properties to correspond to primary stored properties
		local
			code: STRING
		do
			-- populate id code list & set codes in ARCHETYPE_TERM objects
			id_codes.wipe_out
			across id_definitions as id_defs_csr loop
				across id_defs_csr.item as id_defs_list_csr loop
					code := id_defs_list_csr.key
					id_defs_list_csr.item.set_code (code)
					if id_defs_csr.is_first then
						id_codes.extend (code)
						if is_valid_id_code (code) then
							update_highest_refined_codes (code)
							update_highest_code (code)
						end
					end
				end
			end

			-- populate term code list & set codes in ARCHETYPE_TERM objects
			term_codes.wipe_out
			across term_definitions as term_defs_csr loop
				across term_defs_csr.item as term_defs_list_csr loop
					code := term_defs_list_csr.key
					term_defs_list_csr.item.set_code (code)
					if term_defs_csr.is_first then
						term_codes.extend (code)
						if is_valid_term_code (code) then
							update_highest_refined_codes (code)
							update_highest_code (code)
						end
					end
				end
			end

			-- populate constraint code list & set codes in ARCHETYPE_TERM objects
			constraint_codes.wipe_out
			across constraint_definitions as constraint_defs_csr loop
				across constraint_defs_csr.item as constraint_defs_list_csr loop
					code := constraint_defs_list_csr.key
					constraint_defs_list_csr.item.set_code (code)
					if constraint_defs_csr.is_first then
						constraint_codes.extend (code)
						if is_valid_constraint_code (code) then
							update_highest_refined_codes (code)
							update_highest_code (code)
						end
					end
				end
			end
		end

feature {ADL_15_ENGINE} -- Legacy

	convert_at_id_codes (converted_codes: HASH_TABLE [STRING, STRING])
			-- convert at-codes that are being used as id-codes to proper id-codes,
			-- and move them from the term_definitions to the id_definitions
		obsolete
			"Support ADL 1.4 style at-codes used as id-codes"
		local
			conv_terms: HASH_TABLE [ARCHETYPE_TERM, STRING]
			conv_bindings: HASH_TABLE [TERMINOLOGY_CODE, STRING]
			conv_term: ARCHETYPE_TERM
			bind_term: TERMINOLOGY_CODE
			path_strs: HASH_TABLE [STRING, STRING]
			new_path: STRING
		do
			-- move at-code terms that are really id-codes out of term_definitions and into id_definitions
			-- only applies to terms of the specialisation level of this archetype
			across converted_codes as at_id_codes_csr loop
				-- find the term bindings in all terminologies
				-- first case: binding is against just the single code
				if has_any_term_binding (at_id_codes_csr.key) then
					conv_bindings := term_bindings_for_key (at_id_codes_csr.key)
				else
					create conv_bindings.make (0)
				end

				-- add bindings back in keyed by new id codes
				across conv_bindings as id_bindings_csr loop
					put_term_binding (id_bindings_csr.item, at_id_codes_csr.item)
				end

				-- second case: binding is keyed by path containing node id code
				across term_bindings as bindings_for_terminology_csr loop
					create path_strs.make (0)
					across bindings_for_terminology_csr.item as bindings_csr loop
						if bindings_csr.key.has_substring (at_id_codes_csr.key) then
							new_path := bindings_csr.key.twin
							new_path.replace_substring_all (at_id_codes_csr.key, at_id_codes_csr.item)
							path_strs.put (new_path, bindings_csr.key)
						end
					end

					-- now go replace the path keys with the modified path keys
					across path_strs as paths_csr loop
						bindings_for_terminology_csr.item.replace_key (paths_csr.item, paths_csr.key)
					end
				end

				-- now do the id codes
				if specialisation_depth_from_code (at_id_codes_csr.item) = specialisation_depth then
					create conv_terms.make (0)
					-- find the term definitions in all languages
					across term_definitions as term_defs_for_lang_csr loop
						check attached term_defs_for_lang_csr.item.item (at_id_codes_csr.key) as att_term then
							conv_term := att_term
						end
						conv_term.set_code (at_id_codes_csr.item)
						conv_terms.put (conv_term, term_defs_for_lang_csr.key)
					end

					-- completely remove the old term code from definitions and bindings
					remove_definition (at_id_codes_csr.key)

					-- add it back in as an id code
					across conv_terms as id_terms_csr loop
						if has_id_code (at_id_codes_csr.key) then
							replace_definition (id_terms_csr.key, id_terms_csr.item, False)
						else
							put_new_definition (id_terms_csr.key, id_terms_csr.item)
						end
					end
				end
			end

			-- now for the remaining at-coded terms in term_definitions, reformat
			across term_definitions as term_defs_for_lang_csr loop
				create conv_terms.make (0)
				across term_defs_for_lang_csr.item as terms_csr loop
					terms_csr.item.set_code (adl_14_code_reformatted (terms_csr.item.code))
					conv_terms.put (terms_csr.item, terms_csr.item.code)
				end
				term_definitions.replace (conv_terms, term_defs_for_lang_csr.key)
			end

			-- have to resync properties to regenerate id_codes, terms_codes etc
			sync_stored_properties
		end

feature {P_ARCHETYPE_TERMINOLOGY} -- Implementation

	set_id_definitions (a_id_defs: HASH_TABLE [HASH_TABLE [ARCHETYPE_TERM, STRING], STRING])
		do
			id_definitions := a_id_defs
		end

	set_term_definitions (a_term_defs: HASH_TABLE [HASH_TABLE [ARCHETYPE_TERM, STRING], STRING])
		do
			term_definitions := a_term_defs
		end

	set_constraint_definitions (a_constraint_defs: HASH_TABLE [HASH_TABLE [ARCHETYPE_TERM, STRING], STRING])
		do
			constraint_definitions := a_constraint_defs
		end

	set_term_bindings (a_term_bindings: HASH_TABLE [HASH_TABLE [TERMINOLOGY_CODE, STRING], STRING])
		do
			term_bindings := a_term_bindings
		end

	set_constraint_bindings (a_constraint_bindings: HASH_TABLE [HASH_TABLE [URI, STRING], STRING])
		do
			constraint_bindings := a_constraint_bindings
		end

	set_terminology_extracts (a_term_extracts: HASH_TABLE [HASH_TABLE [ARCHETYPE_TERM, STRING], STRING])
		do
			terminology_extracts := a_term_extracts
		end

feature -- Finalisation

	finalise_dt
			-- finalisation routine to guarantee validity on creation
		do
			sync_stored_properties
		end

feature {DT_OBJECT_CONVERTER} -- Conversion

	persistent_attributes: ARRAYED_LIST [STRING]
			-- list of attribute names to persist as DT structure
			-- empty structure means all attributes
		once
			create Result.make(0)
			Result.compare_objects
			Result.extend ("term_definitions")
			Result.extend ("constraint_definitions")
			Result.extend ("term_bindings")
			Result.extend ("constraint_bindings")
		end

feature {NONE} -- Implementation

	refs_tuple (a_code: STRING): TUPLE [codes: TWO_WAY_SORTED_SET [STRING];
										definitions: HASH_TABLE [HASH_TABLE [ARCHETYPE_TERM, STRING], STRING];
										update_highest_code_agt: PROCEDURE [ANY, TUPLE [INTEGER]]]
			-- completely remove the term from the terminology
		do
			create Result
			if is_id_code (a_code) then
				Result.codes := id_codes
				Result.definitions := id_definitions
				Result.update_highest_code_agt := agent (a_val: INTEGER) do highest_id_code := a_val end
			elseif is_term_code (a_code) then
				Result.codes := term_codes
				Result.definitions := term_definitions
				Result.update_highest_code_agt := agent (a_val: INTEGER) do highest_term_code := a_val end
			elseif is_constraint_code (a_code) then
				Result.codes := constraint_codes
				Result.definitions := constraint_definitions
				Result.update_highest_code_agt := agent (a_val: INTEGER) do highest_constraint_code := a_val end
			end
		end

invariant
	Original_language_valid: not original_language.is_empty
	root_code_valid: is_valid_root_id_code (concept_code)
	concept_code_defined: id_codes.has (concept_code)
	Highest_term_code_index_valid: highest_term_code >= 0
	Highest_constraint_code_valid: highest_constraint_code >= 0
	id_codes_compares_objects: id_codes.object_comparison
	term_codes_compares_objects: term_codes.object_comparison
	constraint_codes_compares_objects: constraint_codes.object_comparison

end


