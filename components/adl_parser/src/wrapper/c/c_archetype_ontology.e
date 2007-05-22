indexing
	component:   "openEHR Archetype Project"
	description: "[
			 C wrapper for ARCHETYPE_ONTOLOGY (flattened). In this wrapper, the following
			 transformations are made:
			 	- incoming C String arguments are converted to Eiffel Strings
			 	- C String return values are converted from Eiffel STRINGs to C Strings
				- all arguments and return values of complex object types (i.e. types other 
				  than String, Integer, Boolean, Real, Char) are replaced by Integer handles,
				  which are keys to the objects maintained in the single instance of this 
				  class.
			 ]"
	keywords:    "C wrapper"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2005 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class C_ARCHETYPE_ONTOLOGY

inherit
	C_WRAPPER_TOOLS
		export
			{NONE} all
		end

	SHARED_ADL_INTERFACE
		export
			{NONE} all
		end

feature -- Access

	ontology_concept_code: POINTER is
			-- term code of the concept of the ontology as a whole
		local
			obj: ANY
		do
			obj := ontology.concept_code.to_c
			Result := $obj
		end

	ontology_constraint_binding (a_terminology, a_term_code: POINTER): POINTER is
			-- retrieve the constraint definition in language `a_lang' for code `a_term_code'
			-- in form of a string: "service::query"
			-- REQUIRE
			--  terminology_valid: a_terminology /= void and then terminologies_available.has (a_terminology)
			--  term_code_valid: a_term_code /= void and then has_constraint_binding (a_terminology, a_term_code)
			-- ENSURE
			--  result_exists: Result /= void
		local
			c_a_terminology, c_a_term_code: BASE_C_STRING
			obj: ANY
		do
			create c_a_terminology.make_by_pointer (a_terminology)
			create c_a_term_code.make_by_pointer (a_term_code)
			obj := ontology.constraint_binding (c_a_terminology.string, c_a_term_code.string).as_string.to_c
			Result := $obj
		end

	ontology_constraint_codes: POINTER is
			-- list of constraint codes as address of C array
		do
			Result := eif_list_string_to_c_array(ontology.constraint_codes)
		end

	ontology_constraint_codes_count: INTEGER is
			-- SUPPORT FUNCTION SOLELY FOR USE BY JNI LAYER TO DISCOVER ARRAY LENGTH
		do
			Result := ontology.constraint_codes.count
		end

	ontology_constraint_definition (a_lang, a_term_code: POINTER): POINTER is
			-- retrieve the constraint definition in language `a_lang' for code `a_term_code'
			-- output in String dADL form of ARCHETYPE_TERM used in archetypes (same as .out form):
			--  [code] = <key1 = <"value1">, key2 = <"value2">, key3 = <"value3">>
			-- REQUIRE
			--  language_valid: a_lang /= void and then languages_available.has (a_lang)
			--  term_code_valid: a_term_code /= void and then not a_term_code.is_empty
			-- ENSURE
			--  result_exists: Result /= void
		local
			c_a_lang, c_a_term_code: BASE_C_STRING
			obj: ANY
		do
			create c_a_lang.make_by_pointer (a_lang)
			create c_a_term_code.make_by_pointer (a_term_code)
			obj := ontology.constraint_definition(c_a_lang.string, c_a_term_code.string).out.to_c
			Result := $obj
		end

	ontology_languages_available: POINTER is
		do
			Result := eif_list_string_to_c_array(ontology.languages_available)
		end

	ontology_languages_available_count: INTEGER is
			-- SUPPORT FUNCTION SOLELY FOR USE BY JNI LAYER TO DISCOVER ARRAY LENGTH
		do
			Result := ontology.languages_available.count
		end

	ontology_logical_path_for_physical_path (a_path, a_lang: POINTER): POINTER is
			-- generate the logical path in language 'a_lang' for 'a_path'
			-- REQUIRE
			--  a_path_valid: a_path /= void
			--  a_lang_valid: a_lang /= void
			--  not a_lang.is_empty
			-- ENSURE
			--  result_exists: Result /= void
		local
			c_a_path, c_a_lang: BASE_C_STRING
			obj: ANY
		do
			create c_a_path.make_by_pointer (a_path)
			create c_a_lang.make_by_pointer (a_lang)
			obj := ontology.logical_path_for_physical_path(c_a_path.string, c_a_lang.string).to_c
			Result := $obj
		end

