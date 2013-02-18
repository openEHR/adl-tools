note
	component:   "openEHR Archetype Project"
	description: "[
				 Directory representation of a file-system archetype repository.
				 ]"
	keywords:    "ADL"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2006-2012 Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "See notice at bottom of class"

deferred class ARCHETYPE_INDEXED_REPOSITORY_I

inherit
	ARCHETYPE_REPOSITORY_I

feature {NONE} -- Initialisation

	make (dir_name: attached STRING; a_group_id: INTEGER)
			-- Create as part of `a_group_id', based on valid directory path.
		require
			dir_name_valid: is_valid_directory (dir_name)
			group_id_valid: a_group_id > 0
		do
			group_id := a_group_id
			full_path := dir_name
		ensure
			root_path_set: full_path = dir_name
			group_id_set: group_id = a_group_id
		end

feature -- Access

	full_path: STRING
			-- Path of file-system repository of archetypes.

feature {ARCHETYPE_CATALOGUE} -- Access

	fast_archetype_list: ARRAYED_LIST [ARCH_CAT_ARCHETYPE]
			-- linear index list for efficient processing
		attribute
			create Result.make (0)
		end

feature -- Commands

	populate
			-- Make based on `root_path'.
		do
			archetype_id_index.wipe_out
			fast_archetype_list.wipe_out
			get_archetypes_in_folder (full_path)
			across archetype_id_index as arch_ids_csr loop
				fast_archetype_list.extend (arch_ids_csr.item)
			end
		end

feature {NONE} -- Implementation

	get_archetypes_in_folder (a_path: STRING)
			-- Build a literal representation of the archetype and folder structure
			-- in the repository path, as a tree; each node carries some meta-data.
		require
			Path_valid: not a_path.is_empty
   		deferred
		end

invariant
	repository_path_valid: is_valid_directory (full_path)

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
