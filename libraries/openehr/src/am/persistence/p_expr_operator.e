note
	component:   "openEHR ADL Tools"
	description: "Persistent form of EXPR_OPERATOR."
	keywords:    "persistence, ADL"
	author:      "Thomas Beale <thomas.beale@openEHR.org>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2025 openEHR International"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


deferred class P_EXPR_OPERATOR

inherit
	P_EXPRESSION

feature -- Initialisation

	make_operator (an_op: EXPR_OPERATOR)
		do
			operator := an_op.operator.as_string_name
			precedence_overridden := an_op.precedence_overridden
			type := an_op.type
		end

feature -- Access

	operator: STRING

	precedence_overridden: BOOLEAN

feature -- Factory

	populate_operator (an_op: EXPR_OPERATOR)
		do
			if precedence_overridden then
				an_op.override_precedence
			end
		end

end


