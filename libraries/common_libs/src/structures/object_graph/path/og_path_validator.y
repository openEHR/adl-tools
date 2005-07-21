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

	YY_NEW_PARSER_SKELETON
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

%token <STRING> V_TYPE_IDENTIFIER V_ATTRIBUTE_IDENTIFIER V_STRING
%token <STRING> V_LOCAL_TERM_CODE_REF
%token ERR_STRING
%token SYM_MOVABLE_LEADER

%%

input: og_path
		{
			output := a_path
			accept
		}
	| error
		{
			debug("OG_PATH_parse")
				io.put_string("OG_PATH NOT validated%N")
			end
			abort
		}
	;


og_path: object_path 
		{
			debug("OG_PATH_parse")
				io.put_string(" = og_path%N")
			end
		}
	| attribute_path
		{
			debug("OG_PATH_parse")
				io.put_string(" = og_path%N")
			end
		}
	;

--------------- Relation path --------------------------------------------

attribute_path: attr_path_segment
	| object_path attr_path_segment
	;

--------------- Object path -------------------------------------------------

object_path: obj_path_segment 
	| attribute_path obj_path_segment
	;

attr_path_segment: V_ATTRIBUTE_IDENTIFIER
		{
			if a_path = Void then
				create a_path.make_relative(create {OG_PATH_ITEM}.make_attribute($1))
			else
				a_path.append_attribute_segment(create {OG_PATH_ITEM}.make_attribute($1))
			end
			debug("OG_PATH_parse")
				io.put_string("...attr_path_segment: " + $1)
			end
		}
	;

obj_path_segment: V_LOCAL_TERM_CODE_REF '/'		-- identified object
		{
			if a_path = Void then
				raise_error
				report_error("Absolute path missing leading '/'")
				abort
			else
				a_path.append_object_segment(create {OG_PATH_ITEM}.make_object($1))
			end
			debug("OG_PATH_parse")
				io.put_string("...obj_path_segment: [" + $1 + "]")
			end
		}
	| '/' V_LOCAL_TERM_CODE_REF '/'		-- absolute, identified path
		{
			if a_path /= Void then
				raise_error
				report_error("/[xxx]/ can only appear at head of path")
				abort
			else
				create a_path.make_absolute(create {OG_PATH_ITEM}.make_object($2))
			end
			debug("OG_PATH_parse")
				io.put_string("...obj_path_segment: /[" + $2 + "]/")
			end
		}
--
-- the following can be used to get absolute paths with no trailing slash, if we allow this
-- (not currently allowed in ADL)
--
--	| '/' V_LOCAL_TERM_CODE_REF 	-- absolute, identified path 1 item long
--		{
--			if a_path /= Void then
--				raise_error
--				report_error("/[xxx] can only appear at head of path")
--				abort
--			else
--				create a_path.make_absolute(create {OG_PATH_ITEM}.make_object($2))
--			end
--			debug("OG_PATH_parse")
--				io.put_string("...obj_path_segment: /[" + $2 + "]/")
--			end
--		}
	| SYM_MOVABLE_LEADER V_LOCAL_TERM_CODE_REF '/'		-- movable, identified "//" path pattern
		{
			if a_path /= Void then
				raise_error
				report_error("//[xxx]/ can only appear at head of path")
				abort
			else
				create a_path.make_movable(create {OG_PATH_ITEM}.make_object($2))
			end
			debug("OG_PATH_parse")
				io.put_string("...obj_path_segment: //[" + $2 + "]/")
			end
		}
	| SYM_MOVABLE_LEADER V_LOCAL_TERM_CODE_REF 		-- movable, identified "//" path pattern 1 item long
		{
			if a_path /= Void then
				raise_error
				report_error("//[xxx] can only appear at head of path")
				abort
			else
				create a_path.make_movable(create {OG_PATH_ITEM}.make_object($2))
			end
			debug("OG_PATH_parse")
				io.put_string("...obj_path_segment: //[" + $2 + "]")
			end
		}
	| '/'					-- anonymous object
		{
			if a_path = Void then
				create a_path.make_absolute(create {OG_PATH_ITEM}.make_object_unknown)
			else
				a_path.append_object_segment(create {OG_PATH_ITEM}.make_object_unknown)
			end
			debug("OG_PATH_parse")
				io.put_string("...obj_path_segment(anon)")
			end
		}
	;


call_path: object_path '.' V_ATTRIBUTE_IDENTIFIER
		{
			a_path.append_function_segment(create {OG_PATH_ITEM}.make_feature_call($3))
			debug("OG_PATH_parse")
				io.put_string("...feature_call item: " + $3)
			end

		}
	| call_path '.' V_ATTRIBUTE_IDENTIFIER
		{
			a_path.append_function_segment(create {OG_PATH_ITEM}.make_feature_call($3))
			debug("OG_PATH_parse")
				io.put_string(indent + "feature_call item: " +  $3)
			end
		}
	| object_path '.' error
		{
			raise_error
			report_error("In call path expression; expecting property reference e.g. '.feature_call'")
			abort
		}
	;

--------------------------------------------------------------------

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
	a_path_item: OG_PATH_ITEM

	indent: STRING

end
