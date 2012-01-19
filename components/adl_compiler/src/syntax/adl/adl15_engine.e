note
	component:   "openEHR Archetype Project"
	description: "[
				 This class knows how to parse an ADL text, and serialise an ARCHETYPE object in ADL 1.4 and 1.5.
				 Both parsing and serialisation are multi-part, i.e. treat an archetype as a series of sections
				 each headed by keywords (apart from the items in the header section.
				 ]"
	keywords:    "ADL, parse, serialise"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2003-2011 Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class ADL15_ENGINE

inherit
	SHARED_ARCHETYPE_SERIALISERS
		export
			{NONE} all;
			{ANY} archetype_native_serialiser_formats, has_archetype_native_serialiser_format
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

			create phase_1_validator
			create phase_2_validator
			create phase_3_validator
		end

feature -- Access

	errors: attached ERROR_ACCUMULATOR
			-- errors of last parse

feature -- Parsing

	parse_differential (a_text: attached STRING; an_rm_schema: attached BMM_SCHEMA): detachable DIFFERENTIAL_ARCHETYPE
			-- parse text as differential archetype. If successful, `archetype' contains the parse structure.
		do
			rm_schema := an_rm_schema
			Result ?= parse (a_text, False)
		end

	parse_legacy_flat (a_text: attached STRING; an_rm_schema: attached BMM_SCHEMA): detachable FLAT_ARCHETYPE
			-- parse text as flat archetype. If successful, `archetype' contains the parse structure.
		do
			rm_schema := an_rm_schema
			Result ?= parse (a_text, True)
		end

feature -- Validation

	phase_1_validate (ara: ARCH_CAT_ARCHETYPE; an_rm_schema: attached BMM_SCHEMA)
		do
			validation_passed := False
			phase_1_validator.initialise (ara, an_rm_schema)
			phase_1_validator.validate
			validation_passed := phase_1_validator.passed
			errors := phase_1_validator.errors
		end

	phase_2_validate (ara: ARCH_CAT_ARCHETYPE; an_rm_schema: attached BMM_SCHEMA)
		do
			validation_passed := False
			phase_2_validator.initialise (ara, an_rm_schema)
			phase_2_validator.validate
			validation_passed := phase_2_validator.passed
			errors := phase_2_validator.errors
		end

	phase_3_validate (ara: ARCH_CAT_ARCHETYPE; an_rm_schema: attached BMM_SCHEMA)
		do
			validation_passed := False
			phase_3_validator.initialise (ara, an_rm_schema)
			phase_3_validator.validate
			validation_passed := phase_3_validator.passed
			errors := phase_3_validator.errors
		end

	phase_1_validator: ARCHETYPE_PHASE_1_VALIDATOR

	phase_2_validator: ARCHETYPE_PHASE_2_VALIDATOR

	phase_3_validator: ARCHETYPE_PHASE_3_VALIDATOR

	validation_passed: BOOLEAN
			-- result of last validation

