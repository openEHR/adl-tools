note
	component:   "openEHR ADL Tools"
	description: "[
				 Tools for manipulating ADL 1.4 archetype codes. Term codes take the form of 'atNNNN.N..'.
				 At the first level, 'atNNNN' is used; specialised codes are of the 
				 form 'atNNNN.N' to watever depth require; intervening '0's are allowed,
				 indicating that the code is a child of a parent more than one level
				 up, e.g. 'at0021.0.3' is the 3rd specialisation of the top level code
				 'at0021', in the 2nd specialsiation level.

				 New codes can also be introduced in specialised archetypes, which are
				 not themselves specialisations of any existing code. These have the form
				 'at.NN.NN', e.g. 'at.0.0.2'
				 
				 The factory routines in this class are smart - they don't just make new specialised
				 codes by adding '.1', but by looking at the current hash of codes known in the 
				 archetype ontology into which this class is inherited.
				 
				 NOTE: there is a logical anomaly in how we use codes: 'at0000' is a legitimate code in 
				 an archetype; 'at0000.1' is a specialisation of this, but 'at0.1' is a newly 
				 introduced node at level 1. This means that cods have to be lexically processed 
				 sometimes to detect the 'at0000' pattern, to get correct results. Fixing this 
				 is probably impossible now, but potentially all at0000 should move to being at0001.
				 The same problem is true with the code 'ac0000'.
				 ]"
	keywords:    "archetype, coded term"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2003- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class ADL_14_TERM_CODE_TOOLS

inherit
	SPECIALISATION_STATUSES

	OPENEHR_DEFINITIONS
		export
			{NONE} all
		end

feature -- Definitions

	default_adl_14_code_number_string: STRING = "0000"

	Default_adl_14_concept_code: STRING
			-- FIXME: the 0000 code should not be allowed to be used in an archetype
			-- definition secton, since it violates the rule that a '0' code means
			-- "not defined here" (i.e. it is normally a filler for lower down codes)
			-- THIS SHOULD BE CHANGED to at0001
		once
			Result := Adl_14_term_code_leader + default_adl_14_code_number_string
		end

	Default_adl_14_constraint_code: STRING
			-- FIXME: the 0000 code should not be allowed to be used in an archetype
			-- definition secton, since it violates the rule that a '0' code means
			-- "not defined here" (i.e. it is normally a filler for lower down codes)
			-- THIS SHOULD BE CHANGED to ac0001
		once
			Result := Adl_14_constraint_code_leader + default_adl_14_code_number_string
		end

	Adl_14_specialisation_separator: CHARACTER = '.'

	Adl_14_term_code_leader: STRING = "at"
			-- leader of all internal term codes

	Adl_14_term_code_regex_pattern: STRING
			-- a regex to match any at-code of any depth
		once
			create Result.make_empty
			Result.append ("^at(0|[0-9]{4})(\.[0-9]+)*$")
		end

	Adl_14_constraint_code_leader: STRING = "ac"

	Adl_14_constraint_code_regex_pattern: STRING
			-- a regex to match any ac-term of any depth
		once
			create Result.make_empty
			Result.append ("^ac(0|[0-9]{4})(\.[0-9]+)*$")
		end

	Any_adl_14_code_regex_pattern: STRING
			-- a regex to match any at- or ac-term of any depth
		once
			create Result.make_empty
			Result.append ("^(at|ac)(0|[0-9]{4})(\.[0-9]+)*$")
		end

	Adl_14_zero_filler: STRING = ".0"

