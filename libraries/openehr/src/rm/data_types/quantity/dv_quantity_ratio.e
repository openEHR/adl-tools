note
	component:   "openEHR ADL Tools"

	description: "[
				 Used for recording formulations, e.g. specified administration dosages (e.g. 5 mg / 100 ml),
				 drug amounts based on body weight (e.g. 1 tablet / 10 kg). Not used for pure ratios; use
				 DV_RATIO.
				 ]"
	keywords:    "quantity, ratio, data"

	requirements:"ISO 18308 TS V1.0 STR 3.6"
	design:      "openEHR Data Types Reference Model 1.7"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2000-2004 The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


class DV_QUANTITY_RATIO


inherit
	DATA_VALUE
		redefine
			default_create
		end

create 
	default_create,
	make,
	make_from_string,
	make_from_canonical_string

feature -- Initialization
	
	make_from_string(str:STRING)
		do
		end

	make_from_canonical_string(str:STRING)
		do
		end

	default_create
		local
			q1, q2: DV_QUANTITY
		do
			create q1.default_create
			create q2.default_create
			numerator := q1
			denominator := q2
		ensure then
			value_default: numerator.magnitude = 0 and denominator.magnitude = 0
		end

	make (num, denom: DV_QUANTIFIED)
		require
			numerator_exists: num /= void
			denominator_exists: denom /= void
		do
			numerator := num
			denominator := denom
		ensure
			numerator_set: numerator = num
			denominator_set: denominator = denom
		end

feature -- Status Report

	valid_canonical_string(str: STRING): BOOLEAN
			-- True if str contains required tags
		do
		end

feature -- Access

	numerator: DV_QUANTIFIED
			-- numerator of ratio

	denominator: DV_QUANTIFIED
			-- denominator of ratio
	
feature -- Output

	as_string: STRING
			-- string form displayable for humans
		do
			Result := numerator.as_string + ":" + denominator.as_string
		end
	
	as_canonical_string: STRING
			-- Output in form of string of form "<numerator>" + numerator.as_canonical_string + "</numerator>" +
			--	"<denominator>" + denominator.as_canonical_string + "</denominator>" 
		do
			Result := "<numerator>" + numerator.as_canonical_string + "</numerator>" +
				"<denominator>" + denominator.as_canonical_string + "</denominator>" 
		end
	
invariant
	Numerator_exists: numerator /= Void
	Denominator_exists: denominator /= Void

end


