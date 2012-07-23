note
	component:   "openEHR Archetype Project"
	description: "[
				 Archetype ontology section class for differential, i.e. source form archetypes. The routines in this class
				 correspond to the needs of creating and editing an archetype, i.e. modifying the contents.
				 ]"
	keywords:    "archetype, ontology, terminology"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.com>"
	copyright:   "Copyright (c) 2003-2009 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"
	void_safety: "initial"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class DIFFERENTIAL_ARCHETYPE_ONTOLOGY

inherit
	ARCHETYPE_ONTOLOGY

create
	make, make_empty, make_from_flat

feature -- Initialisation

	make_empty (an_original_lang: STRING; at_specialisation_depth: INTEGER)
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

	make_from_flat (a_flat: FLAT_ARCHETYPE_ONTOLOGY)
			-- create from a flat ontology
		local
			a_flat_copy: FLAT_ARCHETYPE_ONTOLOGY
		do
			a_flat_copy := a_flat.deep_twin
			a_flat_copy.remove_inherited_codes

			concept_code := a_flat_copy.concept_code
			original_language := a_flat.original_language.twin

			term_definitions := a_flat_copy.term_definitions
			constraint_definitions := a_flat_copy.constraint_definitions

			term_codes := a_flat_copy.term_codes
			constraint_codes := a_flat_copy.constraint_codes

			term_bindings := a_flat_copy.term_bindings
			constraint_bindings := a_flat_copy.constraint_bindings
			highest_specialised_code_indexes := a_flat_copy.highest_specialised_code_indexes
		end

feature -- Modification

	add_language (a_language: STRING)
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

	initialise_term_definitions (a_term: ARCHETYPE_TERM)
			-- set concept of ontology from a term
		do
			term_codes.extend (a_term.code)
			term_definitions.put (create {HASH_TABLE[ARCHETYPE_TERM, STRING]}.make (0), original_language)
			term_definitions.item (original_language).put (a_term, a_term.code)
		ensure
			Term_definitions_populated: term_definitions.item (original_language).item(concept_code) = a_term
		end

	replace_term_definition_item (a_language: STRING; a_code, a_key, a_value: STRING)
			-- replace a field denoted by `a_key' of the term with code `a_code'
		require
			Language_valid: has_language (a_language)
			Term_valid: has_term_code (a_code)
		local
			term: ARCHETYPE_TERM
		do
			term := term_definitions.item (a_language).item (a_code)
			if term.has_key (a_key) then
				term.set_value (a_value, a_key)
			end
		end

	replace_constraint_definition_item (a_language: STRING; a_code, a_key, a_value: STRING)
			-- replace a field denoted by `a_key' of the term with code `a_code'
		require
			Language_valid: has_language (a_language)
			Term_valid: has_constraint_code (a_code)
		local
			term: ARCHETYPE_TERM
		do
			term := constraint_definitions.item (a_language).item (a_code)
			if term.has_key (a_key) then
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

feature -- Factory

	new_non_specialised_term_code: STRING
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

	new_specialised_term_code (a_parent_code: STRING): STRING
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

	new_non_specialised_constraint_code: STRING
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

	new_specialised_constraint_code (a_parent_code: STRING): STRING
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

	new_concept_code_at_level (at_level: INTEGER): STRING
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

	to_flat: detachable FLAT_ARCHETYPE_ONTOLOGY
			-- Create a flat version from this differential ontology.
		do
			if dt_representation = Void then
				synchronise_to_tree
			end
			if attached {FLAT_ARCHETYPE_ONTOLOGY} dt_representation.as_object (({FLAT_ARCHETYPE_ONTOLOGY}).type_id, <<original_language.deep_twin, concept_code.deep_twin>>) as ont then
				Result := ont
			end
		end

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
