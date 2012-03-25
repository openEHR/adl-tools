note
	component:   "openEHR Archetype Project"
	description: "ADL Terminology class"
	keywords:    "archetype, ontology, terminology"

	author:      "Thomas Beale"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2003-2010 Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class FLAT_ARCHETYPE_ONTOLOGY

inherit
	ARCHETYPE_ONTOLOGY

create
	make

feature -- Access

	term_definition (a_language, a_code: STRING): attached ARCHETYPE_TERM
			-- retrieve the term definition in language `a_language' for code `a_code'
		do
			Result := term_definitions.item(a_language).item(a_code)
		end

	constraint_definition (a_language, a_code: STRING): attached ARCHETYPE_TERM
			-- retrieve the constraint definition in language `a_language' for code `a_code'
		do
			Result := constraint_definitions.item(a_language).item(a_code)
		end

	term_binding (a_terminology, a_code: STRING): attached CODE_PHRASE
			-- retrieve the term binding from terminology `a_terminology' for code `a_code'
		do
			Result := term_bindings.item(a_terminology).item(a_code)
		end

	constraint_binding (a_terminology, a_code: STRING): attached URI
			-- retrieve the constraint binding from terminology `a_terminology' for code `a_code'
			-- in form of a string: "service::query"
		do
			Result := constraint_bindings.item(a_terminology).item(a_code)
		end

	terminology_extract_term (a_terminology, a_code: STRING): ARCHETYPE_TERM
			-- true if there is an extract from terminology `a_terminology'
		do
			Result := terminology_extracts.item(a_terminology).item(a_code)
		end

feature -- Status Report

	has_term_code (a_code: STRING): BOOLEAN
			-- is `a_code' known in this ontology
		do
			Result := term_codes.has(a_code)
		end

	has_constraint_code (a_code: STRING): BOOLEAN
			--
		do
			Result := constraint_codes.has(a_code)
		end

	has_term_definition (a_language, a_code: STRING): BOOLEAN
			-- is `a_code' defined in `a_language' in this ontology?
		do
			Result := term_definitions.has (a_language) and then term_definitions.item(a_language).has(a_code)
		end

	has_constraint_definition (a_language, a_code: STRING): BOOLEAN
			-- is `a_code' defined in `a_language' in this ontology?
		do
			Result := constraint_definitions.has (a_language) and then constraint_definitions.item(a_language).has(a_code)
		end

	has_any_term_binding (a_code: STRING): BOOLEAN
			-- true if there is any term binding for code `a_code'
		local
			p: ARRAYED_LIST_CURSOR
		do
			p := terminologies_available.cursor
			from terminologies_available.start until terminologies_available.off or Result loop
				Result := term_bindings.has(terminologies_available.item) and then
					term_bindings.item(terminologies_available.item).has(a_code)
				terminologies_available.forth
			end
			terminologies_available.go_to (p)
		end

	has_term_binding (a_terminology, a_code: STRING): BOOLEAN
			-- true if there is a term binding for code `a_code' in `a_terminology'
		do
			Result := term_bindings.has (a_terminology) and then term_bindings.item (a_terminology).has (a_code)
		end

	has_any_constraint_binding (a_code: STRING): BOOLEAN
			-- true if there is any constraint binding for code `a_code'
		local
			p: ARRAYED_LIST_CURSOR
		do
			p := terminologies_available.cursor
			from terminologies_available.start until terminologies_available.off or Result loop
				Result := constraint_bindings.has(terminologies_available.item) and then
					constraint_bindings.item(terminologies_available.item).has(a_code)
				terminologies_available.forth
			end
			terminologies_available.go_to (p)
		end

	has_constraint_binding (a_terminology, a_code: STRING): BOOLEAN
			-- true if there is a term binding for code `a_code' in `a_terminology'
		do
			Result := constraint_bindings.has(a_terminology) and then constraint_bindings.item(a_terminology).has(a_code)
		end

	has_terminology_extract (a_terminology: STRING): BOOLEAN
			-- true if there is an extract from terminology `a_terminology'
		do
			Result := terminology_extracts.has(a_terminology)
		end

	has_terminology_extract_code (a_terminology, a_code: STRING): BOOLEAN
			-- true if there is a term binding for code `a_code' in `a_terminology'
		do
			Result := terminology_extracts.item(a_terminology).has(a_code)
		end

