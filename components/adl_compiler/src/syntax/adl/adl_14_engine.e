note
	component:   "openEHR ADL Tools"
	description: "[
				 This class knows how to parse an ADL text, and serialise an ARCHETYPE object in ADL 1.4 and 1.5.
				 Both parsing and serialisation are multi-part, i.e. treat an archetype as a series of sections
				 each headed by keywords (apart from the items in the header section.
				 ]"
	keywords:    "ADL, parse, serialise"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2003- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class ADL_14_ENGINE

inherit
	SHARED_ARCHETYPE_SERIALISERS
		export
			{NONE} all;
			{ANY} archetype_native_serialiser_formats, has_archetype_native_serialiser_format
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
			create invariant_context.make
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

	parse (a_text: STRING; aca: ARCH_LIB_ARCHETYPE_ITEM): detachable ARCHETYPE
			-- parse text as legacy flat archetype. If successful, `archetype' contains the parse structure.
		local
			res_desc: detachable RESOURCE_DESCRIPTION
			annots: detachable RESOURCE_ANNOTATIONS
			orig_lang_trans: detachable LANGUAGE_TRANSLATIONS
			new_flat_arch: ARCHETYPE
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
				check attached adl_parser.language_text as lt then
					language_context.set_source (lt, adl_parser.language_text_start_line)
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
					if attached adl_parser.description_text as dt and then not dt.is_empty then
						description_context.set_source (dt, adl_parser.description_text_start_line)
						description_context.parse
						if not description_context.parse_succeeded then
							errors.append (description_context.errors)
						elseif attached {DT_COMPLEX_OBJECT} description_context.tree as resource_desc then
							-- FIXME: move copyright from RESOURCE_DESCRIPTION.details.copyright to RESOURCE_DESCRIPTION.copyright
							if has_old_copyright (resource_desc) then
								move_copyright (resource_desc)
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

				------------------- invariant section (optional) ---------------
				-- parse ARCHETYPE.invariants
				if not errors.has_errors then
					if attached adl_parser.invariant_text as inv_text and then not inv_text.is_empty then
						invariant_context.set_source (inv_text, adl_parser.invariant_text_start_line, aca)
						invariant_context.parse
						if not invariant_context.parse_succeeded then
							errors.append (invariant_context.errors)
						end
					else
						invariant_context.reset
					end
				end

				------------------- terminology section (mandatory) ---------------
				-- parse ARCHETYPE.terminology
				if not errors.has_errors then
					check attached adl_parser.terminology_text as term_text then
						terminology_context.set_source (term_text, adl_parser.terminology_text_start_line)
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
						attached terminology_context.tree as term_tree
					then
						-- FIXME: needed on ADL 1.4 style archetypes that have 'items' in the terminology
						convert_terminology_to_nested (term_tree)  -- perform any version upgrade conversions

						if attached orig_lang_trans as olt and then attached {ARCHETYPE_TERMINOLOGY}
							term_tree.as_object (({ARCHETYPE_TERMINOLOGY}).type_id, <<olt.original_language.code_string, definition.node_id, False>>) as flat_terminology
							and then not dt_object_converter.errors.has_errors
						then
							create new_flat_arch.make (
								adl_parser.artefact_type,
								adl_parser.archetype_id,
								olt.original_language,
								adl_parser.uid,
								res_desc,	-- may be Void
								definition,
								flat_terminology
							)

							-- add optional parts
							if attached adl_parser.parent_archetype_id as att_parent_id then
								new_flat_arch.set_parent_archetype_id (att_parent_id)
							end

							if attached adl_parser.adl_version as adl_av then
								new_flat_arch.set_adl_version (adl_av)
							else
								new_flat_arch.set_adl_version (latest_adl_version)
							end

							if adl_parser.is_controlled then
								new_flat_arch.set_is_controlled
							end

							if adl_parser.is_generated then
								new_flat_arch.set_is_generated
							end

							-- other meta-data
							if attached adl_parser.other_metadata as omd and then not omd.is_empty then
								across omd as omd_csr loop
									if attached omd_csr.key as a_key and attached omd_csr.item as an_item then
										new_flat_arch.add_other_metadata_value (a_key, an_item)
									end
								end
							end

							if attached orig_lang_trans.translations as olt_trans then
								new_flat_arch.set_translations (olt_trans)
							end

							if attached invariant_context.tree as inv_tree then
								new_flat_arch.set_rules (inv_tree)
							end

							if attached annots as a then
								new_flat_arch.set_annotations (a)
							end

							new_flat_arch.rebuild
							Result := new_flat_arch
						else
							errors.add_error (ec_SAON, Void, generator + ".parse")
							errors.append (dt_object_converter.errors)
						end
					end
				end
			end
		ensure
			attached Result implies Result.is_flat
		end

feature -- Validation

	post_parse_151_convert (an_arch: ARCHETYPE; aca: ARCH_LIB_ARCHETYPE_ITEM)
		local
			proc: AOM_151_CONVERTER
		do
			if attached post_parse_151_converter as pcp then
				proc := pcp
				proc.initialise (an_arch, aca)
			else
				create proc.make (an_arch, aca)
				post_parse_151_converter := proc
			end
			proc.execute
		end

	post_parse_process (an_arch: ARCHETYPE; aca: ARCH_LIB_ARCHETYPE_ITEM)
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

	phase_1_validate (aca: ARCH_LIB_ARCHETYPE_ITEM)
		local
			proc: AOM_PHASE_1_VALIDATOR
		do
			validation_passed := False
			if attached phase_1_validator as pv then
				proc := pv
				proc.initialise (aca)
			else
				create proc.initialise (aca)
				phase_1_validator := proc
			end
			proc.validate
			validation_passed := proc.passed
			errors := proc.errors
		end

	phase_2_validate (aca: ARCH_LIB_ARCHETYPE_ITEM)
		local
			proc: AOM_PHASE_2_VALIDATOR
		do
			validation_passed := False
			if attached phase_2_validator as pv then
				proc := pv
				proc.initialise (aca)
			else
				create proc.initialise (aca)
				phase_2_validator := proc
			end
			proc.validate
			validation_passed := proc.passed
			errors := proc.errors
		end

	phase_3_validate (aca: ARCH_LIB_ARCHETYPE_ITEM)
		local
			proc: AOM_PHASE_3_VALIDATOR
		do
			validation_passed := False
			if attached phase_3_validator as pv then
				proc := pv
				proc.initialise (aca)
			else
				create proc.initialise (aca)
				phase_3_validator := proc
			end
			proc.validate
			validation_passed := proc.passed
			errors := proc.errors
		end

	post_compile_process (aca: ARCH_LIB_ARCHETYPE_ITEM)
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
			serialiser: ARCHETYPE_MULTIPART_SERIALISER
		do
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
			if an_archetype.has_rules then
				invariant_context.set_tree (an_archetype.rules)
				invariant_context.serialise (a_format)
			end

			-- terminology section
			check attached an_archetype.terminology.dt_representation as dt_ont then
				-- this is a hack which causes terminology section to be output as ODIN with the 'items' attributes
				-- rather than the native nested structure
				convert_terminology_to_unnested (dt_ont)

				terminology_context.set_tree (dt_ont)
				terminology_context.serialise (a_format, False, False)

				-- and this puts the in-memory structure back to native form so things work correctly from here
				convert_terminology_to_nested (dt_ont)
			end

			-- annotations section
			if an_archetype.has_annotations then
				annotations_context.set_tree (an_archetype.annotations.dt_representation)
				annotations_context.serialise (a_format, False, False)
			end

			-- perform the pasting together of pieces to make ADL archetype
			check attached archetype_native_serialiser_for_format (a_format) as ser then
				serialiser := ser
			end
			serialiser.reset
			serialiser.serialise_from_parts (an_archetype, language_context.serialised, description_context.serialised, definition_context.serialised,
				invariant_context.serialised, terminology_context.serialised, annotations_context.serialised, "")

			Result := serialiser.last_result
		end

feature {NONE} -- Implementation

	adl_parser: ADL_14_PARSER
		attribute
			create Result.make
		end

	language_context: ODIN_ENGINE

	description_context: ODIN_ENGINE

	definition_context: CADL_14_ENGINE

	invariant_context: ASSERTION_14_ENGINE

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

	original_language_and_translations_from_terminology (terminology: ARCHETYPE_TERMINOLOGY): LANGUAGE_TRANSLATIONS
			-- The original language and translations, mined from `terminology'.
		do
			create Result.make
			Result.set_original_language_from_string (terminology.original_language)
			across terminology.languages_available as langs_csr loop
				if not langs_csr.item.is_equal (terminology.original_language) then
					Result.add_new_translation (langs_csr.item)
				end
			end
		end

end


