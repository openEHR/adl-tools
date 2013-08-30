note
	component:   "openEHR ADL Tools"
	description: "Assertion operator types"
	keywords:    "ADL, assertion"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2005 Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


class OPERATOR_TYPES

feature -- Definitions

	op_type_boolean: STRING = "Boolean"
			-- pseudo-type name for operator returning a boolean value

	op_type_arithmetic: STRING = "Integer"
			-- pseudo-type name for an operator returning an arithmetic value
			-- FIXME: should be "numeric"

	op_eq: Integer = 2001
			-- Equals operator (= or ==)

	op_ne: Integer = 2002
			-- Not equals operator (!= or /= or <>)

	op_le: Integer = 2003
			-- Less-than or equals operator (<=)

	op_lt: Integer = 2004
			-- Less-than operator (<=)

	op_ge: Integer = 2005
			-- Greater-than or equals operator (>=)

	op_gt: Integer = 2006
			-- Greater-than operator (>)

	op_matches: Integer = 2007
			-- Matches operator (matches or is_in)

	op_not: Integer = 2010
			-- Not logical operator

	op_and: Integer = 2011
			-- And logical operator

	op_or: Integer = 2012
			-- Or logical operator

	op_xor: Integer = 2013
			-- Xor logical operator

	op_implies: Integer = 2014
			-- Implies logical operator

	op_for_all: Integer = 2015
			-- For-all quantifier operator

	op_exists: Integer = 2016
			-- Exists quantifier operator

	op_plus: Integer = 2020
			-- Plus operator (+)

	op_minus: Integer = 2021
			-- Minus operator (-)

	op_multiply: Integer = 2022
			-- Multiply operator (*)

	op_divide: Integer = 2023
			-- Divide operator (/)

	op_exp: Integer = 2024
			-- Exponent operator (^)

feature -- Status Report

	valid_operator (an_op: INTEGER): BOOLEAN
			-- Function to test operator values.
		do
			Result := an_op >= op_eq and an_op <= op_exp
		ensure
			an_op >= op_eq and an_op <= op_exp
		end

	valid_operator_name (an_op_name: STRING): BOOLEAN
			-- True if an_op_name is in list of operator names
		do
			Result := operator_values.has (an_op_name)
		end

	boolean_operator (an_op: INTEGER): BOOLEAN
			-- True if an_op can operate on boolean operands
		require
			valid_operator (an_op)
		do
			Result := unary_boolean_operator(an_op) or binary_boolean_operator (an_op)
		end

	unary_boolean_operator (an_op: INTEGER): BOOLEAN
			-- True if an_op is a unary boolean operator
		require
			valid_operator (an_op)
		do
			Result := an_op = op_not
		end

	binary_boolean_operator (an_op: INTEGER): BOOLEAN
			-- True if an_op is a binary boolean operator
		require
			valid_operator(an_op)
		do
			Result := an_op >= op_and and an_op <= op_implies
		end

	relational_operator (an_op: INTEGER): BOOLEAN
			-- True if an_op is a binary operator with COMPARABLE arguments returning a boolean
		require
			valid_operator(an_op)
		do
			Result := an_op >= op_eq and an_op <= op_gt
		end

	unary_arithmetic_operator (an_op: INTEGER): BOOLEAN
			-- True if an_op is a unary arithmetic operator
		require
			valid_operator (an_op)
		do
			Result := an_op = op_minus
		end

	arithmetic_operator (an_op: INTEGER): BOOLEAN
			-- True if an_op is a binary operator with numeric arguments returning a numeric
		require
			valid_operator (an_op)
		do
			Result := binary_arithmetic_operator(an_op)
		end

	binary_arithmetic_operator (an_op: INTEGER): BOOLEAN
			-- True if an_op is a binary operator with numeric arguments returning a numeric
		require
			valid_operator(an_op)
		do
			Result := an_op >= op_plus and an_op <= op_exp
		end

	set_operator (an_op: INTEGER): BOOLEAN
			-- True if an_op is a unary set operator
		require
			valid_operator(an_op)
		do
			Result := an_op = op_matches
		end

	quantifier_operator (an_op: INTEGER): BOOLEAN
			-- True if an_op is a unary quantifier operator
		require
			valid_operator(an_op)
		do
			Result := an_op = op_for_all or an_op = op_exists
		end

