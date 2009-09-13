note
	component:   "openEHR Archetype Project"
	description: "File-system repository of archetypes - implementation of ARCHETYPE_INDEXED_REPOSITORY_I."
	keywords:    "ADL"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2007 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL: $"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate: $"


class ARCHETYPE_INDEXED_FILE_REPOSITORY_IMP

inherit
	ARCHETYPE_INDEXED_REPOSITORY_I

	ARCHETYPE_FILE_REPOSITORY_IMP

create
	make

feature {NONE} -- Implementation

	build_directory (tree: like directory)
			-- Add archetype and folder meta-data to `tree'.
		local
			fn, full_path, dir_full_path: STRING
			a_dir: DIRECTORY
			fs_node_names: ARRAYED_LIST [STRING]
			dir_name_index: SORTED_TWO_WAY_LIST [STRING]
			arch_index: HASH_TABLE [ARCH_REP_ARCHETYPE, STRING]
			sorted_arch_index: SORTED_TWO_WAY_LIST[ARCH_REP_ARCHETYPE]
			ara: ARCH_REP_ARCHETYPE
			arch_id_str: STRING
			node: like directory
			arch_id: attached ARCHETYPE_ID
   		do
   			-- generate lists of immediate child directory and archetype file names
   			-- in the current directory 'tree.item.full_path'
   			debug("arch_dir")
   				io.put_string(shifter + "---> " + tree.item.full_path + "%N")
   				shifter.extend ('%T')
   			end

			create a_dir.make (tree.item.full_path)

			if a_dir.exists then
				a_dir.open_read
				fs_node_names := a_dir.linear_representation
				create arch_index.make(0)
				create dir_name_index.make

				from
					fs_node_names.start
				until
					fs_node_names.off
				loop
					fn := fs_node_names.item

					if fn.item (1) /= '.' then
						full_path := file_system.pathname (tree.item.full_path, fn)

						if (create {RAW_FILE}.make (full_path)).is_directory then
							dir_name_index.extend (fn)
						elseif adl_flat_filename_pattern_regex.matches (fn) or adl_differential_filename_pattern_regex.matches (fn) then
							arch_id_str := archteype_id_from_path(full_path)
							if arch_id_str /= Void then
								create arch_id.make_from_string(arch_id_str)

								-- the following check ensures only one of a .adl/.adls pair goes into the repository
								if not arch_index.has (arch_id.semantic_id) then
									create ara.make (root_path, full_path, arch_id, Current)
									arch_index.force (ara, arch_id.semantic_id)
								-- look to see if more recent version of an existing archetype; if so, use it
								elseif arch_id.version_number > arch_index.item (arch_id.semantic_id).id.version_number then
									create ara.make (root_path, full_path, arch_id, Current)
									arch_index.replace (ara, arch_id.semantic_id)
								end
							else
	-- FIXME: to support old-style archetype ids with 'draft' in the name; remove when appropriate
	arch_id_str := old_archteype_id_from_path(full_path)
	if arch_id_str /= Void then
		create arch_id.old_make_from_string(arch_id_str)
		if not arch_index.has (arch_id.semantic_id) then
			create ara.make (root_path, full_path, arch_id, Current)
			arch_index.force (ara, arch_id.semantic_id)
			post_warning (Current, "build_directory", "invalid_filename_e1", <<fn>>)
		end
	else
								post_error (Current, "build_directory", "invalid_filename_e1", <<fn>>)
	end
							end
						end
					end

					fs_node_names.forth
				end
			end

			-- process the directories list first:
			-- for all directories below this one, call this routine recursively
			from
				dir_name_index.start
			until
				dir_name_index.off
			loop
				dir_full_path := file_system.pathname (tree.item.full_path, dir_name_index.item)
				node := new_folder_node (dir_full_path)
				build_directory (node)
				tree.put_child_right (node)
				tree.child_forth
				dir_name_index.forth
			end

			-- now create nodes representing all the files for this point
			create sorted_arch_index.make
			sorted_arch_index.append (arch_index.linear_representation)
			sorted_arch_index.sort
			from
				sorted_arch_index.start
			until
				sorted_arch_index.off
			loop
				create node.make (sorted_arch_index.item)
				tree.put_child_right (node)
				tree.child_forth
				sorted_arch_index.forth
			end

   			debug("arch_dir")
   				shifter.remove_tail (1)
   				io.put_string(shifter + "<---%N")
   			end
		end

	adl_flat_filename_pattern_regex: attached LX_DFA_REGULAR_EXPRESSION
			-- Pattern matcher for filenames ending in ".adl".
		once
			create Result.compile_case_insensitive (".*\" + archetype_legacy_file_extension + "$")
		end

	adl_differential_filename_pattern_regex: attached LX_DFA_REGULAR_EXPRESSION
			-- Pattern matcher for filenames ending in ".adls".
		once
			create Result.compile_case_insensitive (".*\" + Archetype_source_file_extension + "$")
		end

	shifter: STRING
			-- Debug indenter.
		once
			create Result.make_empty
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
