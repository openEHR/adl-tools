indexing

	component:   "openEHR Common Archetype Model"

	description: "Constrainer type for instances of DURATION"
	keywords:    "archetype, date, data"

	design:      "openEHR Common Archetype Model 0.2"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2000-2004 The openEHR Foundation <http://www.openEHR.org>"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class C_DURATION

inherit
	C_PRIMITIVE

	ADL_DEFINITIONS
		export
			{NONE} all
		undefine
			out
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
	make_interval,
	make_from_pattern,
	make_pattern_with_interval

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
			valid_order: (a_lower /= Void and an_upper /= Void) implies iso8601_string_to_duration (a_lower) <= iso8601_string_to_duration (an_upper)
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
					create interval.make_lower_unbounded (upper_duration, include_upper)
				elseif upper_duration = Void then
					create interval.make_upper_unbounded (lower_duration, include_lower)
				else
					create interval.make_bounded (lower_duration, upper_duration, include_lower, include_upper)
				end
			end
		ensure
			pattern_set: pattern = a_pattern
			interval_if_lower_or_upper: (a_lower /= Void or an_upper /= Void) xor interval = Void
		end

	make_interval (an_interval: like interval)
			-- Create from an ISO8601-based interval.
		require
			interval_attached: an_interval /= Void
		do
			interval := an_interval
		ensure
			interval_set: interval = an_interval
			pattern_void: pattern = Void
		end

	make_from_pattern (a_pattern: STRING)
			-- Create from an ISO8601-based pattern.
		require
			a_pattern_attached: a_pattern /= Void
			a_pattern_valid: valid_iso8601_duration_constraint_pattern (a_pattern)
		do
			pattern := a_pattern
		ensure
			pattern_set: pattern = a_pattern
			interval_void: interval = Void
		end

	make_pattern_with_interval (a_pattern: STRING; an_interval: like interval)
			-- Create from an ISO8601-based pattern, together with an ISO8601-based interval.
		require
			a_pattern_attached: a_pattern /= Void
			a_pattern_valid: valid_iso8601_duration_constraint_pattern (a_pattern)
			interval_attached: an_interval /= Void
		do
			pattern := a_pattern
			interval := an_interval
		ensure
			pattern_set: pattern = a_pattern
			interval_set: interval = an_interval
		end

feature -- Access

	pattern: STRING
			-- ISO8601-based pattern like "yyyy-mm-XX".
			-- Allowed patterns:
			-- -P[Y|y][M|m][D|d][T[H|h][M|m][S|s]] or -P[W|w]

	interval: INTERVAL [ISO8601_DURATION]
			-- ISO8601-based interval.

	default_value: ISO8601_DURATION is
			-- Default duration value.
		do
			if interval /= Void then
				Result := interval.lower
			else
				-- FIXME: Return something based on `pattern'.
			end
		end

feature -- Status Report

	valid_value (duration: ISO8601_DURATION): BOOLEAN
			-- Is `duration' within `interval'?
		do
			Result := True

			if pattern /= Void then
				-- FIXME: TO BE IMPLEMENTED	
			end

			Result := Result and (interval /= Void implies interval.has (duration))
		end

feature -- Output

	as_string: STRING is
			-- Textual representation.
		do
			create Result.make_empty

			if pattern /= Void then
				Result.append (pattern)
			end

			if interval /= Void then
				if pattern /= Void then
					Result.append_character ('/')
				end

				Result.append ("|" + interval.as_string + "|")
			end

			if assumed_value /= Void then
				Result.append ("; " + assumed_value.as_string)
			end
		ensure then
			not_empty: not Result.is_empty
		end

	as_canonical_string: STRING is
		do
			Result := interval.as_string
		ensure
			attached: Result /= Void
			not_empty: not Result.is_empty
		end

invariant
	basic_validity: pattern /= Void or interval /= Void
	pattern_valid: pattern /= Void implies valid_iso8601_duration_constraint_pattern (pattern)

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
