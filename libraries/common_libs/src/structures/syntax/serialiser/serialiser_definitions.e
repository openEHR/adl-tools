indexing
	component:   "openEHR Archetype Project"
	description: "Common things for all SML archetypes"
	keywords:    "test, SML"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2003 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class SERIALISER_DEFINITIONS

feature -- Access

	FMT_SPACE: INTEGER is 100

	FMT_INDENT:	INTEGER is 101

	FMT_NEWLINE: INTEGER is 102

	FMT_DOC_START: INTEGER is 103

	FMT_DOC_END: INTEGER is 104

	FMT_DOC_STYLES: INTEGER is 105

	FMT_START_BODY: INTEGER is 106

	FMT_END_BODY: INTEGER is 107

	FMT_START_SPAN: INTEGER is 108

	FMT_END_SPAN: INTEGER is 109

	FMT_COMMENT: INTEGER is 110

	FMT_START_TITLE: INTEGER is 111

	FMT_END_TITLE: INTEGER is 112

	FMT_META_ITEM: INTEGER is 113

	FMT_LIST_ITEM_SEPARATOR: INTEGER is 114

	FMT_ASSUMED_VALUE_SEPARATOR: INTEGER is 115

	STYLE_KEYWORD: INTEGER is 200

	STYLE_IDENTIFIER: INTEGER is 201

	STYLE_OPERATOR: INTEGER is 202

	STYLE_TERM_REF: INTEGER is 203

	STYLE_VALUE: INTEGER is 204

	STYLE_COMMENT: INTEGER is 205

	STYLE_INHERITED_IDENTIFIER: INTEGER is 301

	STYLE_REDEFINED_IDENTIFIER: INTEGER is 401

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
--| The Original Code is serialiser_definitions.e.
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