--
-- not necessary - supplied in ARCHETYPE & C_ARCHETYPE
--
--	ontology_physical_to_logical_path (a_phys_path, a_lang: POINTER): POINTER is
--			-- generate a logical path in 'a_lang' from a physical path
--		local
--			c_a_phys_path, c_a_lang: BASE_C_STRING
--			obj: ANY
--		do
--			create c_a_phys_path.make_by_pointer (a_phys_path)
--			create c_a_lang.make_by_pointer (a_lang)
--			obj := ontology.physical_to_logical_path(c_a_phys_path.string, c_a_lang.string).to_c
--			Result := $obj
--		end

	ontology_primary_language: POINTER is
			-- get the original language of the archetype
		local
			obj: ANY
		do
			obj := ontology.primary_language.to_c
			Result := $obj
		end

	ontology_specialisation_depth: INTEGER is
			-- depth of this ontology with relation to ontologies in other archetypes
		do
			Result := ontology.specialisation_depth
		end

	ontology_term_attribute_names: POINTER is
			-- the attribute names found in ARCHETYPE_TERM objects
		do
			Result := eif_list_string_to_c_array(ontology.term_attribute_names)
		end

	ontology_term_attribute_names_count: INTEGER is
			-- SUPPORT FUNCTION SOLELY FOR USE BY JNI LAYER TO DISCOVER ARRAY LENGTH
		do
			Result := ontology.term_attribute_names.count
		end

	ontology_term_binding (a_terminology, a_term_code: POINTER): POINTER is
			-- retrieve the term definition in language `a_lang' for code `a_term_code'
			-- Output in format displayable for humans - e.g. "ICD9::M17"
			-- REQUIRE
			--  terminology_valid: a_terminology /= void and then terminologies_available.has (a_terminology)
			--  term_code_valid: a_term_code /= void and then has_term_binding (a_terminology, a_term_code)
			-- ENSURE
			--  result_exists: Result /= void
		local
			c_a_terminology, c_a_term_code: BASE_C_STRING
			obj: ANY
		do
			create c_a_terminology.make_by_pointer (a_terminology)
			create c_a_term_code.make_by_pointer (a_term_code)
			obj := ontology.term_binding(c_a_terminology.string, c_a_term_code.string).as_string.to_c
			Result := $obj
		end

	ontology_term_codes: POINTER is
			-- list of term codes
		do
			Result := eif_list_string_to_c_array(ontology.term_codes)
		end

	ontology_term_codes_count: INTEGER is
			-- SUPPORT FUNCTION SOLELY FOR USE BY JNI LAYER TO DISCOVER ARRAY LENGTH
		do
			Result := ontology.term_codes.count
		end

	ontology_term_definition (a_lang, a_term_code: POINTER): POINTER is
			-- retrieve the term definition in language `a_lang' for code `a_term_code'
			-- output in string form of ARCHETYPE_TERM, i.e.
			--   [code] = <key1 = <"value1">, key2 = <"value2">, key3 = <"value3">>
			-- REQUIRE
			--  language_valid: a_lang /= void and then languages_available.has (a_lang)
			--  term_code_valid: a_term_code /= void and then not a_term_code.is_empty
			-- ENSURE
			--  result_exists: Result /= void
		local
			c_a_lang, c_a_term_code, obj: BASE_C_STRING
			-- obj: ANY
		do
			create c_a_lang.make_by_pointer (a_lang)
			create c_a_term_code.make_by_pointer (a_term_code)

			create obj.make(ontology.term_definition(c_a_lang.string, c_a_term_code.string).out)
			Result := obj.item
		end

	ontology_terminologies_available: POINTER is
			-- array of strings
		do
			Result := eif_list_string_to_c_array(ontology.terminologies_available)
		end

	ontology_terminologies_available_count: INTEGER is
			-- SUPPORT FUNCTION SOLELY FOR USE BY JNI LAYER TO DISCOVER ARRAY LENGTH
		do
			Result := ontology.terminologies_available.count
		end

	ontology_validity_report: POINTER is
		local
			obj: ANY
		do
			obj := ontology.errors.to_c
			Result := $obj
		end