feature -- Access

	adl_14_specialisation_parent_from_code (a_code: STRING): STRING
			-- get immediate parent of this specialised code
		require
			Code_valid: adl_14_specialisation_depth_from_code(a_code) > 0
		do
			Result := a_code.substring (1, a_code.last_index_of (Adl_14_specialisation_separator, a_code.count)-1)
		ensure
			Valid_result: adl_14_specialisation_depth_from_code(Result) = adl_14_specialisation_depth_from_code(a_code) - 1
		end

	adl_14_code_at_level (a_code: STRING; a_level: INTEGER): STRING
			-- get valid form of this code at `a_level'
		require
			Level_valid: a_level >= 0
			Code_valid: adl_14_code_exists_at_level (a_code, a_level)
		local
			i, idx: INTEGER
			finished: BOOLEAN
		do
			if adl_14_specialisation_depth_from_code (a_code) < a_level then
				Result := a_code.twin
			else
				-- this loop finds the index in a code string of the character just before a_level-1'th '.'
				from
					i := adl_14_specialisation_depth_from_code (a_code)
					idx := a_code.count
				until
					i = a_level
				loop
					idx := a_code.last_index_of (Adl_14_specialisation_separator, idx) - 1
					i := i - 1
				end

				-- if there are trailing 0s, get rid of them
				from until finished loop
					if a_code.substring (idx-1, idx).is_equal (Adl_14_zero_filler) then
						idx := idx - 2
					else
						finished := True
					end
				end

				Result := a_code.substring (1, idx)
			end
		ensure
			Valid_result: is_valid_adl_14_code (Result)
		end

	adl_14_specialisation_status_from_code (a_code: STRING; a_depth: INTEGER): INTEGER
			-- get the specialisation status (added, inherited, redefined) from this code, at a_depth
			-- for example:
			-- 		at0001 at depth 0 ==> ss_added
			--		at0001.1 at depth 0 ==> ss_added
			--		at0001.1 at depth 1 ==> ss_redefined
			--		at0.1 at depth 0 ==> ss_undefined
			--		at0.1 at depth 1 ==> ss_added
			--		at0.1.1 at depth 0 ==> ss_undefined
			--		at0.1.1 at depth 1 ==> ss_added
			--		at0.1.1 at depth 2 ==> ss_redefined
			--		at0009.0.0.1 at depth 0 ==> ss_added
			--		at0009.0.0.1 at depth 1 ==> ss_inherited
			--		at0009.0.0.1 at depth 2 ==> ss_inherited
			--		at0009.0.0.1 at depth 3 ==> ss_redefined
			--		any code at a lower level than the code is inherited, e.g.
			--		at0.1.1 at depth 4 ==> ss_inherited
			--		at0009.0.0.1 at depth 5 ==> ss_inherited
		require
			Code_valid: is_valid_adl_14_code(a_code)
			Depth_valid: a_depth >= 0
		local
			code_defined_in_this_level: BOOLEAN
			code_at_this_level: STRING
		do
			if a_depth > adl_14_specialisation_depth_from_code (a_code) then
				Result := ss_inherited
			else
				code_at_this_level := adl_14_index_from_code_at_level (a_code, a_depth)
				code_defined_in_this_level := code_at_this_level.to_integer > 0 or else code_at_this_level.is_equal (default_adl_14_code_number_string) -- takes account of anomalous "0000" code
				if code_defined_in_this_level then
					if a_depth > 0 and adl_14_code_exists_at_level (a_code, a_depth - 1) then -- parent is valid
						Result := ss_redefined
					else
						Result := ss_added
					end
				elseif a_depth > 0 and adl_14_code_exists_at_level (a_code, a_depth - 1) then
					Result := ss_inherited
				else
					Result := ss_undefined
				end
			end
		end

	adl_14_index_from_code_at_level (a_code: STRING; a_depth: INTEGER): STRING
			-- get the numeric part of the code from this code, at a_depth
			-- for example:
			-- 		a_code = at0001		a_depth = 0 -> 0001
			--		a_code = at0001.4	a_depth = 1 -> 4
			--		a_code = at0.4		a_depth = 0 -> 0
			--		a_code = at0.4		a_depth = 1 -> 4
			--		a_code = at0.4.5	a_depth = 0 -> 0
			--		a_code = at0.4.5	a_depth = 1 -> 4
			--		a_code = at0.4.5	a_depth = 2 -> 5
		require
			Depth_valid: a_depth >= 0 and a_depth <= adl_14_specialisation_depth_from_code (a_code)
		local
			spec_depth: INTEGER
			code_num_part: STRING
			lpos, rpos, depth_count: INTEGER
		do
			spec_depth := adl_14_specialisation_depth_from_code (a_code)
			code_num_part := a_code.substring (Adl_14_term_code_leader.count+1, a_code.count)

			-- determine left hand position
			from
				lpos := 1
				depth_count := 0
			until
				lpos > code_num_part.count or depth_count = a_depth
			loop
				if code_num_part.item (lpos) = Adl_14_specialisation_separator then
					depth_count := depth_count + 1
				end
				lpos := lpos + 1
			end

			-- determine right hand position
			rpos := code_num_part.index_of (Adl_14_specialisation_separator, lpos)
			if rpos = 0 then
				rpos := code_num_part.count
			else
				rpos := rpos - 1
			end
			Result := code_num_part.substring(lpos, rpos)
		end

	adl_14_specialisation_depth_from_code (a_code: STRING): INTEGER
			-- Infer number of levels of specialisation from `a_code'.
		require
			code_valid: is_valid_adl_14_code (a_code)
		do
			Result := a_code.occurrences (Adl_14_specialisation_separator)
		ensure
			non_negative: Result >= 0
		end

	adl_14_specialised_code_tail (a_code: STRING): STRING
			-- get code tail from a specialised code, e.g. from
			-- "at0032.0.1", the result is "1"; from
			-- "at0004.3", the result is "3"
		require
			code_valid: is_valid_adl_14_code (a_code)
			not_root_code: is_adl_14_refined_code (a_code)
		do
			Result := a_code.substring (a_code.last_index_of (Adl_14_specialisation_separator, a_code.count) + 1, a_code.count)
		end

