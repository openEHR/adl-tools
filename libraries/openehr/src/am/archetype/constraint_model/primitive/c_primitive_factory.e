note
	component:   "openEHR ADL Tools"

	description: "[
			  Factory for C_SIMPLE types
			  ]"
	keywords:    "archetype, EHR"

	design:      "openEHR EHR Archetype Model 0.4"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2000-2004 The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


class C_PRIMITIVE_FACTORY

inherit
	ISO8601_FACTORY

feature -- Factory

	create_integer_interval_make_bounded (a_lower, an_upper: INTEGER; include_lower, include_upper: BOOLEAN): INTERVAL[INTEGER]
			-- create Result with both limits set
		require
			valid_order: a_lower <= an_upper
		do
			create Result.make_bounded (a_lower, an_upper, include_lower, include_upper)
		end

	create_integer_interval_make_lower_unbounded (an_upper: INTEGER; include_upper: BOOLEAN): INTERVAL[INTEGER]
			-- create Result from -infinity to `an_upper'
		do
			create Result.make_lower_unbounded (an_upper, include_upper)
		end

	create_integer_interval_make_upper_unbounded (a_lower: INTEGER; include_lower: BOOLEAN): INTERVAL[INTEGER]
			-- create Result from `a_lower' to +infinity
		do
			create Result.make_upper_unbounded (a_lower, include_lower)
		end

	create_integer_list: ARRAYED_LIST[INTEGER]
			-- create Result; useful for callers on the other side of dotNet interface etc
		do
			create Result.make(0)
		end

	create_real_list: ARRAYED_LIST[REAL]
			-- create Result; useful for callers on the other side of dotNet interface etc
		do
			create Result.make(0)
		end

	create_real_interval_make_bounded (a_lower, an_upper: REAL; include_lower, include_upper: BOOLEAN): INTERVAL[REAL]
			-- create Result with both limits set
		require
			valid_order: a_lower <= an_upper
		do
			create Result.make_bounded (a_lower, an_upper, include_lower, include_upper)
		end

	create_real_interval_make_lower_unbounded (an_upper: REAL; include_upper: BOOLEAN): INTERVAL[REAL]
			-- create Result from -infinity to `an_upper'
		do
			create Result.make_lower_unbounded (an_upper, include_upper)
		end

	create_real_interval_make_upper_unbounded (a_lower: REAL; include_lower: BOOLEAN): INTERVAL[REAL]
			-- create Result from `a_lower' to +infinity
		do
			create Result.make_upper_unbounded (a_lower, include_lower)
		end

	create_c_integer_make_bounded (a_lower, an_upper: INTEGER; include_lower, include_upper: BOOLEAN): C_INTEGER
			-- create Result with both limits set
		require
			valid_order: a_lower <= an_upper
		do
			create Result.make_range(create {INTERVAL[INTEGER]}.make_bounded (a_lower, an_upper, include_lower, include_upper))
		end

	create_c_integer_make_lower_unbounded (an_upper: INTEGER; include_upper: BOOLEAN): C_INTEGER
			-- create Result from -infinity to `an_upper'
		do
			create Result.make_range(create {INTERVAL[INTEGER]}.make_lower_unbounded (an_upper, include_upper))
		end

	create_c_integer_make_upper_unbounded (a_lower: INTEGER; include_lower: BOOLEAN): C_INTEGER
			-- create Result from `a_lower' to +infinity
		do
			create Result.make_range(create {INTERVAL[INTEGER]}.make_upper_unbounded (a_lower, include_lower))
		end

	create_c_integer_make_list (a_list: LIST[INTEGER]): C_INTEGER
			-- create Result using a_ist
		do
			create Result.make_list(a_list)
		end

	create_c_real_make_bounded (a_lower, an_upper: REAL; include_lower, include_upper: BOOLEAN): C_REAL
			-- create Result with both limits set
		require
			valid_order: a_lower <= an_upper
		do
			create Result.make_range(create {INTERVAL[REAL]}.make_bounded (a_lower, an_upper, include_lower, include_upper))
		end

	create_c_real_make_lower_unbounded (an_upper: REAL; include_upper: BOOLEAN): C_REAL
			-- create Result from -infinity to `an_upper'
		do
			create Result.make_range(create {INTERVAL[REAL]}.make_lower_unbounded (an_upper, include_upper))
		end

	create_c_real_make_upper_unbounded (a_lower: REAL; include_lower: BOOLEAN): C_REAL
			-- create Result from `a_lower' to +infinity
		do
			create Result.make_range(create {INTERVAL[REAL]}.make_upper_unbounded (a_lower, include_lower))
		end

	create_c_real_make_list (a_list: LIST[REAL]): C_REAL
			-- create Result using a_ist
		do
			create Result.make_list(a_list)
		end

	create_c_boolean_make_true: C_BOOLEAN
			-- create Result allowing True only
		do
			create Result.make_true
		end

	create_c_boolean_make_false: C_BOOLEAN
			-- create Result allowing False only
		do
			create Result.make_false
		end

	create_c_boolean_make_true_false: C_BOOLEAN
			-- create Result allowing True and False
		do
			create Result.make_true_false
		end

	create_c_string_make_any: C_STRING
			-- create Result completely open
		do
			create Result.make_any
		end

	create_c_string_make_from_string (str: STRING): C_STRING
			-- create Result from a single string
		require
			str /= void
		do
			create Result.make_from_string(str)
		ensure
			not Result.is_open
		end

	create_c_string_make_from_regexp (str: STRING): C_STRING
			-- create Result from a regular expression; don't include delimiters (normally //)
		require
			str /= void
		do
			create Result.make_from_regexp(str, True)
		end

	create_c_string_make_from_string_list (lst: LIST [STRING]): C_STRING
			-- create Result from a list of strings
		require
			lst /= void
		do
			create Result.make_from_string_list (lst)
		ensure
			not Result.is_open
		end

	create_c_date_make_bounded (a_lower, an_upper: STRING): C_DATE
			-- create Result with both limits set from ISO8601 strings
		require
			lower_exists: a_lower /= void and then valid_iso8601_date(a_lower)
			upper_exists: an_upper /= void and then valid_iso8601_date(an_upper)
			valid_order: iso8601_string_to_date(a_lower) <= iso8601_string_to_date(an_upper)
		do
			create Result.make_string_range(a_lower, an_upper)
		end

	create_c_date_make_lower_unbounded (an_upper: STRING): C_DATE
			-- create Result from -infinity to `an_upper' in ISO8601 string form
		require
			upper_exists: an_upper /= void and then valid_iso8601_date(an_upper)
		do
			create Result.make_string_range(Void, an_upper)
		end

	create_c_date_make_upper_unbounded (a_lower: STRING): C_DATE
			-- create Result from `a_lower' in ISO8601 string form, to +infinity
		require
			lower_exists: a_lower /= void and then valid_iso8601_date(a_lower)
		do
			create Result.make_string_range(a_lower, Void)
		end

	create_c_date_make_unbounded: C_DATE
			-- create Result as unbounded interval
		do
			create Result.make_string_range(Void, Void)
		end

	create_c_date_make_pattern (a_pattern: STRING): C_DATE
			-- create Result from an ISO8601-based pattern like "yyyy-mm-??"
		require
			pattern_exists: a_pattern /= void and then valid_iso8601_date_constraint_pattern(a_pattern)
		do
			create Result.make_from_pattern(a_pattern)
		end

	create_c_date_time_make_bounded (a_lower, an_upper: STRING): C_DATE_TIME
			-- create Result with both limits set from ISO8601 strings
		require
			lower_exists: a_lower /= void and then valid_iso8601_date_time(a_lower)
			upper_exists: an_upper /= void and then valid_iso8601_date_time(an_upper)
			valid_order: iso8601_string_to_date_time(a_lower) <= iso8601_string_to_date_time(an_upper)
		do
			create Result.make_string_range(a_lower, an_upper)
		end

	create_c_date_time_make_lower_unbounded (an_upper: STRING): C_DATE_TIME
			-- create Result from -infinity to `an_upper' in ISO8601 string form
		require
			upper_exists: an_upper /= void and then valid_iso8601_date_time(an_upper)
		do
			create Result.make_string_range(Void, an_upper)
		end

	create_c_date_time_make_upper_unbounded (a_lower: STRING): C_DATE_TIME
			-- create Result from `a_lower' in ISO8601 string form, to +infinity
		require
			lower_exists: a_lower /= void and then valid_iso8601_date_time(a_lower)
		do
			create Result.make_string_range(a_lower, Void)
		end

	create_c_date_time_make_unbounded: C_DATE_TIME
			-- create Result as unbounded interval
		do
			create Result.make_string_range(Void, Void)
		end

	create_c_date_time_make_pattern (a_pattern: STRING): C_DATE_TIME
			-- create Result from an ISO8601-based pattern like "yyyy-mm-dd hh:??:XX"
		require
			pattern_exists: a_pattern /= void and then valid_iso8601_date_time_constraint_pattern(a_pattern)
		do
			create Result.make_from_pattern(a_pattern)
		end

	create_c_time_make_bounded (a_lower, an_upper: STRING): C_TIME
			-- create Result with both limits set from ISO8601 strings
		require
			lower_exists: a_lower /= void and then valid_iso8601_time(a_lower)
			upper_exists: an_upper /= void and then valid_iso8601_time(an_upper)
			valid_order: iso8601_string_to_time(a_lower) <= iso8601_string_to_time(an_upper)
		do
			create Result.make_string_range(a_lower, an_upper)
		end

	create_c_time_make_lower_unbounded (an_upper: STRING): C_TIME
			-- create Result from -infinity to `an_upper' in ISO8601 string form
		require
			upper_exists: an_upper /= void and then valid_iso8601_time(an_upper)
		do
			create Result.make_string_range(Void, an_upper)
		end

	create_c_time_make_upper_unbounded (a_lower: STRING): C_TIME
			-- create Result from `a_lower' in ISO8601 string form, to +infinity
		require
			lower_valid: attached a_lower as l and then valid_iso8601_time (l)
		do
			create Result.make_string_range (a_lower, Void)
		end

	create_c_time_make_unbounded: C_TIME
			-- create Result as unbounded interval
		do
			create Result.make_string_range(Void, Void)
		end

	create_c_time_make_pattern (a_pattern: STRING): C_TIME
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


