note
	component:   "openEHR ADL Tools"
	description: "ADL Terminology class"
	keywords:    "archetype, ontology, terminology"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2003- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

deferred class ARCHETYPE_ONTOLOGY

inherit
	DT_CONVERTIBLE
		redefine
			finalise_dt
		end

	ARCHETYPE_TERM_CODE_TOOLS
		export
			{NONE} all;
			{ANY} is_valid_concept_code, is_valid_code, specialisation_depth_from_code
		end

	ARCHETYPE_DEFINITIONS
		export
			{NONE} all
		end

feature -- Definitions

	Sym_terminologies_available: STRING = "terminologies_available"

	Sym_term_definitions: STRING = "term_definitions"

	Sym_constraint_definitions: STRING = "constraint_definitions"

	Sym_term_bindings: STRING = "term_bindings"

	Sym_constraint_bindings: STRING = "constraint_bindings"

feature -- Initialisation

	make (an_original_lang, a_concept_code: STRING)
			-- make ontology from concept code and original language
		require
			Original_language_valid: not an_original_lang.is_empty
			root_code_valid: is_valid_concept_code (a_concept_code)
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
			-- original language of the ontology, as set at archetype creation or parsing time

	concept_code: STRING
			-- term code of the concept of the ontology as a whole

	languages_available: ARRAYED_SET [STRING]
		do
			create Result.make(0)
			Result.compare_objects
			across term_definitions as term_defs_csr loop
				Result.extend (term_defs_csr.key)
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

	term_bindings: HASH_TABLE [HASH_TABLE [CODE_PHRASE, STRING], STRING]
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
			-- depth of this ontology with relation to ontologies in other archetypes
		do
			Result := specialisation_depth_from_code (concept_code)
		ensure
			non_negative: Result >= 0
		end

feature -- Access

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

	term_binding (a_terminology, a_key: STRING): CODE_PHRASE
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

	term_bindings_for_terminology (a_terminology: STRING): detachable HASH_TABLE [CODE_PHRASE, STRING]
			-- retrieve the term bindings for a particular terminology
		require
			Terminology_valid: term_bindings.has (a_terminology)
		do
			check attached term_bindings.item (a_terminology) as tbs then
				Result := tbs
			end
		end

	term_bindings_for_key (a_key: STRING): HASH_TABLE [CODE_PHRASE, STRING]
			-- retrieve the term bindings for a key as a table of bound terms keyed by terminology_id
		require
			Terminology_valid: has_any_term_binding (a_key)
		do
			create Result.make (0)
			across term_bindings as bindings_for_lang_csr loop
				if bindings_for_lang_csr.item.has (a_key) and then attached bindings_for_lang_csr.item.item (a_key) as binding_for_key then
					Result.put (binding_for_key, bindings_for_lang_csr.key)
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
			term_code, log_str: STRING
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
					term_code := og_phys_path.item.object_id
					if is_valid_code (term_code) then
						if has_term_code (term_code) then
							if with_codes then
								log_str := annotated_code (term_code, term_definition (a_language, term_code).text)
							else
								log_str := term_definition (a_language, term_code).text
							end
							og_log_path.item.set_object_id (log_str)
						end
					else
						og_log_path.item.set_object_id (term_code)
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
				if is_term_code (a_code) and has_term_code (a_code) then
					Result := term_definition (a_lang, a_code)
				elseif is_constraint_code (a_code) and has_constraint_code (a_code) then
					Result := constraint_definition (a_lang, a_code)
				end
			end
		end

	last_added_term_definition_code: detachable STRING

	last_added_constraint_definition_code: detachable STRING

