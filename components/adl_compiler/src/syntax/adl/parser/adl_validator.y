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

%token SYM_ARCHETYPE SYM_TEMPLATE SYM_TEMPLATE_COMPONENT SYM_OPERATIONAL_TEMPLATE
%token SYM_CONCEPT SYM_SPECIALIZE
%token SYM_DEFINITION SYM_LANGUAGE SYM_ANNOTATIONS SYM_COMPONENT_ONTOLOGIES
%token SYM_DESCRIPTION SYM_ONTOLOGY SYM_INVARIANT
%token SYM_ADL_VERSION SYM_IS_CONTROLLED SYM_IS_GENERATED

%%

input: archetype	
		{
			accept
		}
	| error
		{
			abort
		}
	;

archetype: arch_identification 
	   	arch_specialisation 
		arch_concept 
		arch_language 
		arch_description 
		arch_definition 
		arch_invariant
		arch_ontology
		arch_annotations
	;

arch_identification: arch_head arch_meta_data V_ARCHETYPE_ID 
		{
			if arch_id.valid_id($3) then
				create archetype_id.make_from_string($3)
			end
		}
	| arch_head error
		{
			raise_error
			report_error(create_message_line("SARID", Void))
			abort
		}
	;

arch_head: SYM_ARCHETYPE 
		{
			str := text
			str.right_adjust
			create artefact_type.make_from_type_name(str)
		}
	| SYM_TEMPLATE
		{
			str := text
			str.right_adjust
			create artefact_type.make_from_type_name(str)
		}
	| SYM_TEMPLATE_COMPONENT
		{
			str := text
			str.right_adjust
			create artefact_type.make_from_type_name(str)
		}
	| SYM_OPERATIONAL_TEMPLATE
		{
			str := text
			str.right_adjust
			create artefact_type.make_from_type_name(str)
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
	| SYM_IS_CONTROLLED
		{
			is_controlled := True
		}
	| SYM_IS_GENERATED
		{
			is_generated := True
		}
	;

arch_specialisation: -- empty is ok
	| SYM_SPECIALIZE V_ARCHETYPE_ID 
		{
			if arch_id.valid_id($2) then
				create parent_archetype_id.make_from_string($2)
			end
		}
	| SYM_SPECIALIZE error
		{
			raise_error
			report_error(create_message_line("SASID", Void))
			abort
		}
	;

arch_concept: -- empty is ADL 1.5 
	| SYM_CONCEPT V_LOCAL_TERM_CODE_REF 
		{
			concept := $2
			debug("ADL_parse")
				io.put_string("concept = " + concept + "%N")
			end
		}
	| SYM_CONCEPT error
		{
			raise_error
			report_error(create_message_line("SACO", Void))
			abort
		}
	;

arch_language: 
		{
			raise_error
			report_error(create_message_line("SALAN", Void))
			abort
		}
	| SYM_LANGUAGE V_DADL_TEXT
		{
			convert_dadl_language($2)
			language_text := $2
		}
	| SYM_LANGUAGE error
		{
			raise_error
			report_error(create_message_line("SALA", Void))
			abort
		}
	;

arch_description: -- no meta-data ok
	| SYM_DESCRIPTION V_DADL_TEXT 
		{ 
			convert_dadl_language($2)
			description_text := $2
		}
	| SYM_DESCRIPTION error
		{
			raise_error
			report_error(create_message_line("SADS", Void))
			abort
		}
	;
		

arch_definition:	SYM_DEFINITION V_CADL_TEXT	
		{
			definition_text := $2
		}
	| SYM_DEFINITION error
		{
			raise_error
			report_error(create_message_line("SADF", Void))
			abort
		}
	;

arch_invariant: -- no invariant ok
	| SYM_INVARIANT V_ASSERTION_TEXT
		{
			invariant_text := $2
		}
	| SYM_INVARIANT error
		{
			raise_error
			report_error(create_message_line("SAIV", Void))
			abort
		}
	;

arch_ontology: SYM_ONTOLOGY V_DADL_TEXT
		{
			ontology_text := $2
		}
	| SYM_ONTOLOGY error
		{
			raise_error
			report_error(create_message_line("SAON", Void))
			abort
		}
	;

arch_annotations: -- no meta-data ok
	| SYM_ANNOTATIONS V_DADL_TEXT 
		{ 
			annotations_text := $2
		}
	| SYM_ANNOTATIONS error
		{
			raise_error
			report_error(create_message_line("SAAS", Void))
			abort
		}
	;
		
%%

feature -- Initialization

	make
			-- Create a new Eiffel parser.
		do
			make_scanner
			make_parser_skeleton
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
			add_error_with_location("general_error", <<a_message>>, error_loc)
		end

	abort_with_error (err_code: STRING; args: ARRAY [STRING])
		do
			add_error_with_location(err_code, args, error_loc)
			raise_error
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

	adl_version: STRING

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

feature {NONE} -- Implementation 

	str: STRING

	arch_id: ARCHETYPE_ID
		once
			create Result
		end

end
