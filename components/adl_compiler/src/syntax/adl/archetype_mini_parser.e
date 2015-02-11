note
	component:   "openEHR ADL Tools"
	description: "[
				 Simple, fast hand-built parser for handling the top few lines of ADL files, where it can figure
				 out the kind of file (archetype, template, etc) and also the specialisation parent.
				 ]"
	keywords:    "ADL"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2010- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class ARCHETYPE_MINI_PARSER

inherit
	ADL_SYNTAX_CONVERTER
		export
			{NONE} all;
			{ANY} deep_copy, deep_twin, is_deep_equal, standard_is_equal, file_system
		end

	ANY_VALIDATOR
		redefine
			reset
		end

feature -- Definitions

	Other_details_odin_name: STRING = "other_details"

	Double_quote_char: CHARACTER = '"'

feature -- Access

	last_archetype: detachable ARCHETYPE_THUMBNAIL
			-- thumbnail form of last parsed archetype

	is_generated: BOOLEAN

feature -- Commands

	reset
			-- initialise reporting variables
		do
			precursor
			last_archetype := Void
		end

	parse (a_full_path: STRING)
			-- perform quick parse of lines down to 'concept' line or EOF, and obtain archetype_id,
			-- specialisation status and if specialised, specialisation parent
		require
			path_valid: file_system.file_exists (a_full_path)
		local
			arch_is_differential: BOOLEAN
		do
			reset
			-- determine from the path whether it is a differential (source form) archetype
			arch_is_differential := file_system.has_extension (a_full_path, File_ext_archetype_source)

			-- read first 5 non-blank lines, returned left- and right-adjusted (whitespace-stripped)
			file_context.set_target (a_full_path)
			file_context.read_n_lines(5)

			parse_lines (file_context.line_buf, a_full_path, arch_is_differential)
		end

	parse_from_text (an_adl_text, an_arch_source_id: STRING)
			-- do a mini parse from `an_adl_text'
		local
			line_str: STRING
			start_pos, eol_pos: INTEGER
			lines: ARRAYED_LIST [STRING]
		do
			reset
			create lines.make (0)
			from
				start_pos := 1
				eol_pos := 1
			until
				lines.count = 4 or eol_pos = 0 or start_pos > an_adl_text.count
			loop
				eol_pos := an_adl_text.index_of ('%N', start_pos)
				line_str := an_adl_text.substring (start_pos, eol_pos - 1)
				line_str.left_adjust
				line_str.right_adjust
				if not line_str.is_empty then
					lines.extend (line_str)
				end
				start_pos := eol_pos + 1
			end
			if lines.count = 4 then
				parse_lines (lines, an_arch_source_id, True)
			else
				-- TODO - do some error handling
			end
		end

	extract_other_details (adl_text: STRING): HASH_TABLE [STRING, STRING]
			-- extract description.other_details hash from archetype, if it exists; if not, return empty hash
		local
			start_pos, i, rpos, odin_block_count: INTEGER
			key, val: STRING
		do
			create Result.make(0)
			create key.make_empty
			start_pos := adl_text.substring_index (Other_details_odin_name, 1) + Other_details_odin_name.count
			if start_pos > 0 then
				i := adl_text.index_of (Odin_left_delim, start_pos) + 1
				if i > 0 then
					from odin_block_count := 1 until odin_block_count = 0 or i > adl_text.count loop
						inspect adl_text.item (i)
						when Odin_left_delim then -- consume chars between <>
							rpos := adl_text.index_of (Odin_right_delim, i) - 1
							if rpos >= i+1 then -- guard against empty <> as value
								if adl_text.item (i+1) = Double_quote_char and adl_text.item (rpos) = Double_quote_char then
									val := adl_text.substring (i+2, rpos-1)
								else
									val := adl_text.substring (i+1, rpos)
								end
								Result.put (val, key)
							end
							i := rpos + 1
						when Odin_right_delim then
							odin_block_count := odin_block_count - 1
						when Odin_key_left_delim then -- consume chars between []
							rpos := adl_text.index_of (Odin_key_right_delim, i) - 1
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

feature -- Validation

	validate
		do
		end

feature {NONE} -- Implementation

	file_context: FILE_CONTEXT
			-- Access to the file system.
		once
			create Result
		end

	archetype_id_parser: ARCHETYPE_HRID_PARSER
		once
			create Result.make
		end

	parse_lines (lines: LIST [STRING]; source_id: STRING; arch_is_differential: BOOLEAN)
			-- perform quick parse of lines down to 'concept' line or EOF, and obtain archetype_id,
			-- specialisation status and if specialised, specialisation parent
		local
			id_bad: BOOLEAN
			arch_id_is_old_style, arch_parent_id_is_old_style: BOOLEAN
			arch_artefact_type_name, archetype_id_str, adl_ver: STRING
			parent_id_str: detachable STRING
			lpos, rpos: INTEGER
			arch_tn: ARCHETYPE_THUMBNAIL
		do
			create adl_ver.make_empty

			-- first line
			create arch_artefact_type_name.make_empty
			if lines[1].has ('(') then
				is_generated := lines[1].has_substring (Generated_flag_string)

				-- extract ADL version
				if lines[1].has_substring (Adl_version_string) then
					lpos := lines[1].substring_index (Adl_version_string, 1) + Adl_version_string.count
					lpos := lines[1].index_of ('=', lpos) + 1
					from rpos := lpos until lines[1].item (rpos) = ')' or lines[1].item (rpos) = ';' or else rpos > lines[1].count loop
						rpos := rpos + 1
					end
					adl_ver := lines[1].substring (lpos, rpos-1)
					adl_ver.left_adjust
					adl_ver.right_adjust
				end
				rpos := lines[1].index_of ('(', 1) - 1
			else
				rpos := lines[1].count
			end

			arch_artefact_type_name := lines[1].substring (1, rpos)
			arch_artefact_type_name.right_adjust

			-- now line[1] should contain only the artefact type, e.g. 'archetype', 'template'
			if valid_artefact_type (arch_artefact_type_name) then

				-- get line 2 - should be archetype id
				if archetype_id_checker.valid_id (lines[2]) then
					 -- ok
				elseif old_archetype_id_pattern_regex.matches (lines[2]) then
					arch_id_is_old_style := True
				else -- something wrong with the id
					id_bad := True
					add_error (ec_parse_archetype_e8, <<source_id, lines[2]>>)
				end

				if not id_bad then
					archetype_id_str := lines[2].twin

					-- get line 3 - should be either 'specialise' / 'specialize' or 'concept'
					if lines[3].is_equal ("specialise") or lines[3].is_equal("specialize") then
						if archetype_id_parser.valid_id_reference (lines[4]) then
							parent_id_str := lines[4].twin
						elseif old_archetype_id_pattern_regex.matches (lines[4]) then
							parent_id_str := lines[4].twin
							arch_parent_id_is_old_style := True
						else
							-- something wrong with the parent id
							add_error (ec_parse_archetype_e10, <<source_id, lines[4]>>)
						end
					end

					create arch_tn.make (adl_ver, archetype_id_str, arch_id_is_old_style, arch_artefact_type_name, arch_is_differential, is_generated)
					last_archetype := arch_tn
					if attached parent_id_str as pid_str then
						arch_tn.set_parent_archetype_id (parent_id_str, arch_parent_id_is_old_style)
					end
				end
			else
				add_error (ec_parse_archetype_e9, <<source_id, lines[2]>>)
			end
		end

end



