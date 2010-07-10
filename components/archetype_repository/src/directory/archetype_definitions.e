note
	component:   "openEHR Archetype Project"
	description: "[
				 Basic archetype definitions
				 ]"
	keywords:    "ADL"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.com>"
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

	archetype_legacy_file_extension: STRING = ".adl"
			-- Extension for legacy flat form archetype files.

	archetype_flat_file_extension: STRING = ".adlf"
			-- Extension for legacy flat form archetype files.

	Archetype_source_file_extension: STRING = ".adls"
			-- Extension for source form (differential) archetype files.

	Ontological_path_separator: STRING = "/"

	Archetype_category: STRING = "archetypes"

	Template_category: STRING = "templates"

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

	Group_id_adhoc: INTEGER = 1

	Group_id_reference: INTEGER = 2

	Group_id_work: INTEGER = 3

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
