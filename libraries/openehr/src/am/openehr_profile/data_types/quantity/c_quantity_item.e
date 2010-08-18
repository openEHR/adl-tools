note
	component:   "openEHR Archetype Project"
	description: "Magnitude/unit constrainer item for C_QUANTITY"
	keywords:    "quantity, archetype, clinical type, ADL"
	
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2004 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class C_QUANTITY_ITEM

create
	make

feature -- Initialisation

	make(a_units: STRING; a_magnitude: INTERVAL[REAL]; a_precision: INTERVAL[INTEGER])
			-- add a units constraint. Void magnitude means any magnitude allowed
		require
			Magnitude_validity: a_magnitude /= Void implies a_units /= Void
		do
			units := a_units
			magnitude := a_magnitude
			precision := a_precision
		ensure
			magnitude = Void implies any_magnitude_allowed
			precision = Void implies any_precision_allowed
		end

feature -- Access

	units: STRING
			-- constraint on units
	
	magnitude: INTERVAL [REAL]
			-- constraint on magnitude
			
	precision: INTERVAL [INTEGER]
			-- constraint on precision. A value of -1 means that precision is unconstrained.

feature -- Status Report
			
	any_magnitude_allowed: BOOLEAN
			-- True if there is no constraint on magnitude
		do
			Result := magnitude = Void
		end
		
	any_precision_allowed: BOOLEAN
			-- True if there is no constraint on precision
		do
			Result := precision = Void
		end
		
invariant
	units_valid: units /= Void and not units.is_empty

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
--| The Original Code is c_quantity_item.e.
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
