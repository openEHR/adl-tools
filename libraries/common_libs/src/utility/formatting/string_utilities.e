note
	component:   "openEHR Archetype Project"
	description: "Miscellaneous String utilities."
	keywords:    "formatting"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2003- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "See notice at bottom of class"

class STRING_UTILITIES

feature -- Definitions

	Default_quote_characters: STRING = "nrt\%"'"
			-- characters that mean something special when following a backslash

feature -- Conversion

	serialise_primitive_value (a_prim_val: ANY): STRING
			-- generate a correctly serialised string for any primitive value, making corrections for
			-- broken serialisations of DATE_TIME, DATE_TIME_DURATION and REAL
		do
			-- FIXME: duration.out does not exist in Eiffel, and in any case would not be ISO8601-compliant
			if attached {DATE_TIME_DURATION} a_prim_val as a_dur then
				Result := (create {ISO8601_DURATION}.make_date_time_duration(a_dur)).as_string
			elseif attached {DATE_TIME} a_prim_val as a_dt then
				Result := (create {ISO8601_DATE_TIME}.make_date_time(a_dt)).as_string
			else
				Result := a_prim_val.out
				-- FIXME: REAL.out is broken (still the case in Eiffel 6.6)
				if (attached {REAL_32} a_prim_val or attached {REAL_64} a_prim_val) and then Result.index_of ('.', 1) = 0 then
					Result.append(".0")
				end
			end
		end

	quote_clean (str: STRING): STRING
			-- generate clean copy of `str' and convert
			--	\ to \\
			-- 	" to \"
			-- otherwise just return original string
		local
			i: INTEGER
		do
			if str.has ('\') or str.has ('"') then
				create Result.make (str.count)
				from i := 1 until i > str.count loop
					if str.item (i) = '\' or str.item (i) = '"' then
						Result.append_character ('\')
					end
					Result.append_character (str.item (i))
					i := i + 1
				end
			else
				Result := str
			end
		end

feature -- Element Change

	translate (str, s1, s2: STRING)
			-- in str, replace every occurrence of each char in s1
			-- by corr char in s2, or delete them, if s2 empty
	    require
	    	Str_valid: not str.is_empty
			S1_valid: not s1.is_empty
			Valid_arg_lengths: s1.count = s2.count or else s2.count = 0
	    local
			i, j: INTEGER
	    do
			from i := 1 until i > s1.count loop
			    if s2.count = 0 then -- removal
					str.prune_all(s1.item(i));
			    else
					from
					    j := 1
					until
					    j = 0
					loop
				    	j := str.index_of(s1.item(i), j)
					    if j > 0 then
							str.put(s2.item(i), j);
					    end
					end
			    end

		    	i := i + 1
			end
	    end

	concatenate (items: ARRAY [STRING]): STRING
			-- turn <<str, str, str...>> into a STRING
		local
			i:INTEGER
		do
			create Result.make(0)
			from i := items.lower until i > items.upper loop
				Result.append(items.item(i))
				i := i + 1
			end
		end

	indented (s, indent: STRING): STRING
			-- indent every line in 's' by 'indent' and return result
		local
			indent_str: STRING
			tail_return_count: INTEGER
		do
			if not indent.is_empty then
				create Result.make (s.count)

				-- indent first line
				Result.append (indent)

				-- add the contents
				Result.append (s)

				-- temporarily remove any final %N chars
				from until Result.item (Result.count) /= '%N' or else Result.is_empty loop
					Result.remove_tail (1)
					tail_return_count := tail_return_count + 1
				end

				-- create the indent string
				create indent_str.make (1 + indent.count)
				indent_str.append_character ('%N')
				indent_str.append (indent)

				-- now indent all intervening lines
				Result.replace_substring_all ("%N", indent_str)

				if tail_return_count > 0 then
					Result.append (create {STRING}.make_filled ('%N', tail_return_count))
				end
			else
				Result := s
			end
		end

	add_line_numbers (text: STRING; leader_width: INTEGER; spacer: detachable STRING): STRING
			-- add line numbers to each line of `text' within a width of `leader_width', and with an optional
			-- spacer 'spacer'
			-- If leader_width = 4, and spacer = '  ', then the first line looks like
			-- "   1  ", i.e. "SSS1SS", where 'S' stands for a space
		local
			text_len, left_pos, right_pos, line_no: INTEGER
			line_no_str, leader: STRING
		do
			create leader.make_filled (' ', leader_width - 1)
			text_len := text.count
			create Result.make (text_len)
			from
				left_pos := 1
				line_no := 1
			until
				left_pos > text_len
			loop
				line_no_str := line_no.out

				-- recreate the leader string when we hit a new power of 10
				if line_no \\ 10 = 0 and then line_no_str.count <= leader_width then
					create leader.make_filled (' ', leader_width - line_no_str.count)
				end
				Result.append (leader)
				Result.append (line_no_str)

				if attached spacer then
					Result.append (spacer)
				end

				right_pos := text.index_of ('%N', left_pos)

				if right_pos = 0 then
					right_pos := text_len
				end

				Result.append (text.substring (left_pos, right_pos))
				left_pos := right_pos + 1
				line_no := line_no + 1
			end
		end

