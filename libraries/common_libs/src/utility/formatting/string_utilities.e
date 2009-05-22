note
	component:   "openEHR Archetype Project"
	description: "Miscellaneous String utilities."
	keywords:    "formatting"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2003 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class STRING_UTILITIES

feature -- Definitions

	Default_quote_characters: STRING = "nrt\%"'"
			-- characters that mean something special when following a backslash

feature -- Conversion

	quote_clean (str: STRING): STRING
			-- if any quoting needed, generate clean copy of `str' and convert
			--	\ to \\
			-- 	" to \"
			-- otherwise just return original string
		require
			String_attached: str /= Void
		local
			i, j: INTEGER
		do
			if str.has ('\') or str.has('"') then
				Result := str.twin
				from
					i := 1
					j := 1
				until
					i > str.count
				loop
					if str.item(i) = '\' or str.item(i) = '"' then
						Result.insert_character ('\', j)
						j := j + 1
					end
					i := i + 1
					j := j + 1
				end
			else
				Result := str
			end
		ensure
			Result_attached: Result /= Void
		end

feature -- Element Change

	translate (str, s1, s2: STRING)
			-- in str, replace every occurrence of each char in s1
			-- by corr char in s2, or delete them, if s2 empty
	    require
	    	Str_valid: str /= Void and then not str.is_empty
			S1_valid: not s1.is_empty
			S2_valid: s2 /= Void
			Valid_arg_lengths: s1.count = s2.count or else s2.count = 0
	    local
			i, j: INTEGER
	    do
			from
			    i := 1
			until
			    i > s1.count
			loop
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
		require
			Args_valid: items /= Void
		local
			i:INTEGER
		do
			create Result.make(0)
			from i := items.lower until i > items.upper loop
				Result.append(items.item(i))
				i := i + 1
			end
		ensure
			Result_exists: Result /= Void
		end

	indented (s, indent: STRING): STRING
			-- indent every line in 's' by 'indent' and return result
		require
			String_exists: s /= Void
			Indent_exists: indent /= Void
		local
			insert_str: STRING
			final_return: BOOLEAN
		do
			Result := s.twin
			create insert_str.make(0)
			insert_str.append(indent)

			-- indent first line
			Result.prepend(insert_str)

			if not Result.is_empty then
				-- if last character is a %N, remove it for the moment
				if Result.item(Result.count).is_equal('%N') then
					Result.keep_head(Result.count - 1)
					final_return := True
				end

				-- no indent all intervening lines
				insert_str.prepend("%N")
				Result.replace_substring_all("%N", insert_str)

				if final_return then
					Result.append_character('%N')
				end
			end
		ensure
			Result_exists: Result /= Void
		end

feature -- Unicode

	utf8 (utf8_bytes: STRING): attached STRING_32
			-- `utf8_bytes' converted from a sequence of UTF-8 bytes to 32-bit Unicode characters.
		require
			utf8_bytes_attached: utf8_bytes /= Void
			utf8_bytes_valid: (create {UC_UTF8_ROUTINES}).valid_utf8 (utf8_bytes)
		local
			s: STRING
		do
			create {UC_UTF8_STRING} s.make_from_utf8 (utf8_bytes)
			Result := s.as_string_32
		ensure
			not_longer: Result.count <= utf8_bytes.count
		end

feature -- Matching

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
