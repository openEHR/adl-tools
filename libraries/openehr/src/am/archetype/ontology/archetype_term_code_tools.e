indexing
	component:   "openEHR Archetype Project"
	description: "[
			 Model of an archetype Term code. Term codes take the form of 'atNNNN.N..'.
			 At the first level, 'atNNNN' is used; specialised codes are of the 
			 form 'atNNNN.N' to watever depth require; intervening '0's are allowed,
			 indicating that the code is a child of a parent more than one level
			 up, e.g. 'at0021.0.3' is the 3rd specialisation of the top level code
			 'at0021', in the 2nd specialsiation level.

			 New codes can also be introduced in specialised archetypes, which are
			 not themselves specialisations of any existing code. These have the form
			 'at.NN.NN', e.g. 'at.0.0.2'
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

	Default_concept_code: STRING is "at0000"
			-- FIXME: the 0000 code should not be allowed to be used in an archetype
			-- definition secton, since it violates the rule that a '0' code means
			-- "not defined here" (i.e. it is normally a filler for lower down codes)
			-- THIS SHOULD BE CHANGED to at0001

	Specialisation_separator: CHARACTER is '.'

	Term_code_length: INTEGER is 6
			-- length of top-level term codes, e.g. "at0001"

	Term_code_leader: STRING is "at"
			-- leader of all internal term codes

	Constraint_code_length: INTEGER is 6
			-- length of top-level constraint codes, e.g. "ac0001"

	Constraint_code_leader: STRING is "ac"

feature -- Access

	specialisation_parent_from_code(a_code: STRING): STRING is
			-- get parent of this specialised code
		require
			Code_valid: a_code /= Void and then specialisation_depth_from_code(a_code) > 0
		do
			Result := a_code.substring (1, a_code.last_index_of(Specialisation_separator, a_code.count)-1)
		ensure
			Valid_result: specialisation_depth_from_code(Result) = specialisation_depth_from_code(a_code) - 1
		end

	specialisation_parent_from_code_at_level(a_code: STRING; a_level: INTEGER): STRING is
			-- get parent of this specialised code at `a_level'
		require
			Code_valid: a_code /= Void and then is_valid_code(a_code)
			Level_valid: a_level >= 0 and a_level <= specialisation_depth_from_code(a_code)
		local
			i, idx: INTEGER
		do
			from
				i := specialisation_depth_from_code (a_code)
				idx := a_code.count
			until
				i = a_level
			loop
				idx := a_code.last_index_of (Specialisation_separator, idx) - 1
				i := i - 1
			end

			Result := a_code.substring (1, idx)
		ensure
			Valid_result: specialisation_depth_from_code (Result) = a_level
		end

	specialisation_status_from_code(a_code: STRING; a_depth: INTEGER): SPECIALISATION_STATUS is
			-- get the specialisation status (added, inherited, redefined) from this code, at a_depth
			-- for example:
			-- 		status of at0001 is added at depth 0
			--		status of at0001.1 is added at depth 0, redefined at depth 1
			--		status of at0.1 is undefined at depth 0, added at depth 1
			--		status of at0.1.1 is undefined at depth 0, added at depth 1, redefined at depth 2
		require
			Code_valid: a_code /= Void and then not a_code.is_empty
			Depth_valid: a_depth >= 0 and a_depth <= specialisation_depth_from_code(a_code)
		local
			this_code_exists, parent_code_exists: BOOLEAN
		do
			this_code_exists := specialisation_section_from_code(a_code, a_depth).to_integer > 0
			if a_depth > 0 then
				parent_code_exists := specialisation_section_from_code(a_code, a_depth - 1).to_integer > 0
			end

			if this_code_exists then
				if parent_code_exists then
					create Result.make (ss_redefined)
				else
					create Result.make (ss_added)
				end
			else
				create Result.make (ss_undefined)
			end
		end

	specialisation_section_from_code(a_code: STRING; a_depth: INTEGER): STRING is
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
			Code_valid: a_code /= Void and then not a_code.is_empty
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

	specialisation_depth_from_code (a_code: STRING): INTEGER is
			-- infer number of levels of specialisation from concept code
		require
			Code_valid: a_code /= Void and then is_valid_code (a_code)
		do
			Result := a_code.occurrences (Specialisation_separator)
		ensure
			non_negative: Result >= 0
		end

	specialised_code_tail (a_code: STRING): STRING is
			-- get code tail from a specialised code, e.g. from
			-- "at0032.0.1", the result is "1"; from
			-- "at0004.3", the result is "3"
		require
			code_valid: a_code /= Void and then is_valid_code (a_code)
			not_root_code: is_specialised_code (a_code)
		do
			Result := a_code.substring (a_code.last_index_of (Specialisation_separator, a_code.count) + 1, a_code.count)
		end

feature -- Comparison

	is_valid_code (a_code: STRING): BOOLEAN is
			-- Is `a_code' an "at" or "ac" code?
		require
			code_attached: a_code /= Void
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
					str.prune_all (specialisation_separator)
					Result := str.is_integer
				end
			end
		end

	is_specialised_code(a_code: STRING): BOOLEAN is
			-- a code has been specialised if there is a non-zero code index anywhere above the last index
			-- e.g. at0.0.1, level=3 -> False
			--      at0001.0.1, level=3 -> True
		require
			Code_valid: a_code /= Void and then is_valid_code (a_code)
		local
			idx_str: STRING
		do
			if specialisation_depth_from_code(a_code) > 0 then
				idx_str := a_code.substring(Term_code_leader.count+1, a_code.last_index_of(Specialisation_separator, a_code.count)-1)
				idx_str.prune_all (Specialisation_separator)
				Result := idx_str.to_integer > 0

				if not Result then
					Result := specialisation_parent_from_code_at_level (a_code, 0).same_string (default_concept_code)
				end
			end
		end

