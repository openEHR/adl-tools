note
	component:   "openEHR Common Archetype Model"
	description: "Constrainer type for instances of DATE"
	keywords:    "archetype, date, data"
	design:      "openEHR Common Archetype Model 0.2"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2000- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "See notice at bottom of class"

class C_DATE

inherit
	C_PRIMITIVE
		redefine
			rm_type_name
		end

	DATE_TIME_ROUTINES
		export
			{NONE} all;
			{ANY} valid_iso8601_date_constraint_pattern, valid_iso8601_date, iso8601_string_to_date
		undefine
			out
		end

create
	make_range, make_string_range, make_from_pattern

feature -- Initialisation

	make_range (an_interval: INTERVAL[ISO8601_DATE])
		do
			range := an_interval
		ensure
			range = an_interval
		end

	make_string_range (a_lower_str, an_upper_str: detachable STRING)
			-- make from two iso8601 strings. Either may be Void, indicating an open-ended interval;
			-- they may also be the same, meaning a single point. Limits, where provided, are automatically
			-- included in the interval
		require
			valid_interval: a_lower_str /= Void or an_upper_str /= Void
			lower_valid: attached a_lower_str as l_str implies valid_iso8601_date (l_str)
			upper_valid: attached an_upper_str as u_str implies valid_iso8601_date (u_str)
			valid_order: (attached a_lower_str as l_str and attached an_upper_str as u_str) implies
						(iso8601_string_to_date (l_str) <= iso8601_string_to_date (u_str))
		local
			lower, upper: detachable ISO8601_DATE
		do
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
			-- create Result from an ISO8601-based pattern like "yyyy-mm-XX"
			-- allowed patterns:
			--	"yyyy-mm-dd" - full date required
			--	"yyyy-mm-??" - day optional
			--	"yyyy-??-??" - any date ok
			-- 	"yyyy-??-XX" - day not allowed
			-- 	"yyyy-XX-XX" - month and day not allowed
		require
			a_pattern_valid: valid_iso8601_date_constraint_pattern (a_pattern)
		do
			pattern := a_pattern
		ensure
			pattern_set: pattern = a_pattern
		end

feature -- Access

	range: detachable INTERVAL[ISO8601_DATE]

	pattern: detachable STRING
			-- ISO8601-based pattern like "yyyy-mm-??"

	prototype_value: ISO8601_DATE
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

	rm_type_name: STRING
		once
			Result := Iso_class_name_leader.twin
			Result.append (generating_type.out.substring (3, generating_type.out.count))
		end

feature -- Status Report

	valid_value (a_value: ISO8601_DATE): BOOLEAN
		do
			if attached range as rng then
				Result := rng.has (a_value)
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
				Result := valid_date_constraint_replacements.item (other_p.as_upper).has (p.as_upper)
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
				Result.append("; " + av.out)
			end
		end

invariant
	Basic_validity: range /= Void xor pattern /= Void
	Pattern_validity: attached pattern as p implies valid_iso8601_date_constraint_pattern (p)

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
--| The Original Code is c_date.e.
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
