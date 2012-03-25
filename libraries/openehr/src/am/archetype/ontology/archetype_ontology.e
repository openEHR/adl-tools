note
	component:   "openEHR Archetype Project"
	description: "ADL Terminology class"
	keywords:    "archetype, ontology, terminology"

	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2003-2011 Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

deferred class ARCHETYPE_ONTOLOGY

inherit
	DT_CONVERTIBLE
		redefine
			default_create, finalise_dt
		end

	SHARED_DT_FACTORY
		export
			{NONE} all
		undefine
			default_create
		end

	ARCHETYPE_TERM_CODE_TOOLS
		export
			{NONE} all;
			{ANY} is_valid_concept_code, is_valid_code, specialisation_depth_from_code, deep_twin
		undefine
			default_create
		end

feature -- Definitions

	Sym_terminologies_available: STRING = "terminologies_available"

	Sym_term_definitions: STRING = "term_definitions"

	Sym_constraint_definitions: STRING = "constraint_definitions"

	Sym_term_bindings: STRING = "term_bindings"

	Sym_constraint_bindings: STRING = "constraint_bindings"

feature -- Initialisation

	default_create
			--
		do
			create terminologies_available.make (0)
			terminologies_available.compare_objects

			create term_definitions.make (0)
			create constraint_definitions.make (0)

			create term_codes.make
			term_codes.compare_objects
			create constraint_codes.make
			constraint_codes.compare_objects

			create term_bindings.make (0)
			create constraint_bindings.make (0)
			create highest_specialised_code_indexes.make (0)
		end

	make (an_original_lang, a_concept_code: attached STRING)
			-- make ontology from concept code and original language
		require
			Original_language_valid: not an_original_lang.is_empty
			root_code_valid: is_valid_concept_code (a_concept_code)
		do
			default_create
			concept_code := a_concept_code
			original_language := an_original_lang
		ensure
			concept_code_set: concept_code.is_equal (a_concept_code)
			original_language_set: original_language.is_equal (an_original_lang)
		end

	make_dt (make_args: ARRAY[ANY])
			-- assumed args are <<original_language, concept_code>>
		do
			default_create
			original_language ?= make_args[1]
			concept_code ?= make_args[2]
		end

