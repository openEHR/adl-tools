note
	component:   "openEHR ADL Tools"
	description: "ADL Terminology class"
	keywords:    "archetype, ontology, terminology"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2003- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class ARCHETYPE_TERMINOLOGY

inherit
	DT_CONVERTIBLE
		redefine
			finalise_dt
		end

	ADL_2_TERM_CODE_TOOLS
		export
			{NONE} all;
			{ANY} is_valid_root_id_code, is_valid_id_code, is_valid_value_code, is_valid_value_set_code,
				is_valid_code, specialisation_depth_from_code
		end

	ADL_14_TERM_CODE_TOOLS
		export
			{NONE} all
		end

	SHARED_ADL_APP_RESOURCES
		export
			{NONE} all
		end

	ARCHETYPE_DEFINITIONS
		export
			{NONE} all
		end

create
	make_differential, make_differential_empty, make_dt

feature -- Initialisation

	make_differential (an_original_lang, a_concept_code: STRING)
			-- make terminology from concept code and original language
		require
			Original_language_valid: not an_original_lang.is_empty
			root_code_valid: is_valid_root_id_code (a_concept_code)
		do
			if is_valid_root_id_code (a_concept_code) then
				concept_code := a_concept_code
			else
				concept_code := Root_id_code_top_level
			end
			original_language := an_original_lang
			is_differential := True
		ensure
			concept_code_set: concept_code.is_equal (a_concept_code)
			original_language_set: original_language.is_equal (an_original_lang)
			Is_differential: is_differential
		end

	make_differential_empty (an_original_lang: STRING; at_specialisation_depth: INTEGER)
			-- make an empty terminology at specified specialisation depth
		require
			Original_language_valid: not an_original_lang.is_empty
			Valid_specialisation_depth: at_specialisation_depth >= 0
		do
			make_differential (an_original_lang, new_root_id_code_at_level (at_specialisation_depth))
			add_language (an_original_lang)
			initialise_term_definitions (create {ARCHETYPE_TERM}.make (concept_code))
		ensure
			Primary_language_set: original_language = an_original_lang
			Specialisation_level_set: specialisation_depth = at_specialisation_depth
			Concept_code_set: is_valid_root_id_code (concept_code) and specialisation_depth_from_code (concept_code) = at_specialisation_depth
			Concept_code_in_terms: has_id_code (concept_code)
			Concept_items_not_empty: not term_definition (original_language, concept_code).text.is_empty
			Is_differential: is_differential
		end

	make_dt (make_args: detachable ARRAY [ANY])
			-- assumed args are <<original_language, concept_code>>
		do
			if attached {STRING} make_args[1] as str then
				original_language := str
			end
			if attached {STRING} make_args[2] as a_concept_code and then is_valid_root_id_code (a_concept_code) then
				concept_code := a_concept_code
			else
				concept_code := Root_id_code_top_level
			end
		end

feature -- Access (Stored)

	original_language:  STRING
			-- original language of the terminology, as set at archetype creation or parsing time; must
			-- be a code in the ISO 639-1 2 character language code-set.
        attribute
            create Result.make (0)
        end

	concept_code: STRING
			-- term code of the concept of the terminology as a whole
        attribute
            create Result.make (0)
        end

	term_definitions: HASH_TABLE [HASH_TABLE [ARCHETYPE_TERM, STRING], STRING]
			-- table of term definitions, keyed by code, keyed by language
        attribute
            create Result.make (0)
        end

	term_bindings: HASH_TABLE [HASH_TABLE [URI, STRING], STRING]
			-- tables of bindings of external terms to internal codes and/or paths, keyed by external terminology id
        attribute
            create Result.make (0)
        end

    value_sets: HASH_TABLE [VALUE_SET, STRING]
    		-- table of value sets - keyed by ac-code
        attribute
            create Result.make (0)
        end

	terminology_extracts: detachable HASH_TABLE [HASH_TABLE [ARCHETYPE_TERM, STRING], STRING]
			-- table of {code, description} keyed by terminology_id containing extracted concepts from external terminologies

