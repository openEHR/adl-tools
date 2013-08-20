note
	component:   "openEHR ADL Tools"
	description: "Factory for C_PRIMITIVE types"
	keywords:    "archetype, EHR"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2000- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class C_PRIMITIVE_FACTORY

inherit
	ISO8601_FACTORY

	SHARED_ADL_APP_RESOURCES

feature -- Access

	errors: ERROR_ACCUMULATOR
		once
			create Result.make
		end

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
			create Result.make_range (create {INTERVAL[REAL]}.make_lower_unbounded (an_upper, include_upper))
		end

	create_c_real_make_upper_unbounded (a_lower: REAL; include_lower: BOOLEAN): C_REAL
			-- create Result from `a_lower' to +infinity
		do
			create Result.make_range (create {INTERVAL[REAL]}.make_upper_unbounded (a_lower, include_lower))
		end

	create_c_real_make_list (a_list: LIST[REAL]): C_REAL
			-- create Result using a_ist
		do
			create Result.make_list (a_list)
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
		do
			create Result.make_from_string(str)
		ensure
			not Result.is_open
		end

	create_c_string_make_from_regexp (str: STRING): C_STRING
			-- create Result from a regular expression; don't include delimiters (normally //)
		do
			create Result.make_from_regexp(str, True)
		end

	create_c_string_make_from_string_list (lst: LIST [STRING]): C_STRING
			-- create Result from a list of strings
		do
			create Result.make_from_string_list (lst)
		ensure
			not Result.is_open
		end

	create_c_date_make_bounded (a_lower, an_upper: STRING): C_DATE
			-- create Result with both limits set from ISO8601 strings
		require
			lower_valid: valid_iso8601_date(a_lower)
			upper_valid: valid_iso8601_date(an_upper)
			valid_order: iso8601_string_to_date(a_lower) <= iso8601_string_to_date(an_upper)
		do
			create Result.make_string_range(a_lower, an_upper)
		end

	create_c_date_make_lower_unbounded (an_upper: STRING): C_DATE
			-- create Result from -infinity to `an_upper' in ISO8601 string form
		require
			upper_valid: valid_iso8601_date(an_upper)
		do
			create Result.make_string_range(Void, an_upper)
		end

	create_c_date_make_upper_unbounded (a_lower: STRING): C_DATE
			-- create Result from `a_lower' in ISO8601 string form, to +infinity
		require
			lower_valid: valid_iso8601_date(a_lower)
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
			pattern_valid: valid_iso8601_date_constraint_pattern(a_pattern)
		do
			create Result.make_from_pattern(a_pattern)
		end

	create_c_date_time_make_bounded (a_lower, an_upper: STRING): C_DATE_TIME
			-- create Result with both limits set from ISO8601 strings
		require
			lower_valid: valid_iso8601_date_time (a_lower)
			upper_valid: valid_iso8601_date_time (an_upper)
			valid_order: iso8601_string_to_date_time(a_lower) <= iso8601_string_to_date_time(an_upper)
		do
			create Result.make_string_range(a_lower, an_upper)
		end

	create_c_date_time_make_lower_unbounded (an_upper: STRING): C_DATE_TIME
			-- create Result from -infinity to `an_upper' in ISO8601 string form
		require
			upper_valid: valid_iso8601_date_time(an_upper)
		do
			create Result.make_string_range(Void, an_upper)
		end

	create_c_date_time_make_upper_unbounded (a_lower: STRING): C_DATE_TIME
			-- create Result from `a_lower' in ISO8601 string form, to +infinity
		require
			lower_valid: valid_iso8601_date_time(a_lower)
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
			pattern_valid: valid_iso8601_date_time_constraint_pattern (a_pattern)
		do
			create Result.make_from_pattern (a_pattern)
		end

	create_c_time_make_bounded (a_lower, an_upper: STRING): C_TIME
			-- create Result with both limits set from ISO8601 strings
		require
			lower_valid: valid_iso8601_time (a_lower)
			upper_valid: valid_iso8601_time (an_upper)
			valid_order: iso8601_string_to_time (a_lower) <= iso8601_string_to_time(an_upper)
		do
			create Result.make_string_range(a_lower, an_upper)
		end

	create_c_time_make_lower_unbounded (an_upper: STRING): C_TIME
			-- create Result from -infinity to `an_upper' in ISO8601 string form
		require
			upper_valid: valid_iso8601_time (an_upper)
		do
			create Result.make_string_range (Void, an_upper)
		end

	create_c_time_make_upper_unbounded (a_lower: STRING): C_TIME
			-- create Result from `a_lower' in ISO8601 string form, to +infinity
		require
			lower_valid: valid_iso8601_time (a_lower)
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
			pattern_valid: valid_iso8601_time_constraint_pattern(a_pattern)
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

	create_c_duration_make_from_pattern (a_pattern: STRING): C_DURATION
			-- A duration constraint, made from an ISO8601-based pattern and an interval with both limits set from ISO8601 strings.
		require
			valid_pattern: valid_iso8601_duration_constraint_pattern (a_pattern)
		do
			create Result.make_from_pattern (a_pattern)
		ensure
			pattern_set: Result.pattern = a_pattern
		end

	c_primitive_types: ARRAYED_SET [STRING]
			-- a set of
		once
			create Result.make (0)
			Result.compare_objects
			Result.merge (c_primitive_defaults.current_keys)
		end

	c_primitive_defaults: HASH_TABLE [FUNCTION [ANY, TUPLE, C_PRIMITIVE_OBJECT], STRING]
			-- a set of C_PRIMTIVE default creator agents, keyed by their type name
		once
			create Result.make (0)

			Result.put (agent create_c_string_make_from_regexp (".+"), bare_type_name (({C_STRING}).name))
			Result.put (agent create_c_boolean_make_true_false, bare_type_name (({C_BOOLEAN}).name))

			Result.put (agent create_c_integer_make_bounded (0, 1, True, True), bare_type_name (({C_INTEGER}).name))
			Result.put (agent create_c_real_make_bounded (0.0, 1.0, True, True), bare_type_name (({C_REAL}).name))
			Result.put (agent create_c_real_make_bounded (0.0, 1.0, True, True), bare_type_name ("C_DOUBLE"))

			Result.put (agent create_c_duration_make_from_pattern ("P1Y"), bare_type_name (({C_DURATION}).name))
			Result.put (agent create_c_date_time_make_lower_unbounded ("2000-01-01T12:00:00"), bare_type_name (({C_DATE_TIME}).name))
			Result.put (agent create_c_time_make_lower_unbounded ("12:00:00"), bare_type_name (({C_TIME}).name))
			Result.put (agent create_c_date_make_lower_unbounded ("2000-01-01"), bare_type_name (({C_DATE}).name))

			Result.put (agent create_c_terminology_code ("local::at0001"), bare_type_name (({C_TERMINOLOGY_CODE}).name))
		end

	create_default_c_primitive (rm_type: STRING): C_PRIMITIVE_OBJECT
		require
			c_primitive_types.has ("C_" + rm_type)
		do
			check attached c_primitive_defaults.item ("C_" + rm_type) as p_agt then
				Result := p_agt.item ([])
			end
		end

	valid_c_terminology_code_string (a_string: STRING): BOOLEAN
			-- Verify that the string of form "terminology_id::[code, code, ... [; code]]" is valid
		require
			String_valid: not a_string.is_empty
		local
			sep_pos, end_pos: INTEGER
			str, code_str: STRING
			assumed_code: detachable STRING
			codes: LIST[STRING]
			code_set: ARRAYED_SET[STRING]
		do
			errors.wipe_out
			str := a_string.twin
			str.prune_all (' ')
			str.prune_all ('%T')
			sep_pos := str.substring_index (Terminology_separator, 1)
			if sep_pos > 1 then
				-- get the part after the terminology_id
				end_pos := str.index_of (';', sep_pos)-1
				if end_pos < 0 then
					end_pos := str.count
				else
					assumed_code := str.substring (end_pos+2, str.count)
				end
				if end_pos > sep_pos + Terminology_separator.count then
					code_str := str.substring (sep_pos + Terminology_separator.count, end_pos)
					codes := code_str.split (',')
					create code_set.make (0)
					code_set.compare_objects
					across codes as codes_csr loop
						code_set.extend (codes_csr.item)
					end
					if code_set.count /= codes.count then
						errors.add_error (ec_STCDC, <<>>, "valid_c_terminology_code_string")
					elseif attached assumed_code as ac and then not code_set.has (ac) then
						errors.add_error (ec_STCAC, <<ac>>, "valid_c_terminology_code_string")
					end
				end
			else
				errors.add_error (ec_STCNT, <<>>, "valid_c_terminology_code_string")
			end

			Result := not errors.has_errors
		end

	create_c_terminology_code (a_string: STRING): C_TERMINOLOGY_CODE
			-- Make from string of form "terminology_id::code, code, ... [; code]".
			-- String "terminology_id::" is legal.
		require
			valid_c_terminology_code_string (a_string)
		local
			sep_pos, end_pos: INTEGER
			str: STRING
			code_list: detachable LINKED_SET [STRING]
			terminology_id: STRING
			assumed_value: detachable STRING
		do
			str := a_string.twin
			str.prune_all (' ')
			str.prune_all ('%T')
			sep_pos := str.substring_index (Terminology_separator, 1)
			terminology_id := str.substring (1, sep_pos-1)

			end_pos := str.index_of (';', sep_pos)-1
			if end_pos < 0 then
				end_pos := str.count
			else
				assumed_value := str.substring (end_pos+2, str.count)
			end
			if end_pos > sep_pos + Terminology_separator.count then
				create code_list.make
				code_list.compare_objects
				code_list.append (str.substring (sep_pos + Terminology_separator.count, end_pos).split (','))
			end

			if attached code_list as att_code_list then
				create Result.make_from_codes (terminology_id, att_code_list)
			else
				create Result.make (terminology_id)
			end
			if attached assumed_value then
				Result.set_assumed_value_from_code (assumed_value)
			end
		ensure
			not Result.any_allowed
		end

end