feature -- Access

	original_language: attached STRING
			-- original language of the ontology, as set at archetype creation or parsing time

	concept_code: attached STRING
			-- term code of the concept of the ontology as a whole

	languages_available: attached ARRAYED_SET [STRING]
		do
			create Result.make(0)
			Result.compare_objects
			from term_definitions.start until term_definitions.off loop
				Result.extend(term_definitions.key_for_iteration)
				term_definitions.forth
			end
		end

	terminologies_available: attached ARRAYED_LIST [STRING]

	term_codes: attached TWO_WAY_SORTED_SET[STRING]
			-- list of term codes

	constraint_codes: attached TWO_WAY_SORTED_SET[STRING]
			-- list of constraint codes

	term_attribute_names: attached ARRAYED_LIST[STRING]
			-- the attribute names found in ARCHETYPE_TERM objects

	term_definitions: attached HASH_TABLE[HASH_TABLE[ARCHETYPE_TERM, STRING], STRING]
			-- table of term definitions, keyed by code, keyed by language

	constraint_definitions: attached HASH_TABLE[HASH_TABLE[ARCHETYPE_TERM, STRING], STRING]
			-- table of constraint definitions, keyed by code, keyed by language

	term_bindings: attached HASH_TABLE[HASH_TABLE[CODE_PHRASE, STRING], STRING]
			-- tables of bindings of external terms to internal codes, keyed by external terminology id

	constraint_bindings: attached HASH_TABLE[HASH_TABLE[URI, STRING], STRING]
			-- table of constraint bindings in the form of strings "service::query", keyed by terminology

	terminology_extracts: HASH_TABLE[HASH_TABLE[ARCHETYPE_TERM, STRING], STRING]
			-- table of {code, description} keyed by terminology_id containing extracted concepts from external terminologies

	specialisation_depth: INTEGER
			-- depth of this ontology with relation to ontologies in other archetypes
		do
			Result := specialisation_depth_from_code (concept_code)
		ensure
			non_negative: Result >= 0
		end

	term_definition (a_language, a_code: attached STRING): attached ARCHETYPE_TERM
			-- retrieve the term definition in language `a_language' for code `a_code'
		require
			Term_definition_exists: has_term_definition (a_language, a_code)
		deferred
		end

	constraint_definition (a_language, a_code: attached STRING): attached ARCHETYPE_TERM
			-- retrieve the constraint definition in language `a_language' for code `a_code'
		require
			Term_definition_exists: has_constraint_definition (a_language, a_code)
		deferred
		end

	term_binding (a_terminology, a_code: attached STRING): attached CODE_PHRASE
			-- retrieve the term definition in language `a_language' for code `a_code'
		require
			Term_code_valid: has_term_binding (a_terminology, a_code)
		deferred
		end

	term_bindings_for_terminology (a_terminology: attached STRING): attached HASH_TABLE [CODE_PHRASE, STRING]
			-- retrieve the term bindings for a particular terminology
		require
			Terminology_valid: term_bindings.has (a_terminology)
		do
			Result := term_bindings.item (a_terminology)
		end

	constraint_binding (a_terminology, a_code: attached STRING): attached URI
			-- retrieve the constraint definition in language `a_language' for code `a_code'
			-- in form of a string: "service::query"
		require
			Term_code_valid: has_constraint_binding (a_terminology, a_code)
		deferred
		end

	constraint_bindings_for_terminology (a_terminology: attached STRING): attached HASH_TABLE [URI, STRING]
			-- retrieve the term bindings for a particular terminology
		require
			Terminology_valid: constraint_bindings.has (a_terminology)
		do
			Result := constraint_bindings.item (a_terminology)
		end

	terminology_extract_term (a_terminology, a_code: attached STRING): ARCHETYPE_TERM
			-- true if there is an extract from terminology `a_terminology'
		require
			Terminology_valid: has_terminology_extract(a_terminology)
			Term_code_valid: has_terminology_extract_code(a_terminology, a_code)
		deferred
		end

	physical_to_logical_path (a_phys_path, a_language: attached STRING; with_codes: BOOLEAN): attached STRING
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

feature -- Status Report

	has_language (a_language: attached STRING): BOOLEAN
			-- check that `a_language' supported
		require
			Language_valid: not a_language.is_empty
		do
			Result := term_definitions.has (a_language)
		end

	has_terminology (a_terminology: attached STRING): BOOLEAN
			-- is `a_terminology' known in this ontology?
		require
			Terminology_valid: not a_terminology.is_empty
		do
			Result := terminologies_available.has (a_terminology)
		end

	has_term_code (a_code: attached STRING): BOOLEAN
			-- is `a_code' known in this ontology?
		require
			Term_code_valid: is_valid_code(a_code)
		deferred
		end

	has_term_definition (a_language, a_code: attached STRING): BOOLEAN
			-- is `a_code' defined in `a_language' in this ontology?
		require
			Term_code_valid: is_valid_code(a_code)
			Language_valid: not a_language.is_empty
		deferred
		end

	has_constraint_code (a_code: attached STRING): BOOLEAN
			--
		require
			Code_valid: is_valid_code(a_code)
		deferred
		end

	has_constraint_definition (a_language, a_code: attached STRING): BOOLEAN
			-- is `a_code' defined in `a_language' in this ontology?
		require
			Constraint_code_valid: is_valid_code(a_code)
			Language_valid: not a_language.is_empty
		deferred
		end

	has_term_bindings (a_terminology: attached STRING): BOOLEAN
			-- true if there are term bindings `a_terminology'
		do
			Result := term_bindings.has (a_terminology)
		end

	has_constraint_bindings (a_terminology: attached STRING): BOOLEAN
			-- true if there are term bindings `a_terminology'
		do
			Result := constraint_bindings.has (a_terminology)
		end

	has_any_term_binding (a_code: attached STRING): BOOLEAN
			-- true if there is any term binding for code `a_code'
		require
			Term_code_valid: is_valid_code (a_code)
		deferred
		end

	has_term_binding (a_terminology, a_code: attached STRING): BOOLEAN
			-- true if there is a term binding for code `a_code' in `a_terminology'
		require
			Term_code_valid: is_valid_code (a_code)
		deferred
		end

	has_any_constraint_binding (a_code: attached STRING): BOOLEAN
			-- true if there is any constraint binding for code `a_code'
		require
			Term_code_valid: is_valid_code (a_code)
		deferred
		end

	has_constraint_binding (a_terminology, a_code: attached STRING): BOOLEAN
			-- true if there is a term binding for code `a_code' in `a_terminology'
		require
			Term_code_valid: is_valid_code (a_code)
		deferred
		end

	has_terminology_extract (a_terminology: attached STRING): BOOLEAN
			-- true if there is an extract from terminology `a_terminology'
		require
			Terminology_valid: not a_terminology.is_empty
		deferred
		end

	has_terminology_extract_code (a_terminology, a_code: attached STRING): BOOLEAN
			-- true if there is a term binding for code `a_code' in `a_terminology'
		require
			Terminology_valid: not has_terminology_extract (a_terminology)
			Term_code_valid: not a_code.is_empty
		deferred
		end

	semantically_conforms_to (other: attached FLAT_ARCHETYPE_ONTOLOGY): BOOLEAN
			-- True if this ontology conforms to `other' by having the same or subset of languages
		do
			Result := languages_available.is_subset (other.languages_available)

--			if Result then
--				from
--					terminologies_available.start
--				until
--					terminologies_available.off or not other.terminologies_available.has(terminologies_available.item)
--				loop
--					terminologies_available.forth
--				end
--				Result := terminologies_available.off
--			end
		end

feature -- Modification

	set_concept_code (a_code: attached STRING)
			-- set the primary language of the ontology
		do
			concept_code := a_code
		ensure
			Concept_code_set: concept_code.is_equal(a_code)
		end

	set_original_language (a_language: attached STRING)
			-- set the primary language of the ontology
		do
			original_language := a_language
		ensure
			Language_set: original_language.is_equal(a_language)
		end

	add_term_definition (a_language: attached STRING; a_term: attached ARCHETYPE_TERM)
			-- add a new term definition for language `a_language' and
			-- automatically add translation placeholders in all other languages
		require
			Language_valid: has_language(a_language)
			Term_valid: not has_term_code(a_term.code) and specialisation_depth_from_code (a_term.code) <= specialisation_depth
		do
			put_term_definition (a_language, a_term)
			term_codes.extend (a_term.code)
			update_highest_specialised_code_index (a_term.code)
			update_highest_term_code_index (a_term.code)
		ensure
			Code_valid: has_term_code(a_term.code)
		end

	replace_term_definition (a_language: attached STRING; a_term: attached ARCHETYPE_TERM; replace_translations: BOOLEAN)
			-- replace the definition of an existing term code; replace all translations
			-- if flag set and `a_language' is the primary language
		require
			Language_valid: has_language(a_language)
			Term_valid: has_term_code(a_term.code)
		do
			if a_language.is_equal(original_language) and replace_translations then
				put_term_definition(a_language, a_term) -- replace all translations as well
			else
				term_definitions.item(a_language).replace(a_term, a_term.code) -- just do this translation
			end
		end

	add_constraint_definition (a_language: attached STRING; a_term: attached ARCHETYPE_TERM)
			-- add a new constraint definition for language `a_language' and
			-- automatically add translation placeholders
		require
			Language_valid: has_language(a_language)
			Term_valid: not has_constraint_code(a_term.code) and specialisation_depth_from_code (a_term.code) <= specialisation_depth
		do
			put_constraint_definition (a_language, a_term)
			constraint_codes.extend (a_term.code)
			update_highest_specialised_code_index (a_term.code)
			update_highest_constraint_code_index (a_term.code)
		ensure
			has_constraint_code(a_term.code)
		end

	replace_constraint_definition (a_language: attached STRING; a_term: attached ARCHETYPE_TERM; replace_translations: BOOLEAN)
			-- replace the definition of an existing constraint code; replace all translations
			-- if flag set and `a_language' is the primary language
		require
			Language_valid: has_language(a_language)
			Term_valid: has_constraint_code(a_term.code)
		do
			if a_language.is_equal(original_language) and replace_translations then
				put_constraint_definition(a_language, a_term) -- replace all translations as well
			else
				constraint_definitions.item(a_language).replace(a_term, a_term.code) -- just do this translation
			end
		end

	add_term_binding (a_code_phrase: attached CODE_PHRASE; a_code: attached STRING)
			-- add a new term binding to local code a_code, in the terminology
			-- group corresponding to the a_code_phrase.terminology
		require
			Local_code_valid: has_term_code(a_code)
			Not_already_added: not has_term_binding(a_code_phrase.terminology_id.name, a_code)
		local
			a_terminology: STRING
		do
			a_terminology := a_code_phrase.terminology_id.name
			if not terminologies_available.has(a_terminology) then
				terminologies_available.extend (a_terminology)
			end

			if not has_term_bindings(a_terminology) then
				term_bindings.put(create {HASH_TABLE[CODE_PHRASE, STRING]}.make(0), a_terminology)
			end

			term_bindings.item(a_terminology).put(a_code_phrase, a_code)
		ensure
			Binding_added: has_term_binding(a_code_phrase.terminology_id.name, a_code)
		end

	add_constraint_binding (a_uri: attached URI; a_terminology, a_code: attached STRING)
			-- add a new constraint binding to local code a_code, in the terminology
			-- group corresponding to the a_code_phrase.terminology
		require
			Local_code_valid: has_constraint_code (a_code)
			Not_already_added: not has_constraint_binding (a_terminology, a_code)
		do
			if not terminologies_available.has (a_terminology) then
				terminologies_available.extend (a_terminology)
			end
			if not has_constraint_bindings (a_terminology) then
				constraint_bindings.put (create {HASH_TABLE[URI, STRING]}.make(0), a_terminology)
			end
			constraint_bindings.item (a_terminology).put (a_uri, a_code)
		ensure
			Binding_added: has_constraint_binding (a_terminology, a_code)
		end

	remove_term_definition (a_code: attached STRING)
			-- completely remove the term from the ontology
		require
			Term_valid: has_term_code(a_code)
		local
			ta: ARRAYED_LIST[STRING]
			langs_to_remove: ARRAYED_LIST[STRING]
		do
			create langs_to_remove.make(0)

			from term_definitions.start until term_definitions.off loop
				term_definitions.item_for_iteration.remove(a_code)
				if term_definitions.item_for_iteration.count = 0 then
					langs_to_remove.extend (term_definitions.key_for_iteration)
				end
				term_definitions.forth
			end

			from langs_to_remove.start until langs_to_remove.off loop
				term_definitions.remove(langs_to_remove.item)
				langs_to_remove.forth
			end

			-- make a copy of terminologies list, since the next action might modify it...
			ta := terminologies_available.deep_twin
			if has_any_term_binding(a_code) then
				from ta.start until ta.off loop
					if term_bindings.has(ta.item) and then
						term_bindings.item(ta.item).has(a_code) then
						remove_term_binding(a_code, ta.item)
					end
					ta.forth
				end
			end
			term_codes.prune (a_code)
		ensure
			not has_term_code(a_code)
		end

	remove_constraint_definition (a_code: attached STRING)
			-- completely remove the constraint from the ontology
		require
			Constraint_valid: has_constraint_code(a_code)
		local
			ta: ARRAYED_LIST[STRING]
			langs_to_remove: ARRAYED_LIST[STRING]
		do
			create langs_to_remove.make(0)

			from constraint_definitions.start until constraint_definitions.off loop
				constraint_definitions.item_for_iteration.remove(a_code)
				if constraint_definitions.item_for_iteration.count = 0 then
					langs_to_remove.extend (constraint_definitions.key_for_iteration)
				end
				constraint_definitions.forth
			end

			from langs_to_remove.start until langs_to_remove.off loop
				constraint_definitions.remove(langs_to_remove.item)
				langs_to_remove.forth
			end

			-- make a copy of terminologies list, since the next action might modify it...
			ta := terminologies_available.deep_twin
			if has_any_constraint_binding(a_code) then
				from ta.start until ta.off loop
					if constraint_bindings.has(ta.item) and then
						constraint_bindings.item(ta.item).has(a_code) then
						remove_constraint_binding(a_code, ta.item)
					end
					ta.forth
				end
			end

			constraint_codes.prune (a_code)
		ensure
			not has_constraint_code(a_code)
		end

	remove_term_binding (a_code, a_terminology: attached STRING)
			-- remove term binding to local code in group a_terminology
		require
			Local_code_valid: has_term_code(a_code)
			Terminology_valid: terminologies_available.has(a_terminology)
			Has_binding: has_term_binding(a_terminology, a_code)
		do
			term_bindings.item (a_terminology).remove (a_code)
			if term_bindings.item (a_terminology).count = 0 then
				term_bindings.remove (a_terminology)
				if not constraint_bindings.has (a_terminology) then
					terminologies_available.prune_all (a_terminology)
				end
			end
		ensure
			Binding_removed: not has_term_binding(a_terminology, a_code)
		end

	remove_constraint_binding (a_code, a_terminology: attached STRING)
			-- remove constraint binding to local code in group a_terminology
		require
			Local_code_valid: has_constraint_code (a_code)
			Terminology_valid: terminologies_available.has (a_terminology)
			Has_binding: has_constraint_binding (a_terminology, a_code)
		do
			constraint_bindings.item (a_terminology).remove (a_code)
			if constraint_bindings.item (a_terminology).count = 0 then
				constraint_bindings.remove (a_terminology)
				if not term_bindings.has (a_terminology) then
					terminologies_available.prune_all (a_terminology)
				end
			end
		ensure
			Binding_removed: not has_constraint_binding (a_terminology, a_code)
		end

	set_terminologies_available (a_terminologies_avialable: attached ARRAYED_LIST [STRING])
		do
			terminologies_available := a_terminologies_avialable
		end

	set_term_definitions (a_term_defs: attached HASH_TABLE [HASH_TABLE [ARCHETYPE_TERM, STRING], STRING])
		do
			term_definitions := a_term_defs
		end

	set_constraint_definitions (a_constraint_defs: attached HASH_TABLE [HASH_TABLE [ARCHETYPE_TERM, STRING], STRING])
		do
			constraint_definitions := a_constraint_defs
		end

	set_term_bindings (a_term_bindings: attached HASH_TABLE [HASH_TABLE [CODE_PHRASE, STRING], STRING])
		do
			term_bindings := a_term_bindings
		end

	set_constraint_bindings (a_constraint_bindings: attached HASH_TABLE [HASH_TABLE [URI, STRING], STRING])
		do
			constraint_bindings := a_constraint_bindings
		end

	set_terminology_extracts (a_term_extracts: attached HASH_TABLE [HASH_TABLE [ARCHETYPE_TERM, STRING], STRING])
		do
			terminology_extracts := a_term_extracts
		end

feature -- Conversion

	substitute_codes (str, lang: attached STRING): attached STRING
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
					Result.replace_substring_all(code, term_definition(lang, code).text)
				end
				start_pos := str.substring_index("[" + Term_code_leader, end_pos)
			end
		end

feature {ARCHETYPE_ONTOLOGY, P_ARCHETYPE_ONTOLOGY} -- Implementation

	has_path (a_path: attached STRING): BOOLEAN
			-- True if path `a_path' exists in structure
		require
			a_path_valid: not a_path.is_empty
		do
			Result := dt_representation.has_path(a_path)
		end

	highest_specialised_code_indexes: attached HASH_TABLE [INTEGER, STRING]
			-- Table of child code tails keyed by immediate parent code.

	highest_term_code_index: INTEGER
			-- index of highest non-specialised code at the level of this ontology; 0 if none so far

	highest_constraint_code_index: INTEGER
			-- index of the highest constraint code in the ontology

	highest_code_specialisation_level: INTEGER
			-- level of most specialised code in this ontology; used for detecting codes from a lower level than the archetype itself

	put_term_definition (a_language: attached STRING; a_term: attached ARCHETYPE_TERM)
			-- put a new term definition for language `a_language' and
			-- automatically add translation placeholders in all other languages
		local
			trans_term: ARCHETYPE_TERM
		do
			term_definitions.item (a_language).force (a_term, a_term.code)
			trans_term := a_term.create_translated_term (original_language)
			from term_definitions.start until term_definitions.off loop
				if not term_definitions.key_for_iteration.is_equal (a_language) then
					term_definitions.item_for_iteration.force (trans_term.deep_twin, trans_term.code)
				end
				term_definitions.forth
			end
		ensure
			term_definitions.item (a_language).has (a_term.code)
		end

	put_constraint_definition (a_language: attached STRING; a_term: attached ARCHETYPE_TERM)
			-- add a new constraint definition for language `a_language' and
			-- automatically add translation placeholders
		local
			trans_term: ARCHETYPE_TERM
		do
			if not constraint_definitions.has(a_language) then
				constraint_definitions.put(create {HASH_TABLE[ARCHETYPE_TERM, STRING]}.make(0), a_language)
			end
			constraint_definitions.item(a_language).force(a_term, a_term.code)
			trans_term := a_term.create_translated_term(a_language)

			-- in the following, iterate over term_definitions to get definitive list of languages
			from term_definitions.start until term_definitions.off loop
				if not term_definitions.key_for_iteration.is_equal(a_language) then
					if not constraint_definitions.has(term_definitions.key_for_iteration) then
						constraint_definitions.put(create {HASH_TABLE[ARCHETYPE_TERM, STRING]}.make(0), term_definitions.key_for_iteration)
					end
					constraint_definitions.item(term_definitions.key_for_iteration).force(trans_term, a_term.code)
				end
				term_definitions.forth
			end
		ensure
			constraint_definitions.item(a_language).has(a_term.code)
		end

	update_highest_specialised_code_index (a_code: attached STRING)
			-- Update `highest_specialised_code_indexes' list with `a_code', if it happens to be specialised.
		require
			Code_valid: is_valid_code (a_code)
		local
			parent_code: STRING
			idx: INTEGER
		do
			if is_refined_code (a_code) then
				parent_code := specialisation_parent_from_code (a_code)
				idx := specialised_code_tail (a_code).to_integer
				if idx > highest_specialised_code_indexes [parent_code] then
					highest_specialised_code_indexes [parent_code] := idx
				end
			end
		end

	update_highest_term_code_index (a_code: attached STRING)
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
					if idx > highest_term_code_index then
						highest_term_code_index := idx
					end
				end
			end
		end

	update_highest_constraint_code_index (a_code: attached STRING)
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
					if idx > highest_constraint_code_index then
						highest_constraint_code_index := idx
					end
				end
			end
		end

	valid_term_code (a_code: attached STRING): BOOLEAN
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

	valid_constraint_code (a_code: attached STRING): BOOLEAN
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

