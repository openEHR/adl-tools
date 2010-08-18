note
	component:   "openEHR Archetype Project"
	description: "Assertion operator types"
	keywords:    "ADL, assertion"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2005 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class OPERATOR_TYPES

feature -- Definitions

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

	valid_operator_name(an_op_name: STRING): BOOLEAN
			-- True if an_op_name is in list of operator names
		do
			Result := operator_values.has(an_op_name)
		end

	boolean_operator(an_op: INTEGER): BOOLEAN
			-- True if an_op can operate on boolean operands
		require
			valid_operator(an_op)
		do
			Result := unary_boolean_operator(an_op) or binary_boolean_operator(an_op)
		end
		
	unary_boolean_operator(an_op: INTEGER): BOOLEAN
			-- True if an_op is a unary boolean operator
		require
			valid_operator(an_op)
		do
			Result := an_op = op_not
		end
		
	binary_boolean_operator(an_op: INTEGER): BOOLEAN
			-- True if an_op is a binary boolean operator
		require
			valid_operator(an_op)
		do
			Result := an_op >= op_and and an_op <= op_implies
		end
		
	relational_operator(an_op: INTEGER): BOOLEAN
			-- True if an_op is a binary operator with COMPARABLE arguments returning a boolean
		require
			valid_operator(an_op)
		do
			Result := an_op >= op_eq and an_op <= op_gt
		end
		
	unary_arithmetic_operator(an_op: INTEGER): BOOLEAN
			-- True if an_op is a unary arithmetic operator
		require
			valid_operator(an_op)
		do
			Result := an_op = op_minus
		end
		
	arithmetic_operator(an_op: INTEGER): BOOLEAN
			-- True if an_op is a binary operator with numeric arguments returning a numeric
		require
			valid_operator(an_op)
		do
			Result := binary_arithmetic_operator(an_op)
		end
		
	binary_arithmetic_operator(an_op: INTEGER): BOOLEAN
			-- True if an_op is a binary operator with numeric arguments returning a numeric
		require
			valid_operator(an_op)
		do
			Result := an_op >= op_plus and an_op <= op_exp
		end
		
	set_operator(an_op: INTEGER): BOOLEAN
			-- True if an_op is a unary set operator
		require
			valid_operator(an_op)
		do
			Result := an_op = op_matches
		end
		
	quantifier_operator(an_op: INTEGER): BOOLEAN
			-- True if an_op is a unary quantifier operator
		require
			valid_operator(an_op)
		do
			Result := an_op = op_for_all or an_op = op_exists
		end
		
feature -- Access

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
				
end


--|
--| ***** BEGIN LICENSE BLOCK *****
--| Version: MPL 1.1/GPL 2.0/LGPL 2.1
--|
--| The contents of this file are subject to the Mozilla Public License Version
--| 1.1 (the 'License'); you may not use this file except in compliance with
--| the License. You may obtain a copy of the License at
--| http://www.mozilla.org/MPL/
--|
--| Software distributed under the License is distributed on an 'AS IS' basis,
--| WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License
--| for the specific language governing rights and limitations under the
--| License.
--|
--| The Original Code is operator_kind.e.
--|
--| The Initial Developer of the Original Code is Thomas Beale.
--| Portions created by the Initial Developer are Copyright (C) 2005
--| the Initial Developer. All Rights Reserved.
--|
--| Contributor(s):
--|
--| Alternatively, the contents of this file may be used under the terms of
--| either the GNU General Public License Version 2 or later (the 'GPL'), or
--| the GNU Lesser General Public License Version 2.1 or later (the 'LGPL'),
--| in which case the provisions of the GPL or the LGPL are applicable instead
--| of those above. If you wish to allow use of your version of this file only
--| under the terms of either the GPL or the LGPL, and not to allow others to
--| use your version of this file under the terms of the MPL, indicate your
--| decision by deleting the provisions above and replace them with the notice
--| and other provisions required by the GPL or the LGPL. If you do not delete
--| the provisions above, a recipient may use your version of this file under
--| the terms of any one of the MPL, the GPL or the LGPL.
--|
--| ***** END LICENSE BLOCK *****
--|
