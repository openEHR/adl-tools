indexing
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

class C_QUANTITY

inherit
	C_DOMAIN_TYPE
		redefine
			default_create --, synchronise_to_tree
		end

	TYPE_UTILITIES
		export
			{NONE} all
		undefine
			default_create
		end
		
create
	make

feature -- Initialisation
		
	default_create is
			-- 
		do
			precursor {C_DOMAIN_TYPE}
			rm_type_name := generator
			rm_type_name.remove_head(2) -- remove "C_"
			create list.make(0)
			create representation.make_anonymous(Current)
		end
		
	make is
		do
			default_create
		end
		
feature -- Access

	property: STRING
			-- property: FIXME: should be a CODE_PHRASE
	
	list: ARRAYED_LIST[C_QUANTITY_ITEM]
			-- list of items constraining magnitude/units pairs
			
	standard_equivalent: C_COMPLEX_OBJECT is
		do
			-- FIXME: to be implemented
		end
		
	default_value: QUANTITY is
			-- 	generate a default value from this constraint object
		local
			a_mag: REAL
			a_mag_ivl: OE_INTERVAL[REAL]
 		do
 			if assumed_value /= Void then
 				Result := assumed_value
 			else
				a_mag_ivl := list.first.magnitude
 				if a_mag_ivl /= Void then
					if not a_mag_ivl.lower_unbounded then
						a_mag := a_mag_ivl.upper
					elseif not a_mag_ivl.upper_unbounded then
						a_mag := a_mag_ivl.lower
					else
						a_mag := 0.0 
					end
				end
 			end
			Result := create {QUANTITY}.make(a_mag, list.first.units)
		end

feature -- Modification
	
	set_property(a_property: STRING) is
			-- set property constraint
		require
			Property_valid: a_property /= Void and then not a_property.is_empty
		do
			property := a_property
		end

feature -- Modification

	set_assumed_value_from_units_magnitude(a_units: STRING; a_magnitude: REAL) is
			-- set `assumed_value'
		require
			Units_valid: a_units /= Void implies not a_units.is_empty
		do
			assumed_value := create {QUANTITY}.make(a_magnitude, a_units)
		ensure
			assumed_value_set: assumed_value.magnitude = a_magnitude and assumed_value.units = a_units
		end
	
	add_unit_constraint(a_units: STRING; a_magnitude: OE_INTERVAL[REAL]) is
			-- add a units constraint. Void magnitude means any magnitude allowed
		require
			Units_valid: a_units /= Void and then not a_units.is_empty
			Magnitude_validity: a_magnitude /= Void implies a_units /= Void
		do
			list.extend(create {C_QUANTITY_ITEM}.make(a_units, a_magnitude))
		end
	
feature -- Status Report

	valid_value (a_value: like default_value): BOOLEAN is 
		do
			-- FIXME: to be implemented
			Result := any_allowed or else True
		end
		
feature -- Conversion

	as_string: STRING is
			-- 
		do
			create Result.make (0)
		end

feature -- Serialisation

	enter_block(serialiser: CONSTRAINT_MODEL_SERIALISER; depth: INTEGER) is
			-- perform serialisation at start of block for this node
		do
			synchronise_to_tree
			serialiser.start_c_domain_type(Current, depth)
		end
		
	exit_block(serialiser: CONSTRAINT_MODEL_SERIALISER; depth: INTEGER) is
			-- perform serialisation at end of block for this node
		do
			serialiser.end_c_domain_type(Current, depth)
		end

feature {DT_OBJECT_CONVERTER} -- Conversion

	persistent_attributes: ARRAYED_LIST[STRING] is
			-- list of attribute names to persist as DT structure
			-- empty structure means all attributes
		once
			create Result.make(0)
			Result.extend("property")
			Result.extend("list")
			Result.extend("assumed_value")
			Result.compare_objects
		end

invariant
	list_validity: list /= Void
	property_valid: property /= Void implies not property.is_empty
	
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