feature -- Finalisation

	finalise_dt
			-- finalisation routine to guarantee validity on creation
		local
			code: STRING
			done: BOOLEAN
		do
			-- populate term code list & set codes in ARCHETYPE_TERM objects
			from term_definitions.start until term_definitions.off loop
				from term_definitions.item_for_iteration.start until term_definitions.item_for_iteration.off loop
					code := term_definitions.item_for_iteration.key_for_iteration
					term_definitions.item_for_iteration.item_for_iteration.set_code (code)
					if not done then
						term_codes.extend (code)
						update_highest_specialised_code_index (code)
						update_highest_term_code_index (code)
					end
					term_definitions.item_for_iteration.forth
				end
				term_definitions.forth
				done := True
			end

			-- populate constraint code list & set codes in ARCHETYPE_TERM objects
			done := False
			from constraint_definitions.start until constraint_definitions.off loop
				from constraint_definitions.item_for_iteration.start until constraint_definitions.item_for_iteration.off loop
					code := constraint_definitions.item_for_iteration.key_for_iteration
					constraint_definitions.item_for_iteration.item_for_iteration.set_code (code)
					if not done then
						constraint_codes.extend (code)
						update_highest_specialised_code_index (code)
						update_highest_constraint_code_index(code)
					end
					constraint_definitions.item_for_iteration.forth
				end
				constraint_definitions.forth
				done := True
			end

			-- populate term attribute names (assumed to be the same for terms and constraints)
			term_attribute_names := (create {ARCHETYPE_TERM}.default_create).Keys
			terminologies_available.compare_objects
		end

