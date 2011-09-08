note
	component:   "openEHR Archetype Project"
	description: "ADL Terminology class"
	keywords:    "archetype, ontology, terminology"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.com>"
	copyright:   "Copyright (c) 2003-2008 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

deferred class ARCHETYPE_ONTOLOGY

inherit
	SHARED_DT_FACTORY
		export
			{NONE} all
		redefine
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
			create errors.make

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

	make_from_tree(an_original_lang: STRING; a_dadl_tree: DT_COMPLEX_OBJECT_NODE; a_concept_code: STRING)
			-- make ontology from parse tree and concept code, usually something
			-- like 'at0000' or 'at0000.1'. The specialisation depth of the
			-- ontology is determined from this code
		require
			Original_language_valid: an_original_lang /= Void and then not an_original_lang.is_empty
			Tree_exists: a_dadl_tree /= Void
			root_code_attached: a_concept_code /= Void
			root_code_valid: is_valid_concept_code (a_concept_code)
		do
			default_create
			representation := a_dadl_tree
			concept_code := a_concept_code
			original_language := an_original_lang
			synchronise_from_tree
		ensure
			concept_code_set: concept_code.is_equal (a_concept_code)
		end

feature -- Access

	original_language: STRING
			-- original language of the ontology, as set at archetype creation or parsing time

	languages_available: attached ARRAYED_SET [STRING]
		do
			create Result.make(0)
			Result.compare_objects
			from term_definitions.start until term_definitions.off loop
				Result.extend(term_definitions.key_for_iteration)
				term_definitions.forth
			end
		end

	terminologies_available: ARRAYED_LIST [STRING]

	specialisation_depth: INTEGER
			-- depth of this ontology with relation to ontologies in other archetypes
		do
			Result := specialisation_depth_from_code (concept_code)
		ensure
			non_negative: Result >= 0
		end

	term_definition(a_language, a_code: STRING): attached ARCHETYPE_TERM
			-- retrieve the term definition in language `a_language' for code `a_code'
		require
			Language_valid: a_language /= Void
			Term_code_valid: a_code /= Void
			Term_definition_exists: has_term_definition (a_language, a_code)
		deferred
		end

	constraint_definition(a_language, a_code: STRING): attached ARCHETYPE_TERM
			-- retrieve the constraint definition in language `a_language' for code `a_code'
		require
			Language_valid: a_language /= Void
			Term_code_valid: a_code /= Void
			Term_definition_exists: has_constraint_definition (a_language, a_code)
		deferred
		end

	term_binding(a_terminology, a_code: STRING): attached CODE_PHRASE
			-- retrieve the term definition in language `a_language' for code `a_code'
		require
			Terminology_valid: a_terminology /= Void and then terminologies_available.has(a_terminology)
			Term_code_valid: a_code /= Void and then has_term_binding(a_terminology, a_code)
		deferred
		end

	term_bindings_for_terminology(a_terminology: STRING): attached HASH_TABLE [CODE_PHRASE, STRING]
			-- retrieve the term bindings for a particular terminology
		require
			Terminology_valid: a_terminology /= Void and then terminologies_available.has(a_terminology)
		do
			Result := term_bindings.item(a_terminology)
		end

	constraint_binding(a_terminology, a_code: STRING): attached URI
			-- retrieve the constraint definition in language `a_language' for code `a_code'
			-- in form of a string: "service::query"
		require
			Terminology_valid: a_terminology /= Void and then terminologies_available.has(a_terminology)
			Term_code_valid: a_code /= Void and then has_constraint_binding(a_terminology, a_code)
		deferred
		end

	constraint_bindings_for_terminology(a_terminology: STRING): attached HASH_TABLE [URI, STRING]
			-- retrieve the term bindings for a particular terminology
		require
			Terminology_valid: a_terminology /= Void and then terminologies_available.has(a_terminology)
		do
			Result := constraint_bindings.item(a_terminology)
		end

	terminology_extract_term (a_terminology, a_code: STRING): ARCHETYPE_TERM
			-- true if there is an extract from terminology `a_terminology'
		require
			Terminology_valid: a_terminology /= Void and then has_terminology_extract(a_terminology)
			Term_code_valid: a_code /= Void and then has_terminology_extract_code(a_terminology, a_code)
		deferred
		end

	concept_code: STRING
			-- term code of the concept of the ontology as a whole

	term_codes: TWO_WAY_SORTED_SET[STRING]
			-- list of term codes

	constraint_codes: TWO_WAY_SORTED_SET[STRING]
			-- list of constraint codes

	term_attribute_names: ARRAYED_LIST[STRING]
			-- the attribute names found in ARCHETYPE_TERM objects

	errors: ERROR_ACCUMULATOR

	physical_to_logical_path(a_phys_path: STRING; a_language: STRING): STRING
			-- generate a logical path in 'a_language' from a physical path
		require
			a_path_valid: a_phys_path /= Void
			a_lang_valid: a_language /= Void not a_language.is_empty
		local
			term_code: STRING
			og_phys_path, og_log_path: OG_PATH
		do
			create og_phys_path.make_from_string(a_phys_path)
			create og_log_path.make_from_other(og_phys_path)
			from
				og_phys_path.start
				og_log_path.start
			until
				og_phys_path.off
			loop
				if og_phys_path.item.is_addressable then
					term_code := og_phys_path.item.object_id
					if is_valid_code (term_code) then
						if has_term_code(term_code) then
							og_log_path.item.set_object_id (term_definition(a_language, term_code).item("text"))
						end
					else
						og_log_path.item.set_object_id (term_code)
					end
				end
				og_phys_path.forth
				og_log_path.forth
			end

			Result := og_log_path.as_string
		ensure
			Result_exists: Result /= Void
		end

feature -- Status Report

	has_language (a_language: STRING): BOOLEAN
			-- check that `a_language' supported
		require
			Language_valid: a_language /= Void and then not a_language.is_empty
		do
			Result := term_definitions.has(a_language)
		end

	has_terminology (a_terminology: STRING): BOOLEAN
			-- is `a_terminology' known in this ontology?
		require
			Terminology_valid: a_terminology /= Void and then not a_terminology.is_empty
		do
			Result := terminologies_available.has(a_terminology)
		end

	has_term_code (a_code: STRING): BOOLEAN
			-- is `a_code' known in this ontology?
		require
			Term_code_valid: a_code /= Void and then is_valid_code(a_code)
		deferred
		end

	has_term_definition (a_language, a_code: STRING): BOOLEAN
			-- is `a_code' defined in `a_language' in this ontology?
		require
			Term_code_valid: a_code /= Void and then is_valid_code(a_code)
			Language_valid: a_language /= Void and then not a_language.is_empty
		deferred
		end

	has_constraint_code (a_code: STRING): BOOLEAN
			--
		require
			Code_valid: a_code /= Void and then is_valid_code(a_code)
		deferred
		end

	has_constraint_definition (a_language, a_code: STRING): BOOLEAN
			-- is `a_code' defined in `a_language' in this ontology?
		require
			Constraint_code_valid: a_code /= Void and then is_valid_code(a_code)
			Language_valid: a_language /= Void and then not a_language.is_empty
		deferred
		end

	has_term_bindings (a_terminology: STRING): BOOLEAN
			-- true if there are term bindings `a_terminology'
		require
			Terminology_valid: a_terminology /= Void and then not terminologies_available.is_empty
		do
			Result := term_bindings.has(a_terminology)
		end

	has_constraint_bindings (a_terminology: STRING): BOOLEAN
			-- true if there are term bindings `a_terminology'
		require
			Terminology_valid: a_terminology /= Void and then not terminologies_available.is_empty
		do
			Result := constraint_bindings.has(a_terminology)
		end

	has_any_term_binding (a_code: STRING): BOOLEAN
			-- true if there is any term binding for code `a_code'
		require
			Term_code_valid: a_code /= Void and then is_valid_code(a_code)
		deferred
		end

	has_term_binding (a_terminology, a_code: STRING): BOOLEAN
			-- true if there is a term binding for code `a_code' in `a_terminology'
		require
			Terminology_valid: a_terminology /= Void and then not terminologies_available.is_empty
			Term_code_valid: a_code /= Void and then is_valid_code(a_code)
		deferred
		end

	has_any_constraint_binding (a_code: STRING): BOOLEAN
			-- true if there is any constraint binding for code `a_code'
		require
			Term_code_valid: a_code /= Void and then is_valid_code(a_code)
		deferred
		end

	has_constraint_binding (a_terminology, a_code: STRING): BOOLEAN
			-- true if there is a term binding for code `a_code' in `a_terminology'
		require
			Terminology_valid: a_terminology /= Void and then not terminologies_available.is_empty
			Term_code_valid: a_code /= Void and then is_valid_code(a_code)
		deferred
		end

	has_terminology_extract (a_terminology: STRING): BOOLEAN
			-- true if there is an extract from terminology `a_terminology'
		require
			Terminology_valid: a_terminology /= Void and then not a_terminology.is_empty
		deferred
		end

	has_terminology_extract_code (a_terminology, a_code: STRING): BOOLEAN
			-- true if there is a term binding for code `a_code' in `a_terminology'
		require
			Terminology_valid: a_terminology /= Void and then not has_terminology_extract(a_terminology)
			Term_code_valid: a_code /= Void and then not a_code.is_empty
		deferred
		end

	semantically_conforms_to(other: FLAT_ARCHETYPE_ONTOLOGY): BOOLEAN
			-- True if this ontology conforms to `other' by having the same or subset of languages
		require
			other /= Void
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

	set_original_language (a_language: STRING)
			-- set the primary language of the ontology
		require
			A_lang_valid: a_language /= Void
		do
			original_language := a_language
		ensure
			Language_set: original_language.is_equal(a_language)
		end

	add_term_definition(a_language: STRING; a_term: ARCHETYPE_TERM)
			-- add a new term definition for language `a_language' and
			-- automatically add translation placeholders in all other languages
		require
			Language_valid: a_language /= Void and then has_language(a_language)
			Term_valid: a_term /= Void and not has_term_code(a_term.code) and specialisation_depth_from_code (a_term.code) <= specialisation_depth
		do
			put_term_definition (a_language, a_term)
			term_codes.extend (a_term.code)
			update_highest_specialised_code_index (a_term.code)
			update_highest_term_code_index (a_term.code)
		ensure
			Code_valid: has_term_code(a_term.code)
		end

	replace_term_definition(a_language: STRING; a_term: ARCHETYPE_TERM; replace_translations: BOOLEAN)
			-- replace the definition of an existing term code; replace all translations
			-- if flag set and `a_language' is the primary language
		require
			Language_valid: a_language /= Void and then has_language(a_language)
			Term_valid: a_term /= Void and then has_term_code(a_term.code)
		do
			if a_language.is_equal(original_language) and replace_translations then
				put_term_definition(a_language, a_term) -- replace all translations as well
			else
				term_definitions.item(a_language).replace(a_term, a_term.code) -- just do this translation
			end
		end

	add_constraint_definition(a_language: STRING; a_term: ARCHETYPE_TERM)
			-- add a new constraint definition for language `a_language' and
			-- automatically add translation placeholders
		require
			Language_valid: a_language /= Void and then has_language(a_language)
			Term_valid: a_term /= Void and then not has_constraint_code(a_term.code) and specialisation_depth_from_code (a_term.code) <= specialisation_depth
		do
			put_constraint_definition (a_language, a_term)
			constraint_codes.extend (a_term.code)
			update_highest_specialised_code_index (a_term.code)
			update_highest_constraint_code_index (a_term.code)
		ensure
			has_constraint_code(a_term.code)
		end

	replace_constraint_definition(a_language: STRING; a_term: ARCHETYPE_TERM; replace_translations: BOOLEAN)
			-- replace the definition of an existing constraint code; replace all translations
			-- if flag set and `a_language' is the primary language
		require
			Language_valid: a_language /= Void and then has_language(a_language)
			Term_valid: a_term /= Void and then has_constraint_code(a_term.code)
		do
			if a_language.is_equal(original_language) and replace_translations then
				put_constraint_definition(a_language, a_term) -- replace all translations as well
			else
				constraint_definitions.item(a_language).replace(a_term, a_term.code) -- just do this translation
			end
		end

	add_term_binding(a_code_phrase: CODE_PHRASE; a_code: STRING)
			-- add a new term binding to local code a_code, in the terminology
			-- group corresponding to the a_code_phrase.terminology
		require
			Code_phrase_exists: a_code_phrase /= Void
			Local_code_valid: a_code /= Void and then has_term_code(a_code)
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

	add_constraint_binding(a_uri: URI; a_terminology, a_code: STRING)
			-- add a new constraint binding to local code a_code, in the terminology
			-- group corresponding to the a_code_phrase.terminology
		require
			Uri_exists: a_uri /= Void
			Local_code_valid: a_code /= Void and then has_constraint_code(a_code)
			Not_already_added: not has_constraint_binding(a_terminology, a_code)
		do
			if not terminologies_available.has(a_terminology) then
				terminologies_available.extend (a_terminology)
			end
			if not has_constraint_bindings(a_terminology) then
				constraint_bindings.put(create {HASH_TABLE[URI, STRING]}.make(0), a_terminology)
			end
			constraint_bindings.item(a_terminology).put(a_uri, a_code)
		ensure
			Binding_added: has_constraint_binding(a_terminology, a_code)
		end

	remove_term_definition(a_code: STRING)
			-- completely remove the term from the ontology
		require
			Term_valid: a_code /= Void and then has_term_code(a_code)
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

	remove_constraint_definition(a_code: STRING)
			-- completely remove the constraint from the ontology
		require
			Constraint_valid: a_code /= Void and then has_constraint_code(a_code)
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

	remove_term_binding(a_code, a_terminology: STRING)
			-- remove term binding to local code in group a_terminology
		require
			Local_code_valid: a_code /= Void and then has_term_code(a_code)
			Terminology_valid: terminologies_available.has(a_terminology)
			Has_binding: has_term_binding(a_terminology, a_code)
		do
			term_bindings.item(a_terminology).remove(a_code)
			if term_bindings.item(a_terminology).count = 0 then
				term_bindings.remove (a_terminology)
				if not constraint_bindings.has (a_terminology) then
					terminologies_available.prune_all (a_terminology)
				end
			end
		ensure
			Binding_removed: not has_term_binding(a_terminology, a_code)
		end

	remove_constraint_binding(a_code, a_terminology: STRING)
			-- remove constraint binding to local code in group a_terminology
		require
			Local_code_valid: a_code /= Void and then has_constraint_code(a_code)
			Terminology_valid: terminologies_available.has(a_terminology)
			Has_binding: has_constraint_binding(a_terminology, a_code)
		do
			constraint_bindings.item(a_terminology).remove(a_code)
			if constraint_bindings.item(a_terminology).count = 0 then
				constraint_bindings.remove (a_terminology)
				if not term_bindings.has (a_terminology) then
					terminologies_available.prune_all (a_terminology)
				end
			end
		ensure
			Binding_removed: not has_constraint_binding(a_terminology, a_code)
		end

feature -- Conversion

	substitute_codes(str, lang: STRING): STRING
			-- substitute all occurrences of archetype codes in 'str'
			-- with their term texts from this ontology, in 'lang'
		require
			Str_valid: str /= Void and then not str.is_empty
			Lang_valid: lang /= Void and then has_language(lang)
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
					Result.replace_substring_all(code, term_definition(lang, code).item("text"))
				end
				start_pos := str.substring_index("[" + Term_code_leader, end_pos)
			end
		ensure
			Result_exists: Result /= Void
		end

feature {ARCHETYPE} -- Synchronisation

	synchronise_to_tree
			-- synchronise data to the tree representation
		local
			an_attr_node, attr_node_term_definitions, attr_node_term_binding, attr_node_items: DT_ATTRIBUTE_NODE
			an_obj_node: DT_COMPLEX_OBJECT_NODE
			a_term: ARCHETYPE_TERM
			a_coord_term: CODE_PHRASE
			keys: ARRAYED_LIST[STRING]
			a_uri: URI
		do
			create representation.make_anonymous

			-- terminologies_available: ARRAYED_LIST [STRING]
			if not terminologies_available.is_empty then
				create an_attr_node.make_single(Sym_terminologies_available)
				representation.put_attribute (an_attr_node)
				an_attr_node.put_child (create {DT_PRIMITIVE_OBJECT_LIST}.make_anonymous (terminologies_available))
			end

			-- term_definitions
			create attr_node_term_definitions.make_multiple(Sym_term_definitions)
			representation.put_attribute (attr_node_term_definitions)
			from term_definitions.start until term_definitions.off loop
				create an_obj_node.make_identified (term_definitions.key_for_iteration)
				attr_node_term_definitions.put_child (an_obj_node)
				create attr_node_items.make_multiple("items")
				attr_node_items.use_children_sorted
				an_obj_node.put_attribute(attr_node_items)

				from term_definitions.item_for_iteration.start until term_definitions.item_for_iteration.off loop
					a_term := term_definitions.item_for_iteration.item_for_iteration
					create an_obj_node.make_identified (a_term.code)
					attr_node_items.put_child (an_obj_node)

					keys := a_term.keys
					from keys.start until keys.off loop
						create an_attr_node.make_single(keys.item)
						an_obj_node.put_attribute(an_attr_node)
						an_attr_node.put_child (create {DT_PRIMITIVE_OBJECT}.make_anonymous(a_term.item(keys.item)))
						keys.forth
					end
					term_definitions.item_for_iteration.forth
				end

				term_definitions.forth
			end

			-- constraint definitions
			if not constraint_definitions.is_empty then
				create attr_node_term_definitions.make_multiple(Sym_constraint_definitions)
				representation.put_attribute (attr_node_term_definitions)
				from constraint_definitions.start until constraint_definitions.off loop
					create an_obj_node.make_identified (constraint_definitions.key_for_iteration)
					attr_node_term_definitions.put_child (an_obj_node)
					create attr_node_items.make_multiple("items")
					attr_node_items.use_children_sorted
					an_obj_node.put_attribute(attr_node_items)

					from constraint_definitions.item_for_iteration.start until constraint_definitions.item_for_iteration.off loop
						a_term := constraint_definitions.item_for_iteration.item_for_iteration
						create an_obj_node.make_identified (a_term.code)
						attr_node_items.put_child (an_obj_node)

						keys := a_term.keys
						from keys.start until keys.off loop
							create an_attr_node.make_single(keys.item)
							an_obj_node.put_attribute(an_attr_node)
							an_attr_node.put_child (create {DT_PRIMITIVE_OBJECT}.make_anonymous(a_term.item(keys.item)))
							keys.forth
						end
						constraint_definitions.item_for_iteration.forth
					end

					constraint_definitions.forth
				end
			end

			-- term bindings
			if not term_bindings.is_empty then
				create attr_node_term_binding.make_multiple(sym_term_bindings)
				representation.put_attribute (attr_node_term_binding)
				from term_bindings.start until term_bindings.off loop
					create an_obj_node.make_identified (term_bindings.key_for_iteration)
					attr_node_term_binding.put_child (an_obj_node)
					create an_attr_node.make_multiple("items")
					an_attr_node.use_children_sorted
					an_obj_node.put_attribute(an_attr_node)

					from term_bindings.item_for_iteration.start until term_bindings.item_for_iteration.off loop
						a_coord_term := term_bindings.item_for_iteration.item_for_iteration
						an_attr_node.put_child (create {DT_PRIMITIVE_OBJECT}.make_identified (a_coord_term,
							term_bindings.item_for_iteration.key_for_iteration))
						term_bindings.item_for_iteration.forth
					end
					term_bindings.forth
				end
			end

			-- constraint bindings
			if not constraint_bindings.is_empty then
				create attr_node_term_binding.make_multiple(Sym_constraint_bindings)
				representation.put_attribute (attr_node_term_binding)
				from constraint_bindings.start until constraint_bindings.off loop
					create an_obj_node.make_identified (constraint_bindings.key_for_iteration)
					attr_node_term_binding.put_child (an_obj_node)
					create an_attr_node.make_multiple("items")
					an_attr_node.use_children_sorted
					an_obj_node.put_attribute(an_attr_node)

					from constraint_bindings.item_for_iteration.start until constraint_bindings.item_for_iteration.off loop
						a_uri := constraint_bindings.item_for_iteration.item_for_iteration
						an_attr_node.put_child (create {DT_PRIMITIVE_OBJECT}.make_identified (a_uri,
							constraint_bindings.item_for_iteration.key_for_iteration))
						constraint_bindings.item_for_iteration.forth
					end
					constraint_bindings.forth
				end
			end
		end

feature {ADL_ENGINE} -- Representation

	representation: DT_COMPLEX_OBJECT_NODE
			-- root node of DADL objects representing this ontology

feature --{ARCHETYPE_ONTOLOGY} -- Implementation --changed by SEREF ARIKAN, NEEDED FOR COPYING ONTOLOGY TO PROTOCOL BUFFER WRAPPERS

	has_path(a_path: STRING): BOOLEAN
			-- True if path `a_path' exists in structure
		require
			a_path_valid: a_path /= Void and then not a_path.is_empty
		do
			Result := representation.has_path(a_path)
		end

	term_definitions: HASH_TABLE[HASH_TABLE[ARCHETYPE_TERM, STRING], STRING]
			-- table of term definitions, keyed by code, keyed by language

	constraint_definitions: HASH_TABLE[HASH_TABLE[ARCHETYPE_TERM, STRING], STRING]
			-- table of constraint definitions, keyed by code, keyed by language

	term_bindings: HASH_TABLE[HASH_TABLE[CODE_PHRASE, STRING], STRING]
			-- tables of bindings of external terms to internal codes, keyed by external terminology id

	constraint_bindings: HASH_TABLE[HASH_TABLE[URI, STRING], STRING]
			-- table of constraint bindings in the form of strings "service::query", keyed by terminology

	terminology_extracts: HASH_TABLE[HASH_TABLE[ARCHETYPE_TERM, STRING], STRING]
			-- table of {code, description} keyed by terminology_id containing extracted concepts from external terminologies

	highest_specialised_code_indexes: attached HASH_TABLE [INTEGER, STRING]
			-- Table of child code tails keyed by immediate parent code.

	highest_term_code_index: INTEGER
			-- index of highest non-specialised code at the level of this ontology; 0 if none so far

	highest_constraint_code_index: INTEGER
			-- index of the highest constraint code in the ontology

	highest_code_specialisation_level: INTEGER
			-- level of most specialised code in this ontology; used for detecting codes from a lower level than the archetype itself

	put_term_definition(a_language: STRING; a_term: ARCHETYPE_TERM)
			-- put a new term definition for language `a_language' and
			-- automatically add translation placeholders in all other languages
		local
			trans_term: ARCHETYPE_TERM
		do
			term_definitions.item(a_language).force(a_term, a_term.code)
			trans_term := a_term.create_translated_term(original_language)
			from term_definitions.start until term_definitions.off loop
				if not term_definitions.key_for_iteration.is_equal(a_language) then
					term_definitions.item_for_iteration.force(trans_term.deep_twin, trans_term.code)
				end
				term_definitions.forth
			end
		ensure
			term_definitions.item(a_language).has(a_term.code)
		end

	put_constraint_definition(a_language: STRING; a_term: ARCHETYPE_TERM)
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

	synchronise_from_tree
			-- synchronise info from parse tree to data structures
		local
			term_defs_one_lang: HASH_TABLE[ARCHETYPE_TERM, STRING]
			term_bindings_one_terminology: HASH_TABLE[CODE_PHRASE, STRING]
			constraint_bindings_one_terminology: HASH_TABLE[URI, STRING]
			code, a_language, terminology_path: STRING
			an_attr_node: DT_ATTRIBUTE_NODE
		do
			if representation.has_path("/" + Sym_terminologies_available) then
				terminologies_available := string_list_at_path("/" + Sym_terminologies_available)
			end

			-- populate term definitions & languages_available (temporarily, until all archetypes
			-- have a proper language section
			if has_path ("/" + Sym_term_definitions) then
				an_attr_node := representation.attribute_node_at_path("/" + Sym_term_definitions)
				if an_attr_node.is_multiple then
					from an_attr_node.start until an_attr_node.off loop
						a_language := an_attr_node.item.node_id
						if has_path("/" + Sym_term_definitions + "[" + a_language + "]/items") then
							create term_defs_one_lang.make(0)
							populate_term_defs(Sym_term_definitions, a_language, term_defs_one_lang)
							term_definitions.force(term_defs_one_lang , a_language)
						end
						an_attr_node.forth
					end
				end
			end

			-- populate constraint definitions
			if has_path("/" + Sym_constraint_definitions) then
				an_attr_node := representation.attribute_node_at_path("/" + Sym_constraint_definitions)
				if an_attr_node.is_multiple then
					from an_attr_node.start until an_attr_node.off loop
						a_language := an_attr_node.item.node_id
						if has_path("/" + Sym_constraint_definitions + "[" + a_language + "]/items") then
							create term_defs_one_lang.make(0)
							populate_term_defs(Sym_constraint_definitions, a_language, term_defs_one_lang)
							constraint_definitions.force(term_defs_one_lang , a_language)
						end
						an_attr_node.forth
					end
				end
			end

			-- populate term code list
			if has_language (original_language) then
				from term_definitions.item (original_language).start until term_definitions.item (original_language).off loop
					code := term_definitions.item (original_language).key_for_iteration
					term_codes.extend (code)
					update_highest_specialised_code_index (code)
					update_highest_term_code_index (code)
					term_definitions.item (original_language).forth
				end
			end

			-- populate constraint code list
			if not constraint_definitions.is_empty then
				from constraint_definitions.item(original_language).start until constraint_definitions.item(original_language).off loop
					code := constraint_definitions.item(original_language).key_for_iteration
					constraint_codes.extend (code)
					update_highest_specialised_code_index (code)
					update_highest_constraint_code_index(code)
					constraint_definitions.item(original_language).forth
				end
			end

			-- populate term attribute names (assumed to be the same for terms and constraints)
			if term_attribute_names = Void then
				term_attribute_names := (create {ARCHETYPE_TERM}.make_default).keys
			end

			-- populate term and constraint bindings
			from terminologies_available.start until terminologies_available.off loop
				terminology_path := "/" + sym_term_bindings + "[" + terminologies_available.item + "]/items"

				if has_path (terminology_path) then
					create term_bindings_one_terminology.make (0)
					populate_term_bindings (terminology_path, term_bindings_one_terminology)
					term_bindings.force (term_bindings_one_terminology, terminologies_available.item)
				end

				if has_path("/" + Sym_constraint_bindings + "[" + terminologies_available.item + "]") then
					create constraint_bindings_one_terminology.make(0)
					populate_constraint_bindings(terminologies_available.item, constraint_bindings_one_terminology)
					constraint_bindings.force(constraint_bindings_one_terminology, terminologies_available.item)
				end

				terminologies_available.forth
			end
		end

	populate_term_defs(group, lang: STRING; term_defs_one_lang: HASH_TABLE[ARCHETYPE_TERM, STRING])
		require
			group /= Void and then (group.is_equal(Sym_term_definitions) or group.is_equal(Sym_constraint_definitions))
		local
			t_path: STRING
			an_attr_node: DT_ATTRIBUTE_NODE
			adl_term: ARCHETYPE_TERM
			object_node: DT_COMPLEX_OBJECT_NODE
			object_simple_node: DT_PRIMITIVE_OBJECT
			term_attr_name, t_val: STRING
			a_code: STRING
			in_term_group: BOOLEAN
		do
			in_term_group := group.is_equal(Sym_term_definitions)
			t_path := "/" + group + "[" + lang + "]/items"
			if has_path(t_path) then
				an_attr_node := representation.attribute_node_at_path(t_path)

				if an_attr_node.is_multiple then
					from an_attr_node.start until an_attr_node.off loop
						a_code := an_attr_node.item.node_id
						create adl_term.make (a_code)
						object_node ?= an_attr_node.child_with_id (a_code)
						from object_node.start until object_node.off loop
							term_attr_name := object_node.item.rm_attr_name
							object_simple_node ?= object_node.item.first_child
							t_val ?= object_simple_node.value
							if t_val.is_empty then
								t_val.append ("*")
							end
							adl_term.add_item(term_attr_name, t_val)
							object_node.forth
						end
						term_defs_one_lang.force(adl_term, a_code)
						an_attr_node.forth
					end
				end
			end
		end

	populate_term_bindings (terminology_path: STRING; term_bindings_one_terminology: HASH_TABLE[CODE_PHRASE, STRING])
			-- Populate `term_bindings_one_terminology' from `terminology_path'.
		require
			has_terminology_path: has_path (terminology_path)
		local
			an_attr_node: DT_ATTRIBUTE_NODE
		do
			an_attr_node := representation.attribute_node_at_path (terminology_path)
			if an_attr_node.is_multiple then
				from an_attr_node.start until an_attr_node.off loop
					if attached {DT_PRIMITIVE_OBJECT} an_attr_node.item as a_simple_node then
						if attached {CODE_PHRASE} a_simple_node.value as a_term then
							term_bindings_one_terminology.force (a_term, a_simple_node.node_id)
						else
							errors.add_error ("VONTBC", <<terminology_path>>, "ontology section " + an_attr_node.path)
						end
					else
						errors.add_warning ("VONG", <<terminology_path>>, "ontology section, path " + an_attr_node.path)
					end
					an_attr_node.forth
				end
			end
		end

	populate_constraint_bindings(a_terminology: STRING; constraint_bindings_one_terminology: HASH_TABLE[URI, STRING])
			--
		local
			an_attr_node: DT_ATTRIBUTE_NODE
			a_path: STRING
		do
			a_path := "/" + Sym_constraint_bindings + "[" + a_terminology + "]/items"
			an_attr_node := representation.attribute_node_at_path(a_path)
			if an_attr_node.is_multiple then
				from an_attr_node.start until an_attr_node.off loop
					if attached {DT_PRIMITIVE_OBJECT} an_attr_node.item as a_leaf_node then
						if attached {URI} a_leaf_node.value as a_uri then
							constraint_bindings_one_terminology.force(a_uri, a_leaf_node.node_id)
						else
							errors.add_error ("VONCBU", <<a_path>>, "ontology section, path " + an_attr_node.path)
						end
					else
						errors.add_warning ("VONG", <<a_path>>, "ontology section, path " + an_attr_node.path)
					end
					an_attr_node.forth
				end
			end
		end

	update_highest_specialised_code_index (a_code: STRING)
			-- Update `highest_specialised_code_indexes' list with `a_code', if it happens to be specialised.
		require
			Code_valid: a_code /= Void and then is_valid_code (a_code)
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

	update_highest_term_code_index (a_code: STRING)
			-- update highest non-specialised term code index at the specialisation depth of this archetype
			-- spec depth = 0: at0047 -> use the 0047 & compare with current highest
			-- spec depth = 3: at0.0.12 -> use the 12 & compare with current highest
		require
			Code_valid: a_code /= Void and then is_valid_code (a_code)
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

	update_highest_constraint_code_index (a_code: STRING)
			-- update highest_constraint_code_index for this level;
			-- ignore acXXXX codes not of the level of this archetype
		require
			Code_valid: a_code /= Void and then is_valid_code (a_code)
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

	string_at_path(a_path: STRING): STRING
		require
			Path_valid: a_path /= Void and then has_path(a_path)
		do
			Result ?= representation.value_at_path(a_path)
		ensure
			Result_exists: Result /= Void
		end

	string_list_at_path(a_path: STRING): ARRAYED_LIST[STRING]
			-- get value list from at path `a_path'
		require
			Path_valid: a_path /= Void and then has_path(a_path)
		local
			a_string: STRING
		do
			Result ?= representation.value_list_at_path(a_path)
			if Result = Void then -- get a list from a single value
				a_string ?= representation.value_at_path(a_path)
				if a_string /= Void then
					create Result.make(0)
					Result.extend (a_string)
				end
			end
			Result.compare_objects
		ensure
			Result_exists: Result /= Void
		end

	valid_term_code(a_code: STRING): BOOLEAN
			-- True if `a_code' is found in all languages
		require
			Code_valid: a_code /= Void and then not a_code.is_empty
		local
			t_path: STRING
		do
			from
				term_definitions.start
				Result := True
			until
				term_definitions.off or not Result
			loop
				create t_path.make(0)
				t_path.append ("/" + Sym_term_definitions + "[" + term_definitions.key_for_iteration + "]/items[" + a_code + "]")
				Result := Result and has_path(t_path)
				term_definitions.forth
			end
		end

	valid_constraint_code(a_code: STRING): BOOLEAN
			-- True if `a_code' is found in all languages
		require
			Code_valid: a_code /= Void and then not a_code.is_empty
		local
			t_path: STRING
		do
			from
				constraint_definitions.start
				Result := True
			until
				constraint_definitions.off or not Result
			loop
				create t_path.make(0)
				t_path.append ("/" + Sym_constraint_definitions + "[" + constraint_definitions.key_for_iteration + "]/items[" + a_code + "]")
				Result := Result and has_path(t_path)
				constraint_definitions.forth
			end
		end

invariant
	Original_language_valid: original_language /= Void and then not original_language.is_empty
	Terminologies_available_exists: terminologies_available /= Void

	Term_definitions_exists: term_definitions /= Void
	Term_codes_exists: term_codes /= Void
	Constraint_codes_exists: constraint_codes /= Void
	Term_bindings_exists: term_bindings /= Void
	Constraint_bindings_exists: constraint_bindings /= Void
	root_code_attached: concept_code /= Void
	root_code_valid: is_valid_concept_code (concept_code)
	root_code_in_terms: term_codes.has (concept_code)
	Term_attribute_names_valid: term_attribute_names /= Void

	Highest_term_code_index_valid: highest_term_code_index >= 0
	Highest_constraint_code_index_valid: highest_constraint_code_index >= 0
	Highest_code_specialisation_level_valid: highest_code_specialisation_level >= 0

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