feature -- Status Report

	has_language (a_language: STRING): BOOLEAN
			-- check that `a_language' supported
		require
			Language_valid: not a_language.is_empty
		do
			Result := term_definitions.has (a_language)
		end

	has_terminology (a_terminology: STRING): BOOLEAN
			-- is `a_terminology' known in this ontology?
		require
			Terminology_valid: not a_terminology.is_empty
		do
			Result := terminologies_available.has (a_terminology)
		end

	has_term_code (a_code: STRING): BOOLEAN
			-- is `a_code' known in this ontology
		require
			Term_code_valid: is_valid_code (a_code)
		do
			Result := term_codes.has (a_code)
		end

	has_constraint_code (a_code: STRING): BOOLEAN
			--
		require
			Code_valid: is_valid_code (a_code)
		do
			Result := constraint_codes.has (a_code)
		end

	has_term_definition (a_language, a_code: STRING): BOOLEAN
			-- is `a_code' defined in `a_language' in this ontology?
		require
			Term_code_valid: is_valid_code (a_code)
			Language_valid: not a_language.is_empty
		do
			if term_definitions.has (a_language) and then attached term_definitions.item (a_language) as term_def_for_lang then
				Result := term_def_for_lang.has (a_code)
			end
		end

	has_constraint_definition (a_language, a_code: STRING): BOOLEAN
			-- is `a_code' defined in `a_language' in this ontology?
		require
			Constraint_code_valid: is_valid_code (a_code)
			Language_valid: not a_language.is_empty
		do
			if constraint_definitions.has (a_language) and then attached constraint_definitions.item (a_language) as term_def_for_lang then
				Result := term_def_for_lang.has (a_code)
			end
		end

	has_any_term_binding (a_key: STRING): BOOLEAN
			-- true if there is any term binding for code `a_key' for any terminology
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

	semantically_conforms_to (other: FLAT_ARCHETYPE_ONTOLOGY): BOOLEAN
			-- True if this ontology conforms to `other' by having the same or subset of languages
		do
			Result := languages_available.is_subset (other.languages_available)
		end

feature -- Conversion

	substitute_codes (str, lang: STRING): STRING
			-- substitute all occurrences of archetype codes in 'str'
			-- with their term texts from this ontology, in 'lang'
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
				start_pos := str.substring_index("[" + Term_code_leader, 1)
			until
				start_pos <= 0
			loop
				end_pos := str.index_of(']', start_pos)
				code := str.substring(start_pos+1, end_pos-1)
				if has_term_code(code) then
					Result.replace_substring_all (code, term_definition(lang, code).text)
				end
				start_pos := str.substring_index ("[" + Term_code_leader, end_pos)
			end
		end

