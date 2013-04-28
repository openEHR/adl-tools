note
	component:   "openEHR Archetype Project"
	description: "Common routines for JSON DT serialisation"
	keywords:    "JSON, serialisation"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2011- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "See notice at bottom of class"

deferred class JSON_SERIALISATION_PROFILE

inherit
	SERIALISATION_PROFILE
		redefine
			clean
		end

feature {ANY_SERIALISER} -- Access

	format_items: HASH_TABLE [STRING, INTEGER]
			-- formatting items
		once
			create Result.make(0)
			Result.put(" ",			FMT_SPACE)
			Result.put("%N",		FMT_NEWLINE)
			Result.put("%T",		FMT_INDENT)
			Result.put(", ",		FMT_LIST_ITEM_SEPARATOR)
		end

	styles: HASH_TABLE [STRING, INTEGER]
			-- styles in this format, keyed by logical name
		once
			create Result.make(0)
		end

	quote_patterns: HASH_TABLE [STRING, STRING]
			-- styles in this format, keyed by logical name
		once
			create Result.make(0)
		end

feature {ANY_SERIALISER} -- Factory

	apply_style (elem: STRING; a_style: INTEGER): STRING
			-- apply `a_style' to `elem'
		do
			Result := elem
		end

	clean (str: STRING): STRING
			-- generate clean copy of `str' by inserting \ quoting for chars in `quoted_chars' not already quoted in `str':
			-- find all instances of '\' and '"' that are not already being used in the quote patterns, e.g. like:
			--	\n, \r, \t, \\, \", \'
			-- and convert
			--	\ to \\
			-- 	" to \"
		do
			if not str.is_empty then
				Result := json_clean (str)
			else
				Result := str
			end
		end

feature {NONE} -- Implementation

	json_clean (str: STRING): STRING
			-- generate clean copy of `str' and convert
			--	\ to \\
			-- 	" to \"
			-- otherwise just return original string
		local
			i: INTEGER
		do
			create Result.make (str.count)
			from i := 1 until i > str.count loop
				if str.item (i) = '%N'  then
					Result.append ("\n")
				elseif str.item (i) = '%T'  then
					Result.append ("\t")
				else
					if str.item (i) = '\' or str.item (i) = '"' then
						Result.append_character ('\')
					end
					Result.append_character (str.item (i))
				end
				i := i + 1
			end
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
--| The Original Code is xml_serialisation_profile.e.
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
