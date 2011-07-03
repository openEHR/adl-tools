note
	component:   "openEHR Archetype Project"
	description: "[
				 Basic archetype definitions
				 ]"
	keywords:    "ADL"
	author:      "Thomas Beale"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2006-2009 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"


class ARCHETYPE_DEFINITIONS

feature -- Definitions

	Archetype_native_syntax: STRING = "adl"
			-- Name of native ADL syntax type.

	Archetype_web_syntax: STRING = "html"
			-- Name of web publishing syntax type.

	Archetype_xml_syntax: STRING = "xml"
			-- Name of XML syntax type.

	Archetype_web_page_extension: STRING = ".html"
			-- Extension of web publishing syntax type.

	Archetype_legacy_file_extension: STRING = ".adl"
			-- Extension for legacy flat form archetype files.

	Archetype_flat_file_extension: STRING = ".adlf"
			-- Extension for legacy flat form archetype files.

	Archetype_source_file_extension: STRING = ".adls"
			-- Extension for source form (differential) archetype files.

	Archetype_dummy_file_extension: STRING = ".adlx"
			-- Extension for use with source/flat diff; we don't want to use
			-- the legitimate extension on these files because one is source
			-- and one is flat, and diff tools need to see the same extension;
			-- also we don't want users to get confused about what kind of files
			-- these are

	Archetype_dadl_file_extension: STRING = ".dadl"
			-- Extension for dADL format archetype files.

	Archetype_xml_file_extension: STRING = ".xml"
			-- Extension for XML format archetype files.

	Adl_versions: ARRAYED_LIST [STRING]
			-- list of ADL versions known in this tool
		once
			create Result.make(0)
			Result.compare_objects
			Result.extend("1.4")
			Result.extend("1.4.1")
			Result.extend("1.5")
		end

	Latest_adl_version: STRING
			-- return current latest known ADL version in this tool
		once
			Result := Adl_versions.last
		end

feature -- Comparison

	valid_adl_version (a_ver: attached STRING): BOOLEAN
			-- set adl_version with a string containing only '.' and numbers,
			-- not commencing or finishing in '.'
		require
			Valid_string: not a_ver.is_empty
		local
			str: STRING
		do
			str := a_ver.twin
			str.prune_all ('.')
			Result := str.is_integer and a_ver.item(1) /= '.' and a_ver.item (a_ver.count) /= '.'
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
--| The Original Code is adl_node_control.e.
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