feature -- Modification

	add_new_non_refined_term_definition
			-- add a new term definition with default content;
			-- automatically add translation placeholders in all other languages
			-- return the new code in `last_added_term_definition'
		local
			str: STRING
		do
			str := new_non_refined_term_code
			merge_term_definition (original_language, create {ARCHETYPE_TERM}.make (str))
			last_added_term_definition_code := str
		end

	add_new_refined_term_definition (parent_code: STRING)
			-- add a new term definition as child of `parent_code' with default content;
			-- automatically add translation placeholders in all other languages
			-- return the new code in `last_added_term_definition'
		require
			Term_valid: specialisation_depth_from_code (parent_code) < specialisation_depth
		local
			str: STRING
		do
			str := new_refined_term_code (parent_code)
			merge_term_definition (original_language, create {ARCHETYPE_TERM}.make (str))
			last_added_term_definition_code := str
		end

	add_new_non_refined_constraint_definition
			-- add a new constraint definition with default content;
			-- automatically add translation placeholders in all other languages
			-- return the new code in `last_added_constraint_definition'
		local
			str: STRING
		do
			str := new_non_refined_constraint_code
			merge_constraint_definition (original_language, create {ARCHETYPE_TERM}.make (str))
			last_added_constraint_definition_code := str
		end

	add_new_refined_constraint_definition (parent_code: STRING)
			-- add a new constraint definition as child of `parent_code' with default content;
			-- automatically add translation placeholders in all other languages
			-- return the new code in `last_added_constraint_definition'
		require
			Term_valid: specialisation_depth_from_code (parent_code) < specialisation_depth
		local
			str: STRING
		do
			str := new_refined_constraint_code (parent_code)
			merge_constraint_definition (original_language, create {ARCHETYPE_TERM}.make (str))
			last_added_constraint_definition_code := str
		end

	add_term_binding (a_code_phrase: CODE_PHRASE; a_code: STRING)
			-- add a new term binding to local code a_code, in the terminology
			-- group corresponding to the a_code_phrase.terminology
		require
			Local_code_valid: has_term_code (a_code)
			Not_already_added: not has_term_binding (a_code_phrase.terminology_id.name, a_code)
		local
			a_terminology: STRING
		do
			a_terminology := a_code_phrase.terminology_id.name
			if not has_term_bindings (a_terminology) then
				term_bindings.put (create {HASH_TABLE[CODE_PHRASE, STRING]}.make(0), a_terminology)
			end
			if attached term_bindings.item (a_terminology) as bindings then
				bindings.put (a_code_phrase, a_code)
			end
		ensure
			Binding_added: has_term_binding (a_code_phrase.terminology_id.name, a_code)
		end

	add_constraint_binding (a_uri: URI; a_terminology, a_code: STRING)
			-- add a new constraint binding to local code a_code, in the terminology
			-- group corresponding to the a_code_phrase.terminology
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

	replace_term_definition_item (a_language: STRING; a_code, a_key, a_value: STRING)
			-- replace a field denoted by `a_key' of the term with code `a_code'
		require
			Language_valid: has_language (a_language)
			Term_valid: has_term_code (a_code)
		do
			if attached term_definitions.item (a_language) as defs_for_lang and then attached defs_for_lang.item (a_code) as term and then term.has_key (a_key) then
				term.set_value (a_value, a_key)
			end
		end

	replace_constraint_definition_item (a_language: STRING; a_code, a_key, a_value: STRING)
			-- replace a field denoted by `a_key' of the term with code `a_code'
		require
			Language_valid: has_language (a_language)
			Term_valid: has_constraint_code (a_code)
		do
			if attached constraint_definitions.item (a_language) as defs_for_lang and then attached defs_for_lang.item (a_code) as term and then term.has_key (a_key) then
				term.set_value (a_value, a_key)
			end
		end

	replace_term_binding (a_code_phrase: CODE_PHRASE; a_code: STRING)
			-- replaces existing a term binding to local code a_code, in group a_terminology
		require
			Local_code_valid: has_term_code (a_code)
			Already_added: has_term_binding (a_code_phrase.terminology_id.value, a_code)
		do
			term_bindings.item (a_code_phrase.terminology_id.value).replace (a_code_phrase, a_code)
		ensure
			Binding_added: has_term_binding (a_code_phrase.terminology_id.value, a_code)
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

	remove_term_definition (a_code: STRING)
			-- completely remove the term from the ontology
		require
			Term_valid: has_term_code(a_code)
		local
			terminologies: ARRAYED_LIST[STRING]
			langs_to_remove: ARRAYED_LIST[STRING]
		do
			create langs_to_remove.make(0)

			across term_definitions as term_defs_csr loop
				term_defs_csr.item.remove (a_code)
				if term_defs_csr.item.count = 0 then
					langs_to_remove.extend (term_defs_csr.key)
				end
			end

			across langs_to_remove as lang_terms_csr loop
				term_definitions.remove (lang_terms_csr.item)
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
			term_codes.prune (a_code)
		ensure
			not has_term_code(a_code)
		end

	remove_constraint_definition (a_code: STRING)
			-- completely remove the constraint from the ontology
		require
			Constraint_valid: has_constraint_code (a_code)
		local
			terminologies: ARRAYED_LIST[STRING]
			langs_to_remove: ARRAYED_LIST[STRING]
		do
			create langs_to_remove.make(0)

			across constraint_definitions as constraint_defs_csr loop
				constraint_defs_csr.item.remove (a_code)
				if constraint_defs_csr.item.count = 0 then
					langs_to_remove.extend (constraint_defs_csr.key)
				end
			end

			across langs_to_remove as langs_csr loop
				constraint_definitions.remove (langs_csr.item)
			end

			-- make a copy of terminologies list, since the next action might modify it...
			create terminologies.make_from_array (constraint_bindings.current_keys)
			if has_any_constraint_binding (a_code) then
				across terminologies as terminologies_csr loop
					if constraint_bindings.has (terminologies_csr.item) and then
						constraint_bindings.item (terminologies_csr.item).has (a_code) then
						remove_constraint_binding (a_code, terminologies_csr.item)
					end
				end
			end

			constraint_codes.prune (a_code)
		ensure
			not has_constraint_code (a_code)
		end

	remove_term_binding (a_code, a_terminology: STRING)
			-- remove term binding to local code in group a_terminology
		require
			Local_code_valid: has_term_code(a_code)
			Has_binding: has_term_binding(a_terminology, a_code)
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

