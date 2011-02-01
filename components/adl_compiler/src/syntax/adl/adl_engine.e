note
	component:   "openEHR Archetype Project"
	description: "[
				 This class knows how to parse an ADL text, and serialise an ARCHETYPE object.
				 ]"
	keywords:    "ADL"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2003-2010 Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
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

	SHARED_DT_OBJECT_CONVERTER
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
			create annotations_context.make
		end

feature -- Access

	errors: attached ERROR_ACCUMULATOR
			-- errors of last parse

feature -- Commands

	parse_differential (a_text: attached STRING; an_rm_schema: attached BMM_SCHEMA): detachable DIFFERENTIAL_ARCHETYPE
			-- parse text as differential archetype. If successful, `archetype' contains the parse structure.
		do
			rm_schema := an_rm_schema
			Result ?= parse (a_text, True)
		end

	parse_flat (a_text: attached STRING; an_rm_schema: attached BMM_SCHEMA): detachable FLAT_ARCHETYPE
			-- parse text as flat archetype. If successful, `archetype' contains the parse structure.
		do
			rm_schema := an_rm_schema
			Result ?= parse (a_text, False)
		end

	serialise (an_archetype: attached ARCHETYPE; a_format, a_lang: attached STRING): attached STRING
			-- serialise current archetype into format, using the supplied ontology. For serialising
			-- any form of archetype, the flat-form ontology has to be supplied
		require
			archetype_valid: an_archetype.is_valid
			Language_valid: an_archetype.has_language (a_lang)
			format_valid: has_archetype_serialiser_format (a_format)
		local
			arch_ont_serialised, comp_onts_serialised: STRING
--			comp_onts: HASH_TABLE [STRING, STRING]
			comp_onts_helper: COMPONENT_ONTOLOGIES_HELPER
--			comp_onts_dt: DT_COMPLEX_OBJECT_NODE
		do
			an_archetype.synchronise

			-- language section
			language_context.set_tree (an_archetype.orig_lang_translations.dt_representation)
			language_context.serialise (a_format)

			-- description section
			description_context.set_tree (an_archetype.description.dt_representation)
			description_context.serialise (a_format)

			-- definition section
			definition_context.set_tree (an_archetype.definition)
			definition_context.serialise (an_archetype, a_format, a_lang)

			-- rules section
			if an_archetype.has_invariants then
				invariant_context.set_tree (an_archetype.invariants)
				invariant_context.serialise (a_format)
			end

			-- ontology section
			ontology_context.set_tree (an_archetype.ontology.dt_representation)
			ontology_context.serialise (a_format)
			arch_ont_serialised := ontology_context.serialised

			-- OPT only: component_ontologies section
			if attached {OPERATIONAL_TEMPLATE} an_archetype as opt then
--				create comp_onts.make (0)
--				from opt.component_ontologies.start until opt.component_ontologies.off loop
--					ontology_context.set_tree (opt.component_ontologies.item_for_iteration.representation)
--					ontology_context.serialise (a_format)
--					comp_onts.put (ontology_context.serialised, opt.component_ontologies.key_for_iteration)
--					opt.component_ontologies.forth
--				end
				create comp_onts_helper.make
				comp_onts_helper.set_component_ontologies (opt.component_ontologies)
				ontology_context.set_tree (object_converter.object_to_dt (comp_onts_helper))
				ontology_context.serialise (a_format)
				comp_onts_serialised := ontology_context.serialised
			end

			-- annotations section
			if an_archetype.has_annotations then
				annotations_context.set_tree (an_archetype.annotations.dt_representation)
				annotations_context.serialise (a_format)
			end

			-- perform the pasting together of pieces to make ADL archetype
			create serialiser_mgr.make (an_archetype, a_format)
			serialiser_mgr.serialise (
				language_context.serialised,
				description_context.serialised,
				definition_context.serialised,
				invariant_context.serialised,
				arch_ont_serialised,
				annotations_context.serialised,
				comp_onts_serialised
			)

			Result := serialiser_mgr.last_result
		end

