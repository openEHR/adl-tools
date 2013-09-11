note
	component:   "openEHR ADL Tools"
	description: "Unit definition/exponent atom, as used in units"
	keywords:    "units"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2003 Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


class UNITS_ITEM

inherit
	ANY
		redefine
			out
		end

create
	make

feature -- Initialisation

	make(a_unit:UNIT_REFERENCE; an_exponent:INTEGER)
		require
			Unit_exists: a_unit /= Void
		do
			unit := a_unit
			exponent := an_exponent
		end

feature -- Access

	unit: UNIT_REFERENCE

	exponent:INTEGER

feature -- Modify

	set_exponent(i:INTEGER)
		do
			exponent := i
		end

feature -- Output

	out:STRING
		do
			create Result.make(0)
			Result.append(unit.out)
			if exponent /= 1 then
				Result.append(" ^ ")
				Result.append_integer(exponent)
			end
		end

end


