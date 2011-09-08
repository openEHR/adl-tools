note
	component:   "openEHR Reusable Libraries"
    description: "Token-handling string. NOTE: cannot have empty fields."
	keywords:    "token, string"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2003 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class TOKEN_STRING

inherit
	ANY
		redefine
			out
		end

create
	make

feature -- Initialisation

	make (a_str: STRING)
		require
			a_str_valid: a_str /= Void
		do
			str := a_str
			delimiter := Default_delimiter
		end

	set_delimiter(a_delimiter: CHARACTER)
		do
			delimiter := a_delimiter
		end

feature -- Access

	Default_delimiter: CHARACTER = ','


	is_empty: BOOLEAN
		do
			Result := str.is_empty
		end

	token_count: INTEGER
	        -- return the number of tokens found
		do
			Result := str.occurrences(delimiter) + 1
		end

	remainder: STRING
			-- output the rest of the string starting with the current token
		do
			create Result.make(0)
			if token_start_pos < str.count then
				Result.append(str.substring(token_start_pos, str.count))
			end
		end

feature -- Iteration

	token_start
	    require
			Not_empty: not is_empty
	    do
			token_start_pos := 1
			token_end_pos :=  str.index_of(delimiter, token_start_pos) - 1
			if token_end_pos < 0 then
				token_end_pos := str.count
			end
		end

	token_forth
		require
			Not_off: not token_off
		do
			token_start_pos := token_end_pos + 2
			if not token_off then
				token_end_pos := str.index_of(delimiter, token_start_pos) - 1
     				if token_end_pos < 0  then
					token_end_pos := str.count
				end
			end
		end

	token_off : BOOLEAN
		do
			Result := token_start_pos > str.count
		end

	token_item : STRING
		require
			Not_off: not token_off
		do
			create Result.make(0)
			if token_end_pos >= token_start_pos then
				Result.append(str.substring(token_start_pos, token_end_pos))
			end
		ensure
			Result /= Void
		end

feature -- Status setting

	use_whitespace_parsing
	        -- set up string so that any whitespace (TABs, SPCs) will be treated
	        -- as a single delimiter between tokens not containing whitespace chars
	    require
	        Not_empty: not is_empty
	    local
	        change_pos: INTEGER
	        one_tab, two_tabs, one_space: STRING
	    do
	        create one_tab.make_filled ('%T', 1)
	        create two_tabs.make_filled ('%T', 2)
	        create one_space.make_filled (' ', 1)

	        -- remove leading and trailing white space
  	        str.left_adjust
  	        str.right_adjust

	        -- convert SPACEs to TABs
	        str.replace_substring_all(one_space, one_tab)

	        -- convert all occurrences of multiple TAB to one TAB only
			from
			    change_pos := str.substring_index (two_tabs, 1)
			until
			    change_pos = 0
			loop
			    str.replace_substring (one_tab, change_pos, change_pos + 1)
			    if change_pos < str.count then
					change_pos := str.substring_index (two_tabs, change_pos)
			    else
					change_pos := 0
			    end
			end

			delimiter := '%T'
		ensure
			delimiter = '%T'
	    end

feature -- Modification

	append_token(s: STRING)
			-- append s adding a delimiter before if there is already content
		require
			s /= Void
		do
			if not str.is_empty then
				str.append_character (delimiter)
			end
			str.append(s)
		end

	append(s: STRING)
			-- append s
		require
			s /= Void
		do
			str.append(s)
		end

feature -- Output

	out: STRING
			--
		do
			Result := str.twin
		end

	as_list: ARRAYED_LIST [STRING]
			-- generate a list containing all the tokens in the original string
		do
			create Result.make(0)
			from
				token_start
			until
				token_off
			loop
				Result.extend(token_item)
				token_forth
			end
		end

feature {NONE} -- Implementation

	str: STRING
			-- the data

	delimiter: CHARACTER

	token_start_pos, token_end_pos : INTEGER

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
--| The Original Code is token_string.e.
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
