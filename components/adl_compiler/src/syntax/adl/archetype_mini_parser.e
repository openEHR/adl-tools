note
	component:   "openEHR Archetype Project"
	description: "[
				 Simple, fast hand-built parser for handling the top few lines of ADL files, where it can figure
				 out the kind of file (archetype, template, etc) and also the specialisation parent.
				 ]"
	keywords:    "ADL"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2010- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "See notice at bottom of class"

class ARCHETYPE_MINI_PARSER

inherit
	ADL_SYNTAX_CONVERTER
		rename
			file_exists as is_valid_path
		export
			{NONE} all;
			{ANY} deep_copy, deep_twin, is_deep_equal, standard_is_equal, is_valid_path
		end

feature -- Definitions

	Other_details_dadl_name: STRING = "other_details"

	Generated_flag_string: STRING = "generated"

	Adl_version_string: STRING = "adl_version"

	Dadl_left_delim: CHARACTER = '<'

	Dadl_right_delim: CHARACTER = '>'

	Dadl_key_left_delim: CHARACTER = '['

	Dadl_key_right_delim: CHARACTER = ']'

	Double_quote_char: CHARACTER = '"'

feature -- Access

	last_archetype: detachable ARCHETYPE_THUMBNAIL
			-- thumbnail form of last parsed archetype

	last_parse_fail_reason: STRING
		attribute
			create Result.make_empty
		end

feature -- Status Report

	last_parse_valid: BOOLEAN
			-- True if last parse was ok

feature -- Commands

	parse (a_full_path: STRING)
			-- perform quick parse of lines down to 'concept' line or EOF, and obtain archetype_id,
			-- specialisation status and if specialised, specialisation parent
		require
			path_valid: is_valid_path (a_full_path)
		local
			lines: LIST [STRING]
			artefact_types: ARTEFACT_TYPE
			id_bad: BOOLEAN
			arch_is_differential, arch_is_generated, arch_id_is_old_style, arch_parent_id_is_old_style: BOOLEAN
			arch_artefact_type_name, archetype_id_str: STRING
			parent_id_str: detachable STRING
		do
			last_parse_valid := False
			create artefact_types.default_create

			-- determine from the path whether it is a differential (source form) archetype
			arch_is_differential := file_system.has_extension (a_full_path, File_ext_archetype_source)

			-- read first 5 non-blank lines, returned left- and right-adjusted (whitespace-stripped)
			file_context.set_target (a_full_path)
			file_context.read_n_lines(5)
			lines := file_context.file_lines

			-- first line
			if lines[1].has ('(') then
				arch_is_generated := lines[1].has_substring(Generated_flag_string)

				-- extract ADL version
				-- FIXME: uncomment the following if ADL version needed in thumbnail
--				if lines[1].has_substring(Adl_version_string) then
--					lpos := lines[1].substring_index (Adl_version_string, 1) + Adl_version_string.count
--					lpos := lines[1].index_of ('=', lpos) + 1
--					from rpos := lpos until lines[1].item (rpos) = ')' or lines[1].item (rpos) = ';' or else rpos > lines[1].count loop
--						rpos := rpos + 1
--					end
--					adl_ver := lines[1].substring (lpos, rpos-1)
--					adl_ver.left_adjust
--					adl_ver.right_adjust
--					last_archetype.set_adl_version (adl_ver)
--				end
				lines[1].remove_substring (lines[1].index_of ('(', 1), lines[1].count)
				lines[1].right_adjust
			end

			-- now line[1] should contain only the artefact type, e.g. 'archetype', 'template'
			if artefact_types.valid_type_name (lines[1]) then
				arch_artefact_type_name := lines[1]

				-- get line 2 - should be archetype id
				if (create {ARCHETYPE_ID}).valid_id(lines[2]) then
					 -- ok
				elseif old_archetype_id_pattern_regex.matches (lines[2]) then
					arch_id_is_old_style := True
				else -- something wrong with the id
					id_bad := True
					last_parse_fail_reason := get_msg ("parse_archetype_e8", <<a_full_path, lines[2]>>)
				end

				if not id_bad then
					archetype_id_str := lines[2]

					-- get line 3 - should be either 'specialise' / 'specialize' or 'concept'
					if lines[3].is_equal ("specialise") or lines[3].is_equal("specialize") then
						if (create {ARCHETYPE_ID}).valid_id(lines[4]) then
							parent_id_str := lines[4]
						elseif old_archetype_id_pattern_regex.matches(lines[4]) then
							parent_id_str := lines[4]
							arch_parent_id_is_old_style := True
						else
							-- something wrong with the parent id
							last_parse_fail_reason := get_msg ("parse_archetype_e10", <<a_full_path, lines[4]>>)
						end
					end
					last_parse_valid := True

					create last_archetype.make (archetype_id_str, arch_id_is_old_style, arch_artefact_type_name, arch_is_differential, arch_is_generated)
					if attached parent_id_str as pid_str then
						last_archetype.set_parent_archetype_id (parent_id_str, arch_parent_id_is_old_style)
					end
				end
			else
				last_parse_fail_reason := get_msg ("parse_archetype_e9", <<a_full_path, lines[2]>>)
			end
		end

	extract_other_details (adl_text: STRING): HASH_TABLE [STRING, STRING]
			-- extract description.other_details hash from archetype, if it exists; if not, return empty hash
		local
			start_pos, i, rpos, dadl_block_count: INTEGER
			key, val: STRING
		do
			create Result.make(0)
			create key.make_empty
			start_pos := adl_text.substring_index (Other_details_dadl_name, 1) + Other_details_dadl_name.count
			if start_pos > 0 then
				i := adl_text.index_of (Dadl_left_delim, start_pos) + 1
				if i > 0 then
					from dadl_block_count := 1 until dadl_block_count = 0 or i > adl_text.count loop
						inspect adl_text.item (i)
						when Dadl_left_delim then -- consume chars between <>
							rpos := adl_text.index_of (Dadl_right_delim, i) - 1
							if rpos >= i+1 then -- guard against empty <> as value
								if adl_text.item (i+1) = Double_quote_char and adl_text.item (rpos) = Double_quote_char then
									val := adl_text.substring (i+2, rpos-1)
								else
									val := adl_text.substring (i+1, rpos)
								end
								Result.put (val, key)
							end
							i := rpos + 1
						when Dadl_right_delim then
							dadl_block_count := dadl_block_count - 1
						when Dadl_key_left_delim then -- consume chars between []
							rpos := adl_text.index_of (Dadl_key_right_delim, i) - 1
							if adl_text.item (i+1) = Double_quote_char and adl_text.item (rpos) = Double_quote_char then
								key := adl_text.substring (i+2, rpos-1)
							else
								key := adl_text.substring (i+1, rpos)
							end
							i := rpos + 1
						else
							-- nothing special
						end
						i := i + 1
					end
				end
			end
		end

feature {NONE} -- Implementation

	file_context: FILE_CONTEXT
			-- Access to the file system.
		once
			create Result
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
--| The Original Code is file_context.e.
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
