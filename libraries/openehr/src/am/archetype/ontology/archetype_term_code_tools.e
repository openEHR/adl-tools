note
	component:   "openEHR Archetype Project"
	description: "[
			 Tools for manipulating archetype codes. Term codes take the form of 'atNNNN.N..'.
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
	keywords:    "archetype, ontology, coded term"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2003 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class ARCHETYPE_TERM_CODE_TOOLS

inherit
	SPECIALISATION_STATUSES

feature -- Definitions

	Local_terminology_id: STRING = "local"

	Default_code_number_string: STRING = "0000"

	Default_concept_code: STRING
			-- FIXME: the 0000 code should not be allowed to be used in an archetype
			-- definition secton, since it violates the rule that a '0' code means
			-- "not defined here" (i.e. it is normally a filler for lower down codes)
			-- THIS SHOULD BE CHANGED to at0001
		once
			Result := Term_code_leader + Default_code_number_string
		end

	Default_constraint_code: STRING
			-- FIXME: the 0000 code should not be allowed to be used in an archetype
			-- definition secton, since it violates the rule that a '0' code means
			-- "not defined here" (i.e. it is normally a filler for lower down codes)
			-- THIS SHOULD BE CHANGED to ac0001
		once
			Result := Constraint_code_leader + Default_code_number_string
		end

	Specialisation_separator: CHARACTER = '.'

	Term_code_length: INTEGER
			-- length of top-level term codes, e.g. "at0001"
		once
			Result := Default_concept_code.count
		end

	Term_code_leader: STRING = "at"
			-- leader of all internal term codes

	Term_code_regex_pattern: STRING
			-- a regex to match any term of any depth
		once
			create Result.make_empty
			Result.append (Term_code_leader)
			Result.append ("[0-9]+(\.[0-9]+)*")
		end

	Constraint_code_length: INTEGER
			-- length of top-level constraint codes, e.g. "ac0001"
		once
			Result := Default_constraint_code.count
		end

	Constraint_code_leader: STRING = "ac"

	Constraint_code_regex_pattern: STRING
			-- a regex to match any term of any depth
		once
			create Result.make_empty
			Result.append (Constraint_code_leader)
			Result.append ("[0-9]+(\.[0-9]+)*")
		end

	Zero_filler: STRING = ".0"

	Annotated_code_text_delimiter: CHARACTER = '|'
			-- delimiter for creating annotated terms of form 'nnnn|term text|'
			-- as commonly used in SNOMED CT

	Annotated_code_text_delimiter_string: STRING = "|"
			-- string form of above

feature -- Access

	specialisation_parent_from_code (a_code: attached STRING): STRING
			-- get parent of this specialised code
		require
			Code_valid: specialisation_depth_from_code(a_code) > 0
		do
			Result := a_code.substring (1, a_code.last_index_of(Specialisation_separator, a_code.count)-1)
		ensure
			Valid_result: specialisation_depth_from_code(Result) = specialisation_depth_from_code(a_code) - 1
		end

	code_at_level (a_code: attached STRING; a_level: INTEGER): STRING
			-- get valid form of this code at `a_level'
		require
			Code_valid: code_exists_at_level(a_code, a_level)
			Level_valid: a_level >= 0 and a_level <= specialisation_depth_from_code(a_code)
		local
			i, idx: INTEGER
			finished: BOOLEAN
		do
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
			from
			until
				finished
			loop
				if a_code.substring (idx-1, idx).is_equal (Zero_filler) then
					idx := idx - 2
				else
					finished := True
				end
			end

			Result := a_code.substring (1, idx)
		ensure
			Valid_result: is_valid_code (Result)
		end

	specialisation_status_from_code (a_code: attached STRING; a_depth: INTEGER): SPECIALISATION_STATUS
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
			Code_valid: is_valid_code(a_code)
			Depth_valid: a_depth >= 0
		local
			code_defined_in_this_level: BOOLEAN
			code_at_this_level: STRING
		do
			if a_depth > specialisation_depth_from_code(a_code) then
				create Result.make (ss_inherited)
			else
				code_at_this_level := index_from_code_at_level(a_code, a_depth)
				code_defined_in_this_level := code_at_this_level.to_integer > 0 or else code_at_this_level.count = 4 -- takes account of anomalous "0000" code
				if code_defined_in_this_level then
					if a_depth > 0 and code_exists_at_level(a_code, a_depth - 1) then -- parent is valid
						create Result.make (ss_redefined)
					else
						create Result.make (ss_added)
					end
				elseif a_depth > 0 and code_exists_at_level(a_code, a_depth - 1) then
					create Result.make (ss_inherited)
				else
					create Result.make (ss_undefined)
				end
			end
		end

	index_from_code_at_level (a_code: attached STRING; a_depth: INTEGER): STRING
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
			Depth_valid: a_depth >= 0 and a_depth <= specialisation_depth_from_code(a_code)
		local
			spec_depth: INTEGER
			code_num_part: STRING
			lpos, rpos, depth_count: INTEGER
		do
			spec_depth := specialisation_depth_from_code(a_code)
			code_num_part := a_code.substring (term_code_leader.count+1, a_code.count)

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
			Result := code_num_part.substring(lpos, rpos)
		end

	specialisation_depth_from_code (a_code: attached STRING): INTEGER
			-- Infer number of levels of specialisation from `a_code'.
		require
			code_valid: is_valid_code (a_code)
		do
			Result := a_code.occurrences (Specialisation_separator)
		ensure
			non_negative: Result >= 0
		end

	specialised_code_tail (a_code: attached STRING): STRING
			-- get code tail from a specialised code, e.g. from
			-- "at0032.0.1", the result is "1"; from
			-- "at0004.3", the result is "3"
		require
			code_valid: is_valid_code (a_code)
			not_root_code: is_refined_code (a_code)
		do
			Result := a_code.substring (a_code.last_index_of (Specialisation_separator, a_code.count) + 1, a_code.count)
		end

