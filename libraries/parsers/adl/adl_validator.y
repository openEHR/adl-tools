%{
note
	component:   "openEHR Archetype Project"
	description: "Validating parser for Archetype Description Language (ADL)"
	keywords:    "ADL"
	author:      "Thomas Beale <thomas@deepthought.com.au>"
	support:     "Deep Thought Informatics <support@deepthought.com.au>"
	copyright:   "Copyright (c) 2003-2005 Deep Thought Informatics Pty Ltd"
	license:     "The Eiffel Forum Open Source License version 1"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class ADL_VALIDATOR

inherit
	YY_PARSER_SKELETON
		rename
			make as make_parser_skeleton
		redefine
			report_error
		end

	ADL_SCANNER
		rename
			make as make_scanner
		end

	ADL_SYNTAX_CONVERTER

	SHARED_MESSAGE_DB
		export
			{NONE} all
		end

	KL_SHARED_EXCEPTIONS
	KL_SHARED_ARGUMENTS

create
	make

%}

%token <STRING> V_IDENTIFIER
%token <STRING> V_ARCHETYPE_ID
%token <STRING> V_LOCAL_TERM_CODE_REF
%token <STRING> V_DADL_TEXT V_CADL_TEXT V_ASSERTION_TEXT
%token <STRING> V_VERSION_STRING
%token <STRING> V_VALUE

%token SYM_ARCHETYPE SYM_TEMPLATE SYM_TEMPLATE_OVERLAY SYM_OPERATIONAL_TEMPLATE
%token SYM_CONCEPT SYM_SPECIALIZE
%token SYM_DEFINITION SYM_LANGUAGE SYM_ANNOTATIONS SYM_COMPONENT_ONTOLOGIES
%token SYM_DESCRIPTION SYM_ONTOLOGY SYM_INVARIANT
%token SYM_ADL_VERSION SYM_IS_CONTROLLED SYM_IS_GENERATED
%token SYM_UID

%type <STRING> source_artefact_type opt_artefact_type
%%

input: archetype
		{
			accept
		}
	| specialised_archetype_or_template
		{
			accept
		}
	| template_overlay
		{
			accept
		}
	| operational_template
		{
			accept
		}
	| adl_14_archetype
		{
			accept
		}
	| specialised_adl_14_archetype
		{
			accept
		}
	| error
		{
			abort
		}
	;

adl_14_archetype: source_identification 
		arch_concept 
		arch_language 
		arch_description 
		arch_definition 
		arch_invariant
		arch_ontology
	;

specialised_adl_14_archetype: source_identification 
	   	arch_specialisation
		arch_concept 
		arch_language 
		arch_description 
		arch_definition 
		arch_invariant
		arch_ontology
	;

archetype: source_identification 
		arch_language 
		arch_description 
		arch_definition 
		arch_invariant
		arch_ontology
		arch_annotations
	;

specialised_archetype_or_template: source_identification 
	   	arch_specialisation
		arch_language 
		arch_description 
		arch_definition 
		arch_invariant
		arch_ontology
		arch_annotations
	;

template_overlay: source_identification 
	   	arch_specialisation
		arch_language 
		arch_definition 
		arch_ontology
	;

operational_template: opt_identification 
		arch_language 
		arch_description 
		arch_definition 
		arch_invariant
		arch_ontology
		arch_annotations
		arch_component_ontologies
	;

