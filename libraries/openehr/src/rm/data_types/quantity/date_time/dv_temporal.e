note
	component:   "openEHR ADL Tools"

	description: "[
			 Abstract temporal notion
			 ]"
	keywords:    "date, time"

	requirements:"ISO 18308 TS V1.0 STR 3.7"
	design:      "openEHR Data Types Reference Model 1.7"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.com>"
	copyright:   "Copyright (c) 2011 The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


deferred class DV_TEMPORAL

inherit
	DV_ABSOLUTE_QUANTITY

feature -- Comparison

	diff (other: like Current): DV_DURATION
			-- Difference of two temporal quantities.
		deferred
		end

end