feature {DIFFERENTIAL_ARCHETYPE_ONTOLOGY} -- Modification

	merge_term_definition (a_language: STRING; a_term: ARCHETYPE_TERM)
			-- add a new term definition for language `a_language' and
			-- automatically add translation placeholders in all other languages
		require
			Language_valid: has_language (a_language)
			Term_valid: not has_term_code (a_term.code) and specialisation_depth_from_code (a_term.code) <= specialisation_depth
		do
			put_term_definition (a_language, a_term)
			term_codes.extend (a_term.code)
			update_highest_refined_codes (a_term.code)
			update_highest_term_code (a_term.code)
		ensure
			Code_valid: has_term_code (a_term.code)
		end

	replace_term_definition (a_language: STRING; a_term: ARCHETYPE_TERM; replace_translations: BOOLEAN)
			-- replace the definition of an existing term code; replace all translations
			-- if flag set and `a_language' is the primary language
		require
			Language_valid: has_language (a_language)
			Term_valid: has_term_code (a_term.code)
		do
			if a_language.is_equal (original_language) and replace_translations then
				put_term_definition (a_language, a_term) -- replace all translations as well
			else
				term_definitions.item (a_language).replace (a_term, a_term.code) -- just do this translation
			end
		end

	merge_constraint_definition (a_language: STRING; a_term: ARCHETYPE_TERM)
			-- add a new constraint definition for language `a_language' and
			-- automatically add translation placeholders
		require
			Language_valid: has_language(a_language)
			Term_valid: not has_constraint_code(a_term.code) and specialisation_depth_from_code (a_term.code) <= specialisation_depth
		do
			put_constraint_definition (a_language, a_term)
			constraint_codes.extend (a_term.code)
			update_highest_refined_codes (a_term.code)
			update_highest_constraint_code_index (a_term.code)
		ensure
			has_constraint_code(a_term.code)
		end

	replace_constraint_definition (a_language: STRING; a_term: ARCHETYPE_TERM; replace_translations: BOOLEAN)
			-- replace the definition of an existing constraint code; replace all translations
			-- if flag set and `a_language' is the primary language
		require
			Language_valid: has_language (a_language)
			Term_valid: has_constraint_code (a_term.code)
		do
			if a_language.is_equal (original_language) and replace_translations then
				put_constraint_definition (a_language, a_term) -- replace all translations as well
			else
				constraint_definitions.item (a_language).replace(a_term, a_term.code) -- just do this translation
			end
		end

feature {TEST_DIFFERENTIAL_ARCHETYPE_ONTOLOGY} -- Factory

	new_non_refined_term_code: STRING
			-- create a new at-code at current specialisation depth
			-- code will have form atnnn or at0.n or at0.0.n etc
		local
			new_idx_str: STRING
			i: INTEGER
		do
			if specialisation_depth > 0 then
				create Result.make(0)
				Result.append (Term_code_leader)

				from i := 0 until i = specialisation_depth loop
					Result.append_character ('0')
					Result.append_character (Specialisation_separator)
					i := i + 1
				end

				Result.append_integer (highest_term_code + 1)
			else
				create Result.make_filled ('0', Term_code_length)
				Result.replace_substring (Term_code_leader, 1, Term_code_leader.count)
				new_idx_str := (highest_term_code + 1).out
				Result.replace_substring (new_idx_str, Result.count - new_idx_str.count + 1, Result.count)
			end
		ensure
			Result_exists: specialisation_depth_from_code(Result) = specialisation_depth
		end

	new_refined_term_code (a_parent_code: STRING): STRING
			-- Create a new at-code at current specialisation depth, based on `a_parent_code'
			-- e.g. "at0001" at level 2 will produce "at0001.0.1"
			-- Note: a code of "at0001" has specialisation depth 0
		require
			a_parent_code_valid: has_term_code (a_parent_code)
			level_valid: specialisation_depth > 0
		local
			i: INTEGER
		do
			create Result.make(0)
			Result.append (a_parent_code)

			from i := specialisation_depth_from_code (a_parent_code) + 1 until i >= specialisation_depth loop
				Result.append_character (Specialisation_separator)
				Result.append_character ('0')
				i := i + 1
			end

			Result.append_character (Specialisation_separator)
			if highest_refined_code_index.has (a_parent_code) then
				Result.append_integer (highest_refined_code_index [a_parent_code] + 1)
			else
				Result.append_integer (1)
			end
		ensure
			Result_valid: specialised_code_tail (Result).to_integer > 0
		end

	new_non_refined_constraint_code: STRING
			-- create a new ac-code at current specialisation depth
			-- code will have form atnnn or ac0.n or ac0.0.n etc
		local
			new_idx_str: STRING
			i: INTEGER
		do
			if specialisation_depth > 0 then
				create Result.make(0)
				Result.append (Constraint_code_leader)
				from i := 0 until i = specialisation_depth loop
					Result.append_character ('0')
					Result.append_character (Specialisation_separator)
					i := i + 1
				end

				Result.append_integer(highest_constraint_code + 1)
			else
				create Result.make_filled ('0', Constraint_code_length)
				Result.replace_substring (Constraint_code_leader, 1, Constraint_code_leader.count)
				new_idx_str := (highest_constraint_code + 1).out
				Result.replace_substring (new_idx_str, Result.count-new_idx_str.count+1, Result.count)
			end
		ensure
			Result_exists: specialisation_depth_from_code(Result) = specialisation_depth
		end

	new_refined_constraint_code (a_parent_code: STRING): STRING
			-- Make a new ac-code based on `a_parent_code'
			-- e.g. "ac0001" at level 2 will produce "ac0001.0.1"
			-- Note: a code of "ac0001" has specialisation depth 0
		require
			a_parent_code_valid: has_constraint_code (a_parent_code)
			level_valid: specialisation_depth > 0
		local
			i: INTEGER
		do
			create Result.make(0)
			Result.append (a_parent_code)

			from
				i := specialisation_depth_from_code (a_parent_code) + 1
			until
				i >= specialisation_depth
			loop
				Result.append_character (Specialisation_separator)
				Result.append_character ('0')
				i := i + 1
			end

			Result.append_character (Specialisation_separator)
			if highest_refined_code_index.has (a_parent_code) then
				Result.append_integer (highest_refined_code_index [a_parent_code] + 1)
			else
				Result.append_integer (1)
			end
		ensure
			Result_valid: specialised_code_tail (Result).to_integer > 0
		end

