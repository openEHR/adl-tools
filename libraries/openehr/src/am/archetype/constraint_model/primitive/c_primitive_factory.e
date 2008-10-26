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
	ISO8601_FACTORY

feature -- Factory

	create_integer_interval_make_bounded (a_lower, an_upper: INTEGER; include_lower, include_upper: BOOLEAN): INTERVAL[INTEGER] is
			-- create Result with both limits set
		require
			valid_order: a_lower <= an_upper
		do
			create Result.make_bounded(a_lower, an_upper, include_lower, include_upper)
		end

	create_integer_interval_make_lower_unbounded (an_upper: INTEGER; include_upper: BOOLEAN): INTERVAL[INTEGER] is
			-- create Result from -infinity to `an_upper'
		do
			create Result.make_lower_unbounded(an_upper, include_upper)
		end

	create_integer_interval_make_upper_unbounded (a_lower: INTEGER; include_lower: BOOLEAN): INTERVAL[INTEGER] is
			-- create Result from `a_lower' to +infinity
		do
			create Result.make_upper_unbounded(a_lower, include_lower)
		end

	create_integer_list: ARRAYED_LIST[INTEGER] is
			-- create Result; useful for callers on the other side of dotNet interface etc
		do
			create Result.make(0)
		end

	create_real_list: ARRAYED_LIST[REAL] is
			-- create Result; useful for callers on the other side of dotNet interface etc
		do
			create Result.make(0)
		end

	create_real_interval_make_bounded (a_lower, an_upper: REAL; include_lower, include_upper: BOOLEAN): INTERVAL[REAL] is
			-- create Result with both limits set
		require
			valid_order: a_lower <= an_upper
		do
			create Result.make_bounded(a_lower, an_upper, include_lower, include_upper)
		end

	create_real_interval_make_lower_unbounded (an_upper: REAL; include_upper: BOOLEAN): INTERVAL[REAL] is
			-- create Result from -infinity to `an_upper'
		do
			create Result.make_lower_unbounded(an_upper, include_upper)
		end

	create_real_interval_make_upper_unbounded (a_lower: REAL; include_lower: BOOLEAN): INTERVAL[REAL] is
			-- create Result from `a_lower' to +infinity
		do
			create Result.make_upper_unbounded(a_lower, include_lower)
		end

	create_c_integer_make_bounded (a_lower, an_upper: INTEGER; include_lower, include_upper: BOOLEAN): C_INTEGER is
			-- create Result with both limits set
		require
			valid_order: a_lower <= an_upper
		do
			create Result.make_range(create {INTERVAL[INTEGER]}.make_bounded(a_lower, an_upper, include_lower, include_upper))
		end

	create_c_integer_make_lower_unbounded (an_upper: INTEGER; include_upper: BOOLEAN): C_INTEGER is
			-- create Result from -infinity to `an_upper'
		do
			create Result.make_range(create {INTERVAL[INTEGER]}.make_lower_unbounded(an_upper, include_upper))
		end

	create_c_integer_make_upper_unbounded (a_lower: INTEGER; include_lower: BOOLEAN): C_INTEGER is
			-- create Result from `a_lower' to +infinity
		do
			create Result.make_range(create {INTERVAL[INTEGER]}.make_upper_unbounded(a_lower, include_lower))
		end

	create_c_integer_make_list (a_list: LIST[INTEGER]): C_INTEGER is
			-- create Result using a_ist
		do
			create Result.make_list(a_list)
		end

	create_c_real_make_bounded (a_lower, an_upper: REAL; include_lower, include_upper: BOOLEAN): C_REAL is
			-- create Result with both limits set
		require
			valid_order: a_lower <= an_upper
		do
			create Result.make_range(create {INTERVAL[REAL]}.make_bounded(a_lower, an_upper, include_lower, include_upper))
		end

	create_c_real_make_lower_unbounded (an_upper: REAL; include_upper: BOOLEAN): C_REAL is
			-- create Result from -infinity to `an_upper'
		do
			create Result.make_range(create {INTERVAL[REAL]}.make_lower_unbounded(an_upper, include_upper))
		end

	create_c_real_make_upper_unbounded (a_lower: REAL; include_lower: BOOLEAN): C_REAL is
			-- create Result from `a_lower' to +infinity
		do
			create Result.make_range(create {INTERVAL[REAL]}.make_upper_unbounded(a_lower, include_lower))
		end

	create_c_real_make_list (a_list: LIST[REAL]): C_REAL is
			-- create Result using a_ist
		do
			create Result.make_list(a_list)
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

	create_c_string_make_any: C_STRING is
			-- create Result completely open
		do
			create Result.make_any
		end

	create_c_string_make_from_string (str: STRING): C_STRING is
			-- create Result from a single string
		require
			str /= void
		do
			create Result.make_from_string(str)
		ensure
			not Result.is_open
		end

	create_c_string_make_from_regexp (str: STRING): C_STRING is
			-- create Result from a regular expression; don't include delimiters (normally //)
		require
			str /= void
		do
			create Result.make_from_regexp(str, True)
		end

	create_c_string_make_from_string_list (lst: LIST [STRING]): C_STRING is
			-- create Result from a list of strings
		require
			lst /= void
		do
			create Result.make_from_string_list (lst)
		ensure
			not Result.is_open
		end

	create_c_date_make_bounded (a_lower, an_upper: STRING): C_DATE is
			-- create Result with both limits set from ISO8601 strings
		require
			lower_exists: a_lower /= void and then valid_iso8601_date(a_lower)
			upper_exists: an_upper /= void and then valid_iso8601_date(an_upper)
			valid_order: iso8601_string_to_date(a_lower) <= iso8601_string_to_date(an_upper)
		do
			create Result.make_string_range(a_lower, an_upper)
		end

	create_c_date_make_lower_unbounded (an_upper: STRING): C_DATE is
			-- create Result from -infinity to `an_upper' in ISO8601 string form
		require
			upper_exists: an_upper /= void and then valid_iso8601_date(an_upper)
		do
			create Result.make_string_range(Void, an_upper)
		end

	create_c_date_make_upper_unbounded (a_lower: STRING): C_DATE is
			-- create Result from `a_lower' in ISO8601 string form, to +infinity
		require
			lower_exists: a_lower /= void and then valid_iso8601_date(a_lower)
		do
			create Result.make_string_range(a_lower, Void)
		end

	create_c_date_make_unbounded: C_DATE is
			-- create Result as unbounded interval
		do
			create Result.make_string_range(Void, Void)
		end

	create_c_date_make_pattern (a_pattern: STRING): C_DATE is
			-- create Result from an ISO8601-based pattern like "yyyy-mm-??"
		require
			pattern_exists: a_pattern /= void and then valid_iso8601_date_constraint_pattern(a_pattern)
		do
			create Result.make_from_pattern(a_pattern)
		end

	create_c_date_time_make_bounded (a_lower, an_upper: STRING): C_DATE_TIME is
			-- create Result with both limits set from ISO8601 strings
		require
			lower_exists: a_lower /= void and then valid_iso8601_date_time(a_lower)
			upper_exists: an_upper /= void and then valid_iso8601_date_time(an_upper)
			valid_order: iso8601_string_to_date_time(a_lower) <= iso8601_string_to_date_time(an_upper)
		do
			create Result.make_string_range(a_lower, an_upper)
		end

	create_c_date_time_make_lower_unbounded (an_upper: STRING): C_DATE_TIME is
			-- create Result from -infinity to `an_upper' in ISO8601 string form
		require
			upper_exists: an_upper /= void and then valid_iso8601_date_time(an_upper)
		do
			create Result.make_string_range(Void, an_upper)
		end

	create_c_date_time_make_upper_unbounded (a_lower: STRING): C_DATE_TIME is
			-- create Result from `a_lower' in ISO8601 string form, to +infinity
		require
			lower_exists: a_lower /= void and then valid_iso8601_date_time(a_lower)
		do
			create Result.make_string_range(a_lower, Void)
		end

	create_c_date_time_make_unbounded: C_DATE_TIME is
			-- create Result as unbounded interval
		do
			create Result.make_string_range(Void, Void)
		end

	create_c_date_time_make_pattern (a_pattern: STRING): C_DATE_TIME is
			-- create Result from an ISO8601-based pattern like "yyyy-mm-dd hh:??:XX"
		require
			pattern_exists: a_pattern /= void and then valid_iso8601_date_time_constraint_pattern(a_pattern)
		do
			create Result.make_from_pattern(a_pattern)
		end

	create_c_time_make_bounded (a_lower, an_upper: STRING): C_TIME is
			-- create Result with both limits set from ISO8601 strings
		require
			lower_exists: a_lower /= void and then valid_iso8601_time(a_lower)
			upper_exists: an_upper /= void and then valid_iso8601_time(an_upper)
			valid_order: iso8601_string_to_time(a_lower) <= iso8601_string_to_time(an_upper)
		do
			create Result.make_string_interval(a_lower, an_upper)
		end

	create_c_time_make_lower_unbounded (an_upper: STRING): C_TIME is
			-- create Result from -infinity to `an_upper' in ISO8601 string form
		require
			upper_exists: an_upper /= void and then valid_iso8601_time(an_upper)
		do
			create Result.make_string_interval(Void, an_upper)
		end

	create_c_time_make_upper_unbounded (a_lower: STRING): C_TIME is
			-- create Result from `a_lower' in ISO8601 string form, to +infinity
		require
			lower_exists: a_lower /= void and then valid_iso8601_time(a_lower)
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
			pattern_exists: a_pattern /= void and then valid_iso8601_time_constraint_pattern(a_pattern)
		do
			create Result.make_from_pattern(a_pattern)
		end

	create_c_duration_make (a_pattern, a_lower, an_upper: STRING; include_lower, include_upper: BOOLEAN): C_DURATION
			-- A duration constraint, made from an ISO8601-based pattern and an interval with both limits set from ISO8601 strings.
		require
			not_all_void: a_pattern /= Void or a_lower /= Void or an_upper /= Void
			valid_pattern: a_pattern /= Void implies valid_iso8601_duration_constraint_pattern (a_pattern)
			valid_lower: a_lower /= void implies valid_iso8601_duration (a_lower)
			valid_upper: an_upper /= void implies valid_iso8601_duration (an_upper)
			valid_order: (a_lower /= Void and an_upper /= Void) implies iso8601_string_to_duration (a_lower) <= iso8601_string_to_duration (an_upper)
		do
			create Result.make (a_pattern, a_lower, an_upper, include_lower, include_upper)
		ensure
			pattern_set: Result.pattern = a_pattern
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
