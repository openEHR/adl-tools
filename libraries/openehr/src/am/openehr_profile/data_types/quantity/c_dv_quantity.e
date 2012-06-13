note
	component:   "openEHR Archetype Project"
	description: "Object node type representing constraint on QUANTITY"
	keywords:    "quantity, archetype, clinical type, ADL"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2004 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class C_DV_QUANTITY

inherit
	C_DOMAIN_TYPE
		redefine
			enter_subtree, exit_subtree, node_conforms_to
		end

	EXTERNAL_ENVIRONMENT_ACCESS
		export
			{ANY} has_property
		undefine
			default_create
		end

create
	make, make_dt

feature -- Access

	property: detachable CODE_PHRASE
			-- property

	list: detachable ARRAYED_LIST [C_QUANTITY_ITEM]
			-- list of items constraining magnitude/units pairs

	prototype_value: attached QUANTITY
			-- Generate a default value from this constraint object.
			-- FIXME: This should be of type DV_QUANTITY.
		local
			a_mag: REAL
			a_mag_ivl: INTERVAL [REAL]
			a_prec: INTEGER
			a_prec_ivl: INTERVAL [INTEGER]
 		do
 			if assumed_value /= Void then
 				Result := assumed_value
 			elseif any_allowed then
 				create Result
 			elseif list /= Void then
				a_mag_ivl := list.first.magnitude

 				if a_mag_ivl /= Void then
					if not a_mag_ivl.lower_unbounded then
						a_mag := a_mag_ivl.upper
					elseif not a_mag_ivl.upper_unbounded then
						a_mag := a_mag_ivl.lower
					else
						-- a_mag := 0.0
					end
				end

				a_prec_ivl := list.first.precIsion

 				if a_prec_ivl /= Void then
					if not a_prec_ivl.lower_unbounded then
						a_prec := a_prec_ivl.upper
					elseif not a_prec_ivl.upper_unbounded then
						a_prec := a_prec_ivl.lower
					else
						-- a_prec := 0.0
					end
				end

				create Result.make (a_mag, list.first.units, a_prec)
			else -- property must be the only thing set...
				create Result.make (a_mag, default_units, -1)
 			end
		end

feature -- Statistics

	constrained_rm_attributes: attached ARRAYED_SET [STRING]
			-- report which attributes of the equivalent DV_QUANTITY are being constrained here
		do
			create Result.make(0)
			Result.compare_objects
			if attached list then
				Result.extend ("units")
				from list.start until list.off loop
					if attached list.item.magnitude then
						Result.extend ("magnitude")
					end
					if attached list.item.precision then
						Result.extend ("precision")
					end
					list.forth
				end
			end
		end

feature -- Modification

	set_property (a_property: attached CODE_PHRASE)
			-- set property constraint
		require
			Property_valid: has_property (a_property)
		do
			property := a_property
			default_units := units_for_property (a_property).first
		end

	set_list (an_list: attached ARRAYED_LIST [C_QUANTITY_ITEM])
		do
			list := an_list
		ensure
			list = an_list
		end

	set_assumed_value_from_units_magnitude (a_units: STRING; a_magnitude: REAL; a_precision: INTEGER)
			-- Set `assumed_value'; set precision to -1 if no precision.
		require
			Units_valid: a_units /= Void implies not a_units.is_empty
		do
			set_assumed_value (create {like assumed_value}.make (a_magnitude, a_units, a_precision))
		ensure
			assumed_value_set: assumed_value.magnitude = a_magnitude and assumed_value.units = a_units and assumed_value.precision = a_precision
		end

	add_unit_constraint (a_units: attached STRING; a_magnitude: INTERVAL [REAL]; a_precision: INTERVAL [INTEGER])
			-- add a units constraint. Void magnitude means any magnitude allowed
		require
			Units_valid: not a_units.is_empty
			Magnitude_validity: attached a_magnitude implies attached a_units
		do
			if list = Void then
				create list.make (0)
			end

			list.extend (create {C_QUANTITY_ITEM}.make (a_units, a_magnitude, a_precision))
		end

feature -- Status Report

	any_allowed: BOOLEAN
			-- True if any value allowed
			-- i.e. no property or list
		do
			Result := list = Void and property = Void
		end

	valid_value (a_value: like prototype_value): BOOLEAN
		do
			-- FIXME: to be implemented
			Result := any_allowed or else True
		end

feature -- Comparison

	node_conforms_to (other: like Current; an_rm_schema: BMM_SCHEMA): BOOLEAN
			-- True if this node is a subset, i.e. a redefinition of, `other' in the ADL constraint sense, i.e. that all
			-- aspects of the definition of this node and all child nodes define a narrower, wholly
			-- contained instance space of `other'.
			-- Returns False if they are the same, or if they do not correspond
		local
			other_item: C_QUANTITY_ITEM
			fail: BOOLEAN
		do
			if precursor(other, an_rm_schema) then
				if other.any_allowed then
					Result := True
				elseif not any_allowed then
					if (property = Void and other.property = Void) or else property.is_equal (other.property) then
						if (list = Void and other.list = Void) then
							Result := True
						elseif list /= Void and other.list /= Void and list.count <= other.list.count then
							from list.start until list.off or fail loop
								other_item := other.list_item_by_units (list.item.units)
								if not attached other_item or else  -- there was no item in `other' matching this unit in Current
									attached other_item.magnitude and then not other_item.magnitude.contains (list.item.magnitude)
								then
									fail := True
								end
								list.forth
							end
							Result := list.off
						end
					end
				end
			end
		end

feature -- Conversion

	as_string: STRING
			--
		do
			create Result.make_empty
		end

	standard_equivalent: C_COMPLEX_OBJECT
		do
			-- FIXME: to be implemented
		end

feature -- Visitor

	enter_subtree (visitor: C_VISITOR; depth: INTEGER)
			-- perform action at start of block for this node
		do
            Precursor (visitor, depth)
			visitor.start_c_quantity (Current, depth)
		end

	exit_subtree(visitor: C_VISITOR; depth: INTEGER)
			-- perform action at end of block for this node
		do
            precursor(visitor, depth)
			visitor.end_c_quantity(Current, depth)
		end

feature {DT_OBJECT_CONVERTER} -- Conversion

	persistent_attributes: ARRAYED_LIST[STRING]
			-- list of attribute names to persist as DT structure
			-- empty structure means all attributes
		once
			create Result.make (0)
			Result.compare_objects
			Result.extend ("node_id")
			Result.extend ("property")
			Result.extend ("list")
			Result.extend ("assumed_value")
		end

feature -- Implementation

	default_units: detachable STRING
			-- record default units if property is set; used to generate a default value

	list_item_by_units (a_units: attached STRING): detachable C_QUANTITY_ITEM
			-- return item from `list' whose units match a_units' or else Void
		require
			a_units_valid: not a_units.is_empty
		do
			from list.start until list.off or list.item.units.is_equal (a_units) loop
				list.forth
			end

			if not list.off then
				Result := list.item
			end
		end

invariant
	Items_valid: list /= Void implies not list.is_empty
--	Property_valid: property /= Void implies terminology(Terminology_id_openehr).has_code_for_group_id (Group_id_measurable_properties, property)
	Overall_validity: (list /= Void or property /= Void) xor any_allowed

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
--| The Original Code is cadl_object_term.e.
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