feature -- Access (computed)

	languages_available: ARRAYED_SET [STRING]
		do
			create Result.make(0)
			Result.compare_objects
			across term_definitions as langs_csr loop
				Result.extend (langs_csr.key)
			end
		end

	terminologies_available: ARRAYED_SET [STRING]
			-- set of all terminology names that appear in `term_bindings' or `constraint_bindings'
		local
			terminologies: ARRAY [STRING]
		do
			create Result.make (0)
			Result.compare_objects
			terminologies := term_bindings.current_keys
			terminologies.compare_objects
			Result.merge (terminologies)
		end

	term_codes: TWO_WAY_SORTED_SET [STRING]
			-- list of all term codes
        do
            create Result.make
            Result.compare_objects
            across index_term_definitions as defs loop
           		Result.extend (defs.key)
            end
        end

	id_codes: TWO_WAY_SORTED_SET [STRING]
			-- list of id codes
        do
            create Result.make
            Result.compare_objects
            across index_term_definitions as defs loop
            	if is_id_code (defs.key) then
            		Result.extend (defs.key)
            	end
            end
        end

	value_codes: TWO_WAY_SORTED_SET [STRING]
			-- list of value codes
        do
            create Result.make
            Result.compare_objects
            across index_term_definitions as defs loop
            	if is_value_code (defs.key) then
            		Result.extend (defs.key)
            	end
            end
        end

	value_set_codes: TWO_WAY_SORTED_SET [STRING]
			-- list of constraint codes
        do
            create Result.make
            Result.compare_objects
            across index_term_definitions as defs loop
            	if is_value_set_code (defs.key) then
            		Result.extend (defs.key)
            	end
            end
        end

	specialisation_depth: INTEGER
			-- depth of this terminology with relation to terminologies in other archetypes
		do
			Result := specialisation_depth_from_code (concept_code)
		ensure
			non_negative: Result >= 0
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

	term_definitions_for_code (a_code: STRING): HASH_TABLE [ARCHETYPE_TERM, STRING]
			-- extract the term definitions for code `a_code' in all languages as a Hash keyed by language
		require
			Term_definition_exists: has_code (a_code)
		do
			create Result.make (0)
			across term_definitions as term_defs_for_lang_csr loop
				check attached term_defs_for_lang_csr.item.item (a_code) as att_term then
					Result.put (att_term, term_defs_for_lang_csr.key)
				end
			end
		ensure
			across languages_available as langs_csr all Result.has (langs_csr.item) end
		end

	term_binding (a_terminology, a_key: STRING): URI
			-- retrieve the term binding from terminology `a_terminology' for code `a_key'
		require
			Term_code_valid: has_term_binding (a_terminology, a_key)
		do
			check attached term_bindings.item (a_terminology) as tbs and then attached tbs.item (a_key) as tb then
				Result := tb
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

	term_bindings_for_terminology (a_terminology: STRING): HASH_TABLE [URI, STRING]
			-- retrieve the term bindings for a particular terminology
		require
			Terminology_valid: term_bindings.has (a_terminology)
		do
			check attached term_bindings.item (a_terminology) as tbs then
				Result := tbs
			end
		end

	term_bindings_for_key (a_key: STRING): HASH_TABLE [URI, STRING]
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

	term_binding_key_for_external_code (a_terminology, a_code: STRING): STRING
			-- return the at-code to which is bound the code `a_code' in external terminology `a_terminology'
		require
			has_term_binding_for_external_code (a_terminology, a_code)
		do
			check attached term_binding_map.item (a_terminology.as_lower) as att_map and then attached att_map.item (a_code) as att_code then
				Result := att_code
			end
		end

	definition_for_code (a_lang, a_code: STRING): detachable ARCHETYPE_TERM
			-- extract the term or constraint definition for `a_code'; Void if no
			-- code for `a_lang' and 'a_code'
		do
			if has_language (a_lang) and then attached term_definitions.item (a_lang) as tl then
				Result := tl.item (a_code)
			end
		end

	last_new_definition_code: STRING
		attribute
			create Result.make_empty
		end

	deepest_definition_for_path (a_path, a_lang: STRING): detachable ARCHETYPE_TERM
			-- for a path containing id-codes, obtain the deepest term_definition
			-- for an id-code in the path. If none (i.e. no id-code in the path has
			-- a definition), return Void
		local
			og_path: OG_PATH
			id_codes_lst: like id_codes
		do
			id_codes_lst := id_codes
			create og_path.make_from_string (a_path)
			from og_path.finish until og_path.off or attached Result loop
				if id_codes_lst.has (og_path.item.object_id) then
					Result := term_definition (a_lang, og_path.item.object_id)
				end
				og_path.back
			end
		end

