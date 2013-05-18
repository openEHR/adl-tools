
note
	component:   "openEHR ADL Tools"

	description: "[
				 Abstract class defining the concept of quantified entities whose 
				 values are absolute with respect to an origin. Dates and Times 
				 are the main example.
				 ]"
	keywords:    "quantity, data"

	design:      "openEHR Data Types Reference Model 1.7"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2000- The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

deferred class DV_ABSOLUTE_QUANTITY

inherit
	DV_QUANTIFIED

feature -- Access

	accuracy: detachable like diff
			-- Accuracy of measurement, expressed as a half-range value of the diff type
			-- for this quantity (i.e. an accuracy of x means +/-x).

feature -- Basic Operations

	add (a_diff: like diff): like Current
			-- Addition of a differential amount to this quantity.
		deferred
		end

	subtract (a_diff: like diff): like Current
			-- Result of subtracting a differential amount from this quantity.
		deferred
		end

	diff (a_diff: like Current): ANY
			-- Difference of two quantities.
		deferred
		end

end


