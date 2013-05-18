note
	component:   "openEHR ADL Tools"
	description: "Generic visitor class for ASSERTION objects"
	keywords:    "visitor, assertion expressions"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2008- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

deferred class EXPR_VISITOR

feature -- Visitor

	start_assertion (a_node: ASSERTION; depth: INTEGER)
			-- enter an ASSERTION
		do
		end

	end_assertion (a_node: ASSERTION; depth: INTEGER)
			-- exit an ASSERTION
		do
		end

	start_expr_binary_operator (a_node: EXPR_BINARY_OPERATOR; depth: INTEGER)
			-- enter an EXPR_BINARY_OPERATOR
		do
		end

	end_expr_binary_operator (a_node: EXPR_BINARY_OPERATOR; depth: INTEGER)
			-- exit an EXPR_BINARY_OPERATOR
		do
		end

	start_expr_unary_operator (a_node: EXPR_UNARY_OPERATOR; depth: INTEGER)
			-- enter an EXPR_UNARY_OPERATOR
		do
		end

	end_expr_unary_operator (a_node: EXPR_UNARY_OPERATOR; depth: INTEGER)
			-- exit an EXPR_UNARY_OPERATOR
		do
		end

	start_expr_leaf (a_node: EXPR_LEAF; depth: INTEGER)
			-- enter an EXPR_LEAF
		do
		end

	end_expr_leaf (a_node: EXPR_LEAF; depth: INTEGER)
			-- exit an EXPR_LEAF
		do
		end

feature -- Finalisation

	finalise
			-- finalise after all nodes visited
		do
			-- assume nothing; override in descendants
		end

end


