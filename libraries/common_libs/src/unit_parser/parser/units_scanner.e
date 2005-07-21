indexing
	component:   "openEHR Reusable Libraries"
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
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

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

creation

	make

feature -- Status report

	valid_start_condition (sc: INTEGER): BOOLEAN is
			-- Is `sc' a valid start condition?
		do
			Result := (sc = INITIAL)
		end

feature {NONE} -- Implementation

	yy_build_tables is
			-- Build scanner tables.
		do
			yy_nxt ?= yy_nxt_template
			yy_chk ?= yy_chk_template
			yy_base ?= yy_base_template
			yy_def ?= yy_def_template
			yy_ec ?= yy_ec_template
			yy_meta ?= yy_meta_template
			yy_accept ?= yy_accept_template
		end

	yy_execute_action (yy_act: INTEGER) is
			-- Execute semantic action.
		do
if yy_act <= 9 then
if yy_act <= 5 then
if yy_act <= 3 then
if yy_act <= 2 then
if yy_act = 1 then
--|#line 59 "units_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'units_scanner.l' at line 59")
end
last_token := Plus_code
else
--|#line 60 "units_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'units_scanner.l' at line 60")
end
last_token := Minus_code
end
else
--|#line 61 "units_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'units_scanner.l' at line 61")
end
last_token := Slash_code
end
else
if yy_act = 4 then
--|#line 62 "units_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'units_scanner.l' at line 62")
end
last_token := Star_code
else
--|#line 63 "units_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'units_scanner.l' at line 63")
end
last_token := Caret_code
end
end
else
if yy_act <= 7 then
if yy_act = 6 then
--|#line 65 "units_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'units_scanner.l' at line 65")
end
last_token := SYM_OPEN_PAREN
else
--|#line 66 "units_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'units_scanner.l' at line 66")
end
last_token := SYM_CLOSE_PAREN
end
else
if yy_act = 8 then
--|#line 67 "units_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'units_scanner.l' at line 67")
end
last_token := SYM_START_SUFFIX
else
--|#line 68 "units_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'units_scanner.l' at line 68")
end
last_token := SYM_END_SUFFIX
end
end
end
else
if yy_act <= 13 then
if yy_act <= 11 then
if yy_act = 10 then
--|#line 69 "units_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'units_scanner.l' at line 69")
end
last_token := SYM_START_ANNOT
else
--|#line 70 "units_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'units_scanner.l' at line 70")
end
last_token := SYM_END_ANNOT
end
else
if yy_act = 12 then
--|#line 74 "units_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'units_scanner.l' at line 74")
end

					last_token := V_IDENTIFIER
					last_string_value := text
			
else
--|#line 80 "units_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'units_scanner.l' at line 80")
end

					last_token := V_INTEGER
					last_integer_value := text.to_integer
			
end
end
else
if yy_act <= 15 then
if yy_act = 14 then
--|#line 85 "units_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'units_scanner.l' at line 85")
end

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
			
else
--|#line 99 "units_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'units_scanner.l' at line 99")
end
 last_token := Semicolon_code; terminate 
end
else
if yy_act = 16 then
--|#line 100 "units_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'units_scanner.l' at line 100")
end
;
else
--|#line 0 "units_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'units_scanner.l' at line 0")
end
last_token := yyError_token
fatal_error ("scanner jammed")
end
end
end
end
		end

	yy_execute_eof_action (yy_sc: INTEGER) is
			-- Execute EOF semantic action.
		do
			inspect yy_sc
when 0 then
--|#line 0 "units_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'units_scanner.l' at line 0")
end
terminate
			else
				terminate
			end
		end

feature {NONE} -- Table templates

	yy_nxt_template: ANY is
			-- This is supposed to be "like FIXED_INTEGER_ARRAY_TYPE",
			-- but once functions cannot be declared with anchored types.
		once
			Result := yy_fixed_array (<<
			    0,    4,    5,    6,    7,    8,    9,    4,   10,   11,
			   12,   13,   14,   15,   16,   17,   18,   19,   21,   21,
			   21,   21,   22,   24,   26,   26,   27,   25,   23,   20,
			   20,   28,    3,   28,   28,   28,   28,   28,   28,   28,
			   28,   28,   28,   28,   28,   28,   28,   28,   28,   28>>)
		end

	yy_chk_template: ANY is
			-- This is supposed to be "like FIXED_INTEGER_ARRAY_TYPE",
			-- but once functions cannot be declared with anchored types.
		once
			Result := yy_fixed_array (<<
			    0,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,   13,   22,
			   24,   27,   13,   22,   24,   26,   25,   23,   21,   20,
			    6,    3,   28,   28,   28,   28,   28,   28,   28,   28,
			   28,   28,   28,   28,   28,   28,   28,   28,   28,   28>>)
		end

	yy_base_template: ANY is
			-- This is supposed to be "like FIXED_INTEGER_ARRAY_TYPE",
			-- but once functions cannot be declared with anchored types.
		once
			Result := yy_fixed_array (<<
			    0,    0,    0,   31,   32,   32,   27,   32,   32,   32,
			   32,   32,   32,   11,   32,   32,   32,   32,   32,   32,
			   26,   17,   12,   16,   13,   15,   14,   14,   32>>)
		end

	yy_def_template: ANY is
			-- This is supposed to be "like FIXED_INTEGER_ARRAY_TYPE",
			-- but once functions cannot be declared with anchored types.
		once
			Result := yy_fixed_array (<<
			    0,   28,    1,   28,   28,   28,   28,   28,   28,   28,
			   28,   28,   28,   28,   28,   28,   28,   28,   28,   28,
			   28,   28,   28,   28,   28,   28,   28,   28,    0>>)
		end

	yy_ec_template: ANY is
			-- This is supposed to be "like FIXED_INTEGER_ARRAY_TYPE",
			-- but once functions cannot be declared with anchored types.
		once
			Result := yy_fixed_array (<<
			    0,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    2,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    3,    1,    1,
			    4,    5,    1,    6,    7,    8,    9,   10,   11,   11,
			   11,   11,   11,   11,   11,   11,   11,   11,    1,   12,
			    1,    1,    1,    1,    1,    3,    3,    3,    3,    3,
			    3,    3,    3,    3,    3,    3,    3,    3,    3,    3,
			    3,    3,    3,    3,    3,    3,    3,    3,    3,    3,
			    3,   13,    1,   14,   15,    3,    1,    3,    3,    3,

			    3,    3,    3,    3,    3,    3,    3,    3,    3,    3,
			    3,    3,    3,    3,    3,    3,    3,    3,    3,    3,
			    3,    3,    3,   16,    1,   17,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,

			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1>>)
		end

	yy_meta_template: ANY is
			-- This is supposed to be "like FIXED_INTEGER_ARRAY_TYPE",
			-- but once functions cannot be declared with anchored types.
		once
			Result := yy_fixed_array (<<
			    0,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1>>)
		end

	yy_accept_template: ANY is
			-- This is supposed to be "like FIXED_INTEGER_ARRAY_TYPE",
			-- but once functions cannot be declared with anchored types.
		once
			Result := yy_fixed_array (<<
			    0,    0,    0,   18,   16,   17,   12,    6,    7,    1,
			    2,    4,    3,   13,   15,    8,    9,    5,   10,   11,
			   12,    0,   13,    0,   13,    0,   13,   14,    0>>)
		end

feature {NONE} -- Constants

	yyJam_base: INTEGER is 32
			-- Position in `yy_nxt'/`yy_chk' tables
			-- where default jam table starts

	yyJam_state: INTEGER is 28
			-- State id corresponding to jam state

	yyTemplate_mark: INTEGER is 29
			-- Mark between normal states and templates

	yyNull_equiv_class: INTEGER is 1
			-- Equivalence code for NULL character

	yyReject_used: BOOLEAN is false
			-- Is `reject' called?

	yyVariable_trail_context: BOOLEAN is false
			-- Is there a regular expression with
			-- both leading and trailing parts having
			-- variable length?

	yyReject_or_variable_trail_context: BOOLEAN is false
			-- Is `reject' called or is there a
			-- regular expression with both leading
			-- and trailing parts having variable length?

	yyNb_rules: INTEGER is 17
			-- Number of rules

	yyEnd_of_buffer: INTEGER is 18
			-- End of buffer rule code

	yyLine_used: BOOLEAN is false
			-- Are line and column numbers used?

	yyPosition_used: BOOLEAN is false
			-- Is `position' used?

	INITIAL: INTEGER is 0
			-- Start condition codes

feature -- User-defined features



feature {NONE} -- Local variables

	i_, nb_: INTEGER
	char_: CHARACTER
	str_: STRING
	code_: INTEGER

feature {NONE} -- Initialization

	make is
			-- Create a new scanner.
		do
			make_compressed_scanner_skeleton
			in_buffer := string_.make (Init_buffer_size)
			in_lineno := 1
		end

feature -- Initialization

	reset is
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

	Init_buffer_size: INTEGER is 256
				-- Initial size for `in_buffer'

