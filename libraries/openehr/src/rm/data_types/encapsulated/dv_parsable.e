note
	component:   "openEHR ADL Tools"
	description: "[
			 Encapsulated data expressed as a parsable STRING. The internal model of the data item 
			 is not described in the openEHR model in common with other encapsulated types, but in 
			 this case, the form of the data is assumed to be plaintext, rather than compressed or 
			 other types of large binary data.
			 ]"
	keywords:    "encapsulated, data, parsed"

	requirements:"ISO 18308 TS V1.0 STR ??"
	design:      "openEHR Data Types Reference Model 1.7"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2000-2004 The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


class DV_PARSABLE

inherit
	DV_ENCAPSULATED

create
	make

feature -- Initialization

	make (a_value, a_formalism: STRING)
		require
			Value_valid: not a_value.is_empty
			Formalism_valid: not a_formalism.is_empty
		do
			value := a_value
			formalism := a_formalism
		end

	make_from_string (str: STRING)
		do
		end

feature -- Access

	value: STRING
			-- the string, which may validly be empty in some syntaxes
        attribute
            create Result.make_empty
        end

	formalism: STRING
			-- name of the formalism, e.g. “GLIF 1.0”, “proforma” etc.
        attribute
            create Result.make_empty
        end

feature -- Output

	as_string: STRING
			-- string form displayable for humans
		do
			create Result.make_empty
			Result.append (value)
			Result.append ("::")
			Result.append (formalism)
		end

invariant
	formalism_exists: not formalism.is_empty

end



