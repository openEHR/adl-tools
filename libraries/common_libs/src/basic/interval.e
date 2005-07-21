indexing
	component:   "openEHR support types"
	
	description: "Generic class defining an interval (i.e. range) of a comparable type."
	keywords:    "intervals"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2000-2005 The openEHR Foundation <http://www.openEHR.org>"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class OE_INTERVAL [G -> PART_COMPARABLE]

inherit
	ANY
		redefine
			is_equal
		end
		
create 
	default_create,
	make_bounded, make_lower_unbounded, make_upper_unbounded, make_unbounded, make_point

feature -- Initialization

	make_point(a_value:G) is
			-- make with both limits set to the same value
		require
			Value_exists: a_value /= Void
		do
			lower := a_value
			upper := a_value
			lower_included := True
			upper_included := True
		ensure
			Lower_set: lower = a_value
			Upper_set: upper = a_value
			lower_included_set: lower_included
			upper_included_set: upper_included
			Is_point: is_point
		end

	make_bounded(a_lower, an_upper:G; lower_included_flag, upper_included_flag: BOOLEAN) is
			-- make with both limits set
		require
			Lower_exists: a_lower /= Void
			Upper_exists: an_upper /= Void
			Valid_order: a_lower <= an_upper
		do
			lower := a_lower
			upper := an_upper
			lower_included := lower_included_flag
			upper_included := upper_included_flag
		ensure
			Lower_set: lower = a_lower
			Upper_set: upper = an_upper
			lower_included_set: lower_included = lower_included_flag
			upper_included_set: upper_included = upper_included_flag
		end

	make_lower_unbounded(an_upper:G; upper_included_flag: BOOLEAN) is
			-- make an interval from -infinity to `an_upper'
		require
			Upper_exists: an_upper /= Void
		do
			upper := an_upper
			lower_unbounded := True
			upper_included := upper_included_flag
		ensure
			Lower_unbounded: lower_unbounded
			Upper_set: upper = an_upper
			upper_included_set: upper_included = upper_included_flag
		end

	make_upper_unbounded(a_lower:G; lower_included_flag: BOOLEAN) is
			-- make an interval from `a_lower' to +infinity
		require
			Lower_exists: a_lower /= Void
		do
			lower := a_lower
			upper_unbounded := True
			lower_included := lower_included_flag
		ensure
			Lower_set: lower = a_lower
			Upper_unbounded: upper_unbounded
			lower_included_set: lower_included = lower_included_flag
		end

	make_unbounded is
		do
			lower_unbounded := True
			upper_unbounded := True
		ensure
			Lower_unbounded: lower_unbounded
			Upper_unbounded: upper_unbounded
			lower_included_not_set: not lower_included
			upper_included_not_set: not upper_included
		end

feature -- Access

	lower: G
			-- lower limit of interval

	upper: G
			-- upper limit of interval
			
	midpoint: G is
			-- generate midpoint of limits
		do
			
		end
		
feature -- Status report

	lower_unbounded: BOOLEAN
			-- True if lower limit open, i.e. -infinity
	
	upper_unbounded: BOOLEAN
			-- True if upper limit open, i.e. +infinity
		
	lower_included: BOOLEAN
			-- True if lower limit point included in interval
	
	upper_included: BOOLEAN
			-- True if upper limit point included in interval

	is_point: BOOLEAN is
			-- Is current interval a point (width = 0)?
		do
			Result := not (lower_unbounded or upper_unbounded) and  
						lower_included and upper_included and lower.is_equal (upper)
		ensure
			Result = (not (lower_unbounded or upper_unbounded) and 
				lower_included and upper_included and lower.is_equal (upper))
		end

	has (v: G): BOOLEAN is
			-- Does current interval have `v' between its bounds?
		require
			exists: v /= void
		do
			Result := (lower_unbounded or ((lower_included and v >= lower) or v > lower)) and 
			(upper_unbounded or ((upper_included and v <= upper or v < upper)))
		ensure
			result_definition: Result = (lower_unbounded or ((lower_included and v >= lower) or v > lower)) and 
			(upper_unbounded or ((upper_included and v <= upper or v < upper)))
		end

	is_equal(other: like Current): BOOLEAN is
			-- compare two intervals
		do
			if lower_unbounded then
				Result := other.lower_unbounded
			else
				Result := not other.lower_unbounded and 
						((lower_included = other.lower_included) and lower.is_equal(other.lower))
			end
			
			if Result then
				if upper_unbounded then
					Result := other.upper_unbounded
				else
					Result := not other.upper_unbounded and 
					((upper_included = other.upper_included) and upper.is_equal(other.upper))
				end				
			end
		end
		
	limits_equal: BOOLEAN is
			-- true if limits bounded and equal
		do
			Result := not (lower_unbounded or upper_unbounded) and (lower.is_equal(upper))
		end

feature -- Output

	lower_out: STRING is
			-- same as out but fixed to make REALs with no decimal part
			-- output as NNN.0 anyway
		do
			-- FIXME: REAL.out is broken
			Result := lower.out
			if lower.generating_type.substring(1,4).is_equal("REAL") and then Result.index_of('.', 1) = 0 then
				Result.append(".0")
			end
		end

	upper_out: STRING is
			-- same as out but fixed to make REALs with no decimal part
			-- output as NNN.0 anyway
		do
			-- FIXME: REAL.out is broken
			Result := upper.out
			if upper.generating_type.substring(1,4).is_equal("REAL") and then Result.index_of('.', 1) = 0 then
				Result.append(".0")
			end
		end

	as_occurrences_string: STRING is
		do
			create Result.make(0)
			if lower_unbounded then
				Result.append("(error - lower limit unbounded)")
			elseif upper_unbounded then
				Result.append(lower_out + "..*")
			elseif not limits_equal then
				Result.append(lower_out + ".." + upper_out)
			else
				Result.append(lower_out) 
			end
		end

	as_string: STRING is
		do
			create Result.make(0)
			if lower_unbounded then
				if upper_included then
					Result.append("<= " + upper_out)
				else
					Result.append("< " + upper_out)
				end
			elseif upper_unbounded then
				if lower_included then
					Result.append(">= " + lower_out)
				else
					Result.append("> " + lower_out)
				end
			elseif not limits_equal then
				Result.append(lower_out + ".." + upper_out)
			else
				Result.append(lower_out) 
			end
		end

invariant
	Limits_consistent: (not upper_unbounded and not lower_unbounded) implies (lower <= upper)

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
