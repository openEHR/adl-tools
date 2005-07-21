indexing
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

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2000-2004 The openEHR Foundation <http://www.openEHR.org>"
	license:     "See notice at bottom of class"

	file:        "$Source: C:/project/openehr/spec-dev/architecture/computable/eiffel/rm/data_types/quantity/SCCS/s.dv_ordered.e $"
	revision:    "$Revision$"
	last_change: "$Date: 04/07/15 12:09:37+10:00 $"

deferred class DV_ORDERED

inherit
	DATA_VALUE
		undefine
			is_equal
		end
	COMPARABLE

feature -- Access

	reference_ranges: LINKED_LIST[REFERENCE_RANGE[like Current]]
			-- optional tagged ranges for this value in its particular measurement context

	normal_range: REFERENCE_RANGE[like Current] is
			-- optionally specify which of the reference ranges is to be considered the normal range
		require
			reference_ranges /= Void
		do
			from
				reference_ranges.start
			until
				reference_ranges.off or Result /= Void
			loop
				if reference_ranges.item.meaning.value.is_equal("normal") then
					Result := reference_ranges.item
				end
				reference_ranges.forth
			end
		ensure
			Result /= Void implies reference_ranges.has(Result) and then Result.meaning.value.is_equal("normal")
		end

feature -- Comparison

	is_strictly_comparable_to (other: like Current): BOOLEAN is
		require
			other_exists: other /= Void
		deferred
		end

feature -- Status Report

	is_simple: BOOLEAN is
			-- simple DV_ORDERED objects have no reference ranges or accuracy
		do
			Result := reference_ranges = Void
		end

	has_normal_range: BOOLEAN is
		do
			Result := reference_ranges /= Void and then normal_range /= Void
		end

	is_normal: BOOLEAN is
			-- True if there is the current value is inside the normal range
		require
			has_normal_range
		do
			Result := normal_range.has(Current)
		end
		
feature -- Modification

	add_reference_range(a_rr:REFERENCE_RANGE[like Current]) is
			-- add a new reference range
		require
			Range_exists: a_rr /= Void
		do
			if reference_ranges = Void then
				create reference_ranges.make
			end
			reference_ranges.extend(a_rr)
		end
		
invariant

	Is_simple_validity: reference_ranges = Void implies is_simple
	Reference_range_validity: reference_ranges /= Void implies not reference_ranges.is_empty
	Normal_range_validity: has_normal_range implies (reference_ranges /= Void and then reference_ranges.has(normal_range))

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