feature -- Status Report

	is_differential: BOOLEAN
			-- True if this terminology contains differential additions to a flat terminology

	is_flat: BOOLEAN
			-- True if this terminology contains all definitions for the lineage of its archetype
		do
			Result := not is_differential
		end

	is_specialised: BOOLEAN
		do
			Result := specialisation_depth > 0
		end

	has_language (a_language: STRING): BOOLEAN
			-- check that `a_language' supported
		require
			Language_valid: not a_language.is_empty
		do
			Result := term_definitions.has (a_language)
		end

	has_terminology (a_terminology: STRING): BOOLEAN
			-- is `a_terminology' known in this terminology?
		do
			Result := term_bindings.has (a_terminology)
		end

	has_code (a_code: STRING): BOOLEAN
			-- is `a_code' known in this terminology
		do
			if not term_definitions.is_empty then
				check attached term_definitions.item (original_language) as term_defs_for_orig_lang then
					Result := term_defs_for_orig_lang.has (a_code)
				end
			end
		end

	has_id_code (a_code: STRING): BOOLEAN
			-- is `a_code' known in the terms list of this terminology
		do
			Result := is_id_code (a_code) and has_code (a_code)
		end

	has_value_set_code (a_code: STRING): BOOLEAN
			-- is `a_code' known in the terms list of this terminology
		do
			Result := is_value_set_code (a_code) and has_code (a_code)
		end

	has_value_code (a_code: STRING): BOOLEAN
			-- is `a_code' known in the terms list of this terminology
		do
			Result := is_value_code (a_code) and has_code (a_code)
		end

	has_term_definition (a_language, a_code: STRING): BOOLEAN
			-- is `a_code' defined in `a_language' in the relevant code table of this terminology?
		require
			Language_valid: not a_language.is_empty
		do
			if term_definitions.has (a_language) and then attached term_definitions.item (a_language) as term_def_for_lang then
				Result := term_def_for_lang.has (a_code)
			end
		end

	has_any_term_binding (a_key: STRING): BOOLEAN
			-- true if there is any term binding for internal code or path `a_key' for any terminology
		do
			Result := across term_bindings as bindings_csr some bindings_csr.item.has (a_key) end
		end

	has_term_binding (a_terminology, a_key: STRING): BOOLEAN
			-- true if there is a term binding for internal code or archetype path `a_key' in `a_terminology'
		do
			Result := term_bindings.has (a_terminology) and then term_bindings.item (a_terminology).has (a_key)
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

	has_value_set (a_code: STRING): BOOLEAN
			-- true if there is a value set defined with id ac-code `a_code'
		do
			Result := value_sets.has (a_code)
		end

	has_term_binding_for_external_code (a_terminology, a_code: STRING): BOOLEAN
			-- True if there the at-code to which is bound the code `a_code' in external terminology `a_terminology'
		do
			Result := term_binding_map.has (a_terminology.as_lower) and then attached term_binding_map.item (a_terminology.as_lower) as att_map and then att_map.has (a_code)
		end

	has_value_set_value_code (a_value_code: STRING): BOOLEAN
			-- True if the at-code `a_value_code' is found in any value set
		require
			Valid_code: is_valid_value_code (a_value_code)
		do
			Result := across value_sets as vsets_csr some vsets_csr.item.has_member_code (a_value_code) end
		end

feature -- Status Setting

	set_flat
			-- set this archetype to flat status
		do
			is_differential := False
		end

feature {ADL_2_ENGINE, ARCHETYPE_TERMINOLOGY}-- Status Setting

	set_differential
			-- set this archetype to differential status
		do
			is_differential := True
		end

feature -- Comparison

	semantically_conforms_to (other: ARCHETYPE_TERMINOLOGY): BOOLEAN
			-- True if this terminology conforms to `other' by having the same or subset of languages
		require
			Conformance: is_flat and other.is_differential
		do
			Result := languages_available.is_subset (other.languages_available)
		end

feature -- Facility

	substitute_id_codes (str, lang: STRING): STRING
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
				start_pos := str.substring_index ("[" + Id_code_leader, 1)
			until
				start_pos <= 0
			loop
				end_pos := str.index_of (']', start_pos)
				code := str.substring (start_pos+1, end_pos-1)
				if has_code (code) then
					Result.replace_substring_all (code, term_definition (lang, code).text)
				end
				start_pos := str.substring_index ("[" + Id_code_leader, end_pos)
			end
		end

