note
	component:   "openEHR ADL Tools"
	description: "Persistent form of EXPR_BINARY_OPERATOR."
	keywords:    "persistence, ADL"
	author:      "Thomas Beale <thomas.beale@openEHR.org>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2025 openEHR International"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


class P_EXPR_BINARY_OPERATOR

inherit
	P_EXPR_OPERATOR

	P_DEFINITIONS
		export {NONE}
			all
		end
		
create
	make

feature -- Initialisation

	make (an_op: EXPR_BINARY_OPERATOR)
		do
			make_operator (an_op)
			left_operand := expression_to_p_expression (an_op.left_operand)
			right_operand := expression_to_p_expression (an_op.right_operand)
		end

feature -- Access

	left_operand: P_EXPRESSION

	right_operand: P_EXPRESSION

feature -- Factory

	create_expression: EXPR_BINARY_OPERATOR
		do
			create Result.make (create {OPERATOR_KIND}.make_from_string (operator), left_operand.create_expression, right_operand.create_expression)
			populate_operator (Result)
		end

end


