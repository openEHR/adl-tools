note
	component:   "openEHR Archetype Project"
	description: "Type to represent ordinal pairs in ADL 1.4 archetypes during parsing."
	keywords:    "ordinal, ADL"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2003- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class ORDINAL

create
	make

feature -- Initialisation

	make (a_value: INTEGER; a_symbol_code: STRING)
			-- set value & symbol
		do
			value := a_value
			symbol := a_symbol_code
		ensure
			Value_set: value = a_value
			Symbol_set: symbol = a_symbol_code
		end

feature -- Access

	value: INTEGER

	symbol: STRING

end

