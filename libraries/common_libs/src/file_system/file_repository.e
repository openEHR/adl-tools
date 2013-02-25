note
	component:   "openEHR Archetype Project"
	description: "[
			 Simple notion of a library of archetypes, implemented simply
			 as a directory on the file system
			 ]"
	keywords:    "test, ADL"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2003- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "See notice at bottom of class"

class FILE_REPOSITORY

inherit
	KL_SHARED_FILE_SYSTEM
		export
			{NONE} all;
			{ANY} deep_copy, deep_twin, is_deep_equal, standard_is_equal
		end

create
	make

feature {NONE} -- Initialisation

	make (a_dir_name, a_match_pattern: STRING)
			-- initialise with `a_dir_name', and a filename match regex `a_match_pattern'
		require
			Dir_name_exists: not a_dir_name.is_empty
			Ext_valid: not a_match_pattern.is_empty
   		do
   			create errors.make
   			create matching_paths.make (0)
			base_name_pattern := a_match_pattern

			create base_name_pattern_regex.make
			base_name_pattern_regex.set_case_insensitive (True)
			base_name_pattern_regex.compile (base_name_pattern)
			if not base_name_pattern_regex.is_compiled then
				errors.add_error ("regex_invalid", <<base_name_pattern>>, generator + ".make")
			else
				find_matching_file_paths (a_dir_name)
			end
		end

feature -- Access

	base_name_pattern: STRING
			-- pattern to use for files

	errors: ERROR_ACCUMULATOR
			-- set if make failed

	matching_paths: ARRAYED_LIST [STRING]
			-- file paths matching `base_name_pattern'

feature {NONE} -- Implementation

	base_name_pattern_regex: RX_PCRE_REGULAR_EXPRESSION

	find_matching_file_paths (a_dir_name: STRING)
			-- add file paths found in `a_dir_name' that match `base_name_pattern'
		require
			Dir_name_valid: not a_dir_name.is_empty
		local
			a_dir: DIRECTORY
			a_file: RAW_FILE
			rel_cur_dir, rel_parent_dir, fpath: STRING
   		do
    		check attached file_system.relative_current_directory as cd and attached file_system.relative_parent_directory as pd then
   				rel_cur_dir := cd
   				rel_parent_dir := pd
   			end
			create a_dir.make (a_dir_name)
			if a_dir.exists and a_dir.is_readable then
				a_dir.open_read
				across a_dir.linear_representation as fnames_csr loop
					if not (fnames_csr.item.is_equal (rel_cur_dir) or fnames_csr.item.is_equal (rel_parent_dir)) then
						check attached file_system.pathname (a_dir_name, fnames_csr.item) as f then
							fpath := f
						end
						create a_file.make (fpath)
						if a_file.is_directory then
							find_matching_file_paths (fpath.twin)
						elseif base_name_pattern_regex.matches (fnames_csr.item) then
							matching_paths.extend (fpath)
						end
					end
				end
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