feature {NONE} -- Implementation

	parse (a_text: attached STRING; differential_source_flag: BOOLEAN): ARCHETYPE
			-- parse tree. If successful, `archetype' contains the parse
			-- structure. Then validate the tree
		local
			res_desc: RESOURCE_DESCRIPTION
			annots: RESOURCE_ANNOTATIONS
			orig_lang_trans: LANGUAGE_TRANSLATIONS
			differential_ontology: attached DIFFERENTIAL_ARCHETYPE_ONTOLOGY
			flat_ontology: attached FLAT_ARCHETYPE_ONTOLOGY
		do
			create adl_parser.make
			adl_parser.execute(a_text)

			create errors.make

			if adl_parser.syntax_error then
				errors.append (adl_parser.errors)
			else
				------------------- language section ---------------
				language_context.set_source (adl_parser.language_text, adl_parser.language_text_start_line)
				language_context.parse
				if not language_context.parse_succeeded then
					errors.append (language_context.errors)
				end

				if not errors.has_errors then
					if language_context.tree /= Void then
						orig_lang_trans ?= language_context.tree.as_object (({LANGUAGE_TRANSLATIONS}).type_id, Void)
					end

					------------------- description section ---------------
					if adl_parser.description_text /= Void and then not adl_parser.description_text.is_empty then
						description_context.set_source (adl_parser.description_text, adl_parser.description_text_start_line)
						description_context.parse
						if not description_context.parse_succeeded then
							errors.append (description_context.errors)
						end
					else
						description_context.reset
					end

					if not errors.has_errors then
						if description_context.tree /= Void then
							res_desc ?= description_context.tree.as_object (({RESOURCE_DESCRIPTION}).type_id, Void)
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

								else
									------------------- annotations section ---------------
									if adl_parser.annotations_text /= Void and then not adl_parser.annotations_text.is_empty then
										annotations_context.set_source(adl_parser.annotations_text, adl_parser.annotations_text_start_line)
										annotations_context.parse
										if not annotations_context.parse_succeeded then
											errors.append (annotations_context.errors)
										end
									else
										annotations_context.reset
									end

									if not errors.has_errors then
										if annotations_context.tree /= Void then
											annots ?= annotations_context.tree.as_object (({RESOURCE_ANNOTATIONS}).type_id, Void)
										end

										------------------- build the archetype --------------					
										if attached {C_COMPLEX_OBJECT} definition_context.tree as definition and then attached {ARCHETYPE_ID} adl_parser.archetype_id as id then
											convert_ontology_syntax (ontology_context.tree)  -- perform any version upgrade conversions
											if differential_source_flag then
												if orig_lang_trans /= Void then
												--	create differential_ontology.make_from_tree (orig_lang_trans.original_language.code_string, ontology_context.tree, definition.node_id)
													differential_ontology ?= ontology_context.tree.as_object (({DIFFERENTIAL_ARCHETYPE_ONTOLOGY}).type_id, <<orig_lang_trans.original_language.code_string, definition.node_id>>)
												else
--													create differential_ontology.make_from_tree (Void, ontology_context.tree, definition.node_id)
--													orig_lang_trans := original_language_and_translations_from_ontology (differential_ontology)
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
												--	create flat_ontology.make_from_tree (orig_lang_trans.original_language.code_string, ontology_context.tree, definition.node_id)
													flat_ontology ?= ontology_context.tree.as_object (({FLAT_ARCHETYPE_ONTOLOGY}).type_id, <<orig_lang_trans.original_language.code_string, definition.node_id>>)
												else
--													create flat_ontology.make_from_tree (Void, ontology_context.tree, definition.node_id)
--													orig_lang_trans := original_language_and_translations_from_ontology (flat_ontology)
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
													Result.set_adl_version (adl_parser.adl_version)
												else
													Result.set_adl_version (latest_adl_version)
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
													Result.set_invariants (invariant_context.tree)
												end

												if attached annots then
													Result.set_annotations (annots)
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
			end
		end

	adl_parser: ADL_VALIDATOR

	serialiser_mgr: ARCHETYPE_SERIALISER_MGR

	language_context: DADL_ENGINE

	description_context: DADL_ENGINE

	definition_context: CADL_ENGINE

	invariant_context: ASSERTION_ENGINE

	ontology_context: DADL_ENGINE

	annotations_context: DADL_ENGINE

	rm_schema: BMM_SCHEMA

	original_language_and_translations_from_ontology (ontology: attached ARCHETYPE_ONTOLOGY): attached LANGUAGE_TRANSLATIONS
			-- The original language and translations, mined from `ontology'.
		local
			languages: SEQUENCE [STRING]
		do
			create Result.make
			Result.set_original_language_from_string (ontology.original_language)

			languages := ontology.languages_available
			from languages.start until languages.off loop
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
