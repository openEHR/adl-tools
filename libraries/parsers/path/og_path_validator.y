%{
note
	component:   "openEHR Archetype Project"
	description: "parser for Object Graph paths"
	keywords:    "OG_PATH"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2003- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "See notice at bottom of class"

class OG_PATH_VALIDATOR

inherit
	PARSER_VALIDATOR
		rename
			reset as validator_reset,
			make as make_parser_skeleton
		redefine
			output
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
%token <STRING> V_LOCAL_TERM_CODE_REF V_ANY_PREDICATE
%token ERR_STRING
%token SYM_MOVABLE_LEADER

%type <OG_PATH_ITEM> path_segment
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
			$2.set_movable
			$$ := $2
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
			$2.set_absolute
			$$ := $2
			debug("OG_PATH_parse")
				io.put_string("....absolute_path; %N")
			end
		}
	| absolute_path '/' relative_path
		{
			$1.append_path($3)
			$$ := $1
			debug("OG_PATH_parse")
				io.put_string("....absolute_path (appended relative path); %N")
			end
		}
	;

relative_path: path_segment
		{
			create $$.make_relative ($1)
		}
	| relative_path '/' path_segment
		{
			$1.append_segment ($3)
			$$ := $1
		}
	;

path_segment: V_ATTRIBUTE_IDENTIFIER V_LOCAL_TERM_CODE_REF
		{
			create $$.make_with_object_id ($1, $2)
			debug("OG_PATH_parse")
				io.put_string("...path_segment: " + $1 + "[" + $2 + "]%N")
			end
		}
	| V_ATTRIBUTE_IDENTIFIER V_ANY_PREDICATE
		{
			create $$.make_with_object_id ($1, $2)
			debug("OG_PATH_parse")
				io.put_string("...path_segment: " + $1 + "[" + $2 + "]%N")
			end
		}
	| V_ATTRIBUTE_IDENTIFIER
		{
			create $$.make ($1)
			debug("OG_PATH_parse")
				io.put_string("...path_segment: " + $1 + "%N")
			end
		}
	;

%%

feature {NONE} -- Initialization

	make
			-- Create a new parser.
		do
			make_scanner
			make_parser_skeleton
			create indent.make(0)
		end

feature -- Commands

	execute (in_text: STRING)
		do
			reset
			indent.wipe_out
			set_input_buffer (new_string_buffer (in_text))
			parse
		end

	error_loc: attached STRING
		do
			create Result.make_empty
			if attached {YY_FILE_BUFFER} input_buffer as f_buffer then
				Result.append (f_buffer.file.name + ", ")
			end
			Result.append ("line " + (in_lineno + source_start_line).out)
			Result.append (" [last token = " + token_name (last_token) + "]")
		end

feature -- Access

	source_start_line: INTEGER
			-- offset of source in other document, else 0

	output: detachable OG_PATH

feature {NONE} -- Implementation

	indent: STRING

end
