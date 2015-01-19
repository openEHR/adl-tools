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

	SHARED_ARCHETYPE_LIBRARIES
		export
			{NONE} all
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

	parse (a_text: STRING; aca: ARCH_LIB_ARCHETYPE): detachable AUTHORED_ARCHETYPE
			-- parse text as differential archetype. If successful, `archetype' contains the parse structure.
		local
			res_desc: detachable RESOURCE_DESCRIPTION
			annots: detachable RESOURCE_ANNOTATIONS
			orig_lang_trans: detachable LANGUAGE_TRANSLATIONS
			new_overlay: TEMPLATE_OVERLAY
			parsed_overlay: PARSED_ARCHETYPE
			parsed_auth_arch: PARSED_AUTHORED_ARCHETYPE
			definition, ovl_definition: C_COMPLEX_OBJECT
			terminology_tree: DT_COMPLEX_OBJECT
			alto: ARCH_LIB_TEMPLATE_OVERLAY
		do
			adl_parser.execute (a_text)

			create errors.make
			dt_object_converter.reset

			if adl_parser.syntax_error then
				errors.append (adl_parser.errors)
			else
				parsed_auth_arch := adl_parser.parsed_auth_arch_ref

				------------------- ADL 'language' section (mandatory) ---------------
				-- parse AUTHORED_RESOURCE.original_language & translations
				-- using helper type LANGUAGE_TRANSLATIONS
				check attached parsed_auth_arch.language_text as lt then
					language_context.set_source (lt, parsed_auth_arch.language_text_start_line)
				end
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

				------------------- description section (optional) ---------------
				-- parse AUTHORED_RESOURCE.description
				if not errors.has_errors then
					if attached parsed_auth_arch.description_text as dt and then not dt.is_empty then
						description_context.set_source (dt, parsed_auth_arch.description_text_start_line)
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
					check attached parsed_auth_arch.definition_text as def_text then
						definition_context.set_source (def_text, parsed_auth_arch.definition_text_start_line, aca)
					end
					definition_context.parse
					if not definition_context.parse_succeeded then
						errors.append (definition_context.errors)
					end
				end

				------------------- rules section (optional) ---------------
				-- parse ARCHETYPE.rules
				if not errors.has_errors then
					if attached parsed_auth_arch.rules_text as att_rules_text and then not att_rules_text.is_empty then
						rules_context.set_source (att_rules_text, parsed_auth_arch.rules_text_start_line, aca)
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
					check attached parsed_auth_arch.terminology_text as att_term_text then
						terminology_context.set_source (att_term_text, parsed_auth_arch.terminology_text_start_line)
					end
					terminology_context.parse
					if not terminology_context.parse_succeeded then
						errors.append (terminology_context.errors)
					end
				end

				------------------- annotations section (optional) ---------------
				-- parse AUTHORED_RESOURCE.annotations
				if not errors.has_errors then
					if attached parsed_auth_arch.annotations_text as annot_text and then not annot_text.is_empty then
						annotations_context.set_source (annot_text, parsed_auth_arch.annotations_text_start_line)
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
					check attached definition_context.tree as dct then
						definition := dct
					end
					check attached terminology_context.tree as tct then
						terminology_tree := tct
					end
					-----------------------------------------------------------------------------------------------
					-- FIXME: needed on ADL 1.4 style archetypes that have 'items' in the ontology
					convert_terminology_to_nested (terminology_tree)  -- perform any version upgrade conversions on terminology
					--
					-----------------------------------------------------------------------------------------------

					check attached orig_lang_trans end
					check attached res_desc end
					if attached {ARCHETYPE_TERMINOLOGY} terminology_tree.as_object (({ARCHETYPE_TERMINOLOGY}).type_id, <<orig_lang_trans.original_language.code_string, definition.node_id, True>>) as arch_diff_terminology
						and then not dt_object_converter.errors.has_errors
					then
						Result := build_authored_archetype (parsed_auth_arch, res_desc, orig_lang_trans, definition, rules_context.tree, arch_diff_terminology, annots)

						-- ======================= deal with templates ======================
						if attached {TEMPLATE} Result as tpl and attached {ARCH_LIB_TEMPLATE} aca as tpl_aca then
							from adl_parser.parsed_template.overlays.start until adl_parser.parsed_template.overlays.off or errors.has_errors loop
								dt_object_converter.reset
								parsed_overlay := adl_parser.parsed_template.overlays.item_for_iteration
								------------------- definition section (mandatory) ---------------
								-- parse ARCHETYPE.definition
								check attached parsed_overlay.definition_text as def_text then
									definition_context.set_source (def_text, parsed_overlay.definition_text_start_line, aca)
								end
								definition_context.parse
								if not definition_context.parse_succeeded then
									errors.append (definition_context.errors)
								else
									------------------- rules section (optional) ---------------
									if attached parsed_overlay.rules_text as att_rules_text and then not att_rules_text.is_empty then
										rules_context.set_source (att_rules_text, parsed_overlay.rules_text_start_line, aca)
										rules_context.parse
										if not rules_context.parse_succeeded then
											errors.append (rules_context.errors)
										end
									else
										rules_context.reset
									end

									if not errors.has_errors then
										------------------- terminology section (mandatory) ---------------
										-- parse ARCHETYPE.terminology
										check attached parsed_overlay.terminology_text as att_term_text then
											terminology_context.set_source (att_term_text, parsed_overlay.terminology_text_start_line)
										end
										terminology_context.parse
										if not terminology_context.parse_succeeded then
											errors.append (terminology_context.errors)
										else
											-- ============== create the overlay ================= --
											if attached {ARCHETYPE_TERMINOLOGY} terminology_tree.as_object (({ARCHETYPE_TERMINOLOGY}).type_id,
												<<tpl.original_language.code_string, definition_context.tree.node_id, True>>) as ovl_diff_terminology
												and then not dt_object_converter.errors.has_errors
											then
												check attached definition_context.tree as dct then
													ovl_definition := dct
												end
												new_overlay := build_overlay (parsed_overlay, ovl_definition, rules_context.tree, ovl_diff_terminology)
												tpl.add_overlay (new_overlay)

												-- now we will create a descriptor
												create alto.make (new_overlay, tpl_aca)
												current_library.put_new_archetype (alto)
											else
												errors.add_error (ec_SAON, Void, generator + ".parse")
												errors.append (dt_object_converter.errors)
											end
										end
									end
								end
								adl_parser.parsed_template.overlays.forth
							end

							-- now create new Archetype descriptors for the overlays

						end
					else
						errors.add_error (ec_SAON, Void, generator + ".parse")
						errors.append (dt_object_converter.errors)
					end
				end
			end
		ensure
			attached Result implies Result.is_differential
		end

	build_authored_archetype (a_parsed_auth_arch: PARSED_AUTHORED_ARCHETYPE;
			a_res_desc: RESOURCE_DESCRIPTION;
			a_orig_lang_trans: LANGUAGE_TRANSLATIONS;
			a_definition: C_COMPLEX_OBJECT;
			a_rules: detachable ARRAYED_LIST [ASSERTION];
			a_diff_terminology: ARCHETYPE_TERMINOLOGY;
			a_annots: detachable RESOURCE_ANNOTATIONS): AUTHORED_ARCHETYPE
		do
			a_diff_terminology.set_differential

			if a_parsed_auth_arch.artefact_type.is_template then
				create {TEMPLATE} Result.make_all (
					a_parsed_auth_arch.artefact_type,
					a_parsed_auth_arch.adl_version,
					a_parsed_auth_arch.rm_release,
					a_parsed_auth_arch.archetype_id,
					a_parsed_auth_arch.parent_archetype_id,
					a_parsed_auth_arch.is_controlled,
					a_parsed_auth_arch.uid,
					a_parsed_auth_arch.other_metadata,
					a_orig_lang_trans.original_language,
					a_orig_lang_trans.translations,
					a_res_desc,
					a_definition,
					a_rules,
					a_diff_terminology,
					a_annots
				)
			else
				create Result.make_all (
					a_parsed_auth_arch.artefact_type,
					a_parsed_auth_arch.adl_version,
					a_parsed_auth_arch.rm_release,
					a_parsed_auth_arch.archetype_id,
					a_parsed_auth_arch.parent_archetype_id,
					a_parsed_auth_arch.is_controlled,
					a_parsed_auth_arch.uid,
					a_parsed_auth_arch.other_metadata,
					a_orig_lang_trans.original_language,
					a_orig_lang_trans.translations,
					a_res_desc,
					a_definition,
					a_rules,
					a_diff_terminology,
					a_annots
				)
			end

			if a_parsed_auth_arch.is_generated then
				Result.set_is_generated
			end

			Result.rebuild
		end

	build_overlay (a_parsed_overlay: PARSED_ARCHETYPE;
			a_definition: C_COMPLEX_OBJECT;
			a_rules: detachable ARRAYED_LIST [ASSERTION];
			a_diff_terminology: ARCHETYPE_TERMINOLOGY): TEMPLATE_OVERLAY
		do
			-- build the archetype
			a_diff_terminology.set_differential
			create Result.make (
				a_parsed_overlay.artefact_type,
				a_parsed_overlay.archetype_id,
				a_definition,
				a_diff_terminology
			)

			-- add optional standard parts
			if attached a_parsed_overlay.parent_archetype_id as att_parent_id then
				Result.set_parent_archetype_id (att_parent_id)
			end

			if a_parsed_overlay.is_generated then
				Result.set_is_generated
			end

			if attached a_rules as att_rules_tree then
				Result.set_rules (att_rules_tree)
			end

			Result.rebuild
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