feature -- Comparison

	is_term_code (a_code: attached STRING): BOOLEAN
			-- Is `a_code' an "at" code?
		do
			Result := a_code.starts_with (term_code_leader)
		end

	is_constraint_code (a_code: attached STRING): BOOLEAN
			-- Is `a_code' an "ac" code?
		do
			Result := a_code.starts_with (constraint_code_leader)
		end

	is_valid_code (a_code: attached STRING): BOOLEAN
			-- Is `a_code' a valid "at" or "ac" code? It can be any of:
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
				if a_code.starts_with (term_code_leader) then
					i := term_code_leader.count
				elseif a_code.starts_with (constraint_code_leader) then
					i := constraint_code_leader.count
				end

				if i > 0 then
					str := a_code.substring (i + 1, a_code.count)
					if str.is_equal (default_code_number_string) then
						Result := True
					else
						if str.has (specialisation_separator) then
							str.remove_head (str.last_index_of(Specialisation_separator, str.count))
						end
						if str.is_integer then
							Result := str.to_integer > 0
						end
					end
				end
			end
		end

	is_refined_code (a_code: attached STRING): BOOLEAN
			-- a code has been specialised if there is a non-zero code index anywhere above the last index
			-- e.g. at0.0.1 -> False
			--      at0001.0.1 -> True
			-- OR: if the code is a specialisation of the at0000 code, e.g. at0000.1, it will also return true, even
			-- though it breaks the above rule. This occurs because we allowed at0000 to be a real code!
		require
			Code_valid: is_valid_code (a_code)
		local
			idx_str: STRING
		do
			if specialisation_depth_from_code(a_code) > 0 then
				idx_str := a_code.substring(Term_code_leader.count+1, a_code.last_index_of(Specialisation_separator, a_code.count)-1)
				idx_str.prune_all (Specialisation_separator)
				Result := idx_str.to_integer > 0

				-- this deals with the exception
				if not Result then
					Result := a_code.starts_with (default_concept_code)
				end
			end
		end

	code_exists_at_level (a_code: attached STRING; a_level: INTEGER): BOOLEAN
			-- is `a_code' valid at level `a_level' or less, i.e. if we remove its
			-- trailing specialised part corresponding to specialisation below `a_level',
			-- and then any trailing '.0' pieces, do we end up with a valid code? If so
			-- it means that the code corresponds to a real node from `a_level' or higher
		require
			Code_valid: is_valid_code(a_code)
			Level_valid: a_level >= 0
		local
			s: STRING
			idx, i: INTEGER
		do
			if a_level >= specialisation_depth_from_code(a_code) then
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
				s := a_code.substring(Term_code_leader.count+1, idx)
				if s.starts_with (Default_code_number_string) then
					Result := True
				else
					s.prune_all (Specialisation_separator)
					Result := s.to_integer > 0
				end
			end
		end

	is_valid_concept_code (a_code: attached STRING): BOOLEAN
			-- check if `a_code' is a valid root concept code of an archetype
			-- True if a_code has form at0000, or at0000.1, at0000.1.1 etc
		require
			Code_valid: not a_code.is_empty
		local
			csr: INTEGER
		do
			Result := a_code.starts_with (default_concept_code)
			if Result then
				from csr := Default_concept_code.count + 1 until csr > a_code.count or not Result loop
					Result := a_code.count >= csr + 1 and (a_code.item (csr) = Specialisation_separator and a_code.item (csr + 1) = '1')
					csr := csr + 2
				end
			end
		end

	codes_conformant (a_child_code, a_parent_code: attached STRING): BOOLEAN
			-- True if `a_child_code' conforms to `a_parent_code' in the sense of specialisation, i.e.
			-- is `a_child_code' the same as or more specialised than `a_parent_code'
		require
			Child_code_valid: not a_child_code.is_empty
			Parent_code_valid: not a_parent_code.is_empty
		do
			Result := a_child_code.starts_with (a_parent_code)
		end

feature -- Factory

	new_concept_code_at_level (at_level: INTEGER): STRING
			-- make a new term code for use as the root concept code of an archetype
			-- at level = 0 -> Default_concept_code
			-- at level = 1 -> Default_concept_code.1
			-- at level = 2 -> Default_concept_code.1.1
			-- etc
		require
			level_valid: at_level >= 0
		local
			i: INTEGER
		do
			create Result.make_from_string (default_concept_code)
			from until i >= at_level loop
				Result.append_character (Specialisation_separator)
				Result.append_character ('1')
				i := i + 1
			end
		ensure
			valid: is_valid_concept_code (Result)
			level_set: specialisation_depth_from_code (Result) = at_level
		end

feature -- Conversion

	annotated_code (a_code, a_text: attached STRING): attached STRING
			-- create annotated term of form 'nnnn|term text|' as commonly used in SNOMED CT
		do
			create Result.make_empty
			Result.append (a_code)
			Result.append_character (Annotated_code_text_delimiter)
			Result.append (a_text)
			Result.append_character (Annotated_code_text_delimiter)
		end

feature -- Pattern Matching

	Term_code_regex_matcher: LX_DFA_REGULAR_EXPRESSION
			-- match any term code
		once
			create Result.compile_case_insensitive (Term_code_regex_pattern)
		end

	Constraint_code_regex_matcher: LX_DFA_REGULAR_EXPRESSION
			-- match any term code
		once
			create Result.compile_case_insensitive (Constraint_code_regex_pattern)
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
--| The Original Code is adl_term_code_tools.e.
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
