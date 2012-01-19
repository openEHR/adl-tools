note
	component:   "openEHR Archetype Project"
	description: "[
				 Archetype ontology section class for differential, i.e. source form archetypes. The routines in this class
				 correspond to the needs of creating and editing an archetype, i.e. modifying the contents. A differential 
				 form archetype ontology that is specialised will have its parent_ontology set to the ontology of the parent
				 differential archetype, and so on up the lineage. This allows many of the accessors to function using the
				 rest of the lineage above.
				 FIXME: whether we still need to do this needs to be investigated - it was added to support specialisation
				 semanitcs, but now that flattening works, it may no longer be needed.
				 ]"
	keywords:    "archetype, ontology, terminology"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.com>"
	copyright:   "Copyright (c) 2003-2009 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class DIFFERENTIAL_ARCHETYPE_ONTOLOGY

inherit
	ARCHETYPE_ONTOLOGY

create
	make, make_empty, make_from_flat

feature -- Initialisation

	make_empty (an_original_lang: attached STRING; at_specialisation_depth: INTEGER)
			-- make an empty ontology at specified specialisation depth
		require
			Original_language_valid: not an_original_lang.is_empty
			Valid_specialisation_depth: at_specialisation_depth >= 0
		do
			make (an_original_lang, new_concept_code_at_level (at_specialisation_depth))
			add_language (an_original_lang)
			initialise_term_definitions (create {ARCHETYPE_TERM}.make (concept_code))
		ensure
			Primary_language_set: original_language = an_original_lang
			Specialisation_level_set: specialisation_depth = at_specialisation_depth
			Concept_code_set: is_valid_concept_code(concept_code) and specialisation_depth_from_code (concept_code) = at_specialisation_depth
			Concept_code_in_terms: has_term_code (concept_code)
			Concept_items_not_empty: not term_definition (original_language, concept_code).text.is_empty
		end

	make_from_flat (a_flat: attached FLAT_ARCHETYPE_ONTOLOGY)
			-- create from a flat ontology
		local
			a_flat_copy: FLAT_ARCHETYPE_ONTOLOGY
		do
			a_flat_copy := a_flat.deep_twin
			a_flat_copy.remove_inherited_codes

			concept_code := a_flat_copy.concept_code
			original_language := a_flat.original_language.twin

			terminologies_available := a_flat_copy.terminologies_available

			term_definitions := a_flat_copy.term_definitions
			constraint_definitions := a_flat_copy.constraint_definitions

			term_codes := a_flat_copy.term_codes
			constraint_codes := a_flat_copy.constraint_codes
			term_attribute_names := a_flat_copy.term_attribute_names

			term_bindings := a_flat_copy.term_bindings
			constraint_bindings := a_flat_copy.constraint_bindings
			highest_specialised_code_indexes := a_flat_copy.highest_specialised_code_indexes
		end

