indexing
	component:   "openEHR Archetype Project"
	description: "Descriptor of an archetype in a directory of archetypes"
	keywords:    "ADL, archetype"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2006 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"


class ARCHETYPE_DIRECTORY_ARCHETYPE

inherit 
	ARCHETYPE_DIRECTORY_ITEM
		rename
			make as make_adi
		end

create
	make

feature -- Initialisation

	make(a_root_path, a_full_path: STRING; a_group_id: INTEGER; an_id: ARCHETYPE_ID; is_specialised_flag: BOOLEAN) is
		require
			Root_path_valid: a_root_path /= Void and then not a_root_path.is_empty
			Full_path_valid: a_full_path /= Void and then not a_full_path.is_empty and then a_full_path.substring_index (a_root_path, 1) = 1
			Group_id_valid: a_group_id > 0
			Id_valid: an_id /= Void
		local
			arch_rel_path: STRING
		do
			id := an_id
			is_specialised := is_specialised_flag
			make_adi(a_root_path, a_full_path, a_group_id)
		end

feature -- Access

	id: ARCHETYPE_ID

	is_specialised: BOOLEAN
			
feature {NONE} -- Implementation

	make_semantic_paths is
			-- make semantic_path and semantic_parent_path
		local
			arch_sem_path: STRING
		do			
			semantic_path := full_path.substring (root_path.count + 1, full_path.last_index_of(os_directory_separator, full_path.count)-1)
			semantic_parent_path := semantic_path.twin

			-- generate a semantic path that corresponds to this archetype: 
			-- constructed from the relative folder path + the semantic part of the archetype id, with '-' separators
			-- changed to '/' so that the entire path is '/'-separated
			arch_sem_path := id.domain_concept
			arch_sem_path.replace_substring_all (id.section_separator.out, os_directory_separator.out)
			semantic_path.append(os_directory_separator.out + arch_sem_path)

			arch_sem_path := id.domain_concept_base
			if not arch_sem_path.is_empty then
				arch_sem_path.replace_substring_all (id.section_separator.out, os_directory_separator.out)
				semantic_parent_path.append(os_directory_separator.out + arch_sem_path)
			end
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
