indexing
	component:   "openEHR Data Types"
	
	description: "[
				 Abstract class defining the concept of true quantified values, i.e. 
				 values which are not only ordered, but whose magnitude is meaningful
				 as well. The defining characteristics of the type is the attribute 
				 magnitude - an accurate notion of quantity of something, and the 
				 difference operation.
				 Units were inspired by the Unified Code for Units of Measure (UCUM), 
				 developed by Gunther Schadow and Clement J. McDonald of The Regenstrief 
				 Institute [4]. 
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

	magnitude: NUMERIC is
			-- numeric value of the quantity
		deferred
		end

	accuracy: REAL
			-- optional accuracy of measurement instrument or method which applies 
			-- to this specific instance of DV_QUANTIFIED, expressed as the value 
			-- of the half-range quoted for the accuracy, e.g. "+/- 5%" is represented 
			-- as a DV_QUANTITY of value 5 and units "%".
			
	accuracy_is_percent: BOOLEAN
			-- If True, indicates that when this object was created, accuracy was recorded as a 
			-- percent value; if False, as an absolute quantity value.

	diff_type: DV_QUANTIFIED is
			-- type of difference for this quantity
		deferred
		end
		
feature -- Comparison

	infix "<" (other: like Current): BOOLEAN is
		local
			this_c, other_c: COMPARABLE
		do
			this_c ?= magnitude -- FIXME: relies on knowledge that all NUMERICs are COMPARABLE (problem with Eiffel numeric type model)
			other_c ?= other.magnitude
			Result := other_c < this_c
		end

	is_valid_percentage(v: REAL):BOOLEAN is
			-- True if v between 0 and 1
		local
			a_comparable: COMPARABLE
		do
			a_comparable ?= v
			Result := a_comparable >= 0.0 and a_comparable <= 1.0
		end
		
feature -- Basic Operations

	infix "+" (other: like diff_type): like Current is
			-- addition
		require
			is_strictly_comparable_to(other)
		deferred
		end

	infix "-" (other: like Current): like diff_type is
			-- difference
		require
			is_strictly_comparable_to(other)
		deferred
		end

feature -- Modification

	set_accuracy(v: REAL; is_percent:BOOLEAN) is
			-- set accuracy as half-range v, flag indicates whether understood as a percentage or not
		require
			is_percent implies is_valid_percentage(v)
		do
			accuracy := v
			accuracy_is_percent := is_percent
		ensure
			accuracy = v
			accuracy_is_percent = is_percent
		end

invariant
	Magnitude_exists: magnitude /= Void
	accuracy_validity: accuracy_is_percent implies is_valid_percentage(accuracy)
	
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
