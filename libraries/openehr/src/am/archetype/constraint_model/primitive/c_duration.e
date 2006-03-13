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
			{ANY} is_valid_iso8601_duration, iso8601_string_to_duration
		undefine
			is_equal, default_create, out
		end

create
	make_interval, make_string_interval

feature -- Initialisation
	
	make_interval(an_interval: OE_INTERVAL[DATE_TIME_DURATION]) is
		require
			Interval_exists: an_interval /= Void
		do
			interval := an_interval
		end

	make_string_interval(a_lower, an_upper: STRING; include_lower, include_upper: BOOLEAN) is
			-- make from two iso8601 strings. Either may be Void, indicating an open-ended interval;
			-- they may also be the same, meaning a single point. Boolean flags indicate whether to
			-- include limits in range or not
		require
			valid_interval: a_lower /= Void or an_upper /= Void
			lower_exists: a_lower /= void implies is_valid_iso8601_duration(a_lower)
			upper_exists: an_upper /= void implies is_valid_iso8601_duration(an_upper)
			valid_order: (a_lower /= Void and an_upper /= Void) implies 
						(iso8601_string_to_duration(a_lower) <= iso8601_string_to_duration(an_upper))
		do
			if a_lower = Void then
				if an_upper = Void then
					create interval.make_unbounded
				else
					create interval.make_lower_unbounded(iso8601_string_to_duration(an_upper), include_upper)			
				end
			else
				if an_upper = Void then
					create interval.make_upper_unbounded(iso8601_string_to_duration(a_lower), include_lower)
				else
					create interval.make_bounded(iso8601_string_to_duration(a_lower), iso8601_string_to_duration(an_upper), include_lower, include_upper)			
				end
			end
		end

feature -- Access

	interval: OE_INTERVAL[DATE_TIME_DURATION]

	default_value: DATE_TIME_DURATION is
		do
			Result := interval.lower
		end

feature -- Status Report

	valid_value (a_value: DATE_TIME_DURATION): BOOLEAN is 
		do
			Result := interval.has(a_value)
		end

feature -- Output

	as_string: STRING is
		do
			create Result.make(0)
			Result.append(symbols.item(SYM_INTERVAL_DELIM))
			if interval.lower_unbounded then
				Result.append("<= " + duration_to_iso8601_string(interval.upper))
			elseif interval.upper_unbounded then
				Result.append(">= " + duration_to_iso8601_string(interval.lower))
			elseif not interval.limits_equal then
				Result.append(duration_to_iso8601_string(interval.lower) + ".." + 
								duration_to_iso8601_string(interval.upper))
			else
				Result.append(duration_to_iso8601_string(interval.lower)) 
			end
			Result.append(symbols.item(SYM_INTERVAL_DELIM))
			if assumed_value /= Void then
				Result.append("; " + duration_to_iso8601_string(assumed_value))
			end
		end

	as_canonical_string:STRING is
		do
			Result := interval.as_string
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
