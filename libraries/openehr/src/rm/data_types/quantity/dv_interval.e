indexing
	component:   "openEHR Data Types"
	
	description: "[
				 Generic class defining an interval (i.e. range) of a comparable type. 
				 An interval is a contiguous subrange of a comparable base type.
				 ]"
	keywords:    "intervals"

	requirements:"ISO 18308 TS V1.0 STR 3.5, 3.9"
	design:      "openEHR Data Types Reference Model 1.7"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2000-2004 The openEHR Foundation <http://www.openEHR.org>"
	license:     "See notice at bottom of class"

	file:        "$Source: C:/project/openehr/spec-dev/architecture/computable/eiffel/rm/data_types/quantity/SCCS/s.dv_interval.e $"
	revision:    "$Revision$"
	last_change: "$Date: 05/06/05 02:24:42+01:00 $"

class DV_INTERVAL [G -> DV_ORDERED]

inherit
	DATA_VALUE
		undefine
			is_equal
		end
	OE_INTERVAL [G]
		redefine
			as_string
		end

create 
	default_create,
	make_bounded, 
	make_lower_unbounded, 
	make_upper_unbounded, 
	make_from_canonical_string, 
	make_from_string

feature -- Initialization

	make_from_string(str:STRING) is
		do
		end

	make_from_canonical_string(str:STRING) is
			-- create from a STRING of the form
			-- "<lower>" + value + "</lower>"
			-- "<upper>" + value + "</upper>"
			-- where 'value' = "unbounded" for an open limit
		local
			s: STRING
		do
			s := xml_extract_from_tags(str, "lower", 1)
			if not s.is_equal("unbounded") then
			--	create lower.make_from_canonical_string(s)		
			end
			s := xml_extract_from_tags(str, "upper", 1)
			if not s.is_equal("unbounded") then
			--	create upper.make_from_canonical_string(s)		
			end
		end

feature -- Status Report

	valid_canonical_string(str: STRING): BOOLEAN is
			-- True if str contains required tags
		do
			Result := xml_has_tag(str, "lower", 1) and xml_has_tag(str, "upper", 1)
		end

feature -- Conversion

	as_string: STRING is
		do
			Result := lower.as_string + ".." + upper.as_string
		end
	
	as_canonical_string: STRING is
			-- output as a STRING of the form
			-- "<lower>" + value + "</lower>"
			-- "<upper>" + value + "</upper>"
		do
			create Result.make(0)
			if lower_unbounded then
				Result.append("<lower>" + "unbounded" + "</lower>")
			else
				Result.append("<lower>" + lower.as_canonical_string + "</lower>")
			end
			if upper_unbounded then
				Result.append("<upper>" + "unbounded" + "</upper>")
			else
				Result.append("<upper>" + upper.as_canonical_string + "</upper>")
			end
		end
		
invariant

	Limits_consistent: (not upper_unbounded and not lower_unbounded) implies (lower.is_strictly_comparable_to(upper) and lower <= upper)

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
--| The Original Code is dv_interval.e.
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
