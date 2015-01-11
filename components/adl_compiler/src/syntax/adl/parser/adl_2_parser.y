%{
note
	component:   "openEHR ADL Tools"
	description: "Validating parser for Archetype Description Language (ADL)"
	keywords:    "ADL"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2003- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class ADL_2_PARSER

inherit
	PARSER_VALIDATOR
		rename
			reset as validator_reset,
			make as make_parser_skeleton
		end

	ADL_2_SCANNER
		rename
			make as make_scanner
		redefine
			reset
		end

	ADL_SYNTAX_CONVERTER

create
	make

%}

%token <STRING> V_IDENTIFIER
%token <STRING> V_ARCHETYPE_ID
%token <STRING> V_CONCEPT_CODE
%token <STRING> V_ODIN_TEXT V_CADL_TEXT V_RULES_TEXT
%token <STRING> V_DOTTED_NUMERIC
%token <STRING> V_VALUE

%token SYM_ARCHETYPE SYM_SPECIALIZE SYM_TEMPLATE SYM_TEMPLATE_OVERLAY SYM_OPERATIONAL_TEMPLATE

-------------------------------------------------------------------
--- START legacy ADL 1.4 support
---
%token SYM_CONCEPT 
---
--- END legacy ADL 1.4 support
-------------------------------------------------------------------

%token SYM_DEFINITION SYM_LANGUAGE SYM_ANNOTATIONS SYM_COMPONENT_TERMINOLOGIES
%token SYM_DESCRIPTION SYM_TERMINOLOGY SYM_RULES
%token SYM_ADL_VERSION SYM_RM_RELEASE SYM_IS_CONTROLLED SYM_IS_GENERATED SYM_UID

%%

input: archetype
		{
			accept
		}
	| specialised_archetype
		{
			accept
		}
	| template template_overlays
		{
			accept
		}
	| operational_template
		{
			accept
		}
	| error
		{
			abort_with_error (ec_SUNK, Void)
		}
	;

archetype: archetype_marker arch_meta_data archetype_id 
		arch_language 
		arch_description 
		arch_definition 
		arch_rules
		arch_terminology
		arch_annotations
	;

specialised_archetype: archetype_marker arch_meta_data archetype_id 
	   	arch_specialisation
		arch_language 
		arch_description 
		arch_definition 
		arch_rules
		arch_terminology
		arch_annotations
	;

template: template_marker arch_meta_data archetype_id 
	   	arch_specialisation
		arch_language 
		arch_description 
		arch_definition 
		arch_rules
		arch_terminology
		arch_annotations
	;

template_overlay: template_overlay_marker archetype_id 
	   	arch_specialisation
		arch_definition 
		arch_terminology
	;

template_overlays: -- no overlays ok
		{
		}
	| template_overlay
		{
			parsed_template.add_overlay (parsed_overlay)
		}
	| template_overlays template_overlay
		{
			parsed_template.add_overlay (parsed_overlay)
		}
	; 

operational_template: operational_template_marker arch_meta_data archetype_id 
		arch_language 
		arch_description 
		arch_definition 
		arch_rules
		arch_terminology
		arch_annotations
		arch_component_terminologies
	;

archetype_marker: SYM_ARCHETYPE 
		{
			parsed_auth_arch.reset
			parsed_arch_ref := parsed_auth_arch
			parsed_auth_arch_ref := parsed_auth_arch
			parsed_arch_ref.set_artefact_type (text)
			artefact_type := parsed_arch_ref.artefact_type
		}
	;

template_marker: SYM_TEMPLATE
		{
			parsed_template.reset
			parsed_arch_ref := parsed_template
			parsed_auth_arch := parsed_template
			parsed_arch_ref.set_artefact_type (text)
			artefact_type := parsed_arch_ref.artefact_type
		}
	;

template_overlay_marker: SYM_TEMPLATE_OVERLAY
		{
			parsed_overlay.reset
			parsed_arch_ref := parsed_overlay
			parsed_arch_ref.set_artefact_type (text)
			artefact_type := parsed_arch_ref.artefact_type
		}
	;

operational_template_marker: SYM_OPERATIONAL_TEMPLATE
		{
			parsed_opt.reset
			parsed_arch_ref := parsed_opt
			parsed_auth_arch_ref := parsed_opt
			parsed_arch_ref.set_artefact_type (text)
			artefact_type := parsed_arch_ref.artefact_type
		}
	;

archetype_id: V_ARCHETYPE_ID 
		{
			parsed_arch_ref.set_archetype_id (text)
		}
	;

arch_meta_data: -- empty ok
	| '(' arch_meta_data_items ')'
	;

arch_meta_data_items: arch_meta_data_item
	| arch_meta_data_items ';' arch_meta_data_item
	;