invariant

	in_buffer_not_void: in_buffer /= Void

end

--|
--| ***** BEGIN LICENSE BLOCK *****
--| Version: MPL 1.1/GPL 2.0/LGPL 2.1
--|
--| The contents of this file are subject to the Mozilla Public License Version
--| 1.1 (the 'License'); you may not use this file except in compliance with
--| the License. You may obtain a copy of the License at
--| http://www.mozilla.org/MPL/
--|
--| Software distributed under the License is distributed on an 'AS IS' basis,
--| WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License
--| for the specific language governing rights and limitations under the
--| License.
--|
--| The Original Code is units_scannerl.l
--|
--| The Initial Developer of the Original Code is Thomas Beale.
--| Portions created by the Initial Developer are Copyright (C) 2003-2004
--| the Initial Developer. All Rights Reserved.
--|
--| Contributor(s):
--|
--| Alternatively, the contents of this file may be used under the terms of
--| either the GNU General Public License Version 2 or later (the 'GPL'), or
--| the GNU Lesser General Public License Version 2.1 or later (the 'LGPL'),
--| in which case the provisions of the GPL or the LGPL are applicable instead
--| of those above. If you wish to allow use of your version of this file only
--| under the terms of either the GPL or the LGPL, and not to allow others to
--| use your version of this file under the terms of the MPL, indicate your
--| decision by deleting the provisions above and replace them with the notice
--| and other provisions required by the GPL or the LGPL. If you do not delete
--| the provisions above, a recipient may use your version of this file under
--| the terms of any one of the MPL, the GPL or the LGPL.
--|
--| ***** END LICENSE BLOCK *****
--|