feature {ARCHETYPE_ONTOLOGY} -- Modification

--	set_concept_code (a_code: STRING)
--			-- set the primary language of the ontology
--		do
--			concept_code := a_code
--		ensure
--			Concept_code_set: concept_code.is_equal(a_code)
--		end

--	set_original_language (a_language: STRING)
--			-- set the primary language of the ontology
--		do
--			original_language := a_language
--		ensure
--			Language_set: original_language.is_equal(a_language)
--		end

	has_path (a_path: STRING): BOOLEAN
			-- True if path `a_path' exists in structure
		require
			a_path_valid: not a_path.is_empty
		do
			Result := dt_representation.has_path (a_path)
		end

	highest_refined_code_index: HASH_TABLE [INTEGER, STRING]
			-- Table of current highest code keyed by its parent code, for all specialised codes in this ontology at its
			-- level of specialisation.
			-- For example the entry for key 'at0007' could be 5, meaning that current top child code of 'at0007' is 'at0007.5'
        attribute
            create Result.make (0)
        end

	highest_term_code: INTEGER
			-- highest non-specialised term code at the level of this ontology; 0 if none so far

	highest_constraint_code: INTEGER
			-- highest non-specialised constraint code at the level of this ontology; 0 if none so far

	put_term_definition (a_language: STRING; a_term: ARCHETYPE_TERM)
			-- put a term definition for language `a_language' and
			-- automatically add translation placeholders in all other languages
			-- Has the effect of adding a new term or replacing an existing one
		local
			trans_term: ARCHETYPE_TERM
		do
			term_definitions.item (a_language).force (a_term, a_term.code)
			trans_term := a_term.create_translated_term (original_language)
			across term_definitions as term_defs_csr loop
				if not term_defs_csr.key.is_equal (a_language) then
					term_defs_csr.item.force (trans_term.deep_twin, trans_term.code)
				end
			end
		ensure
			term_definitions.item (a_language).item (a_term.code) = a_term
		end

	put_constraint_definition (a_language: STRING; a_term: ARCHETYPE_TERM)
			-- put a constraint definition for language `a_language' and
			-- automatically add translation placeholders
			-- Has the effect of adding a new term or replacing an existing one
		local
			trans_term: ARCHETYPE_TERM
		do
			if not constraint_definitions.has(a_language) then
				constraint_definitions.put(create {HASH_TABLE[ARCHETYPE_TERM, STRING]}.make(0), a_language)
			end
			constraint_definitions.item(a_language).force(a_term, a_term.code)
			trans_term := a_term.create_translated_term(a_language)

			-- in the following, iterate over term_definitions to get definitive list of languages
			across term_definitions as term_defs_csr loop
				if not term_defs_csr.key.is_equal(a_language) then
					if not constraint_definitions.has (term_defs_csr.key) then
						constraint_definitions.put (create {HASH_TABLE[ARCHETYPE_TERM, STRING]}.make(0), term_defs_csr.key)
					end
					constraint_definitions.item (term_defs_csr.key).force (trans_term, a_term.code)
				end
			end
		ensure
			constraint_definitions.item (a_language).item (a_term.code) = a_term
		end

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

	update_highest_term_code (a_code: STRING)
			-- update highest non-specialised term code index at the specialisation depth of this archetype
			-- spec depth = 0: at0047 -> use the 0047 & compare with current highest
			-- spec depth = 3: at0.0.12 -> use the 12 & compare with current highest
		require
			Code_valid: is_valid_code (a_code)
		local
			idx: INTEGER
			idx_string: STRING
		do
			if not is_refined_code (a_code) and then specialisation_depth_from_code (a_code) = specialisation_depth then
				idx_string := index_from_code_at_level (a_code, specialisation_depth)
				if idx_string.is_integer then
					idx := idx_string.to_integer
					if idx > highest_term_code then
						highest_term_code := idx
					end
				end
			end
		end

	update_highest_constraint_code_index (a_code: STRING)
			-- update highest_constraint_code_index for this level;
			-- ignore acXXXX codes not of the level of this archetype
		require
			Code_valid: is_valid_code (a_code)
		local
			idx: INTEGER
			idx_string: STRING
		do
			if not is_refined_code (a_code) and then specialisation_depth_from_code (a_code) = specialisation_depth then
				idx_string := index_from_code_at_level (a_code, specialisation_depth)
				if idx_string.is_integer then
					idx := idx_string.to_integer
					if idx > highest_constraint_code then
						highest_constraint_code := idx
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

feature {P_ARCHETYPE_ONTOLOGY} -- Implementation

	set_term_definitions (a_term_defs: HASH_TABLE [HASH_TABLE [ARCHETYPE_TERM, STRING], STRING])
		do
			term_definitions := a_term_defs
		end

	set_constraint_definitions (a_constraint_defs: HASH_TABLE [HASH_TABLE [ARCHETYPE_TERM, STRING], STRING])
		do
			constraint_definitions := a_constraint_defs
		end

	set_term_bindings (a_term_bindings: HASH_TABLE [HASH_TABLE [CODE_PHRASE, STRING], STRING])
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
		local
			code: STRING
		do
			-- populate term code list & set codes in ARCHETYPE_TERM objects
			across term_definitions as term_defs_csr loop
				across term_defs_csr.item as term_defs_list_csr loop
					code := term_defs_list_csr.key
					term_defs_list_csr.item.set_code (code)
					if term_defs_csr.cursor_index = 1 then
						term_codes.extend (code)
						if is_valid_code (code) and is_valid_code (concept_code) then
							update_highest_refined_codes (code)
							update_highest_term_code (code)
						end
					end
				end
			end

			-- populate constraint code list & set codes in ARCHETYPE_TERM objects
			across constraint_definitions as constraint_defs_csr loop
				across constraint_defs_csr.item as constraint_defs_list_csr loop
					code := constraint_defs_list_csr.key
					constraint_defs_list_csr.item.set_code (code)
					if constraint_defs_csr.cursor_index = 1 then
						constraint_codes.extend (code)
						if is_valid_code (code) and is_valid_code (concept_code) then
							update_highest_refined_codes (code)
							update_highest_constraint_code_index(code)
						end
					end
				end
			end
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

invariant
	Original_language_valid: not original_language.is_empty
	root_code_valid: is_valid_concept_code (concept_code)
	root_code_in_terms: term_codes.has (concept_code)
	Highest_term_code_index_valid: highest_term_code >= 0
	Highest_constraint_code_index_valid: highest_constraint_code >= 0
	term_codes_compares_objects: term_codes.object_comparison
	constraint_codes_compares_objects: constraint_codes.object_comparison

end


