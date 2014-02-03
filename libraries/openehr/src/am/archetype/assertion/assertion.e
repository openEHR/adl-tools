note
	component:   "openEHR ADL Tools"
	description: "ADL assertion"
	keywords:    "test, ADL"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2003 Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"
	void_safety: "initial"


class ASSERTION

inherit
	BASIC_DEFINITIONS

	OPERATOR_TYPES
		export
			{NONE} all
		end

	EXPR_ITEM

create
	make

feature -- Initialisation

	make (an_expr: EXPR_ITEM; a_tag: detachable STRING)
			-- make assertion with an expression and an optional tag
		require
			Tag_valid: attached a_tag implies not a_tag.is_empty
   		do
			tag := a_tag
			expression := an_expr
			an_expr.set_parent (Current)
			type := op_type_boolean
		end

feature -- Access

	tag: detachable STRING
			-- tag name of assertion

	expression: EXPR_ITEM

	extract_regex: detachable STRING
			-- extract regex from assertion of form:
			-- 'id matches {/regex/}'
		do
			if attached {EXPR_BINARY_OPERATOR} expression as bin_op and then bin_op.operator.value = op_matches and then
				attached {EXPR_LEAF} bin_op.right_operand as rhs and then
				attached {C_STRING} rhs.item as c_str
			then
				Result := c_str.constraint.first
			end
		end

feature -- Status Report

	matches_any: BOOLEAN
			-- True if the regex = {/.*/} i.e. matches anything
		do
			Result := attached extract_regex as att_regex and then att_regex.is_equal (Regex_any_pattern)
		end

feature -- Output

	as_string: STRING
			-- generate string version
		do
			Result := expression.as_string
		end

feature -- Visitor

	enter_subtree (visitor: EXPR_VISITOR; depth: INTEGER)
			-- perform action at start of block for this node
		do
			visitor.start_assertion (Current, depth)
		end

	exit_subtree (visitor: EXPR_VISITOR; depth: INTEGER)
			-- perform action at end of block for this node
		do
			visitor.end_assertion (Current, depth)
		end

invariant
	Tag_valid: attached tag implies not tag.is_empty

end


