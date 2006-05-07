indexing
	component:   "openEHR EHR Archetype Model"

	description: "[
			  Factory for C_SIMPLE types
			  ]"
	keywords:    "archetype, EHR"

	design:      "openEHR EHR Archetype Model 0.4"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2000-2004 The openEHR Foundation <http://www.openEHR.org>"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class C_PRIMITIVE_FACTORY

inherit
	DATE_TIME_ROUTINES
		export
			{NONE} all;
			{ANY} is_valid_iso8601_date, is_valid_iso8601_time, 
					is_valid_iso8601_date_time, is_valid_iso8601_duration,
					iso8601_string_to_date, iso8601_string_to_date_time, iso8601_string_to_time,
					iso8601_string_to_duration,
					is_valid_iso8601_date_constraint_pattern, is_valid_iso8601_time_constraint_pattern, 
					is_valid_iso8601_date_time_constraint_pattern
		end
	
feature -- Factory

	create_integer_interval_make_bounded (a_lower, an_upper: INTEGER; include_lower, include_upper: BOOLEAN): OE_INTERVAL[INTEGER] is
			-- create Result with both limits set
		require
			valid_order: a_lower <= an_upper
		do
			create Result.make_bounded(a_lower, an_upper, include_lower, include_upper)
		end

	create_integer_interval_make_lower_unbounded (an_upper: INTEGER; include_upper: BOOLEAN): OE_INTERVAL[INTEGER] is
			-- create Result from -infinity to `an_upper'
		do
			create Result.make_lower_unbounded(an_upper, include_upper)
		end

	create_integer_interval_make_upper_unbounded (a_lower: INTEGER; include_lower: BOOLEAN): OE_INTERVAL[INTEGER] is
			-- create Result from `a_lower' to +infinity
		do
			create Result.make_upper_unbounded(a_lower, include_lower)
		end

	create_real_interval_make_bounded (a_lower, an_upper: REAL; include_lower, include_upper: BOOLEAN): OE_INTERVAL[REAL] is
			-- create Result with both limits set
		require
			valid_order: a_lower <= an_upper
		do
			create Result.make_bounded(a_lower, an_upper, include_lower, include_upper)
		end

	create_real_interval_make_lower_unbounded (an_upper: REAL; include_upper: BOOLEAN): OE_INTERVAL[REAL] is
			-- create Result from -infinity to `an_upper'
		do
			create Result.make_lower_unbounded(an_upper, include_upper)
		end

	create_real_interval_make_upper_unbounded (a_lower: REAL; include_lower: BOOLEAN): OE_INTERVAL[REAL] is
			-- create Result from `a_lower' to +infinity
		do
			create Result.make_upper_unbounded(a_lower, include_lower)
		end

	create_c_integer_make_bounded (a_lower, an_upper: INTEGER; include_lower, include_upper: BOOLEAN): C_INTEGER is
			-- create Result with both limits set
		require
			valid_order: a_lower <= an_upper
		do
			create Result.make_interval(create {OE_INTERVAL[INTEGER]}.make_bounded(a_lower, an_upper, include_lower, include_upper))
		end

	create_c_integer_make_lower_unbounded (an_upper: INTEGER; include_upper: BOOLEAN): C_INTEGER is
			-- create Result from -infinity to `an_upper'
		do
			create Result.make_interval(create {OE_INTERVAL[INTEGER]}.make_lower_unbounded(an_upper, include_upper))
		end

	create_c_integer_make_upper_unbounded (a_lower: INTEGER; include_lower: BOOLEAN): C_INTEGER is
			-- create Result from `a_lower' to +infinity
		do
			create Result.make_interval(create {OE_INTERVAL[INTEGER]}.make_upper_unbounded(a_lower, include_lower))
		end

	create_c_real_make_bounded (a_lower, an_upper: REAL; include_lower, include_upper: BOOLEAN): C_REAL is
			-- create Result with both limits set
		require
			valid_order: a_lower <= an_upper
		do
			create Result.make_interval(create {OE_INTERVAL[REAL]}.make_bounded(a_lower, an_upper, include_lower, include_upper))
		end

	create_c_real_make_lower_unbounded (an_upper: REAL; include_upper: BOOLEAN): C_REAL is
			-- create Result from -infinity to `an_upper'
		do
			create Result.make_interval(create {OE_INTERVAL[REAL]}.make_lower_unbounded(an_upper, include_upper))
		end

	create_c_real_make_upper_unbounded (a_lower: REAL; include_lower: BOOLEAN): C_REAL is
			-- create Result from `a_lower' to +infinity
		do
			create Result.make_interval(create {OE_INTERVAL[REAL]}.make_upper_unbounded(a_lower, include_lower))
		end

	create_c_boolean_make_true: C_BOOLEAN is
			-- create Result allowing True only
		do
			create Result.make_true
		end

	create_c_boolean_make_false: C_BOOLEAN is
			-- create Result allowing False only
		do
			create Result.make_false
		end

	create_c_boolean_make_true_false: C_BOOLEAN is
			-- create Result allowing True and False
		do
			create Result.make_true_false
		end
	
	create_c_string_make_any: OE_C_STRING is
			-- create Result completely open
		do
			create Result.make_any
		end

	create_c_string_make_from_string (str: STRING): OE_C_STRING is
			-- create Result from a single string
		require
			str /= void
		do
			create Result.make_from_string(str)
		ensure
			not Result.is_open
		end

	create_c_string_make_from_regexp (str: STRING): OE_C_STRING is
			-- create Result from a regular expression
		require
			str /= void
		do
			create Result.make_from_regexp(str, True)
		end

	create_c_string_make_from_string_list (lst: LIST [STRING]): OE_C_STRING is
			-- create Result from a list of strings
		require
			lst /= void
		do
			create Result.make_from_string_list (lst)
		ensure
			not Result.is_open
		end
	
	create_c_date_make_bounded (a_lower, an_upper: STRING): OE_C_DATE is
			-- create Result with both limits set from ISO8601 strings
		require
			lower_exists: a_lower /= void and then is_valid_iso8601_date(a_lower)
			upper_exists: an_upper /= void and then is_valid_iso8601_date(an_upper)
			valid_order: iso8601_string_to_date(a_lower) <= iso8601_string_to_date(an_upper)
		do
			create Result.make_string_interval(a_lower, an_upper)
		end

	create_c_date_make_lower_unbounded (an_upper: STRING): OE_C_DATE is
			-- create Result from -infinity to `an_upper' in ISO8601 string form
		require
			upper_exists: an_upper /= void and then is_valid_iso8601_date(an_upper)
		do
			create Result.make_string_interval(Void, an_upper)
		end

	create_c_date_make_upper_unbounded (a_lower: STRING): OE_C_DATE is
			-- create Result from `a_lower' in ISO8601 string form, to +infinity
		require
			lower_exists: a_lower /= void and then is_valid_iso8601_date(a_lower)
		do
			create Result.make_string_interval(a_lower, Void)
		end

	create_c_date_make_unbounded: OE_C_DATE is
			-- create Result as unbounded interval
		do
			create Result.make_string_interval(Void, Void)
		end

	create_c_date_make_pattern (a_pattern: STRING): OE_C_DATE is
			-- create Result from an ISO8601-based pattern like "yyyy-mm-??"
		require
			pattern_exists: a_pattern /= void and then is_valid_iso8601_date_constraint_pattern(a_pattern)
		do
			create Result.make_from_pattern(a_pattern)
		end

	create_c_date_time_make_bounded (a_lower, an_upper: STRING): C_DATE_TIME is
			-- create Result with both limits set from ISO8601 strings
		require
			lower_exists: a_lower /= void and then is_valid_iso8601_date_time(a_lower)
			upper_exists: an_upper /= void and then is_valid_iso8601_date_time(an_upper)
			valid_order: iso8601_string_to_date_time(a_lower) <= iso8601_string_to_date_time(an_upper)
		do
			create Result.make_string_interval(a_lower, an_upper)
		end

	create_c_date_time_make_lower_unbounded (an_upper: STRING): C_DATE_TIME is
			-- create Result from -infinity to `an_upper' in ISO8601 string form
		require
			upper_exists: an_upper /= void and then is_valid_iso8601_date_time(an_upper)
		do
			create Result.make_string_interval(Void, an_upper)
		end

	create_c_date_time_make_upper_unbounded (a_lower: STRING): C_DATE_TIME is
			-- create Result from `a_lower' in ISO8601 string form, to +infinity
		require
			lower_exists: a_lower /= void and then is_valid_iso8601_date_time(a_lower)
		do
			create Result.make_string_interval(a_lower, Void)
		end

	create_c_date_time_make_unbounded: C_DATE_TIME is
			-- create Result as unbounded interval
		do
			create Result.make_string_interval(Void, Void)
		end
	
	create_c_date_time_make_pattern (a_pattern: STRING): C_DATE_TIME is
			-- create Result from an ISO8601-based pattern like "yyyy-mm-dd hh:??:XX"
		require
			pattern_exists: a_pattern /= void and then is_valid_iso8601_date_time_constraint_pattern(a_pattern)
		do
			create Result.make_from_pattern(a_pattern)
		end

	create_c_time_make_bounded (a_lower, an_upper: STRING): C_TIME is
			-- create Result with both limits set from ISO8601 strings
		require
			lower_exists: a_lower /= void and then is_valid_iso8601_time(a_lower)
			upper_exists: an_upper /= void and then is_valid_iso8601_time(an_upper)
			valid_order: iso8601_string_to_time(a_lower) <= iso8601_string_to_time(an_upper)
		do
			create Result.make_string_interval(a_lower, an_upper)
		end

	create_c_time_make_lower_unbounded (an_upper: STRING): C_TIME is
			-- create Result from -infinity to `an_upper' in ISO8601 string form
		require
			upper_exists: an_upper /= void and then is_valid_iso8601_time(an_upper)
		do
			create Result.make_string_interval(Void, an_upper)
		end

	create_c_time_make_upper_unbounded (a_lower: STRING): C_TIME is
			-- create Result from `a_lower' in ISO8601 string form, to +infinity
		require
			lower_exists: a_lower /= void and then is_valid_iso8601_time(a_lower)
		do
			create Result.make_string_interval(a_lower, Void)
		end

	create_c_time_make_unbounded: C_TIME is
			-- create Result as unbounded interval
		do
			create Result.make_string_interval(Void, Void)
		end
	
	create_c_time_make_pattern (a_pattern: STRING): C_TIME is
			-- create Result from an ISO8601-based pattern like "hh:mm:??"
		require
			pattern_exists: a_pattern /= void and then is_valid_iso8601_time_constraint_pattern(a_pattern)
		do
			create Result.make_from_pattern(a_pattern)
		end

	create_c_duration_make_bounded (a_lower, an_upper: STRING; include_lower, include_upper: BOOLEAN): C_DURATION is
			-- create Result with both limits set from ISO8601 strings
		require
			lower_exists: a_lower /= void and then is_valid_iso8601_duration(a_lower)
			upper_exists: an_upper /= void and then is_valid_iso8601_duration(an_upper)
			valid_order: iso8601_string_to_duration(a_lower) <= iso8601_string_to_duration(an_upper)
		do
			create Result.make_string_interval(a_lower, an_upper, include_lower, include_upper)
		end

	create_c_duration_make_lower_unbounded (an_upper: STRING; include_upper: BOOLEAN): C_DURATION is
			-- create Result from -infinity to `an_upper' in ISO8601 string form
		require
			upper_exists: an_upper /= void and then is_valid_iso8601_duration(an_upper)
		do
			create Result.make_string_interval(Void, an_upper, False, include_upper)
		end

	create_c_duration_make_upper_unbounded (a_lower: STRING; include_lower: BOOLEAN): C_DURATION is
			-- create Result from `a_lower' in ISO8601 string form, to +infinity
		require
			lower_exists: a_lower /= void and then is_valid_iso8601_duration(a_lower)
		do
			create Result.make_string_interval(a_lower, Void, include_lower, False)
		end

	create_c_duration_make_unbounded: C_DURATION is
			-- create Result as unbounded interval
		do
			create Result.make_string_interval(Void, Void, False, False)
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
--| The Original Code is c_simple_factory.e.
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
