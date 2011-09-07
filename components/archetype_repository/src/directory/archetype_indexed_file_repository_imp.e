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

	get_archetypes_in_folder (a_path: STRING)
			-- Add archetype and folder meta-data nodes to `archetypes' list, and call recursively to folders below
		local
			fn, l_full_path: STRING
			a_dir: DIRECTORY
			fs_node_names: ARRAYED_LIST [STRING]
			dir_name_index: SORTED_TWO_WAY_LIST [STRING]
			ara: ARCH_CAT_ARCHETYPE
			amp: ARCHETYPE_MINI_PARSER
   		do
   			-- generate lists of immediate child directory and archetype file names
   			-- in the current directory 'a_parent_node.item.full_path'
   			debug("arch_dir")
   				io.put_string(shifter + "---> " + a_path + "%N")
   				shifter.extend ('%T')
   			end

			create amp
			create a_dir.make (a_path)

			if a_dir.exists then
				a_dir.open_read
				fs_node_names := a_dir.linear_representation
				create dir_name_index.make

				-- deal with legacy archetype files and directories first
				from fs_node_names.start until fs_node_names.off loop
					fn := fs_node_names.item
					if fn.item (1) /= '.' then
						l_full_path := file_system.pathname (a_path, fn)
						if file_system.directory_exists (l_full_path) then
							dir_name_index.extend (fn)
						elseif adl_legacy_flat_filename_pattern_regex.matches (fn) then
							-- perform a mini-parse of the file, getting the archetype id, the specialisation status and the specialisation parent
							amp.parse (l_full_path)
							if amp.last_parse_valid then
								if amp.last_archetype.archetype_id_is_old_style then
									post_error (Current, "build_directory", "parse_archetype_e7", <<fn, amp.last_archetype.archetype_id.as_string>>)
								elseif amp.last_archetype.is_specialised and amp.last_archetype.parent_archetype_id_is_old_style then
									post_error (Current, "build_directory", "parse_archetype_e11", <<fn, amp.last_archetype.parent_archetype_id.as_string>>)
								else -- create the descriptor and put it into a local Hash for this node
									create ara.make_legacy (l_full_path, Current, amp.last_archetype)
									archetype_id_index.force (ara, ara.id.as_string)
								end
							else
								post_error (Current, "build_directory", "general", <<amp.last_parse_fail_reason>>)
							end
						end
					end
					fs_node_names.forth
				end

				-- deal with differential files; can be generated from legacy, or may be the primary artefact
				from fs_node_names.start until fs_node_names.off loop
					fn := fs_node_names.item
					if fn.item (1) /= '.' then
						if adl_differential_filename_pattern_regex.matches (fn) then
							l_full_path := file_system.pathname (a_path, fn)
							amp.parse (l_full_path)
							if amp.last_parse_valid then
								if not archetype_id_index.has (amp.last_archetype.archetype_id.as_string) then
									create ara.make (l_full_path, Current, amp.last_archetype)
									archetype_id_index.force (ara, ara.id.as_string)
								end
							else
								post_error (Current, "build_directory", "general", <<amp.last_parse_fail_reason>>)
							end
						end
					end
					fs_node_names.forth
				end
			end

			-- for all directories below this one, call this routine recursively
			from dir_name_index.start until dir_name_index.off loop
				get_archetypes_in_folder (file_system.pathname (a_path, dir_name_index.item))
				dir_name_index.forth
			end

   			debug("arch_dir")
   				shifter.remove_tail (1)
   				io.put_string(shifter + "<---%N")
   			end
		end

	adl_legacy_flat_filename_pattern_regex: attached LX_DFA_REGULAR_EXPRESSION
			-- Pattern matcher for filenames ending in ".adl".
		once
			create Result.compile_case_insensitive (".*\" + File_ext_archetype_adl14 + "$")
		end

	adl_differential_filename_pattern_regex: attached LX_DFA_REGULAR_EXPRESSION
			-- Pattern matcher for filenames ending in ".adls".
		once
			create Result.compile_case_insensitive (".*\" + File_ext_archetype_source + "$")
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