feature -- Access

	term_definition (a_language, a_code: STRING): attached ARCHETYPE_TERM
			-- retrieve the term definition in language `a_language' for code `a_code'
		do
			if specialisation_depth_from_code (a_code) = specialisation_depth then
				Result := term_definitions.item(a_language).item(a_code)
			else
				Result := parent_ontology.term_definition(a_language, a_code)
			end
		end

	constraint_definition (a_language, a_code: STRING): attached ARCHETYPE_TERM
			-- retrieve the constraint definition in language `a_language' for code `a_code'
		do
			if specialisation_depth_from_code (a_code) = specialisation_depth then
				Result := constraint_definitions.item(a_language).item(a_code)
			else
				Result := parent_ontology.constraint_definition(a_language, a_code)
			end
		end

	term_binding (a_terminology, a_code: STRING): attached CODE_PHRASE
			-- retrieve the term definition in language `a_language' for code `a_code'
		do
			if specialisation_depth_from_code (a_code) = specialisation_depth then
				Result := term_bindings.item(a_terminology).item(a_code)
			else
				Result := parent_ontology.term_binding(a_terminology, a_code)
			end
		end

	constraint_binding (a_terminology, a_code: STRING): attached URI
			-- retrieve the constraint definition in language `a_language' for code `a_code'
			-- in form of a string: "service::query"
		do
			if specialisation_depth_from_code (a_code) = specialisation_depth then
				Result := constraint_bindings.item(a_terminology).item(a_code)
			end
		end

	terminology_extract_term (a_terminology, a_code: STRING): attached ARCHETYPE_TERM
			-- true if there is an extract from terminology `a_terminology'
		do
			if terminology_extracts.item(a_terminology).has(a_code) then
				Result := terminology_extracts.item(a_terminology).item(a_code)
			else
				Result := parent_ontology.terminology_extracts.item(a_terminology).item(a_code)
			end
		end

feature -- Status Report

	has_term_code (a_code: STRING): BOOLEAN
			-- Is `a_code' known in this ontology?
		do
			if specialisation_depth_from_code (a_code) = specialisation_depth then
				Result := term_codes.has (a_code)
			elseif parent_ontology /= Void then
				Result := parent_ontology.has_term_code (a_code)
			end
		end

	has_constraint_code (a_code: STRING): BOOLEAN
			-- Is `a_code' known in this ontology?
		do
			if specialisation_depth_from_code (a_code) = specialisation_depth then
				Result := constraint_codes.has (a_code)
			elseif parent_ontology /= Void then
				Result := parent_ontology.has_constraint_code (a_code)
			end
		end

	has_term_definition (a_language, a_code: STRING): BOOLEAN
			-- is `a_code' defined in `a_language' in this ontology?
		do
			if specialisation_depth_from_code (a_code) = specialisation_depth then
				Result := term_definitions.has (a_language) and then term_definitions.item(a_language).has(a_code)
			elseif parent_ontology /= Void then
				Result := parent_ontology.has_term_definition (a_language, a_code)
			end
		end

	has_constraint_definition (a_language, a_code: STRING): BOOLEAN
			-- is `a_code' defined in `a_language' in this ontology?
		do
			if specialisation_depth_from_code (a_code) = specialisation_depth then
				Result := constraint_definitions.has (a_language) and then constraint_definitions.item(a_language).has(a_code)
			elseif parent_ontology /= Void then
				Result := parent_ontology.has_constraint_definition (a_language, a_code)
			end
		end

	has_any_term_binding (a_code: STRING): BOOLEAN
			-- true if there is any term binding for code `a_code'
		local
			p: ARRAYED_LIST_CURSOR
		do
			if specialisation_depth_from_code (a_code) = specialisation_depth then
				p := terminologies_available.cursor
				from
					terminologies_available.start
				until
					terminologies_available.off or Result
				loop
					Result := term_bindings.has(terminologies_available.item) and then
						term_bindings.item(terminologies_available.item).has(a_code)
					terminologies_available.forth
				end
				terminologies_available.go_to (p)
			else
				Result := parent_ontology.has_any_term_binding(a_code)
			end
		end

	has_term_binding (a_terminology, a_code: STRING): BOOLEAN
			-- true if there is a term binding for code `a_code' in `a_terminology'
		do
			if specialisation_depth_from_code (a_code) = specialisation_depth then
				Result := term_bindings.has(a_terminology) and then
					term_bindings.item(a_terminology).has(a_code)
			else
				Result := parent_ontology.has_term_binding(a_terminology, a_code)
			end
		end

	has_any_constraint_binding (a_code: STRING): BOOLEAN
			-- true if there is any constraint binding for code `a_code'
		local
			p: ARRAYED_LIST_CURSOR
		do
			if specialisation_depth_from_code (a_code) = specialisation_depth then
				p := terminologies_available.cursor
				from
					terminologies_available.start
				until
					terminologies_available.off or Result
				loop
					Result := constraint_bindings.has(terminologies_available.item) and then
						constraint_bindings.item(terminologies_available.item).has(a_code)
					terminologies_available.forth
				end
				terminologies_available.go_to (p)
			else
				Result := parent_ontology.has_any_constraint_binding(a_code)
			end
		end

	has_constraint_binding (a_terminology, a_code: STRING): BOOLEAN
			-- true if there is a term binding for code `a_code' in `a_terminology'
		do
			if specialisation_depth_from_code (a_code) = specialisation_depth then
				Result := constraint_bindings.has(a_terminology) and then
						constraint_bindings.item(a_terminology).has(a_code)
			else
				Result := parent_ontology.has_constraint_binding(a_terminology, a_code)
			end
		end

	has_terminology_extract (a_terminology: STRING): BOOLEAN
			-- true if there is an extract from terminology `a_terminology'
		do
			if not terminology_extracts.has(a_terminology) then
				Result := parent_ontology.has_terminology_extract(a_terminology)
			end
		end

	has_terminology_extract_code (a_terminology, a_code: STRING): BOOLEAN
			-- true if there is a term binding for code `a_code' in `a_terminology'
		do
			if specialisation_depth_from_code (a_code) = specialisation_depth then
				Result := terminology_extracts.item(a_terminology).has(a_code)
			else
				Result := parent_ontology.has_terminology_extract_code(a_terminology, a_code)
			end
		end

