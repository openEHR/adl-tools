indexing
	component:   "openEHR Archetype Project"
	description: "[
				 This class knows how to parse an ADL text, and serialise an ARCHETYPE object.
				 ]"
	keywords:    "ADL"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2003-2007 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class ADL_ENGINE

inherit
	SHARED_ARCHETYPE_SERIALISERS
		export
			{NONE} all;
			{ANY} archetype_serialiser_formats, has_archetype_serialiser_format
		end

	SHARED_APPLICATION_CONTEXT
		export
			{NONE} all
		end

	SHARED_C_FACTORY
		export
			{NONE} all
		end

	INTERNAL
		export
			{NONE} all
		end

creation
	make

feature -- Initialisation

	make is
		do
			create language_context.make
			create description_context.make
			create definition_context.make
			create invariant_context.make
			create ontology_context.make
		end

feature -- Access

	parse_error_text: STRING
			-- errors of last parse

feature -- Commands

	parse (text: STRING; is_differential_source: BOOLEAN): ARCHETYPE is
			-- parse tree. If successful, `archetype' contains the parse
			-- structure. Then validate the tree
		require
			Text_exists: text /= Void
		local
			language_error, description_error, invariant_error: BOOLEAN
			res_desc: RESOURCE_DESCRIPTION
			orig_lang_trans: LANGUAGE_TRANSLATIONS
			arch_ont: ARCHETYPE_ONTOLOGY
			orig_lang: STRING
		do
			create adl_parser.make
			adl_parser.execute(text)
			if adl_parser.syntax_error then
				parse_error_text := adl_parser.error_text
			else
				------------------- language section ---------------
				if adl_parser.language_text /= Void and then not adl_parser.language_text.is_empty then
					language_context.set_source(adl_parser.language_text, adl_parser.language_text_start_line)
					language_context.parse
					if not language_context.parse_succeeded then
						parse_error_text := language_context.parse_error_text
						language_error := True
					end
				else
					language_context.reset
				end
				if not language_error then
					if language_context.tree /= Void then
						orig_lang_trans ?= language_context.tree.as_object (trans_det_id)
					end

					------------------- description section ---------------
					if adl_parser.description_text /= Void and then not adl_parser.description_text.is_empty then
						description_context.set_source(adl_parser.description_text, adl_parser.description_text_start_line)
						description_context.parse
						if not description_context.parse_succeeded then
							parse_error_text := description_context.parse_error_text
							description_error := True
						end
					else
						description_context.reset
					end
					if not description_error then
						if description_context.tree /= Void then
							res_desc ?= description_context.tree.as_object (res_desc_id)
						end

						------------------- definition section ---------------
						definition_context.set_source(adl_parser.definition_text, adl_parser.definition_text_start_line)
						definition_context.parse
						if not definition_context.parse_succeeded then
							parse_error_text := definition_context.parse_error_text
						else
							------------------- invariant section ---------------
							if adl_parser.invariant_text /= Void and then not adl_parser.invariant_text.is_empty then
								invariant_context.set_source(adl_parser.invariant_text, adl_parser.invariant_text_start_line)
								invariant_context.parse
								if not invariant_context.parse_succeeded then
									parse_error_text := invariant_context.parse_error_text
									invariant_error := True
								end
							else
								invariant_context.reset
							end

							if not invariant_error then
								------------------- ontology section ---------------
								ontology_context.set_source(adl_parser.ontology_text, adl_parser.ontology_text_start_line)
								ontology_context.parse
								if not ontology_context.parse_succeeded then
									parse_error_text := ontology_context.parse_error_text
								else
									-- if there was a language section, get the original language
									if orig_lang_trans /= Void then
										orig_lang := orig_lang_trans.original_language.code_string
									end

									-- this call will forgive the first argument being Void for the moment
									create arch_ont.make_from_tree(orig_lang, ontology_context.tree, adl_parser.concept)

									-- if there was no language section, mine the original_language and translations from the ontology
									if orig_lang_trans = Void then
										orig_lang := arch_ont.primary_language
										create orig_lang_trans.make
										orig_lang_trans.set_original_language_from_string(orig_lang)
										from
											arch_ont.languages_available.start
										until
											arch_ont.languages_available.off
										loop
											if not arch_ont.languages_available.item.is_equal(arch_ont.primary_language) then
												orig_lang_trans.add_new_translation (arch_ont.languages_available.item)
											end
											arch_ont.languages_available.forth
										end
									end

									create Result.make(
										adl_parser.archetype_id,
										adl_parser.concept,
										orig_lang,
										res_desc,	-- may be Void
										definition_context.tree,
										arch_ont
									)
									if adl_parser.adl_version /= Void then
										Result.set_adl_version(adl_parser.adl_version)
									else
										Result.set_adl_version(Current_adl_version)
									end

									if is_differential_source then
										Result.set_differential
									end

									if adl_parser.is_controlled then
										Result.set_is_controlled
									end
									if adl_parser.parent_archetype_id /= Void then
										Result.set_parent_archetype_id(adl_parser.parent_archetype_id)
									end

									-- if there was no language section, then create the equivalent object
									-- and use it to paste translations into the archetype
									if orig_lang_trans.translations /= Void then
										Result.set_translations(orig_lang_trans.translations)
									end

									if invariant_context.tree /= Void then
										Result.set_invariants(invariant_context.tree)
									end
								end
							end
						end
					end
				end
			end
		end

	serialise(an_archetype: ARCHETYPE; a_format: STRING):STRING is
			-- serialise current archetype into format
		require
			Format_valid: has_archetype_serialiser_format(a_format)
			Archetype_valid: an_archetype.is_valid
		do
			synchronise_from_archetype(an_archetype)
			language_context.serialise(a_format)
			description_context.serialise(a_format)
			definition_context.serialise(a_format, an_archetype.ontology)

			if an_archetype.has_invariants then
				invariant_context.serialise(a_format)
			end

			ontology_context.serialise(a_format)

			create serialiser_mgr.make(an_archetype, a_format, an_archetype.ontology)
			serialiser_mgr.serialise(
				language_context.serialised,
				description_context.serialised,
				definition_context.serialised,
				invariant_context.serialised,
				ontology_context.serialised)
			Result := serialiser_mgr.last_result
		end

feature {NONE} -- Implementation

	adl_parser: ADL_VALIDATOR

	serialiser_mgr: ARCHETYPE_SERIALISER_MGR

	language_context: DADL_ENGINE

	description_context: DADL_ENGINE

	definition_context: CADL_ENGINE

	invariant_context: ASSERTION_ENGINE

	ontology_context: DADL_ENGINE

	res_desc_id: INTEGER is
			-- dynamic type id of RESOURCE_DESCRIPTION type
		once
			Result := dynamic_type(create {RESOURCE_DESCRIPTION}.default_create)
		end

	trans_det_id: INTEGER is
			-- dynamic type id of dummy class containing translations: LIST [TRANSLATION_DETAILS], to
			-- mimic AUTHORED_RESOURCE - only needed until ADL2
		once
			Result := dynamic_type(create {LANGUAGE_TRANSLATIONS}.make)
		end

	synchronise_from_archetype(an_archetype: ARCHETYPE) is
			-- synchronise archetype to processing engines
		do
			an_archetype.synchronise

		-- FIXME: currently translations and original_language from archetype are serialsed together	
		--	if archetype.translations /= Void then
				language_context.set_tree (an_archetype.orig_lang_translations.dt_representation)
		--	end
			description_context.set_tree(an_archetype.description.dt_representation)
			definition_context.set_tree(an_archetype.definition)
			if an_archetype.has_invariants then
				invariant_context.set_tree(an_archetype.invariants)
			end
			ontology_context.set_tree(an_archetype.ontology.representation)
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
--| The Original Code is adl_engine.e.
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
