note
	component:   "openEHR ADL Tools"
	description: "[
				 Tools for manipulating ADL 1.5 archetype codes. There are 3 types of codes:
					id codes, used to identify nodes - idN, idN.M etc e.g. id1, id20, id2.0.7
					at codes, used to identify value terms - atN, atN.N etc
					ac codes, used to identify ref sets - atN, atN.N etc
				 The 'dot' form (id1.0.4 etc)  is used to signify specialisation levels.  Intervening 
				 '0's are allowed, indicating that the code is a child of a parent more than one 
				 level up, e.g. 'at21.0.3' is the 3rd specialisation of the top level code 'at21', 
				 in the 2nd specialsiation level.

				 New codes can also be introduced in specialised archetypes, which are
				 not themselves specialisations of any existing code. These have the form
				 'at0.0.N', e.g. 'at0.0.2'
				 ]"
	keywords:    "archetype, ontology, coded term"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2003- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class ADL_15_TERM_CODE_TOOLS

inherit
	SPECIALISATION_STATUSES

	OPENEHR_DEFINITIONS
		export
			{NONE} all
		end

feature -- Definitions

	Specialisation_separator: CHARACTER = '.'

	Id_code_leader: STRING = "id"
			-- leader of all id codes

	Value_code_leader: STRING = "at"
			-- leader of all internal term codes

	Constraint_code_leader: STRING = "ac"

	Code_regex_pattern: STRING = "(0|[1-9][0-9]*)(\.(0|[1-9][0-9]*))*"
			-- a regex to match any code of any depth

	Root_id_code_regex_pattern: STRING = "^id1(\.1)*$"
			-- a regex to match a concept (root id) code of any depth

	Root_id_code_top_level: STRING = "id1"

	Default_constraint_code: STRING = "ac0"

	Id_code_regex_pattern: STRING
			-- a regex to match any id code of any depth
		once
			create Result.make_empty
			Result.append_character ('^')
			Result.append (Id_code_leader)
			Result.append (Code_regex_pattern)
			Result.append_character ('$')
		end

	Value_code_regex_pattern: STRING
			-- a regex to match any term of any depth
		once
			create Result.make_empty
			Result.append_character ('^')
			Result.append (Value_code_leader)
			Result.append (Code_regex_pattern)
			Result.append_character ('$')
		end

	Constraint_code_regex_pattern: STRING
			-- a regex to match any constraint code of any depth
		once
			create Result.make_empty
			Result.append_character ('^')
			Result.append (Constraint_code_leader)
			Result.append (Code_regex_pattern)
			Result.append_character ('$')
		end

	Any_code_regex_pattern: STRING
			-- a regex to match any code of any depth
		once
			create Result.make_empty
			Result.append_character ('^')
			Result.append_character ('(')
			Result.append (Id_code_leader)
			Result.append_character ('|')
			Result.append (Value_code_leader)
			Result.append_character ('|')
			Result.append (Constraint_code_leader)
			Result.append_character (')')
			Result.append (Code_regex_pattern)
			Result.append_character ('$')
		end

	Qualified_code_string_regex_pattern: STRING = "[a-zA-Z0-9._\-()]+::[a-zA-Z0-9._\-|*^+?$]+"

	Zero_filler: STRING = ".0"

	Zero_leader: STRING = "0."

	Annotated_code_text_delimiter: CHARACTER = '|'
			-- delimiter for creating annotated terms of form 'nnnn|term text|'
			-- as commonly used in SNOMED CT

	Annotated_code_text_delimiter_string: STRING = "|"
			-- string form of above

	Primitive_node_code_number: STRING = "9999"

	Primitive_node_id: STRING
			-- special 'id9999' code that identifies all terminal primitive objects
		once
			create Result.make_from_string (id_code_leader)
			Result.append (Primitive_node_code_number)
		end

	uri_template: STRING = "http://$terminology_id.info/id/$code_string"

	uri_with_version_template: STRING = "http://$terminology_id.info/ver/$terminology_version/id/$code_string"

	Fake_adl_14_node_id_base: STRING = "id1000000"
			-- used to create new node ids by appending integer strings to create e.g. id10000001, id10000002, etc.
			-- These can easily be detected in code in order to rewrite them to normal ids

	Fake_adl_14_at_code_base: STRING = "at1000000"
			-- used to create new node ids by appending integer strings to create e.g. at10000001, at10000002, etc.
			-- These can easily be detected in code in order to rewrite them to normal codes

	Fake_adl_14_ac_code_base: STRING = "ac1000000"
			-- used to create new ac-codes by appending integer strings to create e.g. ac10000001, ac10000002, etc.
			-- These can easily be detected in code in order to rewrite them to normal codes