feature -- Unicode

	utf8_to_utf32 (utf8_bytes: STRING): STRING_32
			-- `utf8_bytes' converted from a sequence of UTF-8 bytes to 32-bit Unicode characters.
		do
			utf8_encoding.convert_to (utf32_encoding, utf8_bytes)
			Result := utf8_encoding.last_converted_string_32
		end

	utf32_to_utf8 (utf32_bytes: STRING_32): STRING_8
			-- `utf32_bytes' converted from a sequence of UTF-32 bytes to UTF-8 byte sequence
		do
			utf32_encoding.convert_to (utf8_encoding, utf32_bytes)
			Result := utf32_encoding.last_converted_string_8
		end

feature -- Matching

	regex_from_string (a_str: STRING): STRING
			-- turn an ordinary string like "abc" into a regex that can be used with standard regex matching
			-- libs like gobo
		do
			Result := ".*" + a_str + ".*"
		end

	valid_regex (a_regex: STRING): BOOLEAN
			-- True if `a_regex' is valid according to standard PERL-based regex rules
		require
			Regex_valid: not a_regex.is_empty
		local
			regex_matcher: RX_PCRE_REGULAR_EXPRESSION
		do
			create regex_matcher.make
			regex_matcher.set_case_insensitive (True)
			regex_matcher.compile (a_regex)
			Result := regex_matcher.is_compiled
		end

	soundex (a_str: STRING): STRING
			-- generate the soundex equivalent of 'a_str'
		require
			a_str /= Void
	    local
			i: INTEGER;
			old_ptn, new_ptn: STRING
			code: STRING
			remaining: STRING
	    do
	    	create Result.make(0)

	    	create code.make(0)
	    	code.append(a_str)

			translate(code, punctuation, "")
			code.to_upper

			Result := code.substring(1, 1)
			remaining := code.substring(2, code.count)
			translate(remaining, alphabet, soundex_map)

			from
			    i := 1
			until
			    i > 6
			loop
			    create old_ptn.make(0)
			    old_ptn.append_integer(i * 11)
		    	create new_ptn.make(0)
			    new_ptn.append_integer(i)
			    remaining.replace_substring_all(old_ptn, new_ptn)

			    i := i + 1
			end

			translate(remaining, " ", "")
			remaining.append("0000")
			Result.append(remaining.substring(1,3))
	    end

feature {NONE} -- Implementation

	punctuation: STRING = "!%"#$%%&%'()_=-~^@`{[;+:*]},<.>/?\|"

	alphabet: STRING =  "ABCDEFGHIJKLMNOPQRSTUVWXYZ"

	soundex_map: STRING = " 123 12  22455 12623 1 2 2"

	utf8_encoding: ENCODING
	    once
	        create Result.make ({CODE_PAGE_CONSTANTS}.utf8)
	    end

	utf32_encoding: ENCODING
	    once
	        create Result.make ({CODE_PAGE_CONSTANTS}.utf32)
	    end

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
--| The Original Code is string_routines.e.
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