feature -- Modification

	add_language (a_language: STRING)
			-- add a new language to list of languages available
			-- No action if language already exists
		require
			Valid_archetype: is_differential
			Language_valid: not a_language.is_empty
		local
			term_defs_one_lang: detachable HASH_TABLE [ARCHETYPE_TERM, STRING]
		do
			if not term_definitions.has (a_language) then
				create term_defs_one_lang.make (0)
				term_definitions.put (term_defs_one_lang, a_language)

				-- if not the primary language, add set of translation place-holder terms in this language
				if attached original_language and then not a_language.is_equal (original_language) then
					if attached term_definitions.item (original_language) as defs_for_lang then
						across defs_for_lang as defs_csr loop
							term_defs_one_lang.put (defs_csr.item.create_translated_term (original_language), defs_csr.item.code)
						end
					end
				end
			end
		ensure
			Language_added: has_language (a_language)
		end

	initialise_term_definitions (a_term: ARCHETYPE_TERM)
			-- set concept of terminology from a term
		require
			Valid_archetype: is_differential
			Valid_concept_term: is_valid_root_id_code (a_term.code)
		do
			term_definitions.put (create {HASH_TABLE [ARCHETYPE_TERM, STRING]}.make (0), original_language)
			term_definitions.item (original_language).put (a_term, a_term.code)
		ensure
			Term_definitions_populated: term_definitions.item (original_language).item (concept_code) = a_term
		end

	create_added_id_definition (a_text, a_description: STRING)
			-- add a new term definition with 'text' = `a_text', 'description = `a_description',
			-- assumed to be in the original language;
			-- automatically add translation placeholders in all other languages
			-- return the new code in `last_added_term_definition'
		local
			new_term: ARCHETYPE_TERM
		do
			create new_term.make_all (new_id_code_agt.item([]), a_text, a_description)
			put_new_definition (new_term)
			last_new_definition_code := new_term.code
		end

	create_added_value_definition (a_text, a_description: STRING)
			-- add a new term definition with 'text' = `a_text', 'description = `a_description',
			-- assumed to be in the original language;
			-- automatically add translation placeholders in all other languages
			-- return the new code in `last_added_term_definition'
		local
			new_term: ARCHETYPE_TERM
		do
			create new_term.make_all (new_added_value_code_at_level (specialisation_depth, highest_value_code), a_text, a_description)
			put_new_definition (new_term)
			last_new_definition_code := new_term.code
		end

	create_added_constraint_definition (a_text, a_description: STRING)
			-- add a new constraint definition with 'text' = `a_text', 'description = `a_description';
			-- language is assumed to be `original_language'.
			-- automatically add translation placeholders in all other languages
			-- return the new code in `last_added_constraint_definition'
		local
			new_term: ARCHETYPE_TERM
		do
			create new_term.make_all (new_added_value_set_code_at_level (specialisation_depth, highest_value_set_code), a_text, a_description)
			put_new_definition (new_term)
			last_new_definition_code := new_term.code
		end

	create_refined_definition (a_parent_code, a_text, a_description: STRING)
			-- add a new constraint definition as child of `a_parent_code'
			-- with 'text' = `a_text', 'description = `a_description';
			-- language is assumed to be `original_language'.
			-- automatically add translation placeholders in all other languages
			-- return the new code in `last_added_definition'
		require
			Term_valid: specialisation_depth_from_code (a_parent_code) < specialisation_depth
		local
			new_term: ARCHETYPE_TERM
			high_code: INTEGER
		do
			if highest_refined_code_index.has (a_parent_code) then
				high_code := highest_refined_code_index [a_parent_code]
			end
			create new_term.make_all (new_refined_code_at_level (a_parent_code, specialisation_depth, high_code), a_text, a_description)
			put_new_definition (new_term)
			last_new_definition_code := new_term.code
		end

	put_term_binding (a_binding: URI; a_terminology_id, a_code: STRING)
			-- add a new term binding to local code a_code, in the terminology
			-- group corresponding to the a_term_code.terminology
		require
			Local_code_valid: has_code (a_code)
			Not_already_added: not has_term_binding (a_terminology_id, a_code)
		do
			if not has_term_bindings (a_terminology_id) then
				term_bindings.put (create {HASH_TABLE [URI, STRING]}.make(0), a_terminology_id)
			end
			if attached term_bindings.item (a_terminology_id) as bindings then
				bindings.put (a_binding, a_code)
			end
			term_binding_map_cache := Void
		ensure
			Binding_added: has_term_binding (a_terminology_id, a_code)
		end

	replace_term_definition_item (a_language: STRING; a_code, a_key, a_value: STRING)
			-- replace a field denoted by `a_key' of the term with code `a_code'
		require
			Language_valid: has_language (a_language)
			Term_valid: has_code (a_code)
		do
			if attached term_definitions.item (a_language) as defs_for_lang and then
				attached defs_for_lang.item (a_code) as term and then term.has_key (a_key)
			then
				term.set_value (a_value, a_key)
			end
		end

	replace_term_binding (a_binding: URI; a_terminology_id, a_code: STRING)
			-- replaces existing a term binding to local code a_code, in group a_terminology
		require
			Local_code_valid: has_code (a_code)
			Already_added: has_term_binding (a_terminology_id, a_code)
		do
			term_bindings.item (a_terminology_id).replace (a_binding, a_code)
			term_binding_map_cache := Void
		ensure
			Binding_added: has_term_binding (a_terminology_id, a_code)
		end

	replicate_term_definition (an_old_code, a_new_code: STRING)
			-- make a copy of the term with code `an_old_code' in all languages, and add as a new term with code `a_new_code'
		require
			Old_code_valid: has_code (an_old_code)
			New_code_valid: not has_code (a_new_code)
		local
			new_term: ARCHETYPE_TERM
		do
			across term_definitions as term_defs_for_lang_csr loop
				check attached term_defs_for_lang_csr.item.item (an_old_code) as att_term then
					new_term := att_term.deep_twin
				end
				new_term.set_code (a_new_code)
				term_defs_for_lang_csr.item.put (new_term, a_new_code)
			end
			update_highest_codes (a_new_code)
			clear_cache
		ensure
			has_code (a_new_code)
		end

	put_value_set (a_value_set: VALUE_SET)
			-- add `a_value_set' to value sets of this terminology
		require
			Not_already_prsent: not has_value_set (a_value_set.id)
			Valid_id: has_value_set_code (a_value_set.id)
		do
			value_sets.put (a_value_set, a_value_set.id)
		end

feature {DIFFERENTIAL_ARCHETYPE, AOM_151_CONVERTER, ARCHETYPE_COMPARATOR} -- Modification

	remove_definition (a_code: STRING)
			-- completely remove the term from the terminology
		require
			Code_found: has_code (a_code)
		local
			terminologies: ARRAYED_LIST[STRING]
			langs_to_remove: ARRAYED_LIST[STRING]
		do
			create langs_to_remove.make(0)
			across term_definitions as defs_csr loop
				defs_csr.item.remove (a_code)
				if defs_csr.item.count = 0 then
					langs_to_remove.extend (defs_csr.key)
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
			clear_cache
		ensure
			not has_code (a_code)
		end

	remove_term_binding (a_code, a_terminology: STRING)
			-- remove term binding to local code in group a_terminology
		require
			Has_binding: has_term_binding (a_terminology, a_code)
		do
			term_bindings.item (a_terminology).remove (a_code)
			if term_bindings.item (a_terminology).count = 0 then
				term_bindings.remove (a_terminology)
			end
			term_binding_map_cache := Void
		ensure
			Binding_removed: not has_term_binding (a_terminology, a_code)
		end

	remove_term_bindings (a_code: STRING)
			-- remove term binding to local code in all terminologies
		local
			terminologies_to_remove: ARRAYED_LIST [STRING]
		do
			create terminologies_to_remove.make (0)
			across term_bindings as bindings_csr loop
				if bindings_csr.item.has (a_code) then
					bindings_csr.item.remove (a_code)
					if bindings_csr.item.is_empty then
						terminologies_to_remove.extend (bindings_csr.key)
					end
				end
			end

			-- make any removals of entire treminologies needed
			across terminologies_to_remove as terminologies_csr loop
				term_bindings.remove (terminologies_csr.item)
			end

			term_binding_map_cache := Void
		end

feature {DIFFERENTIAL_ARCHETYPE_TERMINOLOGY, AOM_151_CONVERTER} -- Modification

	put_new_definition (a_term: ARCHETYPE_TERM)
			-- add a new term definition for `original_language' and
			-- automatically add translation placeholders in all other languages
		require
			Term_valid: not has_code (a_term.code) and specialisation_depth_from_code (a_term.code) <= specialisation_depth
			Definition_is_new: not has_term_definition (original_language, a_term.code)
		local
			trans_term: ARCHETYPE_TERM
		do
			term_definitions.item (original_language).force (a_term, a_term.code)

			-- make copies in other languages
			trans_term := a_term.create_translated_term (original_language)
			across term_definitions as term_defs_csr loop
				if not term_defs_csr.key.is_equal (original_language) then
					if not term_definitions.has (term_defs_csr.key) then
						term_definitions.put (create {HASH_TABLE[ARCHETYPE_TERM, STRING]}.make(0), term_defs_csr.key)
					end
					term_defs_csr.item.force (trans_term.deep_twin, trans_term.code)
				end
			end

			update_highest_codes (a_term.code)
			clear_cache
		ensure
			Code_valid: has_code (a_term.code)
			Definition_added: has_term_definition (original_language, a_term.code)
		end

	replace_definition (a_language: STRING; a_term: ARCHETYPE_TERM; replace_translations: BOOLEAN)
			-- replace the definition of an existing term code; replace all translations
			-- if flag set and `a_language' is the primary language
		require
			Language_valid: has_language (a_language)
			Term_valid: has_code (a_term.code)
		do
			if a_language.is_equal (original_language) and replace_translations then
				put_new_definition (a_term) -- replace all translations as well
			else
				term_definitions.item (a_language).replace (a_term, a_term.code) -- just do this translation
			end
			clear_cache
		end

	put_definition_and_translations (a_terms: HASH_TABLE [ARCHETYPE_TERM, STRING]; a_code: STRING)
			-- add or replace the terms in `a_terms' in the languages which are the keys of `a_terms'
		require
			Code_new: not has_code (a_code)
			Code_depth_valid: specialisation_depth_from_code (a_code) <= specialisation_depth
			Term_codes_identical: across a_terms as a_terms_csr all a_terms_csr.item.code.is_equal (a_code) end
			Languages_identical: across languages_available as langs_csr all a_terms.has (langs_csr.item) end
		do
			across a_terms as a_terms_csr loop
				if not term_definitions.has (a_terms_csr.key) then
					term_definitions.put (create {HASH_TABLE[ARCHETYPE_TERM, STRING]}.make(0), a_terms_csr.key)
				end
				term_definitions.item (a_terms_csr.key).force (a_terms_csr.item, a_code)
			end
			update_highest_codes (a_code)
			clear_cache
		ensure
			Code_valid: has_code (a_code)
		end

	merge_new_constraint_definition_and_translations (a_terms: HASH_TABLE [ARCHETYPE_TERM, STRING])
			-- add the terms in `a_terms' in the languages which are the keys of `a_terms', under a new
			-- constraint code at this level
		do
			last_new_definition_code := new_added_value_set_code_at_level (specialisation_depth, highest_value_set_code)
			across a_terms as terms_csr loop
				terms_csr.item.set_code (last_new_definition_code)
			end
			put_definition_and_translations (a_terms, last_new_definition_code)
		end

	merge_refined_constraint_definition_and_translations (a_terms: HASH_TABLE [ARCHETYPE_TERM, STRING]; a_parent_code: STRING)
			-- add the terms in `a_terms' in the languages which are the keys of `a_terms', under a refined
			-- constraint code at this level
		local
			high_code: INTEGER
		do
			if highest_refined_code_index.has (a_parent_code) then
				high_code := highest_refined_code_index [a_parent_code]
			end
			last_new_definition_code := new_refined_code_at_level (a_parent_code, specialisation_depth, high_code)
			across a_terms as terms_csr loop
				terms_csr.item.set_code (last_new_definition_code)
			end
			put_definition_and_translations (a_terms, last_new_definition_code)
		end

	merge_new_value_definition_and_translations (a_terms: HASH_TABLE [ARCHETYPE_TERM, STRING])
			-- add the terms in `a_terms' in the languages which are the keys of `a_terms', under a new
			-- value code at this level
		do
			last_new_definition_code := new_added_value_code_at_level (specialisation_depth, highest_value_code)
			across a_terms as terms_csr loop
				terms_csr.item.set_code (last_new_definition_code)
			end
			put_definition_and_translations (a_terms, last_new_definition_code)
		end