feature -- Access

	specialisation_parent_from_code (a_code: STRING): STRING
			-- get immediate parent of this specialised code
		require
			Code_valid: specialisation_depth_from_code (a_code) > 0
		do
			Result := a_code.substring (1, a_code.last_index_of (Specialisation_separator, a_code.count) - 1)
		ensure
			Valid_result: specialisation_depth_from_code (Result) = specialisation_depth_from_code (a_code) - 1
		end

	code_at_level (a_code: STRING; a_level: INTEGER): STRING
			-- get valid form of this code at `a_level'
		require
			Level_valid: a_level >= 0
			Code_valid: code_exists_at_level (a_code, a_level)
		local
			i, idx: INTEGER
			finished: BOOLEAN
		do
			if specialisation_depth_from_code (a_code) < a_level then
				Result := a_code.twin
			else
				-- this loop finds the index in a code string of the character just before a_level-1'th '.'
				from
					i := specialisation_depth_from_code (a_code)
					idx := a_code.count
				until
					i = a_level
				loop
					idx := a_code.last_index_of (Specialisation_separator, idx) - 1
					i := i - 1
				end

				-- if there are trailing 0s, get rid of them
				from until finished loop
					if a_code.substring (idx-1, idx).is_equal (Zero_filler) then
						idx := idx - 2
					else
						finished := True
					end
				end

				Result := a_code.substring (1, idx)
			end
		ensure
			Valid_result: is_valid_code (Result)
		end

	specialisation_status_from_code (a_code: STRING; a_depth: INTEGER): INTEGER
			-- get the specialisation status (added, inherited, redefined) from this code, at a_depth
			-- for example:
			-- 		at1 at depth 0 ==> ss_added
			--		at1.1 at depth 0 ==> ss_added
			--		at1.1 at depth 1 ==> ss_redefined
			--		at0.1 at depth 0 ==> ss_undefined
			--		at0.1 at depth 1 ==> ss_added
			--		at0.1.1 at depth 0 ==> ss_undefined
			--		at0.1.1 at depth 1 ==> ss_added
			--		at0.1.1 at depth 2 ==> ss_redefined
			--		at9.0.0.1 at depth 0 ==> ss_added
			--		at9.0.0.1 at depth 1 ==> ss_inherited
			--		at9.0.0.1 at depth 2 ==> ss_inherited
			--		at9.0.0.1 at depth 3 ==> ss_redefined
			--		any code at a lower level than the code is inherited, e.g.
			--		at0.1.1 at depth 4 ==> ss_inherited
			--		at9.0.0.1 at depth 5 ==> ss_inherited
		require
			Code_valid: is_valid_code(a_code)
			Depth_valid: a_depth >= 0
		local
			code_defined_in_this_level: BOOLEAN
			code_at_this_level: STRING
		do
			if a_depth > specialisation_depth_from_code (a_code) then
				Result := ss_inherited
			else
				code_at_this_level := index_from_code_at_level (a_code, a_depth)
				code_defined_in_this_level := code_at_this_level.to_integer > 0
				if code_defined_in_this_level then
					if a_depth > 0 and code_exists_at_level (a_code, a_depth - 1) then -- parent is valid
						Result := ss_redefined
					else
						Result := ss_added
					end
				elseif a_depth > 0 and code_exists_at_level (a_code, a_depth - 1) then
					Result := ss_inherited
				else
					Result := ss_undefined
				end
			end
		end

	index_from_code_at_level (a_code: STRING; a_depth: INTEGER): STRING
			-- get the numeric part of the code from this code, at a_depth
			-- for example:
			-- 		a_code = at1		a_depth = 0 -> 1
			--		a_code = at1.4		a_depth = 1 -> 4
			--		a_code = at0.4		a_depth = 0 -> 0
			--		a_code = at0.4		a_depth = 1 -> 4
			--		a_code = at0.4.5	a_depth = 0 -> 0
			--		a_code = at0.4.5	a_depth = 1 -> 4
			--		a_code = at0.4.5	a_depth = 2 -> 5
		require
			Depth_valid: a_depth >= 0 and a_depth <= specialisation_depth_from_code (a_code)
		local
			spec_depth: INTEGER
			code_num_part: STRING
			lpos, rpos, depth_count: INTEGER
		do
			spec_depth := specialisation_depth_from_code (a_code)
			code_num_part := a_code.substring (leader_length (a_code)+1, a_code.count)

			-- determine left hand position
			from
				lpos := 1
				depth_count := 0
			until
				lpos > code_num_part.count or depth_count = a_depth
			loop
				if code_num_part.item (lpos) = Specialisation_separator then
					depth_count := depth_count + 1
				end
				lpos := lpos + 1
			end

			-- determine right hand position
			rpos := code_num_part.index_of (Specialisation_separator, lpos)
			if rpos = 0 then
				rpos := code_num_part.count
			else
				rpos := rpos - 1
			end
			Result := code_num_part.substring (lpos, rpos)
		end

	specialisation_depth_from_code (a_code: STRING): INTEGER
			-- Infer number of levels of specialisation from `a_code'.
		require
			code_valid: is_valid_code (a_code)
		do
			Result := a_code.occurrences (Specialisation_separator)
		ensure
			non_negative: Result >= 0
		end

	specialised_code_tail (a_code: STRING): STRING
			-- get code tail from a specialised code, e.g. from
			-- "at32.0.1", the result is "1"; from
			-- "at4.3", the result is "3"
		require
			code_valid: is_valid_code (a_code)
			not_root_code: is_refined_code (a_code)
		do
			Result := a_code.substring (a_code.last_index_of (Specialisation_separator, a_code.count) + 1, a_code.count)
		end