feature -- Comparison

	is_adl_14_term_code (a_code: STRING): BOOLEAN
			-- Is `a_code' an "at" code?
		do
			Result := a_code.starts_with (Adl_14_term_code_leader)
		end

	is_adl_14_term_code_constraint (a_constraint_string: STRING): BOOLEAN
			-- is `a_constraint_string' an ADL-1.4 style constraint string of the form
			-- local::at0003, at0004?
		local
			pos, dot_pos: INTEGER
		do
			if a_constraint_string.starts_with (local_terminology_id) then
				pos := a_constraint_string.substring_index ("at0", 1)
				if pos > 0 then
					dot_pos := a_constraint_string.index_of (Adl_14_specialisation_separator, pos)
					Result := dot_pos = 0 or else dot_pos > pos + 4
				end
			end
		end

	is_adl_14_constraint_code (a_code: STRING): BOOLEAN
			-- Is `a_code' an "ac" code?
		do
			Result := a_code.starts_with (Adl_14_constraint_code_leader)
		end

	is_valid_adl_14_at_code (a_code: STRING): BOOLEAN
			-- Is `a_code' a valid "at" code? It can be any of:
		do
			Result := Adl_14_term_code_regex_matcher.recognizes (a_code)
		end

	is_valid_adl_14_ac_code (a_code: STRING): BOOLEAN
			-- Is `a_code' a valid "at" code? It can be any of:
		do
			Result := Adl_14_constraint_code_regex_matcher.recognizes (a_code)
		end

	is_valid_adl_14_code (a_code: STRING): BOOLEAN
			-- Is `a_code' a valid "at", "ac" or "id" code? It can be any of:
			-- at0000
			-- at000n
			-- at0.n, at0.1.n, at0.0.n etc
			-- where n is non-0
			-- It can't have a final 0-value numeric segment except in the at0000 case.
		local
			i: INTEGER
			str: STRING
		do
			if not a_code.is_empty then
				if a_code.starts_with (Adl_14_term_code_leader) then
					i := Adl_14_term_code_leader.count
				elseif a_code.starts_with (Adl_14_constraint_code_leader) then
					i := Adl_14_constraint_code_leader.count
				end

				if i > 0 then
					str := a_code.substring (i + 1, a_code.count)
					if str.is_equal (default_adl_14_code_number_string) then
						Result := True
					else
						if str.has (Adl_14_specialisation_separator) then
							str.remove_head (str.last_index_of (Adl_14_specialisation_separator, str.count))
						end
						if str.is_integer then
							Result := str.to_integer > 0
						end
					end
				end
			end
		end

	is_adl_14_refined_code (a_code: STRING): BOOLEAN
			-- a code has been specialised if there is a non-zero code index anywhere above the last index
			-- e.g. at0.0.1 -> False
			--      at0001.0.1 -> True
			-- OR: if the code is a specialisation of the at0000 code, e.g. at0000.1, it will also return true, even
			-- though it breaks the above rule. This occurs because we allowed at0000 to be a real code!
		require
			Code_valid: is_valid_adl_14_code (a_code)
		local
			idx_str: STRING
		do
			if adl_14_specialisation_depth_from_code(a_code) > 0 then
				idx_str := a_code.substring(Adl_14_term_code_leader.count+1, a_code.last_index_of(Adl_14_specialisation_separator, a_code.count)-1)
				idx_str.prune_all (Adl_14_specialisation_separator)
				Result := idx_str.to_integer > 0

				-- this deals with the exception
				if not Result then
					Result := a_code.starts_with (Default_adl_14_concept_code)
				end
			end
		end

	adl_14_code_exists_at_level (a_code: STRING; a_level: INTEGER): BOOLEAN
			-- is `a_code' valid at level `a_level' or less, i.e. if we remove its
			-- trailing specialised part corresponding to specialisation below `a_level',
			-- and then any trailing '.0' pieces, do we end up with a valid code? If so
			-- it means that the code corresponds to a real node from `a_level' or higher
		require
			Code_valid: is_valid_adl_14_code (a_code)
			Level_valid: a_level >= 0
		local
			s: STRING
			idx, i: INTEGER
		do
			if a_level >= adl_14_specialisation_depth_from_code(a_code) then
				Result := True
			else
				-- this loop finds the index in a code string of the character just before a_level-1'th '.'
				from
					i := adl_14_specialisation_depth_from_code (a_code)
					idx := a_code.count
				until
					i = a_level
				loop
					idx := a_code.last_index_of (Adl_14_specialisation_separator, idx) - 1
					i := i - 1
				end
				s := a_code.substring(Adl_14_term_code_leader.count+1, idx)
				if s.starts_with (default_adl_14_code_number_string) then
					Result := True
				else
					s.prune_all (Adl_14_specialisation_separator)
					Result := s.to_integer > 0
				end
			end
		end

	is_valid_adl_14_concept_code (a_code: STRING): BOOLEAN
			-- check if `a_code' is a valid root concept code of an archetype
			-- True if a_code has form at0000, or at0000.1, at0000.1.1 etc
		require
			Code_valid: not a_code.is_empty
		local
			csr: INTEGER
		do
			Result := a_code.starts_with (Default_adl_14_concept_code)
			if Result then
				from csr := Default_adl_14_concept_code.count + 1 until csr > a_code.count or not Result loop
					Result := a_code.count >= csr + 1 and (a_code.item (csr) = Adl_14_specialisation_separator and a_code.item (csr + 1) = '1')
					csr := csr + 2
				end
			end
		end

	adl_14_codes_conformant (a_child_code, a_parent_code: STRING): BOOLEAN
			-- True if `a_child_code' conforms to `a_parent_code' in the sense of specialisation, i.e.
			-- is `a_child_code' the same as or more specialised than `a_parent_code'
		require
			Child_code_valid: not a_child_code.is_empty
			Parent_code_valid: not a_parent_code.is_empty
		do
			Result := a_child_code.starts_with (a_parent_code)
		end

