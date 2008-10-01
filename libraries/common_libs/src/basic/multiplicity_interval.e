indexing
	component:   "openEHR support types"

	description: "[
				 Integer interval, used for representing cardinality, occurrences etc.
				 ]"
	keywords:    "intervals"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2000-2005 The openEHR Foundation <http://www.openEHR.org>"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class MULTIPLICITY_INTERVAL

inherit INTERVAL [INTEGER]
	redefine
		as_string
	end

create
	default_create,
	make_bounded,
	make_upper_unbounded,
	make_point

feature -- Operations

	union (other: like Current): like Current is
			-- generate the outer interval of Current and other
		do
			if upper_unbounded or other.upper_unbounded then
				create Result.make_upper_unbounded (lower.min(other.lower), lower_included or other.lower_included)
			else
				create Result.make_bounded (lower.min(other.lower), upper.max(other.upper), lower_included or
						other.lower_included, upper_included or other.upper_included)
			end
		end

	add (other: like Current): like Current is
			-- generate the interval resulting from sum(lower, other.lower)..sum(upper, other.upper)
		do
			if upper_unbounded or other.upper_unbounded then
				create Result.make_upper_unbounded (lower + other.lower, lower_included or other.lower_included)
			else
				create Result.make_bounded (lower + other.lower, upper + other.upper, lower_included or
						other.lower_included, upper_included or other.upper_included)
			end
		end

	as_string: STRING is
		do
			create Result.make(0)
			if upper_unbounded then
				Result.append(lower_out + "..*")
			elseif not limits_equal then
				Result.append(lower_out + ".." + upper_out)
			else
				Result.append(lower_out)
			end
		end

invariant
	Lower_valid: lower >= 0

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
--| The Original Code is interval.e.
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
