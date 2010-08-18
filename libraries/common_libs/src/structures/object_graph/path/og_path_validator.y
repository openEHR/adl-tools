%{
note
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
			make as make_scanner
		end

	KL_SHARED_EXCEPTIONS
	KL_SHARED_ARGUMENTS

create
	make

%}

%token <STRING> V_ATTRIBUTE_IDENTIFIER V_STRING
%token <STRING> V_LOCAL_TERM_CODE_REF
%token ERR_STRING
%token SYM_MOVABLE_LEADER

%type <OG_PATH_ITEM> path_segment -- call_path_segment
%type <OG_PATH> absolute_path movable_path relative_path

%%

input: movable_path
		{
			output := $1
			accept
		}
	| absolute_path
		{
			output := $1
			accept
		}
	| relative_path
		{
			output := $1
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
			$$ := $2
			$$.set_movable
		}
	;

absolute_path: '/'
		{
			create $$.make_root
			debug("OG_PATH_parse")
				io.put_string("....absolute_path (root); %N")
			end
		}
	| '/' relative_path
		{
			$$ := $2
			$$.set_absolute
			debug("OG_PATH_parse")
				io.put_string("....absolute_path; %N")
			end
		}
	| absolute_path '/' relative_path
		{
			$$ := $1
			$$.append_path($3)
			debug("OG_PATH_parse")
				io.put_string("....absolute_path (appended relative path); %N")
			end
		}
	;

relative_path: path_segment
		{
			create $$.make_relative($1)
		}
	| relative_path '/' path_segment
		{
			$$ := $1
			$$.append_segment($3)
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

	make
			-- Create a new Eiffel parser.
		do
			make_scanner
			make_parser_skeleton
			create indent.make(0)
		end

	execute (in_text: STRING)
		do
			reset
			create error_text.make(0)
			set_input_buffer (new_string_buffer (in_text))
			parse
		end

feature {YY_PARSER_ACTION} -- Basic Operations

	report_error (a_message: STRING)
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

	indent: STRING

end