feature -- Comparison

	is_adl_code (a_code: STRING): BOOLEAN
			-- Is `a_code' any kind of ADL archetype local code?
		do
			Result := is_id_code (a_code) or else is_value_code (a_code) or else is_constraint_code (a_code)
		end

	is_id_code (a_code: STRING): BOOLEAN
			-- Is `a_code' an "id" code?
		do
			Result := a_code.starts_with (Id_code_leader)
		end

	is_value_code (a_code: STRING): BOOLEAN
			-- Is `a_code' an "at" code?
		do
			Result := a_code.starts_with (Value_code_leader)
		end

	is_constraint_code (a_code: STRING): BOOLEAN
			-- Is `a_code' an "ac" code?
		do
			Result := a_code.starts_with (Constraint_code_leader)
		end

	is_valid_root_id_code (a_code: STRING): BOOLEAN
			-- check if `a_code' is a valid root concept code of an archetype
			-- True if a_code has form at1, or at1.1, at1.1.1 etc
		do
			Result := Root_id_code_regex_matcher.recognizes (a_code)
		end

	is_valid_id_code (a_code: STRING): BOOLEAN
			-- Is `a_code' a valid "id" code?
		do
			Result := Id_code_regex_matcher.recognizes (a_code)
		end

	is_valid_value_code (a_code: STRING): BOOLEAN
			-- Is `a_code' a valid "at" code?
		do
			Result := Value_code_regex_matcher.recognizes (a_code)
		end

	is_valid_constraint_code (a_code: STRING): BOOLEAN
			-- Is `a_code' a valid "ac" code?
		do
			Result := Constraint_code_regex_matcher.recognizes (a_code)
		end

	is_valid_code (a_code: STRING): BOOLEAN
			-- Is `a_code' a valid "at", "ac" or "id" code? Must match `Any_code_regex_pattern'
		do
			Result := Any_code_regex_matcher.recognizes (a_code)
		end

	is_refined_code (a_code: STRING): BOOLEAN
			-- a code has been specialised if there is a non-zero code index anywhere above the last index
			-- e.g. at0.0.1 -> False
			--      at1.0.1 -> True
		require
			Code_valid: is_valid_code (a_code)
		local
			idx_str: STRING
		do
			if a_code.has (Specialisation_separator) then
				idx_str := a_code.substring (leader_length (a_code) + 1, a_code.last_index_of (Specialisation_separator, a_code.count)-1)
				idx_str.prune_all (Specialisation_separator)
				Result := idx_str.to_integer > 0
			end
		end

	is_qualified_codestring (a_code: STRING): BOOLEAN
			-- True if `a_code' is of form terminology_id::code
		do
			Result := Qualified_code_string_regex_matcher.recognizes (a_code)
		end

	code_exists_at_level (a_code: STRING; a_level: INTEGER): BOOLEAN
			-- is `a_code' valid at level `a_level' or less, i.e. if we remove its
			-- trailing specialised part corresponding to specialisation below `a_level',
			-- and then any trailing '.0' pieces, do we end up with a valid code? If so
			-- it means that the code corresponds to a real node from `a_level' or higher
		require
			Code_valid: is_valid_code (a_code)
			Level_valid: a_level >= 0
		local
			s: STRING
			idx, i: INTEGER
		do
			if a_level >= specialisation_depth_from_code (a_code) then
				Result := True
			else
				-- this loop finds the index in a code string of the character just before a_level-1'th '.'
				from
					i := specialisation_depth_from_code (a_code)
					idx := a_code.count
				until
					i = a_level
				loop
					idx := a_code.last_index_of (Specialisation_separator, idx) - 1
					i := i - 1
				end
				s := a_code.substring (leader_length (a_code) + 1, idx)
				s.prune_all (Specialisation_separator)
				Result := s.to_integer > 0
			end
		end

	codes_conformant (a_child_code, a_parent_code: STRING): BOOLEAN
			-- True if `a_child_code' conforms to `a_parent_code' in the sense of specialisation, i.e.
			-- is `a_child_code' the same as or more specialised than `a_parent_code'
		do
			Result := (a_child_code.is_equal (Primitive_node_id) or else is_valid_code (a_child_code))
				and then a_child_code.starts_with (a_parent_code)
		end

