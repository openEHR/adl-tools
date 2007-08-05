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

class C_DV_QUANTITY

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

	EXTERNAL_ENVIRONMENT_ACCESS
		export
			{ANY} has_property
		undefine
			default_create
		end

create
	make, make_dt

feature -- Initialisation

	default_create is
			--
		do
			precursor {C_DOMAIN_TYPE}
			rm_type_name := generator
			rm_type_name.remove_head(2) -- remove "C_"
			create representation.make_anonymous(Current)
		ensure then
			Any_allowed: any_allowed
		end

	make is
		do
			default_create
		ensure
			Any_allowed: any_allowed
		end

	make_dt is
			-- make used by DT_OBJECT_CONVERTER
		do
			make
		ensure then
			Any_allowed: any_allowed
		end

feature -- Access

	property: CODE_PHRASE
			-- property

	list: ARRAYED_LIST[C_QUANTITY_ITEM]
			-- list of items constraining magnitude/units pairs

	default_value: QUANTITY is
			-- 	generate a default value from this constraint object
		local
			a_mag: REAL
			a_mag_ivl: INTERVAL[REAL]
			a_prec: INTEGER
			a_prec_ivl: INTERVAL[INTEGER]
 		do
 			if assumed_value /= Void then
 				Result := assumed_value
 			elseif any_allowed then
 				Result := create {QUANTITY}.default_create
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
				Result := create {QUANTITY}.make(a_mag, list.first.units, a_prec)
			else -- property must be the only thing set...
				Result := create {QUANTITY}.make(a_mag, default_units, -1)
 			end
		end

feature -- Modification

	set_property(a_property: CODE_PHRASE) is
			-- set property constraint
		require
			Property_valid: a_property /= Void and has_property (a_property)
		do
			property := a_property
			default_units := units_for_property (a_property).first
		end

	set_assumed_value_from_units_magnitude(a_units: STRING; a_magnitude: REAL; a_precision: INTEGER) is
			-- set `assumed_value'; set precision to -1 if no precision
		require
			Units_valid: a_units /= Void implies not a_units.is_empty
		do
			set_assumed_value(create {QUANTITY}.make(a_magnitude, a_units, a_precision))
		ensure
			assumed_value_set: assumed_value.magnitude = a_magnitude and assumed_value.units = a_units and assumed_value.precision = a_precision
		end

	add_unit_constraint(a_units: STRING; a_magnitude: INTERVAL[REAL]; a_precision: INTERVAL[INTEGER]) is
			-- add a units constraint. Void magnitude means any magnitude allowed
		require
			Units_valid: a_units /= Void and then not a_units.is_empty
			Magnitude_validity: a_magnitude /= Void implies a_units /= Void
		do
			if list = Void then
				create list.make(0)
			end
			list.extend(create {C_QUANTITY_ITEM}.make(a_units, a_magnitude, a_precision))
		end

feature -- Status Report

	any_allowed: BOOLEAN is
			-- True if any value allowed
			-- i.e. no property or list
		do
			Result := list = Void and property = Void
		end

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

	standard_equivalent: C_COMPLEX_OBJECT is
		do
			-- FIXME: to be implemented
		end

feature -- Visitor

	enter_subtree(visitor: C_VISITOR; depth: INTEGER) is
			-- perform action at start of block for this node
		do
			synchronise_to_tree
			visitor.start_c_domain_type(Current, depth)
		end

	exit_subtree(visitor: C_VISITOR; depth: INTEGER) is
			-- perform action at end of block for this node
		do
			visitor.end_c_domain_type(Current, depth)
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

feature -- Implementation

	default_units: STRING
			-- record default units if proerty is set; used to generate a default value

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
