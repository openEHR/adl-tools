note
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

	current_language: STRING
		do
			Result := cell_language.item
		ensure
			Result_exists: Result /= Void
		end

	use_flat_adl_version: STRING
		do
			Result := cell_use_flat_adl_version.item
		ensure
			Result_exists: Result /= Void
		end

	strict_validation: BOOLEAN
			-- True if strict validation should be used
		do
			Result:= cell_strict_validation.item
		end

	use_flat_adl_version_numeric: INTEGER
			-- generate a numeric equivalent of the ADL version in use, e.g.
			-- '1.5' -> 150
			-- '1.4.1' -> 141
		local
			s: STRING
		once
			s := use_flat_adl_version.twin
			s.prune_all ('.')
			if s.count < 3 then
				s.append (create {STRING}.make_filled ('0', 3 - s.count))
			end
			if s.is_integer then
				Result := s.to_integer
			end
		ensure
			Result > 100 and Result <= 999
		end

feature -- Modification

	set_current_language(a_lang: STRING)
			-- set `language'
		require
			a_lang /= Void and then not a_lang.is_empty
		do
			cell_language.put(a_lang)
		end

	set_use_flat_adl_version(a_ver: STRING)
			-- set `use_flat_adl_version'
		require
			a_ver /= Void and then adl_versions.has (a_ver)
		do
			cell_use_flat_adl_version.put(a_ver)
		end

	set_strict_validation (flag: BOOLEAN)
			-- set `strict_validation'
		do
			cell_strict_validation.put(flag)
		end

feature {NONE} -- Implementation

	cell_language: CELL[STRING]
			-- language to serialise in, for comments and other language-specific items
		once
			create Result.put(Default_language)
		end

	cell_use_flat_adl_version: CELL[STRING]
			-- ADL version to serialise archetypes in
		once
			create Result.put(latest_adl_version)
		end

	cell_strict_validation: CELL[BOOLEAN]
			-- ADL version to serialise archetypes in
		once
			create Result.put(False)
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