feature -- Factory

	new_adl_14_concept_code_at_level (at_level: INTEGER): STRING
			-- make a new term code for use as the root concept code of an archetype
			-- at level = 0 -> Default_adl_14_concept_code
			-- at level = 1 -> Default_adl_14_concept_code.1
			-- at level = 2 -> Default_adl_14_concept_code.1.1
			-- etc
		require
			level_valid: at_level >= 0
		local
			i: INTEGER
		do
			create Result.make_from_string (Default_adl_14_concept_code)
			from until i >= at_level loop
				Result.append_character (Adl_14_specialisation_separator)
				Result.append_character ('1')
				i := i + 1
			end
		ensure
			valid: is_valid_adl_14_concept_code (Result)
			level_set: adl_14_specialisation_depth_from_code (Result) = at_level
		end

	new_adl_14_refined_code_at_level (a_parent_code: STRING; at_level: INTEGER; id_codes: TWO_WAY_SORTED_SET [STRING]): STRING
			-- Create a new at|ac|id-code at specialisation depth `at_level', based on `a_parent_code'
			-- e.g. "at0001" at level 2 will produce "at0001.0.1"
			-- Note: a code of "at0001" has specialisation depth 0
		require
			level_valid: at_level > 0
		local
			i, code: INTEGER
			leader: STRING
		do
			create leader.make_from_string (a_parent_code)

			from i := adl_14_specialisation_depth_from_code (a_parent_code) + 1 until i >= at_level loop
				leader.append (Adl_14_zero_filler)
				i := i + 1
			end

			leader.append_character (Adl_14_specialisation_separator)

			-- generate a code-tail
			code := 1
			Result := leader + code.out
			from until not id_codes.has (Result) loop
				code := code + 1
				Result := leader + code.out
			end
			id_codes.extend (Result)
		ensure
			Result_valid: adl_14_specialised_code_tail (Result).to_integer > 0
		end

feature -- Pattern Matching

	Any_adl_14_code_regex_matcher: RX_PCRE_REGULAR_EXPRESSION
			-- match any term code
		once
			create Result.make
			Result.compile (Any_adl_14_code_regex_pattern)
		end

	Adl_14_term_code_regex_matcher: RX_PCRE_REGULAR_EXPRESSION
			-- match any term code
		once
			create Result.make
			Result.compile (Adl_14_term_code_regex_pattern)
		end

	Adl_14_constraint_code_regex_matcher: RX_PCRE_REGULAR_EXPRESSION
			-- match any term code
		once
			create Result.make
			Result.compile (Adl_14_constraint_code_regex_pattern)
		end

end


