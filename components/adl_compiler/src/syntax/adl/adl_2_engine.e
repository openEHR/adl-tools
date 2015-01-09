note
	component:   "openEHR ADL Tools"
	description: "[
				 This class knows how to parse an ADL text, and serialise an ARCHETYPE object in ADL 1.4 and ADL 2.
				 Both parsing and serialisation are multi-part, i.e. treat an archetype as a series of sections
				 each headed by keywords (apart from the items in the header section.
				 ]"
	keywords:    "ADL, parse, serialise"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2003- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class ADL_2_ENGINE

inherit
	SHARED_ARCHETYPE_SERIALISERS
		export
			{NONE} all;
			{ANY} archetype_native_serialiser_formats, has_archetype_native_serialiser_format, version_less_than, valid_standard_version, Adl_id_code_version
		end

	ADL_SYNTAX_CONVERTER
		export
			{NONE} all
		end

	SHARED_DT_OBJECT_CONVERTER
		export
			{NONE} all;
			{ANY} deep_copy, deep_twin, is_deep_equal, standard_is_equal
		end

	EXCEPTIONS
		rename
			class_name as exception_class_name
		export
			{NONE} all
		end

create
	make

feature {NONE} -- Initialisation

	make
		do
			create adl_parser.make
			create language_context.make
			create description_context.make
			create definition_context.make
			create rules_context.make
			create terminology_context.make
			create annotations_context.make
		end

feature -- Access

	errors: ERROR_ACCUMULATOR
			-- errors of last parse
		attribute
			create Result.make
		end