feature -- Serialisation

	serialise (an_archetype: attached ARCHETYPE; a_format, a_lang: attached STRING): attached STRING
			-- serialise current archetype into any semantic multi-part format.
		require
			archetype_valid: an_archetype.is_valid
			Language_valid: an_archetype.has_language (a_lang)
			format_valid: has_archetype_native_serialiser_format (a_format)
		local
			ont_serialised, comp_onts_serialised: STRING
			comp_onts_helper: COMPONENT_ONTOLOGIES_HELPER
			dt_ont: DT_COMPLEX_OBJECT_NODE
			generate_adl14_ontology: BOOLEAN
			serialiser: ARCHETYPE_MULTIPART_SERIALISER
		do
			-- set a flag for use below, to generate old-style flat archetypes for old tools
			generate_adl14_ontology := attached {FLAT_ARCHETYPE} an_archetype and adl_version_for_flat_output_numeric = 140

			an_archetype.synchronise_adl15

			-- language section
			language_context.set_tree (an_archetype.orig_lang_translations.dt_representation)
			language_context.serialise (a_format, False, False)

			-- description section
			description_context.set_tree (an_archetype.description.dt_representation)
			description_context.serialise (a_format, False, False)

			-- definition section
			definition_context.set_tree (an_archetype.definition)
			definition_context.serialise (an_archetype, a_format, a_lang)

			-- rules section
			if an_archetype.has_invariants then
				invariant_context.set_tree (an_archetype.invariants)
				invariant_context.serialise (a_format)
			end

			-- ontology section
			dt_ont := an_archetype.ontology.dt_representation

	-- this is a hack which causes ontology section to be output as dADL with the 'items' attributes
	-- rather than the native nested structure
	if generate_adl14_ontology then
		convert_ontology_to_unnested (dt_ont)
	end

			ontology_context.set_tree (dt_ont)
			ontology_context.serialise (a_format, False, False)

	-- and this puts the in-memory structure back to native form so things work correctly from here
	if generate_adl14_ontology then
		convert_ontology_to_nested (dt_ont)
	end

			ont_serialised := ontology_context.serialised

			-- OPT only: component_ontologies section
			if attached {OPERATIONAL_TEMPLATE} an_archetype as opt then
				create comp_onts_helper.make
				comp_onts_helper.set_component_ontologies (opt.component_ontologies)
				ontology_context.set_tree (object_converter.object_to_dt (comp_onts_helper))
				ontology_context.serialise (a_format, False, False)
				comp_onts_serialised := ontology_context.serialised
			end

			-- annotations section
			if an_archetype.has_annotations then
				annotations_context.set_tree (an_archetype.annotations.dt_representation)
				annotations_context.serialise (a_format, False, False)
			end

			-- perform the pasting together of pieces to make ADL archetype
			serialiser := archetype_native_serialiser_for_format (a_format)
			serialiser.reset
			serialiser.serialise_from_parts (an_archetype,
				language_context.serialised, description_context.serialised, definition_context.serialised,
				invariant_context.serialised, ont_serialised, annotations_context.serialised, comp_onts_serialised)

			Result := serialiser.last_result
		end

