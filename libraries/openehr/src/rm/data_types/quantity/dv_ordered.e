note
	component:   "openEHR ADL Tools"
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
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

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
	Other_reference_range_validity: attached other_reference_ranges as att_orr implies not att_orr.is_empty
	Is_simple_validity: (normal_range = Void and other_reference_ranges = Void and normal_status = Void) implies is_simple
--	Normal_status_validity: normal_status /= Void implies normal_status.is_simple
--	Normal_status_symbol_validity: normal_status /= Void implies terminology(Terminology_id_openehr).
--		has_code_for_group_id(Group_id_normal_status, normal_status.symbol.defining_code)

--	Normal_status_validity: normal_status /= Void implies code_set(Code_set_id_normal_statuses).has_code(normal_status)
	Normal_range_and_status_consistency: (attached normal_range as att_nr and attached normal_status as att_ns) implies (att_ns.code_string.is_equal("N") xor not att_nr.has(Current))

end


