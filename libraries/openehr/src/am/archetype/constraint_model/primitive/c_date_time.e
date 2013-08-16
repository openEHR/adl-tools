note
	component:   "openEHR ADL Tools"
	description: "Constrainer type for instances of DATE_TIME"
	keywords:    "archetype, date, data"
	design:      "openEHR Common Archetype Model 0.2"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2000- The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class C_DATE_TIME

inherit
	C_PRIMITIVE
		redefine
			default_create
		end

	DATE_TIME_ROUTINES
		export
			{NONE} all;
			{ANY} valid_iso8601_date_time_constraint_pattern, valid_iso8601_date_time,
					iso8601_string_to_date_time
		undefine
			default_create,
			out
		end

create
	make_range, make_string_range, make_from_pattern

feature -- Initialisation

	default_create
		do
			rm_type_name := Iso_class_name_leader.twin
			rm_type_name.append (generating_type.out.substring (3, generating_type.out.count))
		end

	make_range (an_interval: INTERVAL[ISO8601_DATE_TIME])
		do
			default_create
			range := an_interval
		end

	make_string_range (a_lower_str, an_upper_str: detachable STRING)
			-- make from two iso8601 strings. Either may be Void, indicating an open-ended interval;
			-- they may also be the same, meaning a single point. Limits, where provided, are automatically
			-- included in the interval
		require
			valid_interval: a_lower_str /= Void or an_upper_str /= Void
			lower_valid: attached a_lower_str as l_str implies valid_iso8601_date_time (l_str)
			upper_valid: attached an_upper_str as u_str implies valid_iso8601_date_time (u_str)
			valid_order: (attached a_lower_str as l_str and attached an_upper_str as u_str) implies
						(iso8601_string_to_date_time (l_str) <= iso8601_string_to_date_time (u_str))
		local
			lower, upper: detachable ISO8601_DATE_TIME
		do
			default_create
			if attached a_lower_str as l_str then
				create lower.make_from_string (l_str)
			end
			if attached an_upper_str as u_str then
				create upper.make_from_string (u_str)
			end

			if attached lower as l and attached upper as u then
				create range.make_bounded (l, u, True, True)
			elseif attached upper as u then
				create range.make_lower_unbounded (u, True)
			elseif attached lower as l then
				create range.make_upper_unbounded (l, True)
			end
		end

	make_from_pattern (a_pattern: STRING)
			-- create Result from an ISO8601-based pattern like "yyyy-mm-ddT??:??:??"
		require
			a_pattern_valid: valid_iso8601_date_time_constraint_pattern(a_pattern)
		local
			spc_index: INTEGER
		do
			default_create
			create pattern.make(0)
			pattern.append (a_pattern)
			if not a_pattern.has (Time_leader) then
				spc_index := a_pattern.index_of(' ', 1)
				if spc_index > 0 then
					pattern.put(Time_leader, spc_index)
				end
			end
		ensure
			-- FIXME: re-instate when patterns with no 'T' made invalid
			-- pattern_set: pattern = a_pattern
		end

feature -- Access

	range: detachable INTERVAL[ISO8601_DATE_TIME]

	pattern: detachable STRING
			-- ISO8601-based pattern like "yyyy-mm-ddT??:??:??"

	prototype_value: ISO8601_DATE_TIME
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

	valid_value (a_value: ISO8601_DATE_TIME): BOOLEAN
		do
			if attached range as rng then
				Result := rng.has(a_value)
			else
				-- Result := a_value matches pattern FIXME - to be implemented
				Result := True
			end
		end

feature -- Comparison

	node_conforms_to (other: like Current): BOOLEAN
			-- True if this node is a subset of, or the same as `other'
		do
			if attached pattern as p and attached other.pattern as other_p then
				Result := valid_time_constraint_replacements.item (other_p.as_upper).has (p.as_upper)
			elseif attached range as rng and attached other.range as other_rng then
				Result := other_rng.contains (rng)
			end
		end

feature -- Output

	as_string: STRING
		do
			create Result.make(0)
			if attached range as rng then
				Result.append ("|" + rng.as_string + "|")
			elseif attached pattern as p then
				Result.append (p)
			end
			if attached assumed_value as av then
				Result.append ("; " + av.out)
			end
		end

invariant
	Basic_validity: range /= Void xor pattern /= Void
	Pattern_validity: attached pattern as p implies valid_iso8601_date_time_constraint_pattern (p)

end


