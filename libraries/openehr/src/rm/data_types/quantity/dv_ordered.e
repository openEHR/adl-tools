note
	component:   "openEHR Data Types"
	description: "[
				 Abstract class defining the concept of ordered values, which includes 
				 ordinals as well as true quantities. It defines the functions less_than 
				 and is_strictly_comparable_to, the latter of which must evaluate to True 
				 for instances being compared with the less_than function, or used as 
				 limits in the DV_INTERVAL<T> class.
				 ]"
	keywords:    "Items which are ordered"
	design:      "openEHR Data Types Reference Model 1.7.9"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2000- The openEHR Foundation <http://www.openEHR.org>"
	license:     "See notice at bottom of class"

deferred class DV_ORDERED

inherit
	DATA_VALUE
		undefine
			is_equal
		end

	COMPARABLE

feature -- Access

	other_reference_ranges: detachable LINKED_LIST [REFERENCE_RANGE[like Current]]
			-- optional tagged ranges for this value in its particular measurement context

	normal_range: detachable DV_INTERVAL[like Current]
			-- Optional normal range

	normal_status: detachable CODE_PHRASE
			-- Optional normal status indicator of value with respect to normal range for this value.
			-- Often included by lab, even if the normal range itself is not included.
			-- Coded by ordinals in series HHH, HH, H, (nothing), L, LL, LLL

feature -- Comparison

	is_strictly_comparable_to (other: like Current): BOOLEAN
		deferred
		end

feature -- Status Report

	is_simple: BOOLEAN
			-- simple DV_ORDERED objects have no reference ranges or accuracy
		do
			Result := normal_range = Void and other_reference_ranges = Void
		end

	has_normal_range: BOOLEAN
		do
			Result := normal_range /= Void
		end

	is_normal: BOOLEAN
			-- True if there is the current value is inside the normal range
		require
			has_normal_range
		do
			Result := attached normal_range as nr and then nr.has(Current)
		end

feature -- Modification

	add_other_reference_range (a_rr: REFERENCE_RANGE [like Current])
			-- add a new reference range
		local
			ref_rngs: attached like other_reference_ranges
		do
			if attached other_reference_ranges as orr then
				ref_rngs := orr
			else
				create ref_rngs.make
				other_reference_ranges := ref_rngs
			end
			ref_rngs.extend (a_rr)
		end

invariant
	Other_reference_range_validity: other_reference_ranges /= Void implies not other_reference_ranges.is_empty
	Is_simple_validity: (normal_range = Void and other_reference_ranges = Void and normal_status = Void) implies is_simple
--	Normal_status_validity: normal_status /= Void implies normal_status.is_simple
--	Normal_status_symbol_validity: normal_status /= Void implies terminology(Terminology_id_openehr).
--		has_code_for_group_id(Group_id_normal_status, normal_status.symbol.defining_code)

--	Normal_status_validity: normal_status /= Void implies code_set(Code_set_id_normal_statuses).has_code(normal_status)
	Normal_range_and_status_consistency: (normal_range /= Void and normal_status /= Void) implies (normal_status.code_string.is_equal("N") xor not normal_range.has(Current))

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
--| The Original Code is dv_ordered.e.
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
