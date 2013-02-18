note
	component:   "openEHR Archetype Project"
	description: "Application specific factory routines"
	keywords:    "AWB, archetypes, workbench"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2012- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "See notice at bottom of class"

class APP_OBJECT_FACTORY

feature -- Factory

	create_arch_cat_archetype_make_legacy (a_path: STRING; a_repository: ARCHETYPE_REPOSITORY_I; arch_thumbnail: ARCHETYPE_THUMBNAIL): ARCH_CAT_ARCHETYPE
		do
			create Result.make_legacy (a_path, a_repository, arch_thumbnail)
		end

	create_arch_cat_archetype_make (a_path: STRING; a_repository: ARCHETYPE_REPOSITORY_I; arch_thumbnail: ARCHETYPE_THUMBNAIL): ARCH_CAT_ARCHETYPE
		do
			create Result.make (a_path, a_repository, arch_thumbnail)
		end

	create_arch_cat_archetype_make_new_archetype (an_id: ARCHETYPE_ID; a_repository: ARCHETYPE_REPOSITORY_I; a_directory: STRING): ARCH_CAT_ARCHETYPE
		do
			create Result.make_new_archetype (an_id, a_repository, a_directory)
		end

	create_arch_cat_archetype_make_new_specialised_archetype (an_id: ARCHETYPE_ID; a_parent: ARCHETYPE; a_repository: ARCHETYPE_REPOSITORY_I; a_directory: STRING): ARCH_CAT_ARCHETYPE
		do
			create Result.make_new_specialised_archetype (an_id, a_parent, a_repository, a_directory)
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
--| The Original Code is gui_agents.e.
--|
--| The Initial Developer of the Original Code is Thomas Beale.
--| Portions created by the Initial Developer are Copyright (C) 2011
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
