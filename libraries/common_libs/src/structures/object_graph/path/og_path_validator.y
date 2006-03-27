%{
indexing
	component:   "openEHR Archetype Project"
	description: "parser for Object Graph paths"
	keywords:    "OG_PATH"
	author:      "Thomas Beale <thomas@deepthought.com.au>"
	support:     "Deep Thought Informatics <support@deepthought.com.au>"
	copyright:   "Copyright (c) 2003, 2004 Deep Thought Informatics Pty Ltd"
	license:     "The Eiffel Forum Open Source License version 1"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class OG_PATH_VALIDATOR

inherit

	YY_PARSER_SKELETON
		rename
			make as make_parser_skeleton
		redefine
			report_error
		end

	OG_PATH_SCANNER
		rename
			make as make_eiffel_scanner
		end

	KL_SHARED_EXCEPTIONS
	KL_SHARED_ARGUMENTS

creation

	make

%}

%token <STRING> V_TYPE_IDENTIFIER V_ATTRIBUTE_IDENTIFIER V_STRING V_FEATURE_CALL_IDENTIFIER
%token <STRING> V_LOCAL_TERM_CODE_REF
%token ERR_STRING
%token SYM_MOVABLE_LEADER

%type <OG_PATH_ITEM> path_segment -- call_path_segment
%type <OG_PATH> absolute_path

%%

input: movable_path
		{
			output := a_path
			accept
		}
	| absolute_path
		{
			output := a_path
			accept
		}
	| relative_path
		{
			output := a_path
			accept
		}
	| error
		{
			debug("OG_PATH_parse")
				io.put_string("....OG_PATH NOT validated%N")
			end
			abort
		}
	;

movable_path: SYM_MOVABLE_LEADER relative_path
		{
			a_path.set_movable
		}
	;

absolute_path: '/' relative_path
		{
			a_path.set_absolute
			debug("OG_PATH_parse")
				io.put_string("....absolute_path; %N")
			end
			$$ := a_path
		}
	;

relative_path: path_segment
		{
			create a_path.make_relative($1)
			$$ := a_path
		}
	| relative_path '/' path_segment
		{
			a_path.append_segment($3)
			$$ := a_path
		}
	;

path_segment: V_ATTRIBUTE_IDENTIFIER V_LOCAL_TERM_CODE_REF
		{
			create $$.make_with_object_id($1, $2)
			debug("OG_PATH_parse")
				io.put_string("...path_segment: " + $1 + "[" + $2 + "]%N")
			end
		}
	| V_ATTRIBUTE_IDENTIFIER
		{
			create $$.make($1)
			debug("OG_PATH_parse")
				io.put_string("...path_segment: " + $1 + "%N")
			end
		}
	;

%%

feature -- Initialization

	make is
			-- Create a new Eiffel parser.
		do
			make_eiffel_scanner
			make_parser_skeleton
			create indent.make(0)
		end

	execute(in_text:STRING) is
		do
			reset
			create error_text.make(0)
			a_path := Void
			set_input_buffer (new_string_buffer (in_text))
			parse
		end

feature {YY_PARSER_ACTION} -- Basic Operations

	report_error (a_message: STRING) is
			-- Print error message.
		do
			error_text.append (a_message)
			error_text.append (" [last token = " + token_name(last_token) + "]")
			error_text.append_character ('%N')
		end

feature -- Access

	error_text: STRING

	output: OG_PATH

feature {NONE} -- Implementation

	a_path: OG_PATH

	indent: STRING

end
