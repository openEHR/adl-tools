indexing
	component:   "openEHR Archetype Project"
	description: "Shared context settings for serialisation"
	keywords:    "test, ADL"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2003 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class SHARED_APPLICATION_CONTEXT

inherit
	OPENEHR_DEFINITIONS
		export
			{NONE} all
		end

	ARCHETYPE_DEFINITIONS

feature -- Access

	current_language: STRING is
		do
			Result := cell_language.item
		ensure
			Result_exists: Result /= Void
		end

	use_adl_version: STRING is
		do
			Result := cell_use_adl_version.item
		ensure
			Result_exists: Result /= Void
		end

	use_adl_version_numeric: INTEGER is
		local
			s: STRING
		do
			s := use_adl_version.twin
			s.prune_all ('.')
			if s.is_integer then
				Result := s.to_integer
			end
		end

feature -- Modification

	set_current_language(a_lang: STRING) is
			-- set `language'
		require
			a_lang /= Void and then not a_lang.is_empty
		do
			cell_language.put(a_lang)
		end

	set_use_adl_version(a_ver: STRING) is
			-- set `use_adl_version'
		require
			a_ver /= Void and then adl_versions.has (a_ver)
		do
			cell_use_adl_version.put(a_ver)
		end

feature {NONE} -- Implementation

	cell_language: CELL[STRING] is
			-- language to serialise in, for comments and other language-specific items
		once
			create Result.put(Default_language)
		end

	cell_use_adl_version: CELL[STRING] is
			-- ADL version to serialise archetypes in
		once
			create Result.put(latest_adl_version)
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
--| The Original Code is shared_adl_context.e.
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
