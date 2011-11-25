note
	component:   "openEHR Archetype Project"
	description: "Abstract model of serialisation profile"
	keywords:    "serialisation, ADL"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2003-2011 Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
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

feature -- Initialisation

	make (an_output_format: attached STRING)
			-- make with the output format name this serialiser is to be associated with
		require
			an_output_format_valid: not an_output_format.is_empty
		do
			output_format := an_output_format
		end

feature {ANY_SERIALISER} -- Access

	output_format: STRING
			-- the output format name this profile is
			-- associated with, usually "adl", "xml", "html" etc; needed to allow
			-- embedded dADL in cADL and vice-versa to be serialised

	symbols: attached HASH_TABLE[STRING, INTEGER]
			-- keywords in this format, keyed by logical name
		deferred
		end

	tags: attached HASH_TABLE[STRING, INTEGER]
			-- keywords in this format, keyed by logical name
		deferred
		end

	format_items: attached HASH_TABLE[STRING, INTEGER]
			-- formatting items
		deferred
		end

	styles: attached HASH_TABLE[STRING, INTEGER]
			-- styles in this format, keyed by logical name
		deferred
		end

feature  {ANY_SERIALISER} -- Factory

	apply_style (elem: attached STRING; a_style: INTEGER): attached STRING
			-- apply `a_style' to `elem'
		require
			A_style_valid: styles.has(a_style)
		deferred
		end

	create_indent (indent_level: INTEGER): attached STRING
		require
			indent_level >= 0
		local
			i: INTEGER
		do
			create Result.make(0)
			from i := 1 until i > indent_level loop
				Result.append (format_items.item (FMT_INDENT))
				i := i + 1
			end
		end

	clean (str: attached STRING): attached STRING
			-- generate clean copy of `str' by inserting \ quoting for chars in `quoted_chars' not already quoted in `str':
			-- find all instances of '\' and '"' that are not already being used in the quote patterns, e.g. like:
			--	\n, \r, \t, \\, \", \'
			-- and convert
			--	\ to \\
			-- 	" to \"
		do
			if not str.is_empty then
				Result := quote_clean(str)
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