feature {ARCHETYPE_TERMINOLOGY} -- Modification

	highest_refined_code_index: HASH_TABLE [INTEGER, STRING]
			-- Table of current highest code keyed by its parent code, for all specialised codes
			-- in this terminology at its level of specialisation.
			-- For example the entry for key 'id7' could be 5, meaning that current top child
			-- code of 'id7' is 'id7.5'
        attribute
            create Result.make (0)
        end

	highest_value_code: INTEGER
			-- highest added term code at the level of this terminology; 0 if none so far

	highest_value_set_code: INTEGER
			-- highest added constraint code at the level of this terminology; 0 if none so far

	update_highest_codes (a_code: STRING)
			-- update highest codes either at top level, or for refined codes
			-- spec depth = 0: id47 -> use the 47 & compare with current highest
			-- spec depth = 3: id0.0.12 -> use the 12 & compare with current highest
		require
			Code_valid: is_valid_code (a_code)
		local
			idx: INTEGER
			parent_code: STRING
		do
			if is_refined_code (a_code) then
				parent_code := specialised_code_base (a_code)
				idx := specialised_code_tail (a_code).to_integer
				if idx > highest_refined_code_index [parent_code] then
					highest_refined_code_index [parent_code] := idx
				end
			elseif specialisation_depth_from_code (a_code) = specialisation_depth then
				idx := code_index_at_level (a_code, specialisation_depth)
				if is_value_code (a_code) then
					highest_value_code := highest_value_code.max (idx)
				elseif is_value_set_code (a_code) then
					highest_value_set_code := highest_value_set_code.max (idx)
				end
			end
		end

	sync_stored_properties
			-- update various stored properties to correspond to primary stored properties
		local
			code: STRING
		do
			-- populate id code list & set codes in ARCHETYPE_TERM objects
			clear_cache
			across index_term_definitions as term_defs_csr loop
				code := term_defs_csr.key
				term_defs_csr.item.set_code (code)
				-- code might not be valid if just read this terminology in from a file
				if is_valid_code (code) then
					update_highest_codes (code)
				end
			end
		end