feature -- Modification

	add_language (a_language: attached STRING)
			-- add a new language to list of languages available
			-- No action if language already exists
		require
			Language_valid: not a_language.is_empty
		local
			term_defs_one_lang, constraint_defs_one_lang, term_defs_orig_lang, constraint_defs_orig_lang: HASH_TABLE[ARCHETYPE_TERM, STRING]
		do
			if not term_definitions.has (a_language) then
				create term_defs_one_lang.make(0)
				term_definitions.put (term_defs_one_lang, a_language)
				if not constraint_definitions.is_empty then
					create constraint_defs_one_lang.make(0)
					constraint_definitions.put (constraint_defs_one_lang, a_language)
				end

				-- if not the primary language, add set of translation place-holder terms in this language
				if attached original_language and then not a_language.is_equal(original_language) then
					-- term definitions
					term_defs_orig_lang := term_definitions.item(original_language)
					from term_defs_orig_lang.start until term_defs_orig_lang.off loop
						term_defs_one_lang.put (term_defs_orig_lang.item_for_iteration.create_translated_term(original_language),
							term_defs_orig_lang.item_for_iteration.code)
						term_defs_orig_lang.forth
					end

					-- do constraint definitions as well
					if not constraint_definitions.is_empty then
						constraint_defs_orig_lang := constraint_definitions.item (original_language)
						from constraint_defs_orig_lang.start until constraint_defs_orig_lang.off loop
							constraint_defs_one_lang.put (constraint_defs_orig_lang.item_for_iteration.create_translated_term (original_language),
								constraint_defs_orig_lang.item_for_iteration.code)
							constraint_defs_orig_lang.forth
						end
					end
				end
			end
		ensure
			Language_added: has_language (a_language)
		end

	initialise_term_definitions (a_term: attached ARCHETYPE_TERM)
			-- set concept of ontology from a term
		do
			term_codes.extend (a_term.code)
			term_definitions.put (create {HASH_TABLE[ARCHETYPE_TERM, STRING]}.make(0), original_language)
			term_definitions.item (original_language).put(a_term, a_term.code)
		ensure
			Term_definitions_populated: term_definitions.item(original_language).item(concept_code) = a_term
		end

	replace_term_binding (a_code_phrase: attached CODE_PHRASE; a_code: attached STRING)
			-- replaces existing a term binding to local code a_code, in group a_terminology
		require
			Local_code_valid: has_term_code(a_code)
			Terminology_valid: terminologies_available.has(a_code_phrase.terminology_id.value)
			Already_added: has_term_binding(a_code_phrase.terminology_id.value, a_code)
		do
			term_bindings.item(a_code_phrase.terminology_id.value).replace(a_code_phrase, a_code)
		ensure
			Binding_added: has_term_binding(a_code_phrase.terminology_id.value, a_code)
		end

	replace_constraint_binding (a_uri: attached URI; a_terminology, a_code: attached STRING)
			-- replaces existing constraint binding to local code a_code, in group a_terminology
		require
			Local_code_valid: has_constraint_code(a_code)
			Terminology_valid: terminologies_available.has(a_terminology)
			Already_added: has_constraint_binding(a_terminology, a_code)
		do
			constraint_bindings.item(a_terminology).replace(a_uri, a_code)
		ensure
			Binding_added: has_constraint_binding(a_terminology, a_code)
		end

feature {ARCHETYPE} -- Modification

	set_parent_ontology (an_ontology: attached ARCHETYPE_ONTOLOGY)
			-- add a connection to the ontology of a parent archetype
		require
			Ontology_valid: an_ontology.specialisation_depth + 1 = specialisation_depth
		do
			parent_ontology := an_ontology
		end

