indexing
	component:   "openEHR Data Types"

	description: "[
			 Abstract type representing 'scientific' quantities, i.e. quantities expressed 
			 as a single value and a single, optional units.
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

class
	DV_QUANTITY

inherit
	DV_AMOUNT
		redefine
			default_create,
			as_canonical_string
		end

create
	make_from_string,
	make_from_canonical_string,
	make,
	default_create

feature -- Definitions

	default_units: STRING is "m"
			-- Metres.

	default_precision: INTEGER is -1
			-- No limit, i.e. any number of decimal places.

feature {NONE} -- Initialisation

	default_create is
			-- Create a reasonable default object.
		do
			units := default_units.twin
			precision := default_precision
		ensure then
			units_set_to_default: units.same_string (default_units)
			precision_set_to_default: precision = default_precision
		end

	make (a_magnitude: like magnitude; a_units: like units; n: like precision) is
		require
			units_attached: a_units /= Void
			units_not_empty: not a_units.is_empty
			precision_valid: n >= 1
		do
			magnitude := a_magnitude
			set_units (a_units)
			precision := n
		ensure
			magnitude_set: magnitude = a_magnitude
			units_set_else_unchanged: units.string.same_string (old units.string) or units.same_string (a_units)
			precision_set: precision = n
		end

	make_from_string, make_from_canonical_string (str: STRING) is
			-- make from string of form:
			-- <magnitude>real</magnitude>
			-- <units>string</units>
			-- [<accuracy>real</accuracy>
			-- <accuracy_is_percent>boolean</accuracy_is_percent>]
			-- <precision>integer</precision>
		local
			s: STRING
		do
			s := xml_extract_from_tags (str, "magnitude", 1)
			create magnitude
			magnitude.set_item (s.to_double)

			if xml_has_tag (str, "accuracy", 1) then
				s := xml_extract_from_tags (str, "accuracy_is_percent", 1)

				if s.is_boolean then
					accuracy_is_percent := s.to_boolean
				end

				s := xml_extract_from_tags(str, "accuracy", 1)

				if s.is_integer then
					accuracy := s.to_integer
				end
			end

			set_units (xml_extract_from_tags (str, "units", 1))
		end

feature -- Status Report

	valid_canonical_string (str: STRING): BOOLEAN is
			-- True if `str' contains required tags.
		do
			Result := xml_has_tag (str, "magnitude", 1)
		end

	is_integral: BOOLEAN is
			-- True if precision = 0.
		do
			Result := precision = 0
		end

feature -- Access

	magnitude: REAL_REF
			-- Numeric value of the quantity.

	units: STRING
			-- Stringified units, expressed in UCUM unit syntax, e.g. "kg/m2", “mm[Hg]", "ms-1", "km/h".

	precision: INTEGER
			-- Precision  to  which  the  value  of  the  quantity  is expressed, in
			-- terms of number  of  significant  figures. 0 implies no precision.

feature -- Basic Operations

	infix "+" (other: like Current): like Current is
			-- Addition.
			-- FIXME: "infix" is not part of ECMA Eiffel. Use plus alias "+".
		do
			create Result.make (magnitude + other.magnitude, units, precision)
		end

	infix "-" (other: like Current): like Current is
			-- Subtraction.
			-- FIXME: "infix" is not part of ECMA Eiffel. Use minus alias "-".
		do
			create Result.make (magnitude - other.magnitude, units, precision)
		end

	negated alias "-": like Current
			-- Unary minus.
		do
			create Result.make (-magnitude, units.twin, precision)
		ensure
			attached: Result /= Void
			minus_magnitude: (magnitude + Result.magnitude).abs < accuracy
			same_units: units.same_string (Result.units)
			same_precision: precision = Result.precision
		end

feature -- Modification

	set_units (a_units: STRING) is
			-- Set units.
		require
			units_attached: a_units /= Void
			units_not_empty: not a_units.is_empty
		local
			parser: UNITS_PARSER
		do
			create parser.make
			parser.execute (a_units)

			if parser.units /= Void then
				units_impl := parser.units
				units := a_units
			end
		ensure
			units_set_else_unchanged: units.string.same_string (old units.string) or units.same_string (a_units)
		end

	set_precision (n: INTEGER) is
			-- Set precision to `n' decimal places.
		require
			precision_valid: n >= 1
		do
			precision := n
		ensure
			precision_set: precision = n
		end

feature -- Comparison

	is_strictly_comparable_to (other: like Current): BOOLEAN is
			-- two quantities are strictly comparable if they are measuring the same property
			-- Ideally, we would allow different units within the same property, but there is
			-- no converter currently implemented, so we also require that the units are identical
		do
			Result := units_equivalent (units, other.units)
		ensure then
			units_equivalent (units, other.units) implies Result
		end

feature -- Output

	as_canonical_string: STRING is
			-- standardised form of string guaranteed to contain all information
			-- in data item
		do
			Result := Precursor
			Result.append ("<units>" + units + "</units>")
			Result.append ("<precision>" + precision.out + "</precision>")
		end

	magnitude_as_string: STRING is
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

			Result.append (" " + units)
		end

feature {NONE} -- Implementation

	units_impl: UNITS

invariant
	precision_valid: precision >= -1
	units_valid: units /= void and then not units.is_empty

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
--| The Original Code is dv_quantity.e.
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
