note
	component:   "openEHR support types"

	description: "[
				 Integer interval, used for representing cardinality, occurrences etc.
				 ]"
	keywords:    "intervals"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.com>"
	copyright:   "Copyright (c) 2000-2005 The openEHR Foundation <http://www.openEHR.org>"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class MULTIPLICITY_INTERVAL

inherit INTERVAL [INTEGER]
	rename
		make_bounded as make_bounded_interval,
		make_upper_unbounded as make_upper_unbounded_interval
	redefine
		as_string, equal_interval
	end

create
	default_create,
	make_bounded,
	make_upper_unbounded,
	make_point,
	make_from_interval,
	make_open,
	make_mandatory,
	make_optional,
	make_prohibited,
	make_from_string

convert
	make_from_interval({INTERVAL[INTEGER]})

feature -- Definitions

	Multiplicity_range_delimiter: STRING = ".."

	Multiplicity_unbounded_marker: CHARACTER = '*'

feature -- Initialisation

	make_bounded (a_lower, an_upper: INTEGER)
			-- make with both limits set
		require
			Valid_order: a_lower <= an_upper
		do
			make_bounded_interval(a_lower, an_upper, True, True)
		ensure
			Lower_set: lower = a_lower
			Upper_set: upper = an_upper
			Bounded_lower: not lower_unbounded
			Bounded_upper: not upper_unbounded
		end

	make_upper_unbounded(a_lower: INTEGER)
			-- make an interval from `a_lower' to +infinity
		do
			make_upper_unbounded_interval(a_lower, True)
		ensure
			Lower_set: lower = a_lower
			Bounded_lower: not lower_unbounded
			Upper_unbounded: upper_unbounded
		end

	make_from_interval (an_int: INTERVAL[INTEGER])
			-- make from a standard INTERVAL[INTEGER]
		do
			lower := an_int.lower
			upper := an_int.upper
			lower_included := True
			upper_included := an_int.upper_included
			upper_unbounded := an_int.upper_unbounded
		end

	make_open
			-- make an open interval from 0 to +infinity
		do
			make_upper_unbounded_interval(0, True)
		ensure
			Lower_set: lower = 0
			Lower_bounded: not lower_unbounded
			Upper_unbounded: upper_unbounded
			open: is_open
		end

	make_optional
			-- make an interval representing optionality, i.e. 0..1
		do
			make_bounded_interval(0, 1, True, True)
		ensure
			Lower_set: lower = 0
			Upper_set: upper = 1
			Lower_bounded: not lower_unbounded
			Upper_bounded: not upper_unbounded
			optional: is_optional
		end

	make_mandatory
			-- make an interval representing mandatoriness, i.e. 1..1
		do
			make_point(1)
		ensure
			Lower_set: lower = 1
			Upper_set: upper = 1
			Lower_bounded: not lower_unbounded
			Upper_bounded: not upper_unbounded
			mandatory: is_mandatory
		end

	make_prohibited
			-- make an interval representing prohibition, i.e. 0..0
		do
			make_point(0)
		ensure
			Lower_set: lower = 0
			Upper_set: upper = 0
			Lower_bounded: not lower_unbounded
			Upper_bounded: not upper_unbounded
			prohibited: is_prohibited
		end

	make_from_string (a_str: attached STRING)
			-- make from a string of the form "n..m" or just "n", where n and m are integers, or m may be '*'
		require
			valid_multiplicity_string: valid_multiplicity_string (a_str)
		local
			a_lower, an_upper, delim_pos: INTEGER
			a_mult_str: STRING
		do
			a_mult_str := a_str.twin

			-- remove any spaces
			a_mult_str.prune_all (' ')

			-- make the interval
			delim_pos := a_mult_str.substring_index (Multiplicity_range_delimiter, 1)
			-- n..m case
			if delim_pos > 0 then
				a_lower := a_mult_str.substring (1, delim_pos-1).to_integer
				if a_mult_str.item (a_mult_str.count) = Multiplicity_unbounded_marker then
					make_upper_unbounded (a_lower)
				else
					an_upper := a_mult_str.substring (a_mult_str.substring_index (Multiplicity_range_delimiter, 1) + Multiplicity_range_delimiter.count, a_mult_str.count).to_integer
					make_bounded (a_lower, an_upper)
				end
			-- * case
			elseif a_mult_str.item (1) = Multiplicity_unbounded_marker then
				make_upper_unbounded (0)
			-- m (single integer) case
			else
				a_lower := a_mult_str.to_integer
				make_bounded (a_lower, a_lower)
			end
		end

feature -- Status report

	is_open: BOOLEAN
			-- True if this interval imposes no constraints, i.e. is set to 0..*
		do
			Result := lower = 0 and upper_unbounded
		end

	is_optional: BOOLEAN
			-- True if this interval expresses optionality, i.e. 0..1
		do
			Result := lower = 0 and upper = 1
		end

	is_mandatory: BOOLEAN
			-- True if this interval expresses mandation, i.e. 1..1
		do
			Result := lower = 1 and upper = 1
		end

	is_prohibited: BOOLEAN
			-- True if this interval is set to 0..0
		do
			Result := lower = 0 and upper = 0 and not lower_unbounded and not upper_unbounded
		end

	valid_multiplicity_string (a_str: attached STRING): BOOLEAN
			-- check if string is in form "n..m; ordered; unique" where each subsection after a ';' is optional
		do
			-- for the moment, just assume
			Result := True
		end

feature -- Operations

	union (other: like Current)
			-- generate the outer interval of Current and other
		do
			if upper_unbounded or other.upper_unbounded then
				upper_unbounded := True
			else
				upper := upper.max(other.upper)
			end
			lower := lower.min(other.lower)
		end

	add (other: like Current)
			-- generate the interval resulting from sum(lower, other.lower)..sum(upper, other.upper)
		do
			if upper_unbounded or other.upper_unbounded then
				upper_unbounded := True
			else
				upper := upper + other.upper
			end
			lower := lower + other.lower
		end

feature -- Comparison

	equal_interval (other: attached  INTERVAL [INTEGER]): BOOLEAN
			-- True if current object's interval is same as `other'
		do
			Result := lower = other.lower and
				upper = other.upper and
				lower_included = other.lower_included and
				upper_included = other.upper_included and
				lower_unbounded = other.lower_unbounded and
				upper_unbounded = other.upper_unbounded
		end

feature -- Output

	as_string: STRING
		do
			create Result.make(0)
			if upper_unbounded then
				Result.append (serialise_primitive_value (lower) + "..*")
			elseif not limits_equal then
				Result.append (serialise_primitive_value (lower) + ".." + serialise_primitive_value (upper))
			else
				Result.append (serialise_primitive_value (lower))
			end
		end

invariant
	Lower_valid: lower >= 0

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
--| The Original Code is interval.e.
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
