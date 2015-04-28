note
	component:   "openEHR ADL Tools"
	description: "[
				 Abstract class defining the concept of true quantified values, i.e. values which are 
				 not only ordered, but which have a precise magnitude.
				 ]"
	keywords:    "data, quantified, quantity"
	design:      "openEHR Data Types Reference Model 1.7"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2000- The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

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

	magnitude_status: detachable STRING
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

	valid_magnitude_status (s: STRING): BOOLEAN
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
	Magnitude_status_valid: attached magnitude_status as ms implies valid_magnitude_status (ms)

end