feature -- Factory

	new_non_specialised_term_code_at_level(specialisation_depth, highest_term_code_index: INTEGER): STRING is
			-- create a new code at level of given top code index at given specialisation depth
			-- code will have form atnnn or at0.n or at0.0.n etc
		require
			Level_valid: specialisation_depth >= 0
			Index_valid: highest_term_code_index >= 0
		local
			new_idx_str: STRING
			i: INTEGER
		do
			if specialisation_depth > 0 then
				create Result.make(0)
				Result.append (Term_code_leader)

				from
					i := 0
				until
					i = specialisation_depth
				loop
					Result.append_character('0')
					Result.append_character(Specialisation_separator)
					i := i + 1
				end

				Result.append_integer(highest_term_code_index + 1)
			else
				create Result.make_filled ('0', Term_code_length)
				Result.replace_substring(Term_code_leader, 1, Term_code_leader.count)
				new_idx_str := (highest_term_code_index + 1).out
				Result.replace_substring(new_idx_str, Result.count-new_idx_str.count + 1, Result.count)
			end
		ensure
			Result_exists: Result /= Void
		end

	new_specialised_term_code_at_level(a_parent_code: STRING; specialisation_depth: INTEGER): STRING is
			-- Make a new specialised code based on `a_parent_code'
			-- e.g. "at0001" at level 2 will produce "at0001.0.1"
			-- Note: a code of "at0001" has specialisation depth 0
		require
			a_parent_code_valid: a_parent_code /= Void and then not a_parent_code.is_empty
			level_valid: specialisation_depth > 0
		local
			i: INTEGER
		do
			create Result.make(0)
			Result.append (a_parent_code)

			from
				i := specialisation_depth_from_code(a_parent_code) + 1
			until
				i >= specialisation_depth
			loop
				Result.append_character(Specialisation_separator)
				Result.append_character('0')
				i := i + 1
			end

			Result.append_character(Specialisation_separator)
			Result.append_integer (highest_specialised_code_indexes [a_parent_code] + 1)
		ensure
			Result_valid: Result /= Void and then specialised_code_tail(Result).to_integer > 0
		end

	new_constraint_code_from_index(last_index, specialisation_depth: INTEGER): STRING is
			-- create a new constraint code based on current highest code `last_index'
		require
			Index_valid: last_index >= 0
		local
			new_idx_str: STRING
			i: INTEGER
		do
			new_idx_str := (last_index + 1).out
			if specialisation_depth = 0 then
				create Result.make_filled('0', Term_code_length)
				Result.replace_substring(Constraint_code_leader, 1, Constraint_code_leader.count)
				Result.replace_substring(new_idx_str, Result.count-new_idx_str.count+1, Result.count)
			else
				create Result.make(0)
				Result.append(Constraint_code_leader)
				from
					i := 1
				until
					i > specialisation_depth
				loop
					Result.append_character('0')
					Result.append_character(Specialisation_separator)
					i := i + 1
				end
				Result.append(new_idx_str)
			end
		ensure
			Result_exists: Result /= Void
		end

feature {NONE} -- Implementation

	highest_specialised_code_indexes: HASH_TABLE [INTEGER, STRING]
			-- Table of child code tails keyed by immediate parent code.

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