feature -- Conversion

	ontology_substitute_codes (a_str, a_lang: POINTER): POINTER is
			-- substitute all occurrences of archetype codes in 'str'
			-- with their term texts from this ontology, in 'lang'
			-- REQUIRE
			--  str_valid: str /= void and then not str.is_empty
			--  lang_valid: lang /= void and then has_language (lang)
			-- ENSURE
			--  result_exists: Result /= void
		local
			c_a_str, c_a_lang: BASE_C_STRING
			obj: ANY
		do
			create c_a_str.make_by_pointer (a_str)
			create c_a_lang.make_by_pointer (a_lang)
			obj := ontology.substitute_codes(c_a_str.string, c_a_lang.string).to_c
			Result := $obj
		end

feature -- Factory

	ontology_new_constraint_code: POINTER is
			-- get a new constraint code at this level
			-- ENSURE
			--  result_exists: Result /= void and then not Result.is_empty
		local
			obj: ANY
		do
			obj := ontology.new_constraint_code.to_c
			Result := $obj
		end

	ontology_new_non_specialised_term_code: POINTER is
			-- get a new term code at the specialisation depth of this ontology
			-- NOTE: don't use this to get a specialised code;
			-- use `new_specialised_term_code' and supply parent code
			-- ENSURE
			--  result_exists: Result /= void and then not Result.is_empty
		local
			c_str: BASE_C_STRING
		do
			create c_str.make (ontology.new_non_specialised_term_code)
			Result := c_str.item
		end

	ontology_new_specialised_term_code (a_parent_code: POINTER): POINTER is
			-- get a new specialised code based on `a_parent_code' at the depth
			-- of this ontology
			-- REQUIRE
			--  a_parent_code_valid: a_parent_code /= void and then has_term_code (a_parent_code
			--  level_valid: specialisation_depth > 0
			-- ENSURE
			--  result_valid: Result /= void and then not Result.is_empty
		local
			c_a_parent_code: BASE_C_STRING
			obj: ANY
		do
			create c_a_parent_code.make_by_pointer (a_parent_code)
			obj := ontology.new_specialised_term_code(c_a_parent_code.string).to_c
			Result := $obj
		end

feature -- Modification

	ontology_add_constraint_definition (a_lang: POINTER; a_term: POINTER) is
			-- add a new constraint definition for language `a_lang' and
			-- automatically add translation placeholders
			-- a_term must be provided in dADL form of ARCHETYPE_TERM used in archetypes (same as .out form):
			--  [code] = <key1 = <"value1">, key2 = <"value2">, key3 = <"value3">>
			-- REQUIRE
			--  language_valid: a_lang /= void and then has_language (a_lang)
			--  term_valid: a_term /= void and then not has_constraint_code (a_term.code)
			-- ENSURE
			--  has_constraint_code (a_term.code)
		local
			c_a_term, c_a_lang: BASE_C_STRING
		do
			create c_a_term.make_by_pointer (a_term)
			create c_a_lang.make_by_pointer (a_lang)
			ontology.add_constraint_definition (c_a_lang.string, create {ARCHETYPE_TERM}.make_from_string(c_a_term.string))
		end

	ontology_add_language (a_lang: POINTER) is
			-- add a new language to list of languages available
			-- No action if language already exists
			-- REQUIRE
			--  language_valid: a_lang /= void and then not a_lang.is_empty
			-- ENSURE
			--  language_added: languages_available.has (a_lang)
		local
			c_a_lang: BASE_C_STRING
		do
			create c_a_lang.make_by_pointer (a_lang)
			ontology.add_language(c_a_lang.string)
		end

	ontology_add_term_binding (a_code_phrase_str: POINTER; a_term_code: POINTER) is
			-- add a new term binding to local code a_term_code, in the terminology
			-- group corresponding to the a_code_phrase.terminology
			-- a_code_phrase is in string form "ICD9(1989)::M17"
			-- REQUIRE
			--  code_phrase_exists: a_code_phrase /= void
			--  local_code_valid: a_term_code /= void and then has_term_code (a_term_code)
			--  not_already_added: not has_term_binding (a_code_phrase.terminology_id.as_string, a_term_code)
			-- ENSURE
			--  binding_added: has_term_binding (a_code_phrase.terminology_id.as_string, a_term_code)
		local
			c_a_code_phrase_str, c_a_term_code: BASE_C_STRING
			a_code_phrase: CODE_PHRASE
		do
			create c_a_code_phrase_str.make_by_pointer (a_code_phrase_str)
			create c_a_term_code.make_by_pointer (a_term_code)
			create a_code_phrase.make_from_string(c_a_code_phrase_str.string)
			ontology.add_term_binding(a_code_phrase, c_a_term_code.string)
		end

	ontology_add_term_definition (a_lang: POINTER; a_term: POINTER) is
			-- add a new term definition for language `a_lang' and
			-- automatically add translation placeholders
			-- a_term must be provided in dADL form of ARCHETYPE_TERM used in archetypes (same as .out form):
			--  [code] = <key1 = <"value1">, key2 = <"value2">, key3 = <"value3">>
			-- REQUIRE
			--  language_valid: a_lang /= void and then has_language (a_lang)
			--  term_valid: a_term /= void and then not has_term_code (a_term.code)
			-- ENSURE
			--  has_term_code (a_term.code)
		local
			c_a_term, c_a_lang: BASE_C_STRING
		do
			create c_a_term.make_by_pointer (a_term)
			create c_a_lang.make_by_pointer (a_lang)
			ontology.add_term_definition (c_a_lang.string, create {ARCHETYPE_TERM}.make_from_string(c_a_term.string))
		end

	ontology_initialise_term_definitions (a_term: POINTER) is
			-- set concept of ontology from a term
			-- a_term must be provided in dADL form of ARCHETYPE_TERM used in archetypes (same as .out form):
			-- REQUIRE
			--  term_exists: a_term /= void
			-- ENSURE
			--  concept_code_set: concept_code /= void
			--  term_definitions_created: term_definitions /= void and then term_definitions.item (primary_language).item (concept_code) = a_term
		local
			c_a_term: BASE_C_STRING
		do
			create c_a_term.make_by_pointer (a_term)
			ontology.initialise_term_definitions (create {ARCHETYPE_TERM}.make_from_string(c_a_term.string))
		end

	ontology_remove_term_binding (a_term_code, a_terminology: POINTER) is
			-- remove term binding to local code in group a_terminology
			-- REQUIRE
			--  local_code_valid: a_term_code /= void and then has_term_code (a_term_code)
			--  terminology_valid: terminologies_available.has (a_terminology)
			--  has_binding: has_term_binding (a_terminology, a_term_code)
			-- ENSURE
			--  binding_removed: not has_term_binding (a_terminology, a_term_code)
		local
			c_a_term_code, c_a_terminology: BASE_C_STRING
		do
			create c_a_term_code.make_by_pointer (a_term_code)
			create c_a_terminology.make_by_pointer (a_terminology)
			ontology.remove_term_binding(c_a_term_code.string, c_a_terminology.string)
		end

	ontology_replace_constraint_definition (a_lang: POINTER; a_term: POINTER; replace_translations: BOOLEAN) is
			-- replace the definition of an existing constraint code; replace all translations
			-- if flag set and `a_lang' is the primary language
			-- a_term must be provided in dADL form of ARCHETYPE_TERM used in archetypes (same as .out form):
			--  [code] = <key1 = <"value1">, key2 = <"value2">, key3 = <"value3">>
			-- REQUIRE
			--  language_valid: a_lang /= void and then has_language (a_lang)
			--  term_valid: a_term /= void and then has_constraint_code (a_term.code)
		local
			c_a_term, c_a_lang: BASE_C_STRING
		do
			create c_a_term.make_by_pointer (a_term)
			create c_a_lang.make_by_pointer (a_lang)
			ontology.replace_constraint_definition (c_a_lang.string, create {ARCHETYPE_TERM}.make_from_string(c_a_term.string), replace_translations)
		end

	ontology_replace_term_binding (a_code_phrase_str: POINTER; a_term_code: POINTER) is
			-- replaces existing a term binding to local code a_term_code, in group a_terminology
			-- a_code_phrase is in string form "ICD9(1989)::M17"
			-- REQUIRE
			--  code_phrase_exists: a_code_phrase /= void
			--  local_code_valid: a_term_code /= void and then has_term_code (a_term_code)
			--  terminology_valid: terminologies_available.has (a_code_phrase.terminology_id.as_string)
			--  already_added: has_term_binding (a_code_phrase.terminology_id.as_string, a_term_code)
			-- ENSURE
			--  binding_added: has_term_binding (a_code_phrase.terminology_id.as_string, a_term_code)
		local
			c_a_code_phrase_str, c_a_term_code: BASE_C_STRING
			a_code_phrase: CODE_PHRASE
		do
			create c_a_code_phrase_str.make_by_pointer (a_code_phrase_str)
			create c_a_term_code.make_by_pointer (a_term_code)
			create a_code_phrase.make_from_string(c_a_code_phrase_str.string)
			ontology.replace_term_binding(a_code_phrase, c_a_term_code.string)
		end

	ontology_replace_term_definition (a_lang: POINTER; a_term: POINTER; replace_translations: BOOLEAN) is
			-- replace the definition of an existing term code; replace all translations
			-- if flag set and `a_lang' is the primary language
			-- a_term must be provided in dADL form of ARCHETYPE_TERM used in archetypes (same as .out form):
			--  [code] = <key1 = <"value1">, key2 = <"value2">, key3 = <"value3">>
			-- REQUIRE
			--  language_valid: a_lang /= void and then has_language (a_lang)
			--  term_valid: a_term /= void and then has_term_code (a_term.code)
		local
			c_a_term, c_a_lang: BASE_C_STRING
		do
			create c_a_term.make_by_pointer (a_term)
			create c_a_lang.make_by_pointer (a_lang)
			ontology.replace_term_definition (c_a_lang.string, create {ARCHETYPE_TERM}.make_from_string(c_a_term.string), replace_translations)
		end

	ontology_set_primary_language (a_lang: POINTER) is
			-- set the primary language of the ontology
			-- REQUIRE
			--  a_lang_valid: a_lang /= void and then languages_available.has (a_lang)
			-- ENSURE
			--  language_set: primary_language.is_equal (a_lang)
		local
			c_a_lang: BASE_C_STRING
		do
			create c_a_lang.make_by_pointer (a_lang)
			ontology.set_primary_language(c_a_lang.string)
		end

feature -- Status Report

	ontology_has_constraint_binding (a_terminology, a_term_code: POINTER): BOOLEAN is
			-- true if there is a term binding for code `a_term_code' in `a_terminology'
			-- REQUIRE
			--  terminology_valid: a_terminology /= void and then not terminologies_available.is_empty
			--  term_code_valid: a_term_code /= void and then not a_term_code.is_empty
		local
			c_a_terminology, c_a_term_code: BASE_C_STRING
		do
			create c_a_terminology.make_by_pointer (a_terminology)
			create c_a_term_code.make_by_pointer (a_term_code)
			Result := ontology.has_constraint_binding(c_a_terminology.string, c_a_term_code.string)
		end

	ontology_has_constraint_bindings (a_terminology: POINTER): BOOLEAN is
			-- true if there are term bindings `a_terminology'
			-- REQUIRE
			--  terminology_valid: a_terminology /= void and then not terminologies_available.is_empty
		local
			c_a_terminology: BASE_C_STRING
		do
			create c_a_terminology.make_by_pointer (a_terminology)
			Result := ontology.has_constraint_bindings(c_a_terminology.string)
		end

	ontology_has_constraint_code (a_constraint_code: POINTER): BOOLEAN is
			-- true if a_constraint_code is defined in ontology
			-- REQUIRE
			--  constraint_code_valid: a_constraint_code /= void and then not a_constraint_code.is_empty
		local
			c_a_constraint_code: BASE_C_STRING
		do
			create c_a_constraint_code.make_by_pointer (a_constraint_code)
			Result := ontology.has_constraint_code(c_a_constraint_code.string)
		end

	ontology_has_language (a_lang: POINTER): BOOLEAN is
			-- check that `a_language' supported
			-- REQUIRE
			--  language_valid: a_language /= void and then not a_language.is_empty
		local
			c_a_lang: BASE_C_STRING
		do
			create c_a_lang.make_by_pointer (a_lang)
			Result := ontology.has_language(c_a_lang.string)
		end

	ontology_has_path (a_path: POINTER): BOOLEAN is
			-- True if path `a_path' exists in structure
			-- REQUIRE
			--  a_path_valid: a_path /= void and then not a_path.is_empty
		local
			c_a_path: BASE_C_STRING
		do
			create c_a_path.make_by_pointer (a_path)
			Result := ontology.has_path(c_a_path.string)
		end

	ontology_has_term_binding (a_terminology, a_term_code: POINTER): BOOLEAN is
			-- true if there is a term binding for code `a_term_code' in `a_terminology'
			-- REQUIRE
			--  terminology_valid: a_terminology /= void and then not terminologies_available.is_empty
			--  term_code_valid: a_term_code /= void and then not a_term_code.is_empty
		local
			c_a_terminology, c_a_term_code: BASE_C_STRING
		do
			create c_a_terminology.make_by_pointer (a_terminology)
			create c_a_term_code.make_by_pointer (a_term_code)
			Result := ontology.has_term_binding(c_a_terminology.string, c_a_term_code.string)
		end

	ontology_has_term_bindings (a_terminology: POINTER): BOOLEAN is
			-- true if there are term bindings `a_terminology'
			-- REQUIRE
			--  terminology_valid: a_terminology /= void and then not terminologies_available.is_empty
		local
			c_a_terminology: BASE_C_STRING
		do
			create c_a_terminology.make_by_pointer (a_terminology)
			Result := ontology.has_term_bindings(c_a_terminology.string)
		end

	ontology_has_term_code (a_term_code: POINTER): BOOLEAN is
			-- is `a_term_code' known in this ontology
		local
			c_a_term_code: BASE_C_STRING
		do
			create c_a_term_code.make_by_pointer (a_term_code)
			Result := ontology.has_term_code(c_a_term_code.string)
		end

	ontology_has_terminology (a_terminology: POINTER): BOOLEAN is
			-- is `a_terminology' known in this ontology
			-- REQUIRE
			--  terminology_valid: a_terminology /= void and then not a_terminology.is_empty
		local
			c_a_terminology: BASE_C_STRING
		do
			create c_a_terminology.make_by_pointer (a_terminology)
			Result := ontology.has_terminology(c_a_terminology.string)
		end

	ontology_is_valid: BOOLEAN is
			-- true if ontology is valid
			-- ENSURE
			--  validity_report_exists: validity_report /= void
		do
			Result := ontology.is_valid
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
--| The Original Code is adl_interface.e.
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
