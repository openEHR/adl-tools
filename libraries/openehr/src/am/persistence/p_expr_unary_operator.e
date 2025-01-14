note
	component:   "openEHR ADL Tools"
	description: "Persistent form of EXPR_UNARY_OPERATOR."
	keywords:    "persistence, ADL"
	author:      "Thomas Beale <thomas.beale@openEHR.org>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2025 openEHR International"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


class P_EXPR_UNARY_OPERATOR

inherit
	P_EXPR_OPERATOR

	P_DEFINITIONS
		export {NONE}
			all
		end
		
create
	make

feature -- Initialisation

	make (an_op: EXPR_UNARY_OPERATOR)
		do
			make_operator(an_op)
			operand := expression_to_p_expression (an_op.operand)
		end

feature -- Access

	operand: P_EXPRESSION

feature -- Factory

	create_expression: EXPR_UNARY_OPERATOR
		do
			create Result.make (create {OPERATOR_KIND}.make_from_string (operator), operand.create_expression)
			populate_operator (Result)
		end

end


