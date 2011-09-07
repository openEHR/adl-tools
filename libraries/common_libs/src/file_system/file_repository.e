note
	component:   "openEHR Archetype Project"
	description: "[
			 Simple notion of a library of archetypes, implemented simply
			 as a directory on the file system
			 ]"
	keywords:    "test, ADL"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2003 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class FILE_REPOSITORY

inherit
	ANY
		export
			{NONE} all
		end

create
	make

feature -- Initialisation

	make(a_dir_name, a_base_name_pattern: STRING)
			-- initialise with root directory, and file basename pattern
			-- (default will be set if `a_base_name_pattern' is Void)
		require
			Dir_name_exists: a_dir_name /= Void and then not a_dir_name.is_empty
			Ext_valid: a_base_name_pattern /= Void and then not a_base_name_pattern.is_empty
   		do
			create base_name_pattern.make(0)
			base_name_pattern.append(a_base_name_pattern)
			create base_name_pattern_regex.compile_case_insensitive(base_name_pattern)
			if not base_name_pattern_regex.is_compiled then
				make_error := "pattern " + base_name_pattern + " did not compile; reason: "
			else
				create file_paths.make(0)
				find_file_paths(a_dir_name)
				if file_paths.is_empty then
					make_error := "No files matching pattern " + base_name_pattern + 
						" found in directory " + a_dir_name + 
						" (use .cfg file to set path)"
				end
			end

		ensure
			make_failed or else not file_paths.is_empty
		end

feature -- Access

	base_name_pattern: STRING
			-- pattern to use for files
	
	make_error: STRING
			-- set if make failed

	file_ids: ARRAYED_LIST[STRING]
			-- file names not including extension
		do
			if stored_file_ids = Void then
				create stored_file_ids.make(file_paths.count)
				from 
					file_paths.start
				until
					file_paths.off
				loop
					stored_file_ids.extend(file_paths.key_for_iteration)
					file_paths.forth
				end
			end
			Result := stored_file_ids
		end
	
	file_path(id: STRING): STRING
			-- get path for archetype id `id'
		require
			Id_valid: id /= Void and then has_file_id(id)
		do
			Result := file_paths.item(id)
		end
		
feature -- Status Report

	make_failed: BOOLEAN 
			-- True if created with invalid directory
		do
			Result := make_error /= Void
		end
		
	has_file_id(file_id: STRING): BOOLEAN
		require
			file_id /= Void and then not file_id.is_empty
		do
			Result := file_paths.has(file_id)
		end

feature {NONE} -- Implementation

	stored_file_ids: ARRAYED_LIST[STRING]

	base_name_pattern_regex: LX_DFA_REGULAR_EXPRESSION
	
	file_paths: HASH_TABLE[STRING, STRING]
			-- archetype full pathnames keyed by archetype ids

	find_file_paths(a_dir_name: STRING)
			-- add archetype ids found in directory and subdirectories to file_ids table
		require
			Dir_name_exists: a_dir_name /= Void and then not a_dir_name.is_empty
		local
			fn, fpath: STRING
			a_dir: DIRECTORY
			fnames: ARRAYED_LIST[STRING]
			a_file: RAW_FILE
   		do
			create a_dir.make(a_dir_name)
			if a_dir.exists then
				a_dir.open_read
				fnames := a_dir.linear_representation
				from 
					fnames.start
				until 
					fnames.off
				loop
					fn := fnames.item
					if not (fn.is_equal(".") or fn.is_equal("..")) then
						fpath := a_dir_name + "\" + fn
						create a_file.make(fpath)	
						if a_file.is_directory then
							find_file_paths(fpath.twin)
						elseif a_file.is_plain then
							if base_name_pattern_regex.matches(fn) then
								file_paths.put(fpath, fn.substring(1, fn.count-fn.last_index_of('.', 1)))
							end
						end			
					end
					fnames.forth						
				end
			else
				make_error := "could not open directory " + a_dir_name
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
--| The Original Code is file_repository.e.
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
