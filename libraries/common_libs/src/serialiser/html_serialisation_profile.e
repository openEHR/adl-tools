note
	component:   "openEHR Archetype Project"
	description: "Common routines for HTML ADL serialisation"
	keywords:    "test, ADL"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2003- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "See notice at bottom of class"

deferred class HTML_SERIALISATION_PROFILE

inherit
	SERIALISATION_PROFILE

feature {ANY_SERIALISER} -- Access

	format_items: HASH_TABLE[STRING, INTEGER]
			-- formatting items
		once
			create Result.make (0)
			Result.put (" ",					FMT_SPACE)
			Result.put ("-- ",				FMT_COMMENT)
			Result.put ("%N",				FMT_NEWLINE)
			Result.put ("    ",				FMT_INDENT)
			Result.put ("<html>%N<head>%N",	FMT_DOC_START)
			Result.put ("%N</html>%N",		FMT_DOC_END)
			Result.put (html_style_header,	FMT_DOC_STYLES)
			Result.put ("%N</head>%N<body><pre>%N",		FMT_START_BODY)
			Result.put ("%N</pre></body>%N",	FMT_END_BODY)
			Result.put ("<span $attrs>",		FMT_START_SPAN)
			Result.put ("</span>",			FMT_END_SPAN)
			Result.put ("%N<title>$title",	FMT_START_TITLE)
			Result.put ("</title>%N",		FMT_END_TITLE)
			Result.put (html_meta,			FMT_META_ITEM)
			Result.put (", ",				FMT_LIST_ITEM_SEPARATOR)
			Result.put ("; ",				FMT_ASSUMED_VALUE_SEPARATOR)
		end

	styles: HASH_TABLE[STRING, INTEGER]
			-- styles in this format, keyed by logical name
		once
			create Result.make (0)
			Result.put ("keyword", style_keyword)
			Result.put ("operator", style_operator)
			Result.put ("identifier", style_identifier)
			Result.put ("inherited_identifier", style_inherited_identifier)
			Result.put ("redefined_identifier", style_redefined_identifier)
			Result.put ("term_ref", style_term_ref)
			Result.put ("value", style_value)
			Result.put ("comment", style_comment)
		end

	tags: HASH_TABLE[STRING, INTEGER]
			-- tag strings, keyed by logical name
		once
			create Result.make(0)
		end

	quote_patterns: HASH_TABLE[STRING, STRING]
			-- styles in this format, keyed by logical name
		once
			create Result.make(0)
			Result.put ("&lt;",			"<")
			Result.put ("&gt;",			">")
		end

feature {ANY_SERIALISER} -- Factory

	apply_style (elem: STRING; a_style: INTEGER): STRING
			-- apply `a_style' to `elem', using XML 'class' attribute
		do
			create Result.make(0)
			if attached format_items.item (FMT_START_SPAN) as fmt_ss then
				Result.append (fmt_ss)
			end
			Result.append (elem)
			if attached format_items.item (FMT_END_SPAN) as fmt_es then
				Result.append (fmt_es)
			end
			if attached styles.item (a_style) as style then
				Result.replace_substring_all ("$attrs", "class=" + style)
			end
		end

feature {NONE} -- Implementation

	html_style_header: STRING =
"<style>%N%
%BODY {%N%
	%font-family:%"Courier New%";%N%
%}%N%
%.keyword {%N%
	%text-align:left;%N%
	%font-size: 10pt;%N%
	%font-family:%"Courier New%";%N%
	%margin: 0px;%N%
	%background: white;%N%
	%color: purple;%N%
	%text-decoration:none;%N%
	%font-weight: bold;%N%
	%}%N%
%.identifier {%N%
	%text-align:left;%N%
	%font-size: 10pt;%N%
	%font-family:%"Courier New%";%N%
	%margin: 0px;%N%
	%background: white;%N%
	%font-weight: bold;%N%
	%color: olive;%N%
	%text-decoration:none;%N%
	%}%N%
%.inherited_identifier {%N%
	%text-align:left;%N%
	%font-size: 10pt;%N%
	%font-family:%"Courier New%";%N%
	%margin: 0px;%N%
	%background: yellow;%N%
	%font-weight: bold;%N%
	%color: darkolivegreen;%N%
	%text-decoration:none;%N%
	%}%N%
%.redefined_identifier {%N%
	%text-align:left;%N%
	%font-size: 10pt;%N%
	%font-family:%"Courier New%";%N%
	%margin: 0px;%N%
	%background: yellow;%N%
	%font-weight: bold;%N%
	%color: darkolivegreen;%N%
	%text-decoration:underline;%N%
	%}%N%
%.term_ref {%N%
	%text-align:left;%N%
	%font-size: 10pt;%N%
	%font-family:%"Courier New%";%N%
	%margin: 0px;%N%
	%background: white;%N%
	%color: fuchsia;%N%
	%text-decoration:none;%N%
	%}%N%
%.operator {%N%
	%text-align:left;%N%
	%font-size: 10pt;%N%
	%font-family:%"Courier New%";%N%
	%margin: 0px;%N%
	%background: white;%N%
	%color: blue;%N%
	%text-decoration:none;%N%
	%}%N%
%.value {%N%
	%text-align:left;%N%
	%font-size: 10pt;%N%
	%font-family:%"Courier New%";%N%
	%margin: 0px;%N%
	%background: white;%N%
	%font-weight: bold;%N%
	%color: red;%N%
	%text-decoration:none;%N%
	%}%N%
%.comment {%N%
	%text-align:left;%N%
	%font-size: 10pt;%N%
	%font-family:%"Courier New%";%N%
	%margin: 0px;%N%
	%background: white;%N%
	%font-weight: bold;%N%
	%color: brown%N%
	%text-decoration:none;%N%
	%}%N%
%</style>"

	html_meta: STRING = "[
		<meta name="$name" content="$content">
		<meta http-equiv="Content-Language" content="en">
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		]"

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
--| The Original Code is html_serialisation_profile.e.
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