feature {NONE} -- Implementation

	parse (a_text: attached STRING; is_legacy_flat: BOOLEAN): ARCHETYPE
			-- parse text as either a differential source archetype or template, or else a legacy flat. If successful, `archetype' contains the parse
			-- structure. Then validate the tree
		local
			res_desc: detachable RESOURCE_DESCRIPTION
			annots: detachable RESOURCE_ANNOTATIONS
			orig_lang_trans: LANGUAGE_TRANSLATIONS
		do
			create adl_parser.make
			adl_parser.execute(a_text)

			create errors.make

			if adl_parser.syntax_error then
				errors.append (adl_parser.errors)
			else
				------------------- ADL 'language' section (mandatory) ---------------
				-- parse AUTHORED_RESOURCE.original_language & translations
				-- using helper type LANGUAGE_TRANSLATIONS
				language_context.set_source (adl_parser.language_text, adl_parser.language_text_start_line)
				language_context.parse
				if not language_context.parse_succeeded then
					errors.append (language_context.errors)
				elseif not attached {LANGUAGE_TRANSLATIONS} language_context.tree.as_object (({LANGUAGE_TRANSLATIONS}).type_id, Void) as lt then
					errors.add_error ("deserialise_e1", <<({LANGUAGE_TRANSLATIONS}).name>>, generator + ".parse")
				else
					orig_lang_trans := lt
				end

				------------------- description section (optional) ---------------
				-- parse AUTHORED_RESOURCE.description
				if not errors.has_errors then
					if attached adl_parser.description_text and then not adl_parser.description_text.is_empty then
						description_context.set_source (adl_parser.description_text, adl_parser.description_text_start_line)
						description_context.parse
						if not description_context.parse_succeeded then
							errors.append (description_context.errors)
						elseif not attached {RESOURCE_DESCRIPTION} description_context.tree.as_object (({RESOURCE_DESCRIPTION}).type_id, Void) as rd then
							errors.add_error ("deserialise_e1", <<({RESOURCE_DESCRIPTION}).name>>, generator + ".parse")
						else
							res_desc := rd
						end
					else
						description_context.reset
					end
				end

				------------------- definition section (mandatory) ---------------
				-- parse ARCHETYPE.definition
				if not errors.has_errors then
					definition_context.set_source (adl_parser.definition_text, adl_parser.definition_text_start_line, not is_legacy_flat, rm_schema)
					definition_context.parse
					if not definition_context.parse_succeeded then
						errors.append (definition_context.errors)
					end
				end

				------------------- invariant section (optional) ---------------
				-- parse ARCHETYPE.invariants
				if not errors.has_errors then
					if attached adl_parser.invariant_text and then not adl_parser.invariant_text.is_empty then
						invariant_context.set_source (adl_parser.invariant_text, adl_parser.invariant_text_start_line, not is_legacy_flat, rm_schema)
						invariant_context.parse
						if not invariant_context.parse_succeeded then
							errors.append (invariant_context.errors)
						end
					else
						invariant_context.reset
					end
				end

				------------------- ontology section (mandatory) ---------------
				-- parse ARCHETYPE.ontology
				if not errors.has_errors then
					ontology_context.set_source (adl_parser.ontology_text, adl_parser.ontology_text_start_line)
					ontology_context.parse
					if not ontology_context.parse_succeeded then
						errors.append (ontology_context.errors)
					end
				end

				------------------- annotations section (optional) ---------------
				-- parse AUTHORED_RESOURCE.annotations
				if not errors.has_errors then
					if attached adl_parser.annotations_text and then not adl_parser.annotations_text.is_empty then
						annotations_context.set_source (adl_parser.annotations_text, adl_parser.annotations_text_start_line)
						annotations_context.parse
						if not annotations_context.parse_succeeded then
							errors.append (annotations_context.errors)
						elseif not attached {RESOURCE_ANNOTATIONS} annotations_context.tree.as_object (({RESOURCE_ANNOTATIONS}).type_id, Void) as res_ann then
							errors.add_error ("deserialise_e1", <<({RESOURCE_ANNOTATIONS}).name>>, generator + ".parse")
						else
							annots := res_ann
						end
					else
						annotations_context.reset
					end
				end

				------------------- build the archetype --------------					
				if not errors.has_errors then
					if attached {C_COMPLEX_OBJECT} definition_context.tree as definition and attached {ARCHETYPE_ID} adl_parser.archetype_id as id then
						-- FIXME: needed on ADL 1.4 style archetypes that have 'items' in the ontology
						convert_ontology_to_nested (ontology_context.tree)  -- perform any version upgrade conversions

						if is_legacy_flat then
							if attached orig_lang_trans and then attached {FLAT_ARCHETYPE_ONTOLOGY}
								ontology_context.tree.as_object (({FLAT_ARCHETYPE_ONTOLOGY}).type_id, <<orig_lang_trans.original_language.code_string, definition.node_id>>) as flat_ont
							then
								create {FLAT_ARCHETYPE} Result.make (
									adl_parser.artefact_type,
									id,
									orig_lang_trans.original_language,
									res_desc,	-- may be Void
									definition,
									flat_ont
								)
							end
						else
							if attached orig_lang_trans and then attached {DIFFERENTIAL_ARCHETYPE_ONTOLOGY}
								ontology_context.tree.as_object (({DIFFERENTIAL_ARCHETYPE_ONTOLOGY}).type_id, <<orig_lang_trans.original_language.code_string, definition.node_id>>) as diff_ont
							then
								create {DIFFERENTIAL_ARCHETYPE} Result.make (
									adl_parser.artefact_type,
									id,
									orig_lang_trans.original_language,
									res_desc,	-- may be Void
									definition,
									diff_ont
								)
							end
						end

						-- add optional parts
						if attached {ARCHETYPE_ID} adl_parser.parent_archetype_id as parent_id then
							Result.set_parent_archetype_id (parent_id)
						end

						if attached adl_parser.adl_version then
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

	adl_parser: ADL_VALIDATOR

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