arch_meta_data_item: SYM_ADL_VERSION '=' V_DOTTED_NUMERIC
		{
			parsed_auth_arch_ref.set_adl_version ($3)
		}
	-- allow for Oids
	| SYM_UID '=' V_DOTTED_NUMERIC
		{
			parsed_auth_arch_ref.set_uid ($3)
		}
	-- allow for Guids or other kinds of ids
	| SYM_UID '=' V_VALUE
		{
			parsed_auth_arch_ref.set_uid ($3)
		}
	| SYM_RM_RELEASE '=' V_DOTTED_NUMERIC
		{
			parsed_auth_arch_ref.set_rm_release ($3)
		}
	| SYM_IS_CONTROLLED
		{
			parsed_auth_arch_ref.set_is_controlled
		}
	| SYM_IS_GENERATED
		{
			parsed_arch_ref.set_is_generated
		}
	--
	-- the following could be better done in the scanner by picking up the entire () section after
	-- the archetype id and providing a build data structure to the parser. Currently we match on
	-- V_IDENTIFIERs and V_VALUEs to pick up any sort of alphanum value string, due to how the 
	-- regexes are defined in the scanner (see near top of .l file). However, it works fine, and
	-- is the fastest approach for now.
	--
	| V_IDENTIFIER '=' V_IDENTIFIER
		{
			parsed_auth_arch_ref.put_other_metadata_item ($1, $3)
		}
	| V_IDENTIFIER '=' V_VALUE
		{
			parsed_auth_arch_ref.put_other_metadata_item ($1, $3)
		}
	| V_IDENTIFIER
		{
			parsed_auth_arch_ref.put_other_metadata_item ($1, "true")
		}
	| V_VALUE
		{
			parsed_auth_arch_ref.put_other_metadata_item ($1, "true")
		}
	;

arch_specialisation: SYM_SPECIALIZE V_ARCHETYPE_ID 
		{
			if archetype_id_checker.valid_id_reference ($2) then
				parsed_arch_ref.set_parent_archetype_id ($2)
			else
				abort_with_error (ec_SASID, Void)
			end
		}
	| SYM_SPECIALIZE error
		{
			abort_with_error (ec_SASID, Void)
		}
	;

arch_language: SYM_LANGUAGE V_ODIN_TEXT
		{
			convert_odin_language ($2)
			parsed_auth_arch_ref.set_language_text ($2)
			merge_errors (converter_status)
		}
	| SYM_LANGUAGE error
		{
			abort_with_error (ec_SALA, Void)
		}
	;

arch_description: SYM_DESCRIPTION V_ODIN_TEXT 
		{ 
			convert_odin_language ($2)
			parsed_auth_arch_ref.set_description_text  ($2)
			merge_errors (converter_status)
		}
	| SYM_DESCRIPTION error
		{
			abort_with_error (ec_SADS, Void)
		}
	;
		
arch_definition: SYM_DEFINITION V_CADL_TEXT	
		{
			parsed_arch_ref.set_definition_text ($2)
		}
	| SYM_DEFINITION error
		{
			abort_with_error (ec_SADF, Void)
		}
	;

arch_rules: -- no rules ok
	| SYM_RULES V_RULES_TEXT
		{
			parsed_arch_ref.set_rules_text ($2)
		}
	| SYM_RULES error
		{
			abort_with_error (ec_SAIV, Void)
		}
	;

arch_terminology: SYM_TERMINOLOGY V_ODIN_TEXT
		{
			parsed_arch_ref.set_terminology_text ($2)
		}
	| SYM_TERMINOLOGY error
		{
			abort_with_error (ec_SAON, Void)
		}
	;

arch_annotations: -- no annotations ok
	| SYM_ANNOTATIONS V_ODIN_TEXT 
		{ 
			parsed_auth_arch.set_annotations_text ($2)
		}
	| SYM_ANNOTATIONS error
		{
			abort_with_error (ec_SAAN, Void)
		}
	;
		
arch_component_terminologies: SYM_COMPONENT_TERMINOLOGIES V_ODIN_TEXT 
		{ 
			parsed_opt.set_component_terminologies_text ($2)
		}
	| SYM_COMPONENT_TERMINOLOGIES error
		{
			abort_with_error (ec_SAAN, Void)
		}
	;
		
%%

feature -- Initialization

	make
			-- Create a new Eiffel parser.
		do
			make_scanner
			make_parser_skeleton
			create artefact_type.default_create
			create parsed_auth_arch.make
			parsed_arch_ref := parsed_auth_arch
			parsed_auth_arch_ref := parsed_auth_arch
			create parsed_template.make
			create parsed_overlay.make
			create parsed_opt.make
		end

	reset
		do
			precursor
			validator_reset
			create artefact_type.default_create
			accept
		end

	execute (in_text:STRING)
		do
			reset
			set_input_buffer (new_string_buffer (in_text))
			parse
		end

feature {YY_PARSER_ACTION} -- Basic Operations

	error_loc: STRING
		do
			create Result.make_empty
			if attached {YY_FILE_BUFFER} input_buffer as f_buffer then
				Result.append (f_buffer.file.name + ", ")
			end
			Result.append ("line " + (in_lineno + source_start_line).out)
			Result.append(" [last ADL token = " + token_name(last_token) + "]")
		end

feature -- Parse Output

	artefact_type: ARTEFACT_TYPE

	parsed_arch_ref: PARSED_ARCHETYPE

	parsed_auth_arch_ref: PARSED_AUTHORED_ARCHETYPE

feature {NONE} -- Implementation 

	parsed_auth_arch: PARSED_AUTHORED_ARCHETYPE

	parsed_overlay: PARSED_ARCHETYPE

	parsed_template: PARSED_TEMPLATE

	parsed_opt: PARSED_OPT

	set_archetype_id (an_arch_id: STRING)
		do
			if archetype_id_checker.valid_id (an_arch_id) then
				parsed_arch_ref.set_archetype_id (an_arch_id)
			else
				abort_with_error (ec_SASID, Void)
			end
		end

end
