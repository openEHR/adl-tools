note
	component:   "openEHR Archetype Project"
	description: "cardinality representation in ADL parse tree"
	keywords:    "cardinality, ADL"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2003, 2004 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class CARDINALITY

create
	make, make_from_string

feature -- Definitions

	Cardinality_subsection_delimiter: CHARACTER = ';'

	Cardinality_unique_marker: STRING = "unique"

	Cardinality_ordered_marker: STRING = "ordered"

	Cardinality_unordered_marker: STRING = "unordered"

feature -- Initialisation

	make (an_interval: attached MULTIPLICITY_INTERVAL)
			-- default status is: ordered, not unique, i.e., a list
		require
			Interval_valid: not an_interval.lower_unbounded
		do
			interval := an_interval
			is_ordered := True
		ensure
			Is_list: is_ordered and not is_unique
		end

	make_from_string (a_str: attached STRING)
			-- make from string of form "n..m; ordered; unique" where the ';' section(s) are optional
		local
			end_pos: INTEGER
		do
			end_pos := a_str.index_of (Cardinality_subsection_delimiter, 1)
			if end_pos > 0 then
				create interval.make_from_string (a_str.substring (1, end_pos-1))
				if a_str.has_substring (Cardinality_unordered_marker) then
					-- nothing, but have to check before checking for 'ordered' marker
				elseif a_str.has_substring (Cardinality_ordered_marker) then
					is_ordered := True
				end

				if a_str.has_substring (Cardinality_unique_marker) then
					is_unique := True
				end
			else
				create interval.make_from_string (a_str)
			end
		end

feature -- Access

	interval: MULTIPLICITY_INTERVAL

feature -- Status Report

	is_ordered: BOOLEAN

	is_unique: BOOLEAN

	is_list: BOOLEAN
		do
			Result := is_ordered and not is_unique
		end

	is_set: BOOLEAN
		do
			Result := not is_ordered and is_unique
		end

	is_bag: BOOLEAN
		do
			Result := not is_ordered and not is_unique
		end

	is_open: BOOLEAN
			-- True if this interval imposes no constraints, i.e. is set to 0..*
		do
			Result := interval.is_open
		end

feature -- Comparison

	equal_interval(other: attached CARDINALITY): BOOLEAN
			-- is this and `other' the same interval
		do
			Result := interval.equal_interval (other.interval)
		end

	contains (other: attached CARDINALITY): BOOLEAN
			-- Does current cardinality contain `other'?
		do
			Result := interval.contains(other.interval)
		end

feature -- Modification

	set_unordered
		do
			is_ordered := False
		end

	set_unique
		do
			is_unique := True
		end

feature -- Output

	as_string: attached STRING
			-- output as a string, excluding default items
		do
			create Result.make(0)

			Result.append(interval.lower.out)
			if interval.upper_unbounded then
				Result.append("..*")
			elseif not interval.limits_equal then
				Result.append(".." + interval.upper.out)
			end

			if is_ordered then
				Result.append("; ordered")
			else
				Result.append("; unordered")
			end

			if is_unique then
				Result.append("; unique")
			end
		end

invariant
	Validity: not interval.lower_unbounded

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
--| The Original Code is cadl_cardinality.e.
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
