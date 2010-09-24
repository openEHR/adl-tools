note
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

	ARCHETYPE_TERM_CODE_TOOLS
		export
			{NONE} all
		end

	SHARED_C_FACTORY
		export
			{NONE} all
		end

	ADL_SYNTAX_CONVERTER
		export
			{NONE} all
		end

	SHARED_MESSAGE_DB
		export
			{NONE} all
		end

	INTERNAL
		export
			{NONE} all
		end

create
	make

feature {NONE} -- Initialisation

	make
		do
			create language_context.make
			create description_context.make
			create definition_context.make
			create invariant_context.make
			create ontology_context.make
		end

feature -- Access

	errors: attached ERROR_ACCUMULATOR
			-- errors of last parse

feature -- Commands

	parse_differential (text: STRING; an_rm_schema: SCHEMA_ACCESS): DIFFERENTIAL_ARCHETYPE
			-- parse text as differential archetype. If successful, `archetype' contains the parse structure.
		require
			Text_exists: text /= Void
			Rm_schema_available: an_rm_schema /= Void
		do
			rm_schema := an_rm_schema
			Result ?= parse(text, True)
		end

	parse_flat (text: STRING; an_rm_schema: SCHEMA_ACCESS): FLAT_ARCHETYPE
			-- parse text as flat archetype. If successful, `archetype' contains the parse structure.
		require
			Text_exists: text /= Void
			Rm_schema_available: an_rm_schema /= Void
		do
			rm_schema := an_rm_schema
			Result ?= parse(text, False)
		end

	serialise (an_archetype: attached ARCHETYPE; a_format, a_lang: attached STRING): STRING
			-- serialise current archetype into format, using the supplied ontology. For serialising
			-- any form of archetype, the flat-form ontology has to be supplied
		require
			archetype_valid: an_archetype.is_valid
			Language_valid: an_archetype.has_language (a_lang)
			format_valid: has_archetype_serialiser_format (a_format)
		do
			synchronise_from_archetype(an_archetype)
			language_context.serialise(a_format)
			description_context.serialise(a_format)
			definition_context.serialise(a_format, a_lang, an_archetype.ontology)

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

	parse (text: attached STRING; differential_source_flag: BOOLEAN): ARCHETYPE
			-- parse tree. If successful, `archetype' contains the parse
			-- structure. Then validate the tree
		local
			res_desc: RESOURCE_DESCRIPTION
			orig_lang_trans: LANGUAGE_TRANSLATIONS
			differential_ontology: attached DIFFERENTIAL_ARCHETYPE_ONTOLOGY
			flat_ontology: attached FLAT_ARCHETYPE_ONTOLOGY
		do
			create adl_parser.make
			adl_parser.execute(text)

			create errors.make

			if adl_parser.syntax_error then
				errors.append (adl_parser.errors)
			else
				------------------- language section ---------------
				language_context.set_source(adl_parser.language_text, adl_parser.language_text_start_line)
				language_context.parse
				if not language_context.parse_succeeded then
					errors.append (language_context.errors)
				end

				if not errors.has_errors then
					if language_context.tree /= Void then
						orig_lang_trans ?= language_context.tree.as_object (trans_det_id)
					end

					------------------- description section ---------------
					if adl_parser.description_text /= Void and then not adl_parser.description_text.is_empty then
						description_context.set_source(adl_parser.description_text, adl_parser.description_text_start_line)
						description_context.parse
						if not description_context.parse_succeeded then
							errors.append (description_context.errors)
						end
					else
						description_context.reset
					end

					if not errors.has_errors then
						if description_context.tree /= Void then
							res_desc ?= description_context.tree.as_object (res_desc_id)
						end

						------------------- definition section ---------------
						definition_context.set_source(adl_parser.definition_text, adl_parser.definition_text_start_line, differential_source_flag, rm_schema)
						definition_context.parse
						if not definition_context.parse_succeeded then
							errors.append (definition_context.errors)
						else
							------------------- invariant section ---------------
							if adl_parser.invariant_text /= Void and then not adl_parser.invariant_text.is_empty then
								invariant_context.set_source(adl_parser.invariant_text, adl_parser.invariant_text_start_line, differential_source_flag, rm_schema)
								invariant_context.parse
								if not invariant_context.parse_succeeded then
									errors.append (invariant_context.errors)
								end
							else
								invariant_context.reset
							end

							if not errors.has_errors then
								------------------- ontology section ---------------
								ontology_context.set_source (adl_parser.ontology_text, adl_parser.ontology_text_start_line)
								ontology_context.parse

								if not ontology_context.parse_succeeded then
									errors.append(ontology_context.errors)

								elseif attached {C_COMPLEX_OBJECT} definition_context.tree as definition and then attached {ARCHETYPE_ID} adl_parser.archetype_id as id then
									convert_ontology_syntax(ontology_context.tree)  -- perform any version upgrade conversions
									if differential_source_flag then
										if orig_lang_trans /= Void then
											create differential_ontology.make_from_tree (orig_lang_trans.original_language.code_string, ontology_context.tree, definition.node_id)
										else
											create differential_ontology.make_from_tree (Void, ontology_context.tree, definition.node_id)
											orig_lang_trans := original_language_and_translations_from_ontology (differential_ontology)
										end

										if not differential_ontology.errors.is_empty then
											errors.append (differential_ontology.errors)
										else
											create {DIFFERENTIAL_ARCHETYPE} Result.make (
												adl_parser.artefact_type,
												id,
												orig_lang_trans.original_language.code_string,
												res_desc,	-- may be Void
												definition,
												differential_ontology
											)
										end
									else
										if orig_lang_trans /= Void then
											create flat_ontology.make_from_tree (orig_lang_trans.original_language.code_string, ontology_context.tree, definition.node_id)
										else
											create flat_ontology.make_from_tree (Void, ontology_context.tree, definition.node_id)
											orig_lang_trans := original_language_and_translations_from_ontology (flat_ontology)
										end

										if not flat_ontology.errors.is_empty then
											errors.append (flat_ontology.errors)
										else
											create {FLAT_ARCHETYPE} Result.make (
												adl_parser.artefact_type,
												id,
												orig_lang_trans.original_language.code_string,
												res_desc,	-- may be Void
												definition,
												flat_ontology
											)
										end
									end

									if not errors.has_errors then
										if attached {ARCHETYPE_ID} adl_parser.parent_archetype_id as parent_id then
											Result.set_parent_archetype_id (parent_id)
										end

										if adl_parser.adl_version /= Void then
											Result.set_adl_version(adl_parser.adl_version)
										else
											Result.set_adl_version(latest_adl_version)
										end

										if adl_parser.is_controlled then
											Result.set_is_controlled
										end

										if adl_parser.is_generated then
											Result.set_is_generated
										end

										-- if there was no language section, then create the equivalent object
										-- and use it to paste translations into the archetype
										if orig_lang_trans.translations /= Void then
											Result.set_translations(orig_lang_trans.translations)
										end

										if invariant_context.tree /= Void then
											Result.set_invariants(invariant_context.tree)
										end

										Result.rebuild
									end
								end
							end
						end
					end
				end
			end
		end

	adl_parser: ADL_VALIDATOR

	serialiser_mgr: ARCHETYPE_SERIALISER_MGR

	language_context: DADL_ENGINE

	description_context: DADL_ENGINE

	definition_context: CADL_ENGINE

	invariant_context: ASSERTION_ENGINE

	ontology_context: DADL_ENGINE

	rm_schema: SCHEMA_ACCESS

	res_desc_id: INTEGER
			-- dynamic type id of RESOURCE_DESCRIPTION type
		once
			Result := dynamic_type(create {RESOURCE_DESCRIPTION}.default_create)
		end

	trans_det_id: INTEGER
			-- dynamic type id of dummy class containing translations: LIST [TRANSLATION_DETAILS], to
			-- mimic AUTHORED_RESOURCE - only needed until ADL2
		once
			Result := dynamic_type(create {LANGUAGE_TRANSLATIONS}.make)
		end

	synchronise_from_archetype(an_archetype: ARCHETYPE)
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

	original_language_and_translations_from_ontology (ontology: attached ARCHETYPE_ONTOLOGY): attached LANGUAGE_TRANSLATIONS
			-- The original language and translations, mined from `ontology'.
		local
			languages: SEQUENCE [STRING]
		do
			create Result.make
			Result.set_original_language_from_string (ontology.original_language)

			from
				languages := ontology.languages_available
				languages.start
			until
				languages.off
			loop
				if not languages.item.is_equal (ontology.original_language) then
					Result.add_new_translation (languages.item)
				end

				languages.forth
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