feature -- Modification

	merge (other: attached FLAT_ARCHETYPE_ONTOLOGY)
			-- append all the codes from the other ontology to this one; used to create the ontology for flat-form archetypes
			-- only languages that exist in the current ontology are merged from `other'
		require
			Other_valid: semantically_conforms_to(other)
		local
			lang_terms: HASH_TABLE [ARCHETYPE_TERM, STRING_8]
			cons_bindings_1: HASH_TABLE [URI, STRING_8]
			term_bindings_1: HASH_TABLE [CODE_PHRASE, STRING_8]
			a_lang, a_terminology: STRING
		do
			-- term definitions
			from other.term_definitions.start until other.term_definitions.off loop
				a_lang := other.term_definitions.key_for_iteration
				if has_language (a_lang) then
					if not term_definitions.has (a_lang) then
						term_definitions.put(create {HASH_TABLE[ARCHETYPE_TERM, STRING]}.make(0), a_lang)
					end
					lang_terms := other.term_definitions.item_for_iteration
					from lang_terms.start until lang_terms.off loop
						if has_term_code (lang_terms.key_for_iteration) then
							replace_term_definition (a_lang, lang_terms.item_for_iteration.deep_twin, False)
						else
							add_term_definition (a_lang, lang_terms.item_for_iteration.deep_twin)
						end
						lang_terms.forth
					end
				end
				other.term_definitions.forth
			end

			-- constraint definitions
			from other.constraint_definitions.start until other.constraint_definitions.off loop
				a_lang := other.constraint_definitions.key_for_iteration
				if has_language (a_lang) then
					if not constraint_definitions.has (a_lang) then
						constraint_definitions.put (create {HASH_TABLE[ARCHETYPE_TERM, STRING]}.make(0), a_lang)
					end
					lang_terms := other.constraint_definitions.item_for_iteration
					from lang_terms.start until lang_terms.off loop
						if has_constraint_code (lang_terms.item_for_iteration.code) then
							replace_constraint_definition (a_lang, lang_terms.item_for_iteration.deep_twin, False)
						else
							add_constraint_definition (a_lang, lang_terms.item_for_iteration.deep_twin)
						end
						lang_terms.forth
					end
				end
				other.constraint_definitions.forth
			end

			-- terminology bindings; first add the bindings to terminologies that are not there at all
			from other.terminologies_available.start until other.terminologies_available.off loop
				a_terminology := other.terminologies_available.item
				if other.has_term_bindings (a_terminology) then
					term_bindings_1 := other.term_bindings_for_terminology (a_terminology)
					from term_bindings_1.start until term_bindings_1.off loop
						add_term_binding (term_bindings_1.item_for_iteration.deep_twin, term_bindings_1.key_for_iteration)
						debug ("flatten")
							io.put_string ("%TONTOLOGY: adding term_binding for " + term_bindings_1.key_for_iteration + "%N")
						end
						term_bindings_1.forth
					end
				end
				other.terminologies_available.forth
			end

			-- constraint bindings; first add the bindings to terminologies that are not there at all
			from other.terminologies_available.start until other.terminologies_available.off loop
				a_terminology := other.terminologies_available.item
				if other.has_constraint_bindings (a_terminology) then
					cons_bindings_1 := other.constraint_bindings_for_terminology (a_terminology)
					from cons_bindings_1.start until cons_bindings_1.off loop
						add_constraint_binding (cons_bindings_1.item_for_iteration.deep_twin, a_terminology, cons_bindings_1.key_for_iteration)
						cons_bindings_1.forth
					end
				end
				other.terminologies_available.forth
			end
		ensure
			-- Terminologies_merged: terminologies_available.is_superset (other.terminologies_available)
		end

feature -- Factory

	to_differential: attached DIFFERENTIAL_ARCHETYPE_ONTOLOGY
			-- Create a differential version from this flat ontology.
		do
			create Result.make_from_flat (Current)
		end

feature {ARCHETYPE_ONTOLOGY} -- Implementation

	remove_inherited_codes
			-- remove all at- and ac- codes inherited from ancestor archetypes
		local
			rm_term_codes: ARRAYED_LIST[STRING]
			rm_constraint_codes: ARRAYED_LIST[STRING]
		do
			create rm_term_codes.make(0)
			create rm_constraint_codes.make(0)
			from term_codes.start until term_codes.off loop
				if specialisation_depth_from_code (term_codes.item) /= specialisation_depth then
					rm_term_codes.extend(term_codes.item)
				end
				term_codes.forth
			end
			from constraint_codes.start until constraint_codes.off loop
				if specialisation_depth_from_code (constraint_codes.item) /= specialisation_depth then
					rm_constraint_codes.extend (constraint_codes.item)
				end
				constraint_codes.forth
			end

			from rm_term_codes.start until rm_term_codes.off loop
				remove_term_definition (rm_term_codes.item)
				rm_term_codes.forth
			end
			from rm_constraint_codes.start until rm_constraint_codes.off loop
				remove_constraint_definition (rm_constraint_codes.item)
				rm_constraint_codes.forth
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
