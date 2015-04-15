note
	component:   "openEHR ADL Tools"
	description: "Assertion operator instance"
	keywords:    "ADL, assertion"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2005 Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"
	void_safety: "initial"


class OPERATOR_KIND

inherit
	OPERATOR_TYPES
		redefine
			out
		end

create
	make, make_from_string

feature -- Initialisation

	make (an_op: INTEGER)
			-- make from operator code
		require
			valid_operator: valid_operator (an_op)
		do
			value := an_op
		end

	make_from_string (an_op_name: STRING)
			-- make from operator name
		require
			valid_operator_name: valid_operator_name (an_op_name)
		do
			value := operator_values.item (an_op_name)
		end

feature -- Access

	value: INTEGER
			-- Actual value of this instance

feature -- Output

	out: STRING
			-- output symbolic form
		do
			Result := as_string_symbol
		end

	as_string_symbol: STRING
			-- output symbolic form, e.g. "="
		do
			create Result.make_from_string (operator_symbol (value))
		end

	as_string_name: STRING
			-- output word form e.g. "equals"
		do
			create Result.make_from_string (operator_name (value))
		end

	as_text_symbol: STRING
			-- output word form e.g. "equals"
		do
			create Result.make_from_string (operator_text_identifier (value))
		end

invariant
	Validity: valid_operator (value)

end


