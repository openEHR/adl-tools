%{
note
	component:   "openEHR ADL Tools"
	description: "[
			 Scanner for unit strings conforming to the Unified Code for Units
	             of Measure (UCUM), developed by Gunther Schadow and Clement J. McDonald
	             of The Regenstrief Institute For Health Care, Indianapolis. Published at
	             http://aurora.rg.iupui.edu/UCUM.
			 ]"
	keywords:    "units, UCUM"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2003 Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


class UNITS_SCANNER

inherit
	YY_COMPRESSED_SCANNER_SKELETON
		rename
			make as make_compressed_scanner_skeleton,
			reset as reset_compressed_scanner_skeleton,
			output as print_out
		end

	UNITS_TOKENS
		export
			{NONE} all
		end

	UT_CHARACTER_CODES
		export
			{NONE} all
		end

	KL_IMPORTED_INTEGER_ROUTINES
	KL_IMPORTED_STRING_ROUTINES
	KL_SHARED_PLATFORM
	KL_SHARED_EXCEPTIONS
	KL_SHARED_ARGUMENTS

create
	make
%}

%option outfile="units_scanner.e"

%%

			--/* symbols */

"+"			last_token := Plus_code
"-"			last_token := Minus_code
"/"			last_token := Slash_code
"."			last_token := Star_code
"^"			last_token := Caret_code

"("			last_token := SYM_OPEN_PAREN
")"			last_token := SYM_CLOSE_PAREN
"["			last_token := SYM_START_SUFFIX
"]"			last_token := SYM_END_SUFFIX
"{"			last_token := SYM_START_ANNOT
"}"			last_token := SYM_END_ANNOT


		--/* identifiers */
[a-zA-Z_%]+		{
					last_token := V_IDENTIFIER
					last_string_value := text
			}

		--/* integers */
[0-9]+				{
					last_token := V_INTEGER
					last_integer_value := text.to_integer
			}

[0-9]{1,3}(,[0-9]{3})+		{
					last_token := V_INTEGER
					str_ := text
					nb_ := text_count
					from i_ := 1 until i_ > nb_ loop
						char_ := str_.item (i_)
						in_buffer.append_character (char_)
						i_ := i_ + 1
					end
					last_integer_value := in_buffer.to_integer
					in_buffer.wipe_out
			}

<<EOF>>			terminate
";"				{ last_token := Semicolon_code; terminate }
.				;


%%

feature {NONE} -- Local variables

	i_, nb_: INTEGER
	char_: CHARACTER
	str_: STRING
	code_: INTEGER

feature {NONE} -- Initialization

	make
			-- Create a new scanner.
		do
			make_compressed_scanner_skeleton
			create in_buffer.make (Init_buffer_size)
			in_lineno := 1
		end

feature -- Initialization

	reset
			-- Reset scanner before scanning next input.
		do
			reset_compressed_scanner_skeleton
			in_lineno := 1
			in_buffer.wipe_out
		end

feature -- Access

	in_buffer: STRING
			-- Buffer for lexial tokens

	in_lineno: INTEGER
			-- Current line number

	is_operator: BOOLEAN
			-- Parsing an operator declaration?

feature {NONE} -- Constants

	Init_buffer_size: INTEGER = 256
				-- Initial size for `in_buffer'

invariant
	in_buffer_not_void: in_buffer /= Void

end

