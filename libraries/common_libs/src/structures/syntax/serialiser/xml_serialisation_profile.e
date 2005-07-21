indexing
	component:   "openEHR Archetype Project"
	description: "Common routines for XML ADL serialisation"
	keywords:    "test, ADL"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2003 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$Source"
	revision:    "$Revision"
	last_change: "$Date"

deferred class XML_SERIALISATION_PROFILE

inherit
	SERIALISATION_PROFILE

	XML_SERIALISER_DEFINITIONS
		export
			{NONE} all
		end

feature {NONE} -- Serialisation

	format_items: HASH_TABLE[STRING, INTEGER] is
			-- formatting items
		once
			create Result.make(0)
			Result.put(" ",					FMT_SPACE)
			Result.put("-- ",				FMT_COMMENT)
			Result.put("%N",				FMT_NEWLINE)
			Result.put("%T",				FMT_INDENT)
			Result.put("<?xml version=%"1.0%" encoding=%"ISO-8859-1%"?>%N",	FMT_DOC_START)
			Result.put(", ",				FMT_LIST_ITEM_SEPARATOR)
			Result.put("; ",				FMT_ASSUMED_VALUE_SEPARATOR)
		end

	styles: HASH_TABLE[STRING, INTEGER] is
			-- styles in this format, keyed by logical name
		once
			create Result.make(0)
			Result.put("keyword",			STYLE_KEYWORD)
			Result.put("operator",			STYLE_OPERATOR)
			Result.put("identifier",		STYLE_IDENTIFIER)
			Result.put("term_ref",			STYLE_TERM_REF)
			Result.put("value",			STYLE_VALUE)
			Result.put("comment",			STYLE_COMMENT)
		end
	
	quote_patterns: HASH_TABLE[STRING, STRING] is
			-- styles in this format, keyed by logical name
		once
			create Result.make(0)
			Result.put("&lt;",			"<")
			Result.put("&gt;",			">")
		end

feature -- Factory

	apply_style(elem:STRING; a_style:INTEGER): STRING is
			-- apply `a_style' to `elem', using attr 'class'
		do
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