feature -- Factory

	new_root_id_code_at_level (at_level: INTEGER): STRING
			-- make a new id code for use as the root concept code of an archetype
			-- at level = 0 -> id1
			-- at level = 1 -> id1.1
			-- at level = 2 -> id1.1.1
			-- etc
		require
			level_valid: at_level >= 0
		local
			i: INTEGER
		do
			create Result.make_from_string (Id_code_leader)
			Result.append_character ('1')
			from until i >= at_level loop
				Result.append_character (Specialisation_separator)
				Result.append_character ('1')
				i := i + 1
			end
		ensure
			valid: is_valid_root_id_code (Result)
			level_set: specialisation_depth_from_code (Result) = at_level
		end

	new_added_id_code_at_level (at_level: INTEGER; a_highest_code: INTEGER): STRING
			-- generate a new code of the form 'idN'. a_highest_code contains highest id code already in use in the
			-- calling context; the returned code will be unique with respect to this set.
		do
			Result := new_added_code_at_level (Id_code_leader, at_level, a_highest_code)
		end

	new_added_value_code_at_level (at_level: INTEGER; a_highest_code: INTEGER): STRING
			-- generate a new code of the form 'idN'. a_highest_code contains highest id code already in use in the
			-- calling context; the returned code will be unique with respect to this set.
		do
			Result := new_added_code_at_level (Value_code_leader, at_level, a_highest_code)
		end

	new_added_constraint_code_at_level (at_level: INTEGER; a_highest_code: INTEGER): STRING
			-- generate a new code of the form 'idN'. a_highest_code contains highest id code already in use in the
			-- calling context; the returned code will be unique with respect to this set.
		do
			Result := new_added_code_at_level (Constraint_code_leader, at_level, a_highest_code)
		end

	new_refined_code_at_level (a_parent_code: STRING; at_level: INTEGER; a_highest_code: INTEGER): STRING
			-- Create a new at|ac|id-code at specialisation depth `at_level', based on `a_parent_code'
			-- e.g. "at0001" at level 2 with `a_highest_code' = 3 will produce "at0001.0.4"
			-- Note: a code of "at0001" has specialisation depth 0
		require
			level_valid: at_level > 0
		local
			i: INTEGER
		do
			create Result.make_from_string (a_parent_code)
			from i := specialisation_depth_from_code (a_parent_code) + 1 until i >= at_level loop
				Result.append (Zero_filler)
				i := i + 1
			end
			Result.append_character (Specialisation_separator)
			Result.append ((a_highest_code + 1).out)
		end

feature -- Conversion

	annotated_code (a_code, a_text, a_separator: STRING): STRING
			-- create annotated term of form 'a_code a_separator|term text|' as commonly used in SNOMED CT
			-- a_separator is typically a single space or an empty string
		do
			create Result.make_empty
			Result.append (a_code)
			Result.append (a_separator)
			Result.append_character (Annotated_code_text_delimiter)
			Result.append (a_text)
			Result.append_character (Annotated_code_text_delimiter)
		end

	adl_14_id_code_converted (an_adl_14_code: STRING): STRING
			-- convert the lead numeric part of an ADL 1.4 at-code that has a level 0 part,
			-- and is being used as an id-code. Convert via `adl_14_code_renumbered' and then
			-- change leader from `at' to `id'; this adds 1 to the top part of the code
		do
			Result := adl_14_code_renumbered (an_adl_14_code)
			Result.replace_substring (Id_code_leader, 1, 2)
		end

	adl_14_path_converted (an_adl_14_path: STRING): STRING
			-- convert `an_adl_14_path' containing ADL 1.4 at-codes to a path containing,
			-- ADL 1.5 id-codes, using `adl_14_code_renumbered'
			-- `an_adl_14_path' should be a well-formed path as recognised by a regex,
			-- of the form /aaaa/bbbb[atNNNN]/cccc[atNNNN]/dddd
		local
			lpos, rpos: INTEGER
			at_code: STRING
		do
			create Result.make_from_string (an_adl_14_path)
			lpos := an_adl_14_path.index_of ('[', 1)
			from until lpos = 0 or lpos >= an_adl_14_path.count loop
				rpos := an_adl_14_path.index_of (']', lpos)
				at_code := an_adl_14_path.substring (lpos+1, rpos-1)
				Result.replace_substring_all (at_code, adl_14_id_code_converted (at_code))
				lpos := an_adl_14_path.index_of ('[', rpos)
			end
		end

	adl_14_code_renumbered (an_adl_14_code: STRING): STRING
			-- convert the lead numeric part of an ADL 1.4 code that has a level 0 part, by:
			--
			-- removing leading '0's in top level code part ('0001' in at0001.3.1), if applicable
			-- renumbering to be 1 higher (at0001.3.1 => at2.3.1)
		local
			dot_pos: INTEGER
			level_0_numeric_part: STRING
		do
			dot_pos := an_adl_14_code.index_of ('.', 3)
			if dot_pos = 0 or dot_pos > 6 then
				level_0_numeric_part := (an_adl_14_code.substring (3, 6).to_integer_32 + 1).out
				create Result.make_from_string (an_adl_14_code.substring (1,2))
				Result.append (level_0_numeric_part)
				if an_adl_14_code.count > 6 then
					Result.append (an_adl_14_code.substring (7, an_adl_14_code.count))
				end
			else
				create Result.make_from_string (an_adl_14_code)
			end
		end

	term_code_to_uri (a_term_code: TERMINOLOGY_CODE): STRING
			-- convert to a URI string
		do
			if attached a_term_code.terminology_version as ver then
				create Result.make_from_string (uri_with_version_template)
				Result.replace_substring_all ("$terminology_version", ver)
			else
				create Result.make_from_string (uri_template)
			end
			Result.replace_substring_all ("$terminology_id", a_term_code.terminology_id)
			Result.replace_substring_all ("$code_string", a_term_code.code_string)
		end

feature {NONE} -- Implementation

	Any_code_regex_matcher: RX_PCRE_REGULAR_EXPRESSION
			-- match any term code
		once
			create Result.make
			Result.compile (Any_code_regex_pattern)
		end

	Root_id_code_regex_matcher: RX_PCRE_REGULAR_EXPRESSION
			-- match any concept code
		once
			create Result.make
			Result.compile (Root_id_code_regex_pattern)
		end

	Id_code_regex_matcher: RX_PCRE_REGULAR_EXPRESSION
			-- match any id code
		once
			create Result.make
			Result.compile (Id_code_regex_pattern)
		end

	Value_code_regex_matcher: RX_PCRE_REGULAR_EXPRESSION
			-- match any value (at) code
		once
			create Result.make
			Result.compile (Value_code_regex_pattern)
		end

	Constraint_code_regex_matcher: RX_PCRE_REGULAR_EXPRESSION
			-- match any term code
		once
			create Result.make
			Result.compile (Constraint_code_regex_pattern)
		end

	Qualified_code_string_regex_matcher: RX_PCRE_REGULAR_EXPRESSION
			-- match any term code
		once
			create Result.make
			Result.compile (Qualified_code_string_regex_pattern)
		end

	leader_length (a_code: STRING): INTEGER
			-- obtain length of non-numeric leader part of code
		do
			if is_id_code (a_code) then
				Result := Id_code_leader.count
			elseif is_value_code (a_code) then
				Result := Value_code_leader.count
			elseif is_constraint_code (a_code) then
				Result := Constraint_code_leader.count
			end
		end

	new_added_code_at_level (a_code_leader: STRING; at_level: INTEGER; a_highest_code: INTEGER): STRING
			-- generate a new code of the form `a_code_leader' + 'N'. a_highest_code contains highest
			-- code already in use in the calling context
		local
			i: INTEGER
		do
			Result := a_code_leader.twin
			from i := 0 until i >= at_level loop
				Result.append (Zero_leader)
				i := i + 1
			end
			Result.append ((a_highest_code + 1).out)
		end

end


