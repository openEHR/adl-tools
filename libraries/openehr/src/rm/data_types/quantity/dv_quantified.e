note
	component:   "openEHR Data Types"

	description: "[
				 Abstract class defining the concept of true quantified values, i.e. values which are 
				 not only ordered, but which have a precise magnitude.
				 ]"
	keywords:    "data, quantified, quantity"

	design:      "openEHR Data Types Reference Model 1.7"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2000-2004 The openEHR Foundation <http://www.openEHR.org>"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

deferred class DV_QUANTIFIED

inherit
	DV_ORDERED

	EXTERNAL_ENVIRONMENT_ACCESS
		undefine
			is_equal
		end

feature -- Access

	magnitude: NUMERIC
			-- numeric value of the quantity
		deferred
		end

	magnitude_status: STRING
			-- Optional status of magnitude with values:
			-- "=" : magnitude is a point value
			-- "<" : value is < magnitude
			-- ">" : value is > magnitude
			-- "<=" : value is <= magnitude
			-- ">=" : value is >= magnitude
			-- "~" : value is approximately magnitude
			-- If not present, meaning is “=”.

feature -- Comparison

	is_less alias "<" (other: like Current): BOOLEAN
		do
			if attached {COMPARABLE} magnitude as this_c and attached {COMPARABLE} other.magnitude as other_c then
				Result := other_c < this_c
			end
		end

	valid_magnitude_status(s: STRING): BOOLEAN
			-- Test whether a string value is one of the valid
			-- values for the magnitude_status attribute.
		do
			Result := s.is_equal("=") or s.is_equal("<") or s.is_equal(">") or
				s.is_equal("<=") or s.is_equal(">=") or s.is_equal("~")
		ensure
			Result = s.is_equal("=") or s.is_equal("<") or s.is_equal(">") or
				s.is_equal("<=") or s.is_equal(">=") or s.is_equal("~")
		end

invariant
	Magnitude_status_valid: magnitude_status /= Void implies valid_magnitude_status(magnitude_status)

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
--| The Original Code is dv_quantified.e.
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
