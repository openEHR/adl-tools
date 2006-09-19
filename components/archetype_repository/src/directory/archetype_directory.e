indexing	
	component:   "openEHR Archetype Project"
	description: "[
				 Archteype directory - a data structure containing a archetypes found in a file-based 
				 repository. In the structure, specialised archetypes are subordinates of their parent 
				 archetypes, if the latter are known, else they are on the level of the parent.
				 ]"
	keywords:    "ADL"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2006 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"


class ARCHETYPE_DIRECTORY

inherit
	SHARED_RESOURCES
		export
			{NONE} all
		end

	ARCHETYPE_DEFINITIONS
		export
			{NONE} all
		end

feature -- Access

	repository_path: STRING
			-- path to the root of the repository containing the archetypes

	directory: TWO_WAY_TREE [ARCHETYPE_DIRECTORY_ITEM]
			-- tree-structured directory of archetypes
						
	index: HASH_TABLE [TWO_WAY_TREE [ARCHETYPE_DIRECTORY_ITEM], STRING]
			-- index of archetype nodes in archetype_directory, keyed by archetype domain_concept

feature -- Commands
	
	populate(a_dir_name: STRING) is
			-- make based on valid directory path
		require
			Dir_name_valid: a_dir_name /= Void and then (create {DIRECTORY}.make(a_dir_name)).exists
		do
			create index.make(0)
			repository_path := a_dir_name
			directory := populate_directory(repository_path)
		end
		
feature {NONE} -- Implementation

	populate_directory(a_dir_name: STRING): TWO_WAY_TREE [ARCHETYPE_DIRECTORY_ITEM] is
			-- add archetype and folder meta-data for directory to archetype directory
		require
			Dir_name_valid: a_dir_name /= Void
		local
			fn, fpath: STRING
			a_dir: DIRECTORY
			fs_node_names: ARRAYED_LIST[STRING]
			dir_name_index: SORTED_TWO_WAY_LIST[STRING]
			file_name_index: SORTED_TWO_WAY_LIST[ARCHETYPE_ID]
			file_name_table: HASH_TABLE[STRING, STRING]
			a_file: RAW_FILE
			an_arch_id: ARCHETYPE_ID
			an_arch_name: STRING
			ada_item: ARCHETYPE_DIRECTORY_ARCHETYPE
			arch_node, non_spec_arch_node: TWO_WAY_TREE [ARCHETYPE_DIRECTORY_ITEM]
   		do
			create a_dir.make(a_dir_name)
			create Result.make(create {ARCHETYPE_DIRECTORY_FOLDER}.make(a_dir_name))

			if a_dir.exists then
				a_dir.open_read
				fs_node_names := a_dir.linear_representation
				create file_name_index.make
				create dir_name_index.make
				create file_name_table.make(0)
				from 
					fs_node_names.start
				until 
					fs_node_names.off
				loop
					fn := fs_node_names.item
					if not (fn.is_equal(".") or fn.is_equal("..") or fn.item (1) = '.') then
						fpath := a_dir_name + Os_directory_separator.out + fn
						create a_file.make(fpath)	
						if a_file.is_directory then
							dir_name_index.extend (fn)
						elseif a_file.is_plain and base_name_pattern_regex.matches(fn) then
							an_arch_name := fn.twin
							an_arch_name.remove_tail(("." + Archetype_file_extension).count)
							create an_arch_id.default_create
							if an_arch_id.valid_id(an_arch_name) then
								an_arch_id.make_from_string(an_arch_name)
								file_name_index.extend (an_arch_id)
								file_name_table.put(fn, an_arch_id.as_string)
							end
						end			
					end
					fs_node_names.forth
				end
			end
			
			from
				dir_name_index.start
			until
				dir_name_index.off
			loop
				fpath := a_dir_name + Os_directory_separator.out + dir_name_index.item
				Result.put_child_right (populate_directory(fpath))
				Result.child_forth				
				dir_name_index.forth
			end
			
			from
				file_name_index.start
			until
				file_name_index.off
			loop
				fpath := a_dir_name + Os_directory_separator.out + file_name_table.item(file_name_index.item.as_string)
				an_arch_id := file_name_index.item				
				create ada_item.make(fpath, an_arch_id, an_arch_id.is_specialised)
				create arch_node.make(ada_item)
				if not an_arch_id.is_specialised then
					Result.put_child_right(arch_node)
					Result.child_forth
				else
					if index.has(an_arch_id.domain_concept_base) then
						non_spec_arch_node := index.item(an_arch_id.domain_concept_base)
					else
						non_spec_arch_node := Result
					end
					non_spec_arch_node.put_child_right(arch_node)
					non_spec_arch_node.child_forth
				end
				index.put(arch_node, an_arch_id.domain_concept)
				
				file_name_index.forth
			end		
		end
							
	base_name_pattern_regex: LX_DFA_REGULAR_EXPRESSION is
			-- pattern matcher for filenames ending in ".adl"
		once
			create Result.compile_case_insensitive(".*\." + Archetype_file_extension + "$")
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