feature -- Parsing

	parse (a_text: STRING; aca: ARCH_LIB_ARCHETYPE): detachable ARCHETYPE
			-- parse text as differential archetype. If successful, `archetype' contains the parse structure.
		local
			res_desc: detachable RESOURCE_DESCRIPTION
			annots: detachable RESOURCE_ANNOTATIONS
			orig_lang_trans: detachable LANGUAGE_TRANSLATIONS
			new_diff_arch: AUTHORED_ARCHETYPE
			new_overlay: ARCHETYPE
			tpl_orig_lang: TERMINOLOGY_CODE
		do
			adl_parser.execute (a_text)

			create errors.make
			dt_object_converter.reset

			if adl_parser.syntax_error then
				errors.append (adl_parser.errors)
			else
				------------------- ADL 'language' section (mandatory) ---------------
				-- parse AUTHORED_RESOURCE.original_language & translations
				-- using helper type LANGUAGE_TRANSLATIONS
				if not adl_parser.artefact_type.is_overlay then
					language_context.set_source (adl_parser.language_text, adl_parser.language_text_start_line)
					language_context.parse
					if not language_context.parse_succeeded then
						errors.append (language_context.errors)
					elseif not dt_object_converter.errors.has_errors and
						attached {LANGUAGE_TRANSLATIONS} language_context.tree.as_object (({LANGUAGE_TRANSLATIONS}).type_id, Void) as lt
					then
						orig_lang_trans := lt
					else
						errors.add_error (ec_deserialise_e1, <<({LANGUAGE_TRANSLATIONS}).name>>, generator + ".parse")
						errors.append (dt_object_converter.errors)
					end
				end

				------------------- description section (optional) ---------------
				-- parse AUTHORED_RESOURCE.description
				if not errors.has_errors then
					if attached adl_parser.description_text as dt and then not dt.is_empty then
						description_context.set_source (dt, adl_parser.description_text_start_line)
						description_context.parse
						if not description_context.parse_succeeded then
							errors.append (description_context.errors)
						elseif attached {DT_COMPLEX_OBJECT} description_context.tree as resource_desc then
							-- FIXME: move copyright from RESOURCE_DESCRIPTION.details.copyright to RESOURCE_DESCRIPTION.copyright
							if has_old_copyright (resource_desc) then
								move_copyright (resource_desc)
								errors.add_warning (ec_old_copyright, Void, generator + ".parse")
							end

							if not dt_object_converter.errors.has_errors and
								attached {RESOURCE_DESCRIPTION} resource_desc.as_object (({RESOURCE_DESCRIPTION}).type_id, Void) as rd
							then
								res_desc := rd
							else
								errors.add_error (ec_deserialise_e1, <<({RESOURCE_DESCRIPTION}).name>>, generator + ".parse")
								errors.append (dt_object_converter.errors)
							end
						else
							raise (generator + ".parse: AUTHORED_RESOURCE.description Data Tree missing.")
						end
					else
						description_context.reset
					end
				end

				------------------- definition section (mandatory) ---------------
				-- parse ARCHETYPE.definition
				if not errors.has_errors then
					check attached adl_parser.definition_text as def_text then
						definition_context.set_source (def_text, adl_parser.definition_text_start_line, aca)
					end
					definition_context.parse
					if not definition_context.parse_succeeded then
						errors.append (definition_context.errors)
					end
				end

				------------------- rules section (optional) ---------------
				-- parse ARCHETYPE.rules
				if not errors.has_errors then
					if attached adl_parser.rules_text as att_rules_text and then not att_rules_text.is_empty then
						rules_context.set_source (att_rules_text, adl_parser.rules_text_start_line, aca)
						rules_context.parse
						if not rules_context.parse_succeeded then
							errors.append (rules_context.errors)
						end
					else
						rules_context.reset
					end
				end

				------------------- terminology section (mandatory) ---------------
				-- parse ARCHETYPE.terminology
				if not errors.has_errors then
					check attached adl_parser.terminology_text as att_term_text then
						terminology_context.set_source (att_term_text, adl_parser.terminology_text_start_line)
					end
					terminology_context.parse
					if not terminology_context.parse_succeeded then
						errors.append (terminology_context.errors)
					end
				end

				------------------- annotations section (optional) ---------------
				-- parse AUTHORED_RESOURCE.annotations
				if not errors.has_errors then
					if attached adl_parser.annotations_text as annot_text and then not annot_text.is_empty then
						annotations_context.set_source (annot_text, adl_parser.annotations_text_start_line)
						annotations_context.parse
						if not annotations_context.parse_succeeded then
							errors.append (annotations_context.errors)
						elseif not dt_object_converter.errors.has_errors and
							attached {RESOURCE_ANNOTATIONS} annotations_context.tree.as_object (({RESOURCE_ANNOTATIONS}).type_id, Void) as res_ann
						then
							annots := res_ann
						else
							errors.add_error (ec_deserialise_e1, <<({RESOURCE_ANNOTATIONS}).name>>, generator + ".parse")
							errors.append (dt_object_converter.errors)
						end
					else
						annotations_context.reset
					end
				end

				------------------- build the archetype --------------					
				if not errors.has_errors then
					if attached definition_context.tree as definition and
						attached terminology_context.tree as terminology_tree
					then

						if adl_parser.artefact_type.is_overlay then
							create tpl_orig_lang.default_create
							if attached {ARCHETYPE_TERMINOLOGY}
								terminology_tree.as_object (({ARCHETYPE_TERMINOLOGY}).type_id, <<tpl_orig_lang.code_string, definition.node_id, True>>) as diff_terminology
								and then not dt_object_converter.errors.has_errors
							then
								-- build the archetype
								diff_terminology.set_differential
								create new_overlay.make (
									adl_parser.artefact_type,
									adl_parser.archetype_id,
									definition,
									diff_terminology
								)

								-- add optional standard parts
								if attached adl_parser.parent_archetype_id as att_parent_id then
									new_overlay.set_parent_archetype_id (att_parent_id)
								end

								if adl_parser.is_generated then
									new_overlay.set_is_generated
								end

								if attached rules_context.tree as att_rules_tree then
									new_overlay.set_rules (att_rules_tree)
								end

								new_overlay.rebuild
								Result := new_overlay
							else
								errors.add_error (ec_SAON, Void, generator + ".parse")
								errors.append (dt_object_converter.errors)
							end
						else
							-----------------------------------------------------------------------------------------------
							-- FIXME: needed on ADL 1.4 style archetypes that have 'items' in the ontology
							convert_terminology_to_nested (terminology_tree)  -- perform any version upgrade conversions on terminology
							--
							-----------------------------------------------------------------------------------------------

							if attached orig_lang_trans as olt and then attached {ARCHETYPE_TERMINOLOGY}
								terminology_tree.as_object (({ARCHETYPE_TERMINOLOGY}).type_id, <<olt.original_language.code_string, definition.node_id, True>>) as diff_terminology
								and then not dt_object_converter.errors.has_errors
							then
								-- build the archetype
								check attached res_desc end
								diff_terminology.set_differential
								create new_diff_arch.make (
									adl_parser.artefact_type,
									adl_parser.archetype_id,
									adl_parser.rm_release,
									olt.original_language,
									adl_parser.uid,
									res_desc,
									definition,
									diff_terminology
								)

								-- add optional standard parts
								if attached adl_parser.parent_archetype_id as att_parent_id then
									new_diff_arch.set_parent_archetype_id (att_parent_id)
								end

								if adl_parser.is_generated then
									new_diff_arch.set_is_generated
								end

								if attached rules_context.tree as att_rules_tree then
									new_diff_arch.set_rules (att_rules_tree)
								end

								-- version meta-data
								if valid_standard_version (adl_parser.adl_version) then
									new_diff_arch.set_adl_version (adl_parser.adl_version)
								end

								if valid_standard_version (adl_parser.rm_release) then
									new_diff_arch.set_rm_release (adl_parser.rm_release)
								end

								if adl_parser.is_controlled then
									new_diff_arch.set_is_controlled
								end

								-- other meta-data
								if attached adl_parser.other_metadata as omd and then not omd.is_empty then
									across omd as omd_csr loop
										if attached omd_csr.key as a_key and attached omd_csr.item as an_item then
											new_diff_arch.put_other_metadata_value (a_key, an_item)
										end
									end
								end

								-- descriptive meta-data
								if attached orig_lang_trans.translations as olt_trans then
									new_diff_arch.set_translations (olt_trans)
								end

								if attached annots as att_annots then
									new_diff_arch.set_annotations (att_annots)
								end

								new_diff_arch.rebuild
								Result := new_diff_arch
							else
								errors.add_error (ec_SAON, Void, generator + ".parse")
								errors.append (dt_object_converter.errors)
							end
						end
					end
				end
			end
		ensure
			attached Result implies Result.is_differential
		end

feature -- Validation

	post_parse_151_convert (an_arch: AUTHORED_ARCHETYPE; aca: ARCH_LIB_ARCHETYPE)
		require
			Sub_151_version: version_less_than (an_arch.adl_version, Adl_id_code_version)
		local
			proc: AOM_151_CONVERTER
			flat_parent: detachable AUTHORED_ARCHETYPE
		do
			if attached aca.specialisation_parent as spec_parent and then attached {AUTHORED_ARCHETYPE} spec_parent.flat_archetype as auth_arch then
				flat_parent := auth_arch
 			end

			if attached post_parse_151_converter as pcp then
				proc := pcp
				proc.initialise (an_arch, flat_parent, aca.rm_schema)
			else
				create proc.make (an_arch, flat_parent, aca.rm_schema)
				post_parse_151_converter := proc
			end
			proc.execute
		end

	post_parse_process (an_arch: ARCHETYPE; aca: ARCH_LIB_ARCHETYPE)
		local
			proc: AOM_POST_PARSE_PROCESSOR
		do
			if attached post_parse_processor as pcp then
				proc := pcp
				proc.initialise (an_arch, aca)
			else
				create proc.make (an_arch, aca)
				post_parse_processor := proc
			end
			proc.execute
		end

	phase_1_validate (aca: ARCH_LIB_ARCHETYPE)
		local
			proc: AOM_PHASE_1_VALIDATOR
			flat_parent: detachable ARCHETYPE
			diff_child: ARCHETYPE
		do
			validation_passed := False
			check attached aca.differential_archetype as da then
				diff_child := da
			end
			if attached aca.specialisation_parent as spec_parent then
				flat_parent := spec_parent.flat_archetype
 			end

			if attached phase_1_validator as pv then
				proc := pv
				proc.initialise (diff_child, flat_parent, aca.rm_schema)
			else
				create proc.initialise (diff_child, flat_parent, aca.rm_schema)
				phase_1_validator := proc
			end
			proc.validate
			validation_passed := proc.passed
			errors := proc.errors
		end

	phase_2_validate (aca: ARCH_LIB_ARCHETYPE)
		local
			proc: AOM_PHASE_2_VALIDATOR
			flat_parent: detachable ARCHETYPE
			diff_child: ARCHETYPE
			flat_parent_slot_fillers_index: detachable HASH_TABLE [ARRAYED_SET[STRING], STRING]
		do
			validation_passed := False
			check attached aca.differential_archetype as da then
				diff_child := da
			end
			if attached aca.specialisation_parent as spec_parent then
				flat_parent := spec_parent.flat_archetype
				flat_parent_slot_fillers_index := spec_parent.flat_slot_fillers_index
 			end

			if attached phase_2_validator as pv then
				proc := pv
				proc.initialise (diff_child, flat_parent, flat_parent_slot_fillers_index, aca.rm_schema, aca.display_language)
			else
				create proc.initialise (diff_child, flat_parent, flat_parent_slot_fillers_index, aca.rm_schema, aca.display_language)
				phase_2_validator := proc
			end
			proc.validate
			validation_passed := proc.passed
			errors := proc.errors
		end

	phase_3_validate (aca: ARCH_LIB_ARCHETYPE)
		local
			proc: AOM_PHASE_3_VALIDATOR
			flat_parent: detachable ARCHETYPE
			diff_child: ARCHETYPE
		do
			validation_passed := False
			check attached aca.differential_archetype as da then
				diff_child := da
			end
			if attached aca.specialisation_parent as spec_parent then
				flat_parent := spec_parent.flat_archetype
 			end

			if attached phase_3_validator as pv then
				proc := pv
				proc.initialise (diff_child, flat_parent, aca.flat_archetype, aca.rm_schema)
			else
				create proc.initialise (diff_child, flat_parent, aca.flat_archetype, aca.rm_schema)
				phase_3_validator := proc
			end
			proc.validate
			validation_passed := proc.passed
			errors := proc.errors
		end

	post_compile_process (aca: ARCH_LIB_ARCHETYPE)
		local
			proc: AOM_POST_COMPILE_PROCESSOR
		do
			if attached post_compile_processor as pcp then
				proc := pcp
				proc.initialise (aca)
			else
				create proc.initialise (aca)
				post_compile_processor := proc
			end
			proc.execute
		end

	validation_passed: BOOLEAN
			-- result of last validation

feature -- Serialisation

	serialise (an_archetype: ARCHETYPE; a_format, a_lang: STRING): STRING
			-- serialise current archetype into any semantic multi-part format.
		require
			Language_valid: an_archetype.has_language (a_lang)
			format_valid: has_archetype_native_serialiser_format (a_format)
		local
			lang_serialised, desc_serialised, rules_serialised, annot_serialised, comp_onts_serialised: STRING
			comp_onts_helper: COMPONENT_TERMINOLOGIES_HELPER
			serialiser: ARCHETYPE_MULTIPART_SERIALISER
		do
			create lang_serialised.make_empty
			create desc_serialised.make_empty
			if attached {AUTHORED_ARCHETYPE} an_archetype as auth_arch then
				-- language section
				language_context.set_tree (auth_arch.orig_lang_translations.dt_representation)
				language_context.serialise (a_format, False, False)
				lang_serialised := language_context.serialised

				-- description section
				description_context.set_tree (auth_arch.description.dt_representation)
				description_context.serialise (a_format, False, False)
				desc_serialised := description_context.serialised
			end

			-- definition section
			definition_context.set_tree (an_archetype.definition)
			definition_context.serialise (an_archetype, a_format, a_lang)

			-- rules section
			create rules_serialised.make_empty
			if an_archetype.has_rules then
				rules_context.set_tree (an_archetype.rules)
				rules_context.serialise (a_format)
				rules_serialised := rules_context.serialised
			end

			-- terminology section
			terminology_context.set_tree (an_archetype.terminology.dt_representation)
			terminology_context.serialise (a_format, False, False)

			-- annotations section
			create annot_serialised.make_empty
			if attached {AUTHORED_ARCHETYPE} an_archetype as auth_arch then
				if auth_arch.has_annotations then
					annotations_context.set_tree (auth_arch.annotations.dt_representation)
					annotations_context.serialise (a_format, False, False)
					annot_serialised := annotations_context.serialised
				end
			end

			-- OPT only: component_ontologies section
			create comp_onts_serialised.make_empty
			if attached {OPERATIONAL_TEMPLATE} an_archetype as opt then
				create comp_onts_helper.make
				comp_onts_helper.set_component_terminologies (opt.component_terminologies)
				terminology_context.set_tree (comp_onts_helper.dt_representation)
				terminology_context.serialise (a_format, False, False)
				comp_onts_serialised := terminology_context.serialised
			end

			-- perform the pasting together of pieces to make ADL archetype
			check attached archetype_native_serialiser_for_format (a_format) as ser then
				serialiser := ser
			end
			serialiser.reset
			serialiser.serialise_from_parts (an_archetype, lang_serialised, desc_serialised, definition_context.serialised,
					rules_serialised, terminology_context.serialised, annot_serialised, comp_onts_serialised)

			Result := serialiser.last_result
		end

feature {NONE} -- Implementation

	adl_parser: ADL_2_PARSER
		attribute
			create Result.make
		end

	language_context: ODIN_ENGINE

	description_context: ODIN_ENGINE

	definition_context: CADL_2_ENGINE

	rules_context: ASSERTION_2_ENGINE

	terminology_context: ODIN_ENGINE

	annotations_context: ODIN_ENGINE

	post_parse_151_converter: detachable AOM_151_CONVERTER
		note
			option: stable
		attribute
		end

	post_parse_processor: detachable AOM_POST_PARSE_PROCESSOR
		note
			option: stable
		attribute
		end

	phase_1_validator: detachable AOM_PHASE_1_VALIDATOR
		note
			option: stable
		attribute
		end

	phase_2_validator: detachable AOM_PHASE_2_VALIDATOR
		note
			option: stable
		attribute
		end

	phase_3_validator: detachable AOM_PHASE_3_VALIDATOR
		note
			option: stable
		attribute
		end

	post_compile_processor: detachable AOM_POST_COMPILE_PROCESSOR
		note
			option: stable
		attribute
		end

	original_language_and_translations_from_ontology (a_terminology: ARCHETYPE_TERMINOLOGY): LANGUAGE_TRANSLATIONS
			-- The original language and translations, mined from `a_terminology'.
		do
			create Result.make
			Result.set_original_language_from_string (a_terminology.original_language.code_string)
			across a_terminology.languages_available as langs_csr loop
				if not langs_csr.item.is_equal (a_terminology.original_language.code_string) then
					Result.add_new_translation (langs_csr.item)
				end
			end
		end

end


