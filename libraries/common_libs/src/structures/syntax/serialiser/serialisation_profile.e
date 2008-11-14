indexing
	component:   "openEHR Archetype Project"
	description: "Abstract model of serialisation profile"
	keywords:    "test, ADL"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2003 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

deferred class SERIALISATION_PROFILE

inherit
	SERIALISER_DEFINITIONS
		export
			{NONE} all
		end

	STRING_UTILITIES
		export
			{NONE} all
		end

feature -- Definitions

	Quote_characters: STRING is "nrt\%"'"
			-- characters that mean something special when following a backslash

feature -- Initialisation

	make(an_output_format: STRING) is
			-- make with the output format name this serialiser is to be associated with
		require
			an_output_format_valid: an_output_format /= Void and then not an_output_format.is_empty
		do
			output_format := an_output_format
		end

feature {ANY_SERIALISER} -- Access

	output_format: STRING
			-- the output format name this profile is
			-- associated with, usually "adl", "xml", "html" etc; needed to allow
			-- embedded dADL in cADL and vice-versa to be serialised

	symbols: HASH_TABLE[STRING, INTEGER] is
			-- keywords in this format, keyed by logical name
		deferred
		ensure
			Result_exists: Result /= Void
		end

	tags: HASH_TABLE[STRING, INTEGER] is
			-- keywords in this format, keyed by logical name
		deferred
		ensure
			Result_exists: Result /= Void
		end

	format_items: HASH_TABLE[STRING, INTEGER] is
			-- formatting items
		deferred
		ensure
			Result_exists: Result /= Void
		end

	styles: HASH_TABLE[STRING, INTEGER] is
			-- styles in this format, keyed by logical name
		deferred
		ensure
			Result_exists: Result /= Void
		end

feature  {ANY_SERIALISER} -- Factory

	apply_style(elem:STRING; a_style:INTEGER): STRING is
			-- apply `a_style' to `elem', using attr 'class'
		require
			Elem_exists: elem /= Void
			A_style_valid: styles.has(a_style)
		deferred
		end

	create_indent(indent_level: INTEGER): STRING is
		require
			indent_level >= 0
		local
			i: INTEGER
		do
			create Result.make(0)
			from
				i := 1
			until
				i > indent_level
			loop
				Result.append(format_items.item(FMT_INDENT))
				i := i + 1
			end
		end

	clean(str:STRING): STRING is
			-- generate clean copy of `str' by inserting \ quoting for chars in `quoted_chars' not already quoted in `str':
			-- find all instances of '\' and '"' that are not already being used in the quote patterns, e.g. like:
			--	\n, \r, \t, \\, \", \'
			-- and convert
			--	\ to \\
			-- 	" to \"
		require
			String_attached: str /= Void
		do
			if not str.is_empty then
				Result := quote_clean(str, Quote_characters, 1, str.count)
			else
				Result := str
			end
		end

	clean_contents(str:STRING): STRING is
			-- same as clean(), but only on contents of string, if it represents a literal string and is enclosed by '"'
		require
			String_attached: str /= Void
		do
			if not str.is_empty then
				if str.item (1) = '"' and str.item (str.count) = '"' then
					if str.count > 2 then
						Result := quote_clean(str, Quote_characters, 2, str.count-1)
					else
						Result := str
					end
				else
					Result := quote_clean(str, Quote_characters, 1, str.count)
				end
			else
				Result := str
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
--| The Original Code is serialisation_profile.e.
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