feature -- Factory

	new_non_specialised_term_code: attached STRING
			-- create a new code at level of current top code index at current specialisation depth
			-- code will have form atnnn or at0.n or at0.0.n etc
		local
			new_idx_str: STRING
			i: INTEGER
		do
			if specialisation_depth > 0 then
				create Result.make(0)
				Result.append (Term_code_leader)

				from i := 0 until i = specialisation_depth loop
					Result.append_character('0')
					Result.append_character(Specialisation_separator)
					i := i + 1
				end

				Result.append_integer(highest_term_code_index + 1)
			else
				create Result.make_filled ('0', Term_code_length)
				Result.replace_substring(Term_code_leader, 1, Term_code_leader.count)
				new_idx_str := (highest_term_code_index + 1).out
				Result.replace_substring(new_idx_str, Result.count-new_idx_str.count + 1, Result.count)
			end
		ensure
			Result_exists: specialisation_depth_from_code(Result) = specialisation_depth
		end

	new_specialised_term_code (a_parent_code: attached STRING): attached STRING
			-- Make a new specialised code based on `a_parent_code'
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

			from i := specialisation_depth_from_code(a_parent_code) + 1 until i >= specialisation_depth loop
				Result.append_character(Specialisation_separator)
				Result.append_character('0')
				i := i + 1
			end

			Result.append_character(Specialisation_separator)
			Result.append_integer (highest_specialised_code_indexes [a_parent_code] + 1)
		ensure
			Result_valid: specialised_code_tail (Result).to_integer > 0
		end

	new_non_specialised_constraint_code: attached STRING
			-- create a new code at level of current top code index at current specialisation depth
			-- code will have form acnnn or ac0.n or ac0.0.n etc
		local
			new_idx_str: STRING
			i: INTEGER
		do
			if specialisation_depth > 0 then
				create Result.make(0)
				Result.append (Constraint_code_leader)
				from i := 0 until i = specialisation_depth loop
					Result.append_character('0')
					Result.append_character(Specialisation_separator)
					i := i + 1
				end

				Result.append_integer(highest_constraint_code_index + 1)
			else
				create Result.make_filled ('0', Constraint_code_length)
				Result.replace_substring(Constraint_code_leader, 1, Constraint_code_leader.count)
				new_idx_str := (highest_constraint_code_index + 1).out
				Result.replace_substring(new_idx_str, Result.count-new_idx_str.count+1, Result.count)
			end
		ensure
			Result_exists: specialisation_depth_from_code(Result) = specialisation_depth
		end

	new_specialised_constraint_code (a_parent_code: attached STRING): attached STRING
			-- Make a new specialised code based on `a_parent_code'
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
				i := specialisation_depth_from_code(a_parent_code) + 1
			until
				i >= specialisation_depth
			loop
				Result.append_character(Specialisation_separator)
				Result.append_character('0')
				i := i + 1
			end

			Result.append_character(Specialisation_separator)
			Result.append_integer (highest_specialised_code_indexes [a_parent_code] + 1)
		ensure
			Result_valid: specialised_code_tail (Result).to_integer > 0
		end

	new_concept_code_at_level (at_level: INTEGER): attached STRING
			-- make a new term code for use as the root concept code of an archetype
			-- at level = 0 -> Default_concept_code
			-- at level = 1 -> Default_concept_code.1
			-- at level = 2 -> Default_concept_code.1.1
			-- etc
		require
			level_valid: at_level >= 0
		local
			i: INTEGER
		do
			create Result.make_from_string (default_concept_code)
			from until i >= at_level loop
				Result.append_character (Specialisation_separator)
				Result.append_character ('1')
				i := i + 1
			end
		ensure
			valid: is_valid_concept_code (Result)
			level_set: specialisation_depth_from_code (Result) = at_level
		end

feature -- Conversion

	to_flat: attached FLAT_ARCHETYPE_ONTOLOGY
			-- Create a flat version from this differential ontology.
		do
			if dt_representation = Void then
				synchronise_to_tree
			end
			Result ?= dt_representation.as_object (({FLAT_ARCHETYPE_ONTOLOGY}).type_id, <<original_language.deep_twin, concept_code.deep_twin>>)
		end

	parent_ontology: ARCHETYPE_ONTOLOGY
			-- ARCHETYPE_ONTOLOGY objects of specialisation parent archetype

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
--| The Original Code is differential_archetype_ontology.e.
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
