indexing
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
			-- length of internal top-level term codes, e.g. "at0001"

	Term_code_leader: STRING is "at"
			-- leader of all internal term codes

	Constraint_code_leader: STRING is "ac"

feature -- Access

	specialisation_parent_from_code(a_code: STRING): STRING is
			-- get parent of this specialised code
		require
			Code_valid: a_code /= Void and then specialisation_depth_from_code(a_code) > 0
		do
			Result := a_code.substring (1, a_code.last_index_of(Specialisation_separator, a_code.count)-1)
		end

	specialisation_status_from_code(a_code: STRING; a_depth: INTEGER): SPECIALISATION_STATUS is
			-- get the specialisation status (added, inherited, redefined) from this code, at a_depth
			-- for example:
			-- 		status of at0001 is added at depth 0
			--		status of at0001.1 is added at depth 0, redefined at depth 1
			--		status of at0.1 is undefined at depth 0, added at depth 1
			--		status of at0.1.1 is undefined at depth 0, added at depth 1, redefined at depth 2
		require
			Depth_valid: a_depth >= 0 and a_depth <= specialisation_depth_from_code(a_code)
		local
			code_defined_in_this_level, parent_code_defined_in_level_above: BOOLEAN
			code_at_this_level, code_at_parent_level: STRING
		do
			code_at_this_level := specialisation_section_from_code(a_code, a_depth)
			code_defined_in_this_level := code_at_this_level.to_integer > 0 or else code_at_this_level.count = 4 -- takes account of anomalous "0000" code
			if a_depth > 0 then
				code_at_parent_level := specialisation_section_from_code(a_code, a_depth - 1)
				parent_code_defined_in_level_above := code_at_parent_level.to_integer > 0 or else code_at_parent_level.count = 4 -- takes account of anomalous "0000" code
			end

			if code_defined_in_this_level then
				if parent_code_defined_in_level_above then
					create Result.make (ss_redefined)
				else
					create Result.make (ss_added)
				end
			else
				if parent_code_defined_in_level_above then
					create Result.make (ss_inherited)
				else
					create Result.make (ss_undefined)
				end
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

	specialisation_depth_from_code(a_code: STRING): INTEGER is
			-- infer number of levels of specialisation from concept code
		require
			Code_valid: a_code /= Void and then is_valid_code(a_code)
		do
			Result := a_code.occurrences (Specialisation_separator)
		end

	specialised_code_tail(a_code: STRING): STRING is
			-- get code tail from a specialised code, e.g. from
			-- "at0032.0.1", the result is "1"; from
			-- "at0004.3", the result is "3"
		require
			Code_valid: a_code /= Void and then is_specialised_code(a_code)
		do
			Result := a_code.substring(a_code.last_index_of(Specialisation_separator, a_code.count)+1, a_code.count)
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
				i := term_code_leader.count
				Result := a_code.substring (1, i).same_string (term_code_leader)

				if not Result then
					i := constraint_code_leader.count
					Result := a_code.substring (1, i).same_string (constraint_code_leader)
				end

				if Result then
					str := a_code.substring (i + 1, a_code.count)
					str.prune_all (specialisation_separator)
					Result := str.is_integer
				end
			end
		end

	is_specialised_code(a_code: STRING): BOOLEAN is
			-- 	a code has been specialised if there is a non-zero number above the
			-- specialisation depth of the code
		require
			Code_valid: a_code /= Void and then is_valid_code(a_code)
		do
			if specialisation_depth_from_code(a_code) > 0 then
				Result := a_code.substring(Term_code_leader.count+1, a_code.last_index_of(Specialisation_separator, a_code.count)-1).to_integer > 0
			end
		end

	valid_concept_code(a_code: STRING): BOOLEAN is
			-- check if `a_code' is a valid root concept code of an archetype
			-- True if a_code has form at0000, or at0000.1, at0000.1.1 etc
		require
			Code_valid: a_code /= Void and then not a_code.is_empty
		local
			csr: INTEGER
		do
			Result := a_code.substring(1, Default_concept_code.count).is_equal (default_concept_code)
			if Result then
				from
					csr := Default_concept_code.count + 1
				until
					csr > a_code.count or not Result
				loop
					Result := a_code.count >= csr+1 and (a_code.item (csr) = Specialisation_separator and a_code.item (csr+1) = '1')
					csr := csr + 2
				end
			end
		end

feature -- Factory

	new_non_specialised_term_code_at_level(a_level, last_index_at_level: INTEGER): STRING is
			-- create a new code at level of current top code at that level is `last_index_at_level'
		require
			Level_valid: a_level >= 0
			Index_valid: last_index_at_level >= 0
		local
			new_idx_str: STRING
			i: INTEGER
		do
			if a_level > 0 then
				create Result.make(0)
				Result.append(Term_code_leader)
				from
					i := 0
				until
					i = a_level
				loop
					Result.append_character('0')
					Result.append_character(Specialisation_separator)
					i := i + 1
				end

				Result.append_integer(last_index_at_level+1)
			else
				create Result.make_filled('0', Term_code_length)
				Result.replace_substring(Term_code_leader, 1, Term_code_leader.count)
				new_idx_str := (last_index_at_level + 1).out
				Result.replace_substring(new_idx_str, Result.count-new_idx_str.count+1, Result.count)
			end
		ensure
			Result_exists: Result /= Void
		end

	new_specialised_term_code_at_level(a_parent_code, last_code: STRING; at_level:INTEGER): STRING is
			-- make a new specialised code based on `a_parent_code'
			-- e.g. "at0001" at level 2 will produce "at0001.0.1"
			-- Note: a code of "at0001" has specialisation depth 0
		require
			a_parent_code_valid: a_parent_code /= Void and then not a_parent_code.is_empty
			last_code_valid: last_code /= Void and then not last_code.is_empty
			level_valid: at_level > 0
		local
			i, n: INTEGER
		do
			create Result.make(0)
			Result.append(a_parent_code)
			from
				i := specialisation_depth_from_code(a_parent_code) + 1
			until
				i >= at_level
			loop
				Result.append_character(Specialisation_separator)
				Result.append_character('0')
				i := i + 1
			end

			Result.append_character(Specialisation_separator)
			n := specialised_code_tail(last_code).to_integer
			Result.append_integer(n+1)
		ensure
			Result_valid: Result /= Void and then specialised_code_tail(Result).to_integer > 0
		end

	new_concept_code_at_level(at_level:INTEGER): STRING is
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
			create Result.make(0)
			Result.append(Default_concept_code)
			from
			until
				i >= at_level
			loop
				Result.append_character(Specialisation_separator)
				Result.append_character('1')
				i := i + 1
			end
		ensure
			Result_valid: Result /= Void and then valid_concept_code(Result)
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
