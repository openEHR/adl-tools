note
	component:   "openEHR ADL Tools"
	description: "[
			 ADL expression tree constraint - consists of either an 
			 expression (to be evaluated) or the result, i.e. as if
			 already evaluated
			 ]"
	keywords:    "test, ADL"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2003 Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


class ADL_EXPR_CONSTRAINT

feature -- Access

	eval_result: ANY
			-- constraint on result of evaluation of an expression

	expression: EXPR_ITEM
			-- constraint expressed in the form of an expression

feature -- Modification

	set_eval_result(v:ANY)
		require
			Exists: v /= Void
		do
			eval_result := v
		end

	set_expression(e: EXPR_ITEM)
		require
			Exists: e /= Void
		do
			expression := e
		end

end