feature {ARCHETYPE} -- Modification

	set_new_id_code_agt (an_agt: like new_id_code_agt)
		do
			new_id_code_agt := an_agt
		end

	new_id_code_agt: detachable FUNCTION [ARCHETYPE, TUPLE, STRING]
			-- agent to obtain new id code at the specialisation level of this archetype

feature -- Factory

	to_flat: ARCHETYPE_TERMINOLOGY
			-- populate from a differential terminology. Finalisation will involve
			-- merging of codes from parent archetype ontologies if this ontology
			-- belongs to a specialised archetype
		require
			Is_differential: is_differential
		do
			Result := deep_twin
			Result.set_flat
		ensure
			Result_is_flat: Result.is_flat
		end

	to_differential: ARCHETYPE_TERMINOLOGY
			-- create from a flat terminology by cloning then removing all inherited
			-- codes and bindings
		require
			Is_flat: is_flat
		do
			Result := deep_twin
			if is_specialised then
				Result.remove_inherited_codes
			end
			Result.set_differential
		ensure
			Result_is_differential: Result.is_differential
		end

feature {ARCHETYPE_FLATTENER} -- Flattening

	merge (other: ARCHETYPE_TERMINOLOGY)
			-- merge other's terminology, doing the following:
			--	* replace term_definitions, bindings & value sets with other's, if they are overrides
			-- 	* add new term definitions, bindings and value sets if they are new in other
		require
			Logical_conformance: is_flat and other.is_differential
			Other_valid: semantically_conforms_to (other)
		do
			-- concept code
			concept_code := other.concept_code.twin

			-- term definitions
			across other.term_codes as other_codes_csr loop
				put_definition_and_translations (other.term_definitions_for_code (other_codes_csr.item).deep_twin, other_codes_csr.item)
			end

			-- terminology bindings; these are sparse and don't work like term defnition translations so
			-- have to be done individually
			across other.term_bindings as other_bindings_for_terminology_csr loop
				across other_bindings_for_terminology_csr.item as other_bindings_csr loop
					merge_specialised_term_binding (other_bindings_csr.item.twin, other_bindings_for_terminology_csr.key, other_bindings_csr.key)
				end
			end

			-- value sets: here we have to account for replacement of value sets in parent by child
			across other.value_sets as value_sets_csr loop
				merge_specialised_value_set (value_sets_csr.item.deep_twin)
			end

			sync_stored_properties
		ensure
			Specialisation_depth_set: specialisation_depth = other.specialisation_depth
		end

