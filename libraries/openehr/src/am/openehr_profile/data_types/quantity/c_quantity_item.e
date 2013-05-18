note
	component:   "openEHR ADL Tools"
	description: "Magnitude/unit constrainer item for C_QUANTITY"
	keywords:    "quantity, archetype, clinical type, ADL"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2004- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class C_QUANTITY_ITEM

create
	make

feature -- Initialisation

	make (a_units: STRING; a_magnitude: detachable INTERVAL [REAL]; a_precision: detachable INTERVAL [INTEGER])
			-- add a units constraint. Void magnitude means any magnitude allowed
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

	magnitude: detachable INTERVAL [REAL]
			-- constraint on magnitude

	precision: detachable INTERVAL [INTEGER]
			-- constraint on precision. A value of -1 means that precision is unconstrained.

feature -- Status Report

	any_magnitude_allowed: BOOLEAN
			-- True if there is no constraint on magnitude
		do
			Result := not attached magnitude
		end

	any_precision_allowed: BOOLEAN
			-- True if there is no constraint on precision
		do
			Result := not attached precision
		end

feature -- Comparison

	node_conforms_to (other: like Current): BOOLEAN
			-- True if this node is a subset, i.e. a redefinition of, `other' in the ADL constraint sense, i.e. that all
			-- aspects of the definition of this node and all child nodes define a narrower, wholly
			-- contained instance space of `other'.
			-- Returns False if they are the same, or if they do not correspond
		do
			Result := units.same_string (other.units)
			if Result then
				if attached magnitude as mag and attached other.magnitude as other_mag then
					Result := other_mag.contains (mag)
				else
					Result := not attached magnitude
				end
			end
		end

invariant
	units_valid: not units.is_empty

end


