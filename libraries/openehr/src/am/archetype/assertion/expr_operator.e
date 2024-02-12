note
	component:   "openEHR ADL Tools"
	description: "node in ADL parse tree"
	keywords:    "test, ADL"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2003- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"
	void_safety: "initial"

deferred class EXPR_OPERATOR

inherit
	OPERATOR_TYPES
		export
			{NONE} all
		end
	EXPRESSION

feature -- Initialisation

	make (an_op: OPERATOR_KIND)
   		do
			operator := an_op

			-- this should be replaced by code that infers typs properly from operands
			if boolean_operator (an_op.value) or relational_operator (an_op.value) or set_operator (an_op.value) then
				type := op_type_boolean
			elseif arithmetic_operator (an_op.value) then
				type := op_type_arithmetic
			end
		end

feature -- Access

	operator: OPERATOR_KIND

	precedence_overridden: BOOLEAN

feature -- Comparison

	precedence_overrides (other: EXPR_OPERATOR): BOOLEAN
		do
			Result := higher_precedence (operator.value, other.operator.value)
		end

feature -- Modification

	override_precedence
			-- override natural precedence
		do
			precedence_overridden := True
		ensure
			precedence_overridden
		end

end