feature {ARCHETYPE} -- Flattening

	reduce_languages_to (other: ARCHETYPE_TERMINOLOGY)
			-- remove any languages not in `other'
		require
			Valid_conformance: is_flat and other.is_differential
		do
			across languages_available as langs_csr loop
				if not other.languages_available.has (langs_csr.item) then
					term_definitions.remove (langs_csr.item)
				end
			end
			original_language := other.original_language.twin
		ensure
			original_language.is_equal (other.original_language)
		end

feature {ARCHETYPE_TERMINOLOGY} -- Flattening

	remove_inherited_codes
			-- remove all at- and ac- codes inherited from ancestor archetypes
		local
			rm_id_codes, rm_term_codes, rm_constraint_codes: ARRAYED_LIST[STRING]
		do
			create rm_id_codes.make(0)
			create rm_term_codes.make(0)
			create rm_constraint_codes.make(0)

			across id_codes as id_codes_csr loop
				if specialisation_depth_from_code (id_codes_csr.item) /= specialisation_depth then
					rm_id_codes.extend (id_codes_csr.item)
				end
			end
			across value_codes as term_codes_csr loop
				if specialisation_depth_from_code (term_codes_csr.item) /= specialisation_depth then
					rm_term_codes.extend (term_codes_csr.item)
				end
			end
			across value_set_codes as constraint_codes_csr loop
				if specialisation_depth_from_code (constraint_codes_csr.item) /= specialisation_depth then
					rm_constraint_codes.extend (constraint_codes_csr.item)
				end
			end

			across rm_id_codes as rm_id_codes_csr loop
				remove_definition (rm_id_codes_csr.item)
			end
			across rm_term_codes as rm_term_codes_csr loop
				remove_definition (rm_term_codes_csr.item)
			end
			across rm_constraint_codes as rm_constraint_codes_csr loop
				remove_definition (rm_constraint_codes_csr.item)
			end
			sync_stored_properties
		end

feature {NONE} -- Flattening

	merge_specialised_term_binding (a_binding: URI; a_terminology_id, a_child_code: STRING)
			-- merge the binding a_code/a_binding into this terminology, if necessary
			-- removing any existing binding to a parent code of `a_child_code'
		require
			not has_term_binding (a_terminology_id, a_child_code)
		local
			code_in_parent: STRING
			spec_depth: INTEGER
		do
			-- determine for parent code that might exist in this flat terminology
			if is_refined_code (a_child_code) then
				code_in_parent := a_child_code
				from spec_depth := specialisation_depth until spec_depth = 0 or has_term_binding (a_terminology_id, code_in_parent) loop
					spec_depth := spec_depth - 1
					code_in_parent := code_at_level (a_child_code, spec_depth)
				end

				if has_term_binding (a_terminology_id, code_in_parent) then
					remove_term_binding (code_in_parent, a_terminology_id)
				end
			end
			put_term_binding (a_binding, a_terminology_id, a_child_code)
		end

	merge_specialised_value_set (a_value_set: VALUE_SET)
			-- merge `a_value_set' into this terminology, if necessary removing any existing
			-- value set bound to a parent code of ac-code a_value_set.id
		local
			code_in_parent: STRING
			spec_depth: INTEGER
			parent_code_set: detachable ARRAYED_LIST [STRING]
		do
			-- determine for parent code that might exist in this flat terminology
			if is_refined_code (a_value_set.id) then
				code_in_parent := a_value_set.id
				from spec_depth := specialisation_depth until spec_depth = 0 or value_sets.has (code_in_parent) loop
					spec_depth := spec_depth - 1
					code_in_parent := code_at_level (a_value_set.id, spec_depth)
				end

				if value_sets.has (code_in_parent) then
					parent_code_set := value_sets.item (code_in_parent).members
					value_sets.remove (code_in_parent)
				end
			end
			value_sets.put (a_value_set, a_value_set.id)

			-- remove at codes from parent value set that are not in the current one
			if attached parent_code_set as p_code_set then
				across p_code_set as parent_codes_csr loop
					if not a_value_set.has_member_code (parent_codes_csr.item) then
						remove_definition (parent_codes_csr.item)
					end
				end
			end
		end

feature {NONE} -- Legacy

	constraint_definitions: HASH_TABLE [HASH_TABLE [ARCHETYPE_TERM, STRING], STRING]
			-- table of constraint definitions, keyed by code, keyed by language
        attribute
            create Result.make (0)
        end

	constraint_bindings: HASH_TABLE [HASH_TABLE [URI, STRING], STRING]
			-- table of constraint bindings in the form of strings "service::query", keyed by terminology
        attribute
            create Result.make (0)
        end

    merge_constraint_definitions_and_bindings
    		-- merge term_definitions and constraint_definitions into one list;
    		-- merge term_bindings and constraint_bindings into one list
    	do
    		across constraint_definitions as cons_defs_for_lang_csr loop
    			if term_definitions.has (cons_defs_for_lang_csr.key) and then attached term_definitions.item (cons_defs_for_lang_csr.key) as term_defs then
    				term_defs.merge (cons_defs_for_lang_csr.item)
    			end
    		end
     		across constraint_bindings as cons_bindings_for_terminology_csr loop
    			if not term_bindings.has (cons_bindings_for_terminology_csr.key) then
					term_bindings.put (create {HASH_TABLE [URI, STRING]}.make(0), cons_bindings_for_terminology_csr.key)
				end
    			if attached term_bindings.item (cons_bindings_for_terminology_csr.key) as bindings then
    				bindings.merge (cons_bindings_for_terminology_csr.item)
    			end
    		end
    	end

feature {P_ARCHETYPE_TERMINOLOGY, AOM_151_CONVERTER} -- Implementation

	set_term_definitions (a_term_defs: like term_definitions)
		do
			term_definitions := a_term_defs
		end

	set_term_bindings (a_term_bindings: like term_bindings)
		do
			term_bindings := a_term_bindings
		end

	set_terminology_extracts (a_term_extracts: like terminology_extracts)
		do
			terminology_extracts := a_term_extracts
		end

	set_value_sets (a_value_sets: like value_sets)
		do
			value_sets := a_value_sets
		end

feature -- Finalisation

	finalise_dt
			-- finalisation routine to guarantee validity on creation
		do
			merge_constraint_definitions_and_bindings
			across value_sets as vset_csr loop
				if not vset_csr.item.members.object_comparison then
					vset_csr.item.correct_members
				end
			end
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
			Result.extend ("term_bindings")
			Result.extend ("value_sets")
		end

feature {NONE} -- Implementation

	clear_cache
		do
			index_term_definitions_cache := Void
		end

	index_term_definitions: HASH_TABLE [ARCHETYPE_TERM, STRING]
			-- term definitions table for original language
		do
			if attached index_term_definitions_cache as att_cache then
				Result := att_cache
			elseif attached term_definitions.item (original_language) as att_terms then
				Result := att_terms
				index_term_definitions_cache := Result
			else
				create Result.make (0)
			end
		end

	index_term_definitions_cache: detachable HASH_TABLE [ARCHETYPE_TERM, STRING]
		note
			option: transient
		attribute
		end

	term_binding_map: HASH_TABLE [HASH_TABLE [STRING, STRING], STRING]
			-- tables of bindings of external terms to internal codes and/or paths, keyed by external terminology id
			-- each internal table is of at-codes, keyed by external code in the terminology of the outer key
		local
			terminology_id: STRING
        do
            if attached term_binding_map_cache as att_map then
            	Result := att_map
            else
            	create Result.make (0)
            	across term_bindings as bindings_for_terminology_csr loop
            		terminology_id := bindings_for_terminology_csr.key
            		across bindings_for_terminology_csr.item as bindings_csr loop
            			-- put external code, at-code
            			if not Result.has (terminology_id) then
            				Result.put (create {HASH_TABLE [STRING, STRING]}.make (0), terminology_id)
            			end
            			check attached Result.item (terminology_id) as att_map then
            				att_map.put (bindings_csr.key, terminology_code_from_uri (bindings_csr.item.as_string))
            			end
            		end
            	end
            	term_binding_map_cache := Result
            end
        end

	term_binding_map_cache: detachable HASH_TABLE [HASH_TABLE [STRING, STRING], STRING]
			-- cache for `term_binding_map'

	has_path (a_path: STRING): BOOLEAN
			-- True if path `a_path' exists in structure
		require
			a_path_valid: not a_path.is_empty
		do
			Result := dt_representation.has_path (a_path)
		end

invariant
	Original_language_valid: not original_language.is_empty
	Root_code_valid: is_valid_root_id_code (concept_code)
	Concept_code_defined: id_codes.has (concept_code)
	Highest_term_code_index_valid: highest_value_code >= 0
	Highest_value_set_code_valid: highest_value_set_code >= 0

end


