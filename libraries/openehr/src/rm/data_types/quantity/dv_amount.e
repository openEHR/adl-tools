indexing
	component:   "openEHR Data Types"

	description: "[
				 Abstract class defining the concept of relative quantified 'amounts'. For relative quantities, 
				 the '+' and '-' operators are defined (unlike descendants of DV_ABSOLUTE_QUANTITY, such as the 
				 date/time types).
				 ]"
	keywords:    "quantity, data"

	requirements:"ISO 18308 TS V1.0 STR 3.2 - 3.4"
	design:      "openEHR Data Types Reference Model 1.7"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2000-2004 The openEHR Foundation <http://www.openEHR.org>"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

deferred class DV_AMOUNT

inherit
	DV_QUANTIFIED

	EXTERNAL_ENVIRONMENT_ACCESS
		undefine
			is_equal
		end

feature -- Access

	accuracy: REAL
			-- optional accuracy of measurement instrument or method which applies
			-- to this specific instance of DV_QUANTIFIED, expressed as the value
			-- of the half-range quoted for the accuracy, e.g. "+/- 5%" is represented 
			-- as a DV_QUANTITY of value 5 and units "%".

feature -- Status Report

	valid_canonical_string(str: STRING): BOOLEAN is
			-- True if str contains required tags
		deferred
		end

	accuracy_is_percent: BOOLEAN
			-- If True, indicates that when this object was created, accuracy was recorded as a
			-- percent value; if False, as an absolute quantity value.

feature -- Comparison

	valid_percentage(v: REAL):BOOLEAN is
			-- True if v between 0 and 1
		local
			a_comparable: COMPARABLE
		do
			a_comparable ?= v
			Result := a_comparable >= 0.0 and a_comparable <= 1.0
		end

feature -- Basic Operations

	infix "+" (other: like Current): like Current is
			-- addition
		require
			is_strictly_comparable_to(other)
		deferred
		ensure
			is_strictly_comparable_to(Result)
		end

	infix "-" (other: like Current): like Current is
			-- difference
		require
			is_strictly_comparable_to(other)
		deferred
		ensure
			is_strictly_comparable_to(Result)
		end

feature -- Modification

	set_accuracy(v: REAL; is_percent:BOOLEAN) is
			-- set accuracy as half-range v, flag indicates whether understood as a percentage or not
		require
			is_percent implies valid_percentage(v)
		do
			accuracy := v
			accuracy_is_percent := is_percent
		ensure
			accuracy = v
			accuracy_is_percent = is_percent
		end

feature -- Output

	as_string: STRING is
			-- string form displayable for humans
		do
			Result := magnitude_as_string
			if accuracy /= 0 then
				Result.append(" +/-" + accuracy.out)
				if accuracy_is_percent then
					Result.append ("%%")
				end
			end
		end

	as_canonical_string: STRING is
			-- standardised form of string guaranteed to contain all information
			-- in data item
		do
			Result := "<magnitude>" + magnitude.out + "</magnitude>"
			if accuracy /= 0 then
				Result.append("<accuracy>" + accuracy.out + "</accuracy>")
				Result.append("<accuracy_is_percent>" + accuracy_is_percent.out + "</accuracy_is_percent>")
			end
		end

	magnitude_as_string: STRING is
			-- output the magnitude in its natural form
		deferred
		ensure
			attached: Result /= Void
			not_empty: not Result.is_empty
		end

invariant
	Accuracy_validity: accuracy_is_percent implies valid_percentage(accuracy)

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
--| The Original Code is dv_measurable.e.
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
