indexing
	component:   "openEHR Data Types"
	
	description: "[
	             Used to record pure ratios, such as titers, concentration ratios (e.g. Na:K) etc.
				 ]"
	keywords:    "ratio, quantity"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2006 The openEHR Foundation <http://www.openEHR.org>"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class DV_PROPORTION

inherit
	DV_QUANTIFIED
	
	PROPORTION_KIND
		undefine
			is_equal
		end

create
	make, make_from_string, make_from_canonical_string
	
feature -- Initialization
	
	make(a_numerator, a_denominator: REAL) is
			-- make from a numerator, denominator
		do
			numerator := a_numerator
			denominator := a_denominator
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

	numerator: REAL
			-- numerator of ratio

	denominator: REAL
			-- denominator of ratio

	is_integral: BOOLEAN
			-- True if only integer values are allows in the numerator and denominator.

	type: INTEGER
			-- Indicates semantic type of proportion, including percent, unitary etc.
			
	magnitude: REAL_REF is
			-- value of numerator/denominator
		do
			Result := numerator/denominator
		end

	diff_type: DV_PROPORTION
			-- type of difference for this quantity
		
feature -- Comparison

	is_strictly_comparable_to (other: DV_PROPORTION): BOOLEAN is
			-- two ordinals can be compared if they come from the same series
		do
			Result := type = other.type
		end

feature -- Basic Operations

	infix "+" (diff_val: like diff_type): like Current is
			-- addition
		do
		end

	infix "-" (other: like Current): like diff_type is
			-- difference
		do
		end

feature -- Conversion

	as_string: STRING is
		do
			create Result.make(0)
			Result.append(numerator.out)
			Result.append(denominator.out)
		end
	
	as_canonical_string: STRING is
		do
			Result := "<numerator>" + numerator.out + "</numerator>" +
					"<denominator>" + denominator.out + "</denominator>"
		end
	
	magnitude_as_string: STRING is
			-- output the magnitude in its natural form
		do
			-- FIXME: to be implemented
		end

invariant
	Type_validity: valid_proportion_kind(type)
	Is_integral_validity: is_integral implies (numerator.floor = numerator and denominator.floor = denominator)
	Fraction_validity: (type = pk_fraction or type = pk_integer_fraction) implies is_integral
	Unitary_validity: type = pk_unitary implies denominator = 1
	Percent_validity: type = pk_percent implies denominator = 100
	
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