source_identification: source_artefact_type arch_meta_data V_ARCHETYPE_ID 
		{
			$1.right_adjust
			create artefact_type.make_from_type_name ($1)
			if arch_id.valid_id ($3) then
				create archetype_id.make_from_string ($3)
			else
				abort_with_error ("SASID", Void)
			end
		}
	| source_artefact_type error
		{
			abort_with_error ("SARID", Void)
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

opt_identification: opt_artefact_type arch_meta_data V_ARCHETYPE_ID 
		{
			$1.right_adjust
			create artefact_type.make_from_type_name ($1)
			if arch_id.valid_id ($3) then
				create archetype_id.make_from_string ($3)
			else
				abort_with_error ("SASID", Void)
			end
		}
	| opt_artefact_type error
		{
			abort_with_error ("SARID", Void)
		}
	;

opt_artefact_type: SYM_OPERATIONAL_TEMPLATE
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

arch_meta_data_item: SYM_ADL_VERSION '=' V_VERSION_STRING
		{
			adl_version := $3
		}
	| SYM_UID '=' V_VALUE
		{
			uid := $3
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
			if arch_id.valid_id ($2) then
				create parent_archetype_id.make_from_string ($2)
			else
				abort_with_error ("SASID", Void)
			end
		}
	| SYM_SPECIALIZE error
		{
			abort_with_error ("SASID", Void)
		}
	;

arch_concept: SYM_CONCEPT V_LOCAL_TERM_CODE_REF 
		{
			concept := $2
			debug("ADL_parse")
				io.put_string("concept = " + concept + "%N")
			end
		}
	| SYM_CONCEPT error
		{
			abort_with_error ("SACO", Void)
		}
	;

arch_language: SYM_LANGUAGE V_DADL_TEXT
		{
			convert_dadl_language($2)
			language_text := $2
		}
	| SYM_LANGUAGE error
		{
			abort_with_error ("SALA", Void)
		}
	;

arch_description: SYM_DESCRIPTION V_DADL_TEXT 
		{ 
			convert_dadl_language($2)
			description_text := $2
		}
	| SYM_DESCRIPTION error
		{
			abort_with_error ("SADS", Void)
		}
	;
		

arch_definition:	SYM_DEFINITION V_CADL_TEXT	
		{
			definition_text := $2
		}
	| SYM_DEFINITION error
		{
			abort_with_error ("SADF", Void)
		}
	;

arch_invariant: -- no invariant ok
	| SYM_INVARIANT V_ASSERTION_TEXT
		{
			invariant_text := $2
		}
	| SYM_INVARIANT error
		{
			abort_with_error ("SAIV", Void)
		}
	;

arch_ontology: SYM_ONTOLOGY V_DADL_TEXT
		{
			ontology_text := $2
		}
	| SYM_ONTOLOGY error
		{
			abort_with_error ("SAON", Void)
		}
	;

arch_annotations: -- no meta-data ok
	| SYM_ANNOTATIONS V_DADL_TEXT 
		{ 
			annotations_text := $2
		}
	| SYM_ANNOTATIONS error
		{
			abort_with_error ("SAAS", Void)
		}
	;
		
arch_component_ontologies: SYM_COMPONENT_ONTOLOGIES V_DADL_TEXT 
		{ 
			component_ontologies_text := $2
		}
	| SYM_COMPONENT_ONTOLOGIES error
		{
			abort_with_error ("SAAS", Void)
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
		end

	execute (in_text:STRING)
		do
			reset
			set_input_buffer (new_string_buffer (in_text))
			parse
		end

feature {YY_PARSER_ACTION} -- Basic Operations

	report_error (a_message: STRING)
			-- Print error message.
		do
			add_error_with_location ("general_error", <<a_message>>, error_loc)
		end

	abort_with_error (err_code: STRING; args: ARRAY [STRING])
		do
			add_error_with_location (err_code, args, error_loc)
			abort
		end

	error_loc: attached STRING
		do
			create Result.make_empty
			if attached {YY_FILE_BUFFER} input_buffer as f_buffer then
				Result.append (f_buffer.file.name + ", ")
			end
			Result.append ("line " + (in_lineno + source_start_line).out)
			Result.append(" [last ADL token = " + token_name(last_token) + "]")
		end

	source_start_line: INTEGER
			-- offset of source in other document, else 0

feature -- Parse Output

	archetype_id: ARCHETYPE_ID

	other_metadata: HASH_TABLE [STRING, STRING]

	adl_version: STRING

	uid: STRING

	is_controlled: BOOLEAN

	is_generated: BOOLEAN

	artefact_type: ARTEFACT_TYPE

	parent_archetype_id: ARCHETYPE_ID

	concept: STRING

	language_text: STRING

	description_text: STRING

	definition_text: STRING

	invariant_text: STRING
	
	ontology_text: STRING

	annotations_text: STRING

	component_ontologies_text: STRING

feature {NONE} -- Implementation 

	str: STRING

	arch_id: ARCHETYPE_ID
		once
			create Result
		end

end
