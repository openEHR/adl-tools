note

	component:   "openEHR Common Archetype Model"

	description: "Constrainer type for instances of DURATION"
	keywords:    "archetype, date, data"

	design:      "openEHR Common Archetype Model 0.2"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2000-2004 The openEHR Foundation <http://www.openEHR.org>"
	license:     "See notice at bottom of class"
	void_safe:	 "yes"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class C_DURATION

inherit
	C_PRIMITIVE
		redefine
			rm_type_name
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

	make (a_pattern, a_lower, an_upper: STRING; include_lower, include_upper: BOOLEAN)
			-- Create from an ISO8601-based pattern, together with two ISO8601 strings representing an interval.
			-- If either `a_lower' or `an_upper' is Void, the interval is open-ended;
			-- if they are the same, the interval is a single point.
			-- Boolean flags indicate whether to include limits in the range or not.
		require
			not_all_void: a_pattern /= Void or a_lower /= Void or an_upper /= Void
			valid_pattern: a_pattern /= Void implies valid_iso8601_duration_constraint_pattern (a_pattern)
			valid_lower: a_lower /= void implies valid_iso8601_duration (a_lower)
			valid_upper: an_upper /= void implies valid_iso8601_duration (an_upper)
			valid_order: (a_lower /= Void and an_upper /= Void) implies iso8601_string_to_comparable_duration (a_lower) <= iso8601_string_to_comparable_duration (an_upper)
		local
			lower_duration, upper_duration: ISO8601_DURATION
		do
			pattern := a_pattern

			if a_lower /= Void or an_upper /= Void then
				if a_lower /= Void then
					create lower_duration.make_from_string (a_lower)
				end

				if an_upper /= Void then
					create upper_duration.make_from_string (an_upper)
				end

				if lower_duration = Void then
					create range.make_lower_unbounded (upper_duration, include_upper)
				elseif upper_duration = Void then
					create range.make_upper_unbounded (lower_duration, include_lower)
				else
					create range.make_bounded (lower_duration, upper_duration, include_lower, include_upper)
				end
			end
		ensure
			pattern_set: pattern = a_pattern
			interval_if_lower_or_upper: (a_lower /= Void or an_upper /= Void) xor range = Void
		end

	make_range (an_interval: attached like range)
			-- Create from an ISO8601-based interval.
		do
			range := an_interval
		ensure
			interval_set: range = an_interval
			pattern_void: pattern = Void
		end

	make_from_pattern (a_pattern: attached STRING)
			-- Create from an ISO8601-based pattern.
		require
			a_pattern_valid: valid_iso8601_duration_constraint_pattern (a_pattern)
		do
			pattern := a_pattern
		ensure
			pattern_set: pattern = a_pattern
			interval_void: range = Void
		end

	make_pattern_with_range (a_pattern: attached STRING; an_interval: attached like range)
			-- Create from an ISO8601-based pattern, together with an ISO8601-based interval.
		require
			a_pattern_valid: valid_iso8601_duration_constraint_pattern (a_pattern)
		do
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
			if attached range then
				Result := range.lower
			else
				-- FIXME: Return something based on `pattern'.
			end
		end

	rm_type_name: STRING
		once
			Result := Iso_class_name_leader.twin
			Result.append (generating_type.out.substring (3, generating_type.out.count))
		end

feature -- Status Report

	valid_value (duration: ISO8601_DURATION): BOOLEAN
			-- Is `duration' within `range'?
		do
			Result := True

			if attached pattern then
				-- FIXME: TO BE IMPLEMENTED	
			end

			Result := Result and (range /= Void implies range.has (duration))
		end

feature -- Comparison

	node_conforms_to (other: like Current): BOOLEAN
			-- True if this node constraint is a subset of `other'
		do
			Result := pattern_conforms_to (other) and range_conforms_to (other)
		end

	pattern_conforms_to (other: like Current): BOOLEAN
			-- True if the pattern of this node is or narrower than that in `other'
		do
			if attached pattern and attached other.pattern then
				Result := compute_pattern_conformance (pattern, other.pattern)
			else
				Result := True
			end
		end

	range_conforms_to (other: like Current): BOOLEAN
			-- True if the pattern of this node is or narrower than that in `other'
		do
			if attached range and attached other.range then
				Result := other.range.contains (range)
			else
				Result := True
			end
		end

feature -- Output

	as_string: STRING
			-- Textual representation.
		do
			create Result.make_empty

			if attached pattern then
				Result.append (pattern)
			end

			if attached range then
				if attached pattern then
					Result.append_character ('/')
				end

				Result.append ("|" + range.as_string + "|")
			end

			if assumed_value /= Void then
				Result.append ("; " + assumed_value.as_string)
			end
		ensure then
			not_empty: not Result.is_empty
		end

feature {NONE} -- Implementation

	compute_pattern_conformance (a_child_pattern, a_pattern: STRING): BOOLEAN
		local
			ymd_part, hmd_part: STRING
		do
			-- TODO: child pattern can only narrow parent pattern
			Result := True
		end

invariant
	basic_validity: attached pattern or attached range
	pattern_valid: attached pattern implies valid_iso8601_duration_constraint_pattern (pattern)

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
--| The Original Code is c_duration.e.
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
