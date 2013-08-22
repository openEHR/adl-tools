note
	component:   "openEHR ADL Tools"
	description: "Constrainer type for instances of DURATION"
	keywords:    "archetype, date, data"
	design:      "openEHR Common Archetype Model 0.2"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2000- The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class C_DURATION

inherit
	C_PRIMITIVE_OBJECT
		redefine
			default_create
		end

	DATE_TIME_ROUTINES
		export
			{NONE} all
			{ANY} valid_iso8601_duration, iso8601_string_to_duration, valid_iso8601_duration_constraint_pattern
		undefine
			is_equal,
			default_create,
			out
		end

create
	make,
	make_range,
	make_from_pattern,
	make_pattern_with_range

feature {NONE} -- Initialisation

	default_create
		do
			rm_type_name := bare_type_name (({ISO8601_DURATION}).name)
		end

	make (a_pattern, a_lower_str, an_upper_str: detachable STRING; include_lower, include_upper: BOOLEAN)
			-- Create from an ISO8601-based pattern, together with two ISO8601 strings representing an interval.
			-- If either `a_lower' or `an_upper' is Void, the interval is open-ended;
			-- if they are the same, the interval is a single point.
			-- Boolean flags indicate whether to include limits in the range or not.
		require
			not_all_void: a_pattern /= Void or a_lower_str /= Void or an_upper_str /= Void
			valid_pattern: attached a_pattern as p implies valid_iso8601_duration_constraint_pattern (p)
			valid_lower: attached a_lower_str as l_str implies valid_iso8601_duration (l_str)
			valid_upper: attached an_upper_str as u_str implies valid_iso8601_duration (u_str)
			valid_order: (attached a_lower_str as l_str and attached an_upper_str as u_str) implies
				iso8601_string_to_comparable_duration (l_str) <= iso8601_string_to_comparable_duration (u_str)
		local
			lower_duration, upper_duration: detachable ISO8601_DURATION
		do
			default_create
			pattern := a_pattern

			if attached a_lower_str as lower_dur then
				create lower_duration.make_from_string (lower_dur)
			end

			if attached an_upper_str as upper_dur then
				create upper_duration.make_from_string (upper_dur)
			end

			if attached upper_duration as upper_dur and attached lower_duration as lower_dur then
				create range.make_bounded (lower_dur, upper_dur, include_lower, include_upper)
			elseif attached upper_duration as upper_dur then
				create range.make_lower_unbounded (upper_dur, include_upper)
			elseif attached lower_duration as lower_dur then
				create range.make_upper_unbounded (lower_dur, include_lower)
			end
		ensure
			pattern_set: pattern = a_pattern
			interval_if_lower_or_upper: (a_lower_str /= Void or an_upper_str /= Void) xor range = Void
		end

	make_range (an_interval: attached like range)
			-- Create from an ISO8601-based interval.
		do
			default_create
			range := an_interval
		ensure
			interval_set: range = an_interval
			pattern_void: pattern = Void
		end

	make_from_pattern (a_pattern: STRING)
			-- Create from an ISO8601-based pattern.
		require
			a_pattern_valid: valid_iso8601_duration_constraint_pattern (a_pattern)
		do
			default_create
			pattern := a_pattern
		ensure
			pattern_set: pattern = a_pattern
			interval_void: range = Void
		end

	make_pattern_with_range (a_pattern: STRING; an_interval: attached like range)
			-- Create from an ISO8601-based pattern, together with an ISO8601-based interval.
		require
			a_pattern_valid: valid_iso8601_duration_constraint_pattern (a_pattern)
		do
			default_create
			pattern := a_pattern
			range := an_interval
		ensure
			pattern_set: pattern = a_pattern
			interval_set: range = an_interval
		end

feature -- Access

	pattern: detachable STRING
			-- ISO8601-based pattern.
			-- Allowed patterns:
			-- P[Y|y][M|m][D|d][T[H|h][M|m][S|s]] or P[W|w]

	range: detachable INTERVAL [ISO8601_DURATION]
			-- ISO8601-based interval.

	prototype_value: ISO8601_DURATION
			-- Default duration value.
		do
			if attached range as rng then
				if attached rng.lower as l then
					Result := l
				elseif attached rng.upper as u then
					Result := u
				else
					create Result.default_create
				end
			else
				-- Result := FIXME - generate a default from a pattern
				create Result.default_create
			end
		end

feature -- Status Report

	valid_value (duration: ISO8601_DURATION): BOOLEAN
			-- Is `duration' within `range'?
		do
			if attached pattern then
				-- FIXME: TO BE IMPLEMENTED
				Result := True
			end

			Result := Result and (attached range as rng and then rng.has (duration))
		end

feature -- Output

	as_string: STRING
			-- Textual representation.
		do
			create Result.make_empty
			if attached pattern as pat then
				Result.append (pat)
			end
			if attached range as rng then
				if attached pattern then
					Result.append_character ('/')
				end
				Result.append ("|" + rng.as_string + "|")
			end
			if attached assumed_value as av then
				Result.append ("; " + av.as_string)
			end
		ensure then
			not_empty: not Result.is_empty
		end

feature {NONE} -- Implementation

	do_node_conforms_to (other: like Current): BOOLEAN
			-- True if this node constraint is a subset of `other'
		do
			Result := pattern_conforms_to (other) and range_conforms_to (other)
		end

	pattern_conforms_to (other: like Current): BOOLEAN
			-- True if the pattern of this node is or narrower than that in `other'
		do
			if attached pattern as pat and attached other.pattern as other_pat then
				Result := compute_pattern_conformance (pat, other_pat)
			else
				Result := True
			end
		end

	range_conforms_to (other: like Current): BOOLEAN
			-- True if the pattern of this node is or narrower than that in `other'
		do
			if attached range as rng and attached other.range as other_rng then
				Result := other_rng.contains (rng)
			else
				Result := True
			end
		end

	compute_pattern_conformance (a_child_pattern, a_pattern: STRING): BOOLEAN
		do
			-- TODO: child pattern can only narrow parent pattern
			Result := True
		end

invariant
	basic_validity: attached pattern or attached range
	pattern_valid: attached pattern as p implies valid_iso8601_duration_constraint_pattern (p)

end


