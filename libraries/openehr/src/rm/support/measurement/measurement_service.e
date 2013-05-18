note
	component:   "openEHR ADL Tools"
	description: "Simple measurement service interface definition"
	keywords:    "measurement, units"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2000- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class MEASUREMENT_SERVICE

inherit
	SHARED_TERMINOLOGY_SERVICE

feature -- Access

	units_for_property (a_property: CODE_PHRASE): ARRAYED_LIST[STRING]
			-- return list of units for this property
		require
			has_property (a_property)
		do
			-- FIXME: to be implemented
			create Result.make (0)
			Result.extend ("m")
		end

feature -- Status Report

	has_property (a_property: CODE_PHRASE): BOOLEAN
			-- True if a_property known in property list
		do
			-- FIXME: to be implemented
			Result := True
		end

feature -- Comparison

	is_valid_units_string (units: STRING): BOOLEAN
			-- True if the units string ‘units’ is a valid string according to the UCUM specification [8].
		do
		end

	units_equivalent (units1, units2: STRING): BOOLEAN
			-- True if two units strings correspond to the same measured property.
		require
			is_valid_units_string (units1)
			is_valid_units_string (units2)
		do
		end

end



