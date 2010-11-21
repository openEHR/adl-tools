note
	component:   "openEHR Archetype Project"
	description: "Descriptor of a folder in a directory of archetypes"
	keywords:    "ADL, archetype"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2006 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"


class ARCH_REP_FOLDER

inherit
	ARCH_REP_ITEM

create
	make

feature {NONE} -- Implementation

	make_ontological_paths
			-- Make `base_name', `ontological_path' and `ontological_parent_path'.
		local
			pos: INTEGER
		do
			ontological_path := full_path.substring (root_path.count + 1, full_path.count)
			ontological_path.replace_substring_all (os_directory_separator.out, ontological_path_separator)

			if ontological_path.is_empty then
				ontological_path := ontological_path_separator.twin
			end

			pos := ontological_path.last_index_of (ontological_path_separator.item (1), ontological_path.count)
			ontological_parent_path := ontological_path.substring (1, pos - 1)
			base_name := ontological_path.substring (pos + ontological_path_separator.count, ontological_path.count)
		end

feature -- Access

	group_name: STRING
			-- Name distinguishing the type of item and the group to which its `repository' belongs.
			-- Useful as a logical key to pixmap icons, etc.
		do
			Result := "file_folder_" + file_repository.group_id.out
		end

	ontological_name: STRING
			-- semantic name of this node, relative to parent concept, which is either class or package name, or else as concept name of archetype
			-- used to generate ontological path

	display_name: STRING
			-- semantic name of this node to use in display context

feature -- Status Report

	has_artefacts: BOOLEAN
			-- True if there are any artefacts at or below this point

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
--| The Original Code is archetype_directory_item.e.
--|
--| The Initial Developer of the Original Code is Thomas Beale.
--| Portions created by the Initial Developer are Copyright (C) 2006
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
