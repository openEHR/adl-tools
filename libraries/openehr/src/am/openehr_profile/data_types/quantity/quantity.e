indexing
	component:   "openEHR Archetype Project"
	description: "FIXME: temporary type for QUANTITY until reconciled with DV_QUANTITY"
	keywords:    "quantity, ADL"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2003-2005 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class QUANTITY

inherit
	ANY
		redefine
			default_create
		end

create
	make, default_create

feature -- Definitions

	Default_units: STRING is "m"
			-- metres

	Default_precision: INTEGER is -1

feature -- Initialisation

	default_create is
			-- create a reasonable default object
		do
			units := Default_units.twin
			precision := Default_precision
		ensure then
			precision = Default_precision
		end

	make(a_magnitude: REAL; a_units: STRING; a_precision: INTEGER) is
			-- set magnitude and units; precision should be set to -1 if no precision
		require
			Units_valid: a_units /= Void implies not a_units.is_empty
		do
			magnitude := a_magnitude
			units := a_units
			precision := a_precision
		ensure
			Magnitude_set: magnitude = a_magnitude
			Units_set: units = a_units
			Precision_set: precision = a_precision
		end

feature -- Access

	magnitude: REAL

	units: STRING

	precision: INTEGER

feature -- Conversion

	magnitude_as_string: STRING
			-- The magnitude in its natural form.
		local
			formatter: FORMAT_DOUBLE
		do
			if precision = default_precision then
				Result := magnitude.out
			else
				create formatter.make (precision.max (50), precision)
				Result := formatter.formatted (magnitude.to_double)
			end

			if units /= Void then
				Result.append (" " + units)
			end
		end

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
--| The Original Code is cadl_object_ordinal.e.
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