feature -- Access

	operator_precedence: HASH_TABLE [INTEGER, INTEGER]
			-- precedence tables as a hash of precedence order keyed by operator id
			-- Use: get the precendence of the two operators you want and compare them
			-- A lower number beats a higher number
		once
			create Result.make (0)
			Result.put(2, op_exp)
			Result.put(3, op_multiply)
			Result.put(3, op_divide)
			Result.put(4, op_plus)
			Result.put(4, op_minus)
			Result.put(6, op_matches)
			Result.put(6, op_le)
			Result.put(6, op_lt)
			Result.put(6, op_ge)
			Result.put(6, op_gt)
			Result.put(7, op_eq)
			Result.put(7, op_ne)
			Result.put(10, op_not)
			Result.put(10, op_for_all)
			Result.put(10, op_exists)
			Result.put(11, op_and)
			Result.put(12, op_or)
			Result.put(12, op_xor)
			Result.put(13, op_implies)
		end

	operator_name (an_op: INTEGER): STRING
		require
			valid_operator (an_op)
		do
			create Result.make_empty
			if attached operator_names.item (an_op) as sym then
				Result.append (sym)
			end
		end

	operator_names: HASH_TABLE [STRING, INTEGER]
			-- english names of operators, keyed by value
		once
			create Result.make(0)
			Result.put("equals", op_eq)
			Result.put("not equals", op_ne)
			Result.put("less than or equals", op_le)
			Result.put("less than", op_lt)
			Result.put("greater than or equals", op_ge)
			Result.put("greater than", op_gt)
			Result.put("matches", op_matches)
			Result.put("not", op_not)
			Result.put("and", op_and)
			Result.put("or", op_or)
			Result.put("xor", op_xor)
			Result.put("implies", op_implies)
			Result.put("for all", op_for_all)
			Result.put("exists", op_exists)
			Result.put("plus", op_plus)
			Result.put("minus", op_minus)
			Result.put("multiply", op_multiply)
			Result.put("divide", op_divide)
			Result.put("exponent", op_exp)
		end

	operator_text_identifier (an_op: INTEGER): STRING
		require
			valid_operator (an_op)
		do
			create Result.make_empty
			if attached operator_text_identifiers.item (an_op) as sym then
				Result.append (sym)
			end
		end

	operator_text_identifiers: HASH_TABLE [STRING, INTEGER]
			-- text names of operators, keyed by value, useful for filenames
		once
			create Result.make(0)
			Result.put("eq", op_eq)
			Result.put("ne", op_ne)
			Result.put("le", op_le)
			Result.put("le", op_lt)
			Result.put("ge", op_ge)
			Result.put("gt", op_gt)
			Result.put("matches", op_matches)
			Result.put("not", op_not)
			Result.put("and", op_and)
			Result.put("or", op_or)
			Result.put("xor", op_xor)
			Result.put("implies", op_implies)
			Result.put("for_all", op_for_all)
			Result.put("exists", op_exists)
			Result.put("plus", op_plus)
			Result.put("minus", op_minus)
			Result.put("multiply", op_multiply)
			Result.put("divide", op_divide)
			Result.put("exponent", op_exp)
		end

	operator_symbol (an_op: INTEGER): STRING
		require
			valid_operator (an_op)
		do
			check attached operator_symbols.item (an_op) as sym then
				Result := sym
			end
		end

	operator_symbols: HASH_TABLE [STRING, INTEGER]
			-- symbols of operators, keyed by value
		once
			create Result.make(0)
			Result.put("=", op_eq)
			Result.put("<>", op_ne)
			Result.put("<=", op_le)
			Result.put("<", op_lt)
			Result.put(">=", op_ge)
			Result.put(">", op_gt)
			Result.put("matches", op_matches)
			Result.put("not", op_not)
			Result.put("and", op_and)
			Result.put("or", op_or)
			Result.put("xor", op_xor)
			Result.put("implies", op_implies)
			Result.put("for_all", op_for_all)
			Result.put("exists", op_exists)
			Result.put("+", op_plus)
			Result.put("-", op_minus)
			Result.put("*", op_multiply)
			Result.put("/", op_divide)
			Result.put("^", op_exp)
		end

	operator_ids_from_symbols: HASH_TABLE [INTEGER, STRING]
			-- symbols of operator id, keyed by text symbol, as would be parsed
		once
			create Result.make(0)
			Result.put(op_eq, "=")
			Result.put(op_ne, "<>")
			Result.put(op_le, "<=")
			Result.put(op_lt, "<")
			Result.put(op_ge, ">=")
			Result.put(op_gt, ">")
			Result.put(op_matches, "matches")
			Result.put(op_not, "not")
			Result.put(op_and, "and")
			Result.put(op_or, "or")
			Result.put(op_xor, "xor")
			Result.put(op_implies, "implies")
			Result.put(op_for_all, "for_all")
			Result.put(op_exists, "exists")
			Result.put(op_plus, "+")
			Result.put(op_minus, "-")
			Result.put(op_multiply, "*")
			Result.put(op_divide, "/")
			Result.put(op_exp, "^")
		end

