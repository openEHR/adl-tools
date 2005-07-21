indexing
	component:   "openEHR Data Types"
	
	description: "[
	             Models rankings and scores, e.g. pain, Apgar values, etc, where there
	             is a) implied ordering, b) no implication that the distance between 
	             each value is constant, and c) the total number of values is usually limited.
	             Examples: value sets {trace, +, ++, +++}, or {low, med, high}.
				 ]"
	keywords:    "ordinal, quantity"

	requirements:"ISO 18308 TS V1.0 STR 3.2"
	design:      "openEHR Data Types Reference Model 1.7"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2000-2004 The openEHR Foundation <http://www.openEHR.org>"
	license:     "See notice at bottom of class"

	file:        "$Source: C:/project/openehr/spec-dev/architecture/computable/eiffel/rm/data_types/quantity/SCCS/s.dv_ordinal.e $"
	revision:    "$Revision$"
	last_change: "$Date: 05/03/13 23:17:04+00:00 $"

class DV_ORDINAL

inherit
	DV_ORDERED

create
	make, make_from_string, make_from_canonical_string
	
feature -- Initialization
	
	make(a_value: INTEGER; a_symbol: DV_CODED_TEXT) is
			-- make from a value/symbol pair
		require
			a_symbol_valid: a_symbol /= Void
		do
			value := a_value
			symbol := a_symbol
		ensure
			Value_set: value = a_value
			Symbol_set: symbol = a_symbol
		end
		
	make_from_string(str:STRING) is
		do
		end

	make_from_canonical_string(str:STRING) is
		do
		end

feature -- Status Report

	valid_canonical_string(str: STRING): BOOLEAN is
			-- True if str contains required tags
		do
		end
		
feature -- Access

	value: INTEGER
			-- ordinal value of this datum

	symbol: DV_CODED_TEXT
			-- symbolic representation of this value in the enumeration,
			-- which may be strings made from “+” symbols, or other enumerations 
			-- of terms such as “mild”, “moderate”, “severe”.

	limits: REFERENCE_RANGE [DV_ORDINAL] is
			-- limits of the ordinal enumeration, to allow comparison of an ordinal value to its limits.
		do
		end

feature -- Comparison

	is_strictly_comparable_to (other: DV_ORDINAL): BOOLEAN is
			-- two ordinals can be compared if they come from the same series
		do
			Result := symbol.is_comparable(other.symbol)
		end

	infix "<" (other: DV_ORDINAL): BOOLEAN is
			-- Is current object less than `other'?
		do
			Result := value < other.value
		end

feature -- Conversion

	as_string: STRING is
		do
			create Result.make(0)
			Result.append(symbol.as_string)
		end
	
	as_canonical_string: STRING is
		do
			Result := "<value>" + value.out + "</value>" +
					"<symbol>" + symbol.as_canonical_string + "</symbol>"
		end
	
invariant
	Value_validity: value > 0
	Symbol_valid: symbol /= Void
	Limits_valid: limits /= Void and then limits.meaning.value.is_equal("limits")
	Reference_range_valid: reference_ranges /= Void and then reference_ranges.has(limits)
	
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
--| The Original Code is dv_ordinal.e.
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
