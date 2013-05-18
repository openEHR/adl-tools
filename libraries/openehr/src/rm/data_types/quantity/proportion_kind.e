note
	component:   "openEHR ADL Tools"
	
	description: "[
				 Class of enumeration constants defining types of proportion for the DV_PROPORTION class.
				 ]"
	keywords:    "Reference range for ordered data items"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2006 The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


class PROPORTION_KIND

feature -- Definitions

	pk_ratio: INTEGER = 0	
			-- Ratio type. Numerator and denominator may be any value

	pk_unitary: INTEGER = 1	
			-- Denominator must be 1

	pk_percent: INTEGER = 2	
			-- Denominator is 100, numerator is understood as a percentage value.

	pk_fraction: INTEGER = 3	
			-- Numerator and denominator are integral, and the presentation method uses a slash, e.g. ¿1/2¿.

	pk_integer_fraction: INTEGER = 4	
			-- Numerator and denominator are integral, and the presentation method uses a slash, e.g. ¿1/2¿; 
			-- if the numerator is greated than the denominator, e.g. n=3, d=2, the presentation is ¿1 1/2¿.

feature -- Validity

	valid_proportion_kind (n: INTEGER): BOOLEAN
			-- True if n is one of the defined types.
		do
			Result := n >= pk_ratio and n <= pk_integer_fraction
		end

end

