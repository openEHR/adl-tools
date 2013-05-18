note
	component:   "openEHR ADL Tools"
	description: "FIXME: temporary type for ORDINAL until reconciled with DV_ORDINAL"
	keywords:    "ordinal, ADL"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2003- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class ORDINAL

inherit
	ANY
		redefine
			out
		end

create
	make

feature -- Definitions

	Separator: CHARACTER = '|'
			-- separates each value from its code-phrase

feature -- Initialisation

	make (a_value: INTEGER; a_symbol: CODE_PHRASE)
			-- set value & symbol
		do
			value := a_value
			symbol := a_symbol
		ensure
			Value_set: value = a_value
			Symbol_set: symbol = a_symbol
		end

feature -- Access

	value: INTEGER

	symbol: CODE_PHRASE

feature -- Conversion

	as_string: STRING
			--
		do
			create Result.make(0)
			Result.append (value.out + Separator.out + "[" + symbol.as_string + "]")
		end

	out: STRING
			--
		do
			Result := as_string
		end

end


