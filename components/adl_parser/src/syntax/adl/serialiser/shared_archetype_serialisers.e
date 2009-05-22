note
	component:   "openEHR Archetype Project"
	description: "cADL serialisers"
	keywords:    "test, ADL"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2003, 2004 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class SHARED_ARCHETYPE_SERIALISERS

inherit
	ARCHETYPE_DEFINITIONS

feature -- Access

	archetype_serialiser_formats: attached ARRAYED_LIST [STRING]
			-- List of format names.
		once
			create Result.make (0)

			from
				archetype_serialisers.start
			until
				archetype_serialisers.off
			loop
				Result.extend (archetype_serialisers.key_for_iteration)
				archetype_serialisers.forth
			end

			Result.compare_objects
		ensure
			not_empty: not Result.is_empty
			each_format_has_file_extension: Result.for_all (agent (format: STRING): BOOLEAN
				do
					Result := archetype_file_extensions.has (format)
				end)
		end

	archetype_serialiser_for_format (a_format: STRING): ARCHETYPE_SERIALISER
			-- The archetype serialiser for `a_format'.
		require
			format_attached: a_format /= Void
			format_valid: has_archetype_serialiser_format (a_format)
		do
			Result := archetype_serialisers [a_format]
		ensure
			Result_exists: Result /= Void
		end

	archetype_file_extensions: attached HASH_TABLE [STRING, STRING]
			-- File extensions for logical serialisation formats.
		once
			create Result.make (0)
			Result.put (archetype_source_file_extension, archetype_native_syntax)
			Result.put (".html", "html")
			Result.put (".xml", "xml")
			Result.put (".owl", "owl")
		ensure
			not_empty: not Result.is_empty
		end

feature -- Status Report

	has_archetype_serialiser_format (a_format: STRING): BOOLEAN
			-- Is `a_format' supported for serialisation?
		require
			format_attached: a_format /= Void
		do
			Result := archetype_serialisers.has (a_format)
		end

feature {NONE} -- Implementation

	archetype_serialisers: attached HASH_TABLE [ARCHETYPE_SERIALISER, STRING]
			-- The supported archetype serialisers.
		once
			create Result.make (0)
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
--| The Original Code is shared_adl_serialisers.e.
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