feature {DT_OBJECT_CONVERTER} -- Conversion

	persistent_attributes: ARRAYED_LIST [STRING]
			-- list of attribute names to persist as DT structure
			-- empty structure means all attributes
		once
			create Result.make(0)
			Result.compare_objects
			Result.extend ("terminologies_available")
			Result.extend ("term_definitions")
			Result.extend ("constraint_definitions")
			Result.extend ("term_bindings")
			Result.extend ("constraint_bindings")
		end

invariant
	Original_language_valid: not original_language.is_empty
	root_code_valid: is_valid_concept_code (concept_code)
	root_code_in_terms: term_codes.has (concept_code)
	Highest_term_code_index_valid: highest_term_code_index >= 0
	Highest_constraint_code_index_valid: highest_constraint_code_index >= 0
	Highest_code_specialisation_level_valid: highest_code_specialisation_level >= 0
	terminologies_available_compares_objects: attached terminologies_available implies terminologies_available.object_comparison
	term_codes_compares_objects: term_codes.object_comparison
	constraint_codes_compares_objects: constraint_codes.object_comparison

end


--|
--| ***** BEGIN LICENSE BLOCK *****
--| Version: MPL 1.1/GPL 2.0/LGPL 2.1
--|
--| The contents of this file are subject to the Mozilla Public License Version
--| 1.1 (the 'License'); you may not use this file except in compliance with
--| the License. You may obtain a copy of the License at
--| http://www.mozilla.org/MPL/
--|
--| Software distributed under the License is distributed on an 'AS IS' basis,
--| WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License
--| for the specific language governing rights and limitations under the
--| License.
--|
--| The Original Code is adl_ontology.e.
--|
--| The Initial Developer of the Original Code is Thomas Beale.
--| Portions created by the Initial Developer are Copyright (C) 2003-2004
--| the Initial Developer. All Rights Reserved.
--|
--| Contributor(s):
--|
--| Alternatively, the contents of this file may be used under the terms of
--| either the GNU General Public License Version 2 or later (the 'GPL'), or
--| the GNU Lesser General Public License Version 2.1 or later (the 'LGPL'),
--| in which case the provisions of the GPL or the LGPL are applicable instead
--| of those above. If you wish to allow use of your version of this file only
--| under the terms of either the GPL or the LGPL, and not to allow others to
--| use your version of this file under the terms of the MPL, indicate your
--| decision by deleting the provisions above and replace them with the notice
--| and other provisions required by the GPL or the LGPL. If you do not delete
--| the provisions above, a recipient may use your version of this file under
--| the terms of any one of the MPL, the GPL or the LGPL.
--|
--| ***** END LICENSE BLOCK *****
--|