--	operator_glyphs: HASH_TABLE [STRING_32, INTEGER]
--			-- graphic symbols of operators, keyed by value
--		once
--			create Result.make(0)
--			Result.put("=", op_eq)
--			Result.put({STRING_32} "%/0x2260/", op_ne)		-- U+2260
--			Result.put({STRING_32} "%/0x2264/", op_le)		-- U+2264
--			Result.put("<", op_lt)
--			Result.put({STRING_32} "%/0x2265/", op_ge)		-- U+2265
--			Result.put(">", op_gt)
--			Result.put({STRING_32} "%/0x2208/", op_matches) -- U+2208
--			Result.put({STRING_32} "%/0x00AC/", op_not)	-- U+00AC
--			Result.put({STRING_32} "%/0x2227/", op_and)	-- U+2227
--			Result.put({STRING_32} "%/0x2228/", op_or)		-- U+2228
--			Result.put({STRING_32} "%/0x22BB/", op_xor)	-- U+22BB
--			Result.put({STRING_32} "%/0x21D2/", op_implies) -- U+21D2
--			Result.put({STRING_32} "%/0x2200/", op_for_all) -- U+2200
--			Result.put({STRING_32} "%/0x2203/", op_exists) -- U+2203
--			Result.put("+", op_plus)
--			Result.put("-", op_minus)
--			Result.put("*", op_multiply)
--			Result.put("/", op_divide)
--			Result.put("^", op_exp)
--		end

	operator_values: HASH_TABLE [INTEGER, STRING]
			-- english names of operators, keyed by value
		once
			create Result.make(0)
			Result.compare_objects
			Result.put(op_eq, "equals")
			Result.put(op_ne, "not equals")
			Result.put(op_le, "less than or equals")
			Result.put(op_lt, "less than")
			Result.put(op_ge, "greater than or equals")
			Result.put(op_gt, "greater than")
			Result.put(op_matches, "matches")
			Result.put(op_not, "not")
			Result.put(op_and, "and")
			Result.put(op_or, "or")
			Result.put(op_xor, "xor")
			Result.put(op_implies, "implies")
			Result.put(op_for_all, "for all")
			Result.put(op_exists, "exists")
			Result.put(op_plus, "plus")
			Result.put(op_minus, "minus")
			Result.put(op_multiply, "multiply")
			Result.put(op_divide, "divide")
			Result.put(op_exp, "exponent")
		end

feature -- Comparison

	higher_precedence (op1, op2: INTEGER): BOOLEAN
			-- is `op1' of higher precedence than `op2'?
			-- if they are the same, the result is False
		require
			Op1_valid: valid_operator (op1)
			Op2_valid: valid_operator (op2)
		do
			Result := operator_precedence.item (op1) < operator_precedence.item (op2)
		end

end


