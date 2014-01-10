%{
note
	component:   "openEHR ADL Tools"
	description: "Validating parser for Archetype Description Language (ADL) 1.4 archetypes"
	keywords:    "ADL 1.4"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2003- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class ADL_14_PARSER

inherit
	PARSER_VALIDATOR
		rename
			reset as validator_reset,
			make as make_parser_skeleton
		end

	ADL_14_SCANNER
		rename
			make as make_scanner
		redefine
			reset
		end

	ADL_SYNTAX_CONVERTER

	KL_SHARED_EXCEPTIONS
	KL_SHARED_ARGUMENTS

create
	make

%}

%token <STRING> V_IDENTIFIER
%token <STRING> V_ARCHETYPE_ID
%token <STRING> V_CONCEPT_CODE
%token <STRING> V_ODIN_TEXT V_CADL_TEXT V_ASSERTION_TEXT
%token <STRING> V_DOTTED_NUMERIC
%token <STRING> V_VALUE

%token SYM_ARCHETYPE SYM_TEMPLATE SYM_TEMPLATE_OVERLAY SYM_OPERATIONAL_TEMPLATE
%token SYM_CONCEPT SYM_SPECIALIZE
%token SYM_DEFINITION SYM_LANGUAGE SYM_ANNOTATIONS SYM_COMPONENT_ONTOLOGIES
%token SYM_DESCRIPTION SYM_ONTOLOGY SYM_INVARIANT
%token SYM_ADL_VERSION SYM_IS_CONTROLLED SYM_IS_GENERATED
%token SYM_UID

%type <STRING> source_artefact_type
%%

input: archetype
		{
			accept
		}
	| specialised_archetype
		{
			accept
		}
	| error
		{
			abort_with_error (ec_SUNK, Void)
		}
	;

archetype: source_identification 
		arch_concept 
		arch_language 
		arch_description 
		arch_definition 
		arch_invariant
		arch_ontology
		arch_annotations
	;

specialised_archetype: source_identification 
	   	arch_specialisation
		arch_concept 
		arch_language 
		arch_description 
		arch_definition 
		arch_invariant
		arch_ontology
		arch_annotations
	;

source_identification: source_artefact_type arch_meta_data V_ARCHETYPE_ID 
		{
			$1.right_adjust
			create artefact_type.make_from_type_name ($1)
			if archetype_id_parser.valid_id ($3) then
				create archetype_id.make_from_string ($3)
			else
				abort_with_error (ec_SASID, Void)
			end
		}
	| source_artefact_type error
		{
			abort_with_error (ec_SARID, Void)
		}
	;

source_artefact_type: SYM_ARCHETYPE 
		{
			$$ := text
		}
	| SYM_TEMPLATE
		{
			$$ := text
		}
	| SYM_TEMPLATE_OVERLAY
		{
			$$ := text
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
			adl_version := $3
		}
	-- allow for Oids
	| SYM_UID '=' V_DOTTED_NUMERIC
		{
			create uid.make_from_string ($3)
		}
	-- allow for Guids or other kinds of ids
	| SYM_UID '=' V_VALUE
		{
			create uid.make_from_string ($3)
		}
	| SYM_IS_CONTROLLED
		{
			is_controlled := True
		}
	| SYM_IS_GENERATED
		{
			is_generated := True
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
			other_metadata.put ($3, $1)
		}
	| V_IDENTIFIER '=' V_VALUE
		{
			other_metadata.put ($3, $1)
		}
	| V_IDENTIFIER
		{
			other_metadata.put ("true", $1)
		}
	| V_VALUE
		{
			other_metadata.put ("true", $1)
		}
	;

arch_specialisation: SYM_SPECIALIZE V_ARCHETYPE_ID 
		{
			if archetype_id_parser.valid_id ($2) then
				create parent_archetype_id.make_from_string ($2)
			else
				abort_with_error (ec_SASID, Void)
			end
		}
	| SYM_SPECIALIZE error
		{
			abort_with_error (ec_SASID, Void)
		}
	;

arch_concept: -- no concept ok
	| SYM_CONCEPT V_CONCEPT_CODE 
		{
			concept := $2
			debug("ADL_parse")
				io.put_string("concept = " + $2 + "%N")
			end
		}
	| SYM_CONCEPT error
		{
			abort_with_error (ec_SACO, Void)
		}
	;

arch_language: SYM_LANGUAGE V_ODIN_TEXT
		{
			convert_odin_language($2)
			language_text := $2
			merge_errors (converter_status)
		}
	| SYM_LANGUAGE error
		{
			abort_with_error (ec_SALA, Void)
		}
	;

arch_description: SYM_DESCRIPTION V_ODIN_TEXT 
		{ 
			convert_odin_language($2)
			description_text := $2
			merge_errors (converter_status)
		}
	| SYM_DESCRIPTION error
		{
			abort_with_error (ec_SADS, Void)
		}
	;
		

arch_definition:	SYM_DEFINITION V_CADL_TEXT	
		{
			definition_text := $2
		}
	| SYM_DEFINITION error
		{
			abort_with_error (ec_SADF, Void)
		}
	;

arch_invariant: -- no invariant ok
	| SYM_INVARIANT V_ASSERTION_TEXT
		{
			invariant_text := $2
		}
	| SYM_INVARIANT error
		{
			abort_with_error (ec_SAIV, Void)
		}
	;

arch_ontology: SYM_ONTOLOGY V_ODIN_TEXT
		{
			ontology_text := $2
		}
	| SYM_ONTOLOGY error
		{
			abort_with_error (ec_SAON, Void)
		}
	;

arch_annotations: -- no meta-data ok
	| SYM_ANNOTATIONS V_ODIN_TEXT 
		{ 
			annotations_text := $2
		}
	| SYM_ANNOTATIONS error
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
			create other_metadata.make (0)
			create archetype_id.default_create
			create definition_text.make_empty
			create language_text.make_empty
			create ontology_text.make_empty
			create artefact_type.default_create
		end

	reset
		do
			precursor
			validator_reset
			accept
		end

	execute (in_text:STRING)
		do
			reset

			create artefact_type.default_create
			adl_version := Void
			other_metadata.wipe_out
			create archetype_id.default_create
			uid := Void
			parent_archetype_id := Void
			is_controlled := False
			is_generated := False

			language_text.wipe_out
			description_text := Void
			definition_text.wipe_out
			ontology_text.wipe_out
			invariant_text := Void
			annotations_text := Void
			component_ontologies_text := Void

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

	archetype_id: ARCHETYPE_HRID

	other_metadata: HASH_TABLE [STRING, STRING]

	adl_version: detachable STRING

	uid: detachable HIER_OBJECT_ID

	is_controlled: BOOLEAN

	is_generated: BOOLEAN

	artefact_type: ARTEFACT_TYPE

	parent_archetype_id: detachable ARCHETYPE_HRID

	concept: detachable STRING

	language_text: STRING

	description_text: detachable STRING

	definition_text: STRING

	invariant_text: detachable STRING
	
	ontology_text: STRING

	annotations_text: detachable STRING

	component_ontologies_text: detachable STRING

feature {NONE} -- Implementation 

	archetype_id_parser: ARCHETYPE_HRID_PARSER
		once
			create Result.make
		end

end
