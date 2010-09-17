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
			ara: ARCH_REP_ARCHETYPE
			arch_id, parent_arch_id: attached ARCHETYPE_ID
			a_file: RAW_FILE
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

				from fs_node_names.start until fs_node_names.off loop
					fn := fs_node_names.item

					if fn.item (1) /= '.' then
						l_full_path := file_system.pathname (a_path, fn)

						create a_file.make (l_full_path)
						if a_file.is_directory then
							dir_name_index.extend (fn)
						elseif adl_flat_filename_pattern_regex.matches (fn) or adl_differential_filename_pattern_regex.matches (fn) then
							-- perform a mini-parse of the file, getting the archetype id, the specialisation status and the specialisation parent
							amp.parse (l_full_path)
							if amp.last_parse_valid then
								if not amp.last_archetype_id_old_style then
									create arch_id.make_from_string(amp.last_archetype_id)

									-- create the descriptor and put it into a local Hash for this node
									if amp.last_archetype_specialised then
										if not amp.last_parent_archetype_id_old_style then
											create parent_arch_id.make_from_string(amp.last_parent_archetype_id)
											create ara.make_specialised (l_full_path, arch_id, parent_arch_id, Current, amp.last_archetype_artefact_type)
											insert_descriptor_into_directory (ara)
										else
											post_error (Current, "build_directory", "parse_archetype_e11", <<fn, amp.last_parent_archetype_id>>)
										end
									else
										create ara.make (l_full_path, arch_id, Current, amp.last_archetype_artefact_type)
										insert_descriptor_into_directory (ara)
									end
								else
									post_warning (Current, "build_directory", "parse_archetype_e7", <<fn, amp.last_archetype_id>>)
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

	insert_descriptor_into_directory (ara: ARCH_REP_ARCHETYPE)
			-- this function ensures only one of a .adl/.adls pair goes into the repository
			-- look to see if more recent version of an existing archetype; if so, use it
		do
			if not archetype_id_index.has (ara.id.semantic_id) then
				archetype_id_index.force (ara, ara.id.semantic_id)
			elseif ara.id.version_number > archetype_id_index.item (ara.id.semantic_id).id.version_number then
				archetype_id_index.replace (ara, ara.id.semantic_id)
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
