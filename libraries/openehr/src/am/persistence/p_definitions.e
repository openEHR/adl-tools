note
	component:   "openEHR ADL Tools"
	description: "Definitions and utilities for P_XXX classess."
	keywords:    "archetype, persistence"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2011- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class P_DEFINITIONS

feature -- Factory

	expression_to_p_expression (an_expr: EXPRESSION): P_EXPRESSION
		do
			if attached {EXPR_ARCHETYPE_REF} an_expr as expr then
				create {P_EXPR_ARCHETYPE_REF} Result.make (expr)
			elseif attached {EXPR_ARCHETYPE_ID_CONSTRAINT} an_expr as expr then
				create {P_EXPR_ARCHETYPE_ID_CONSTRAINT} Result.make (expr)
			elseif attached {EXPR_CONSTRAINT} an_expr as expr then
				create {P_EXPR_CONSTRAINT} Result.make (expr)
			elseif attached {EXPR_BINARY_OPERATOR} an_expr as expr then
				create {P_EXPR_BINARY_OPERATOR} Result.make (expr)
			elseif attached {EXPR_UNARY_OPERATOR} an_expr as expr then
				create {P_EXPR_UNARY_OPERATOR} Result.make (expr)
			elseif attached {EXPR_LITERAL} an_expr as expr then
				create {P_EXPR_LITERAL} Result.make (expr)
			else
				create {P_EXPR_LITERAL} Result
			end
		end

end

