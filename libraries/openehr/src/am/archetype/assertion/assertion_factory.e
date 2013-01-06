note
	component:   "openEHR Archetype Project"
	description: "operand in an expression tree"
	keywords:    "assertion, ADL"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2004- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "See notice at bottom of class"

class ASSERTION_FACTORY

feature -- Factory

	create_expr_leaf_archetype_definition_ref (an_absolute_path: STRING): EXPR_LEAF
			-- node refers to a feature in an archetype definition
		require
			path_exists: not an_absolute_path.is_empty
		do
			create Result.make_archetype_definition_ref(an_absolute_path)
		end

	create_expr_leaf_archetype_ref (a_rel_path: STRING): EXPR_LEAF
			-- node refers to a feature in an outer archetype structure (not the
			-- definition - use create_expr_leaf_archetype_definition_ref for that)
			-- e.g. 'archetype_id' - see AOM for allowable features; / notation
			-- can be used if need to go deeper
		require
			ref_exists: not a_rel_path.is_empty
		do
			create Result.make_archetype_ref(a_rel_path)
		end

	create_expr_leaf_boolean(an_item: BOOLEAN): EXPR_LEAF
			-- node is a boolean value
   		do
			create Result.make_boolean(an_item)
		end

	create_expr_leaf_real(an_item: REAL): EXPR_LEAF
			-- node is a real value
   		do
			create Result.make_real(an_item)
		end

	create_expr_leaf_integer(an_item: INTEGER): EXPR_LEAF
			-- node is an integer value
   		do
			create Result.make_integer(an_item)
		end

	create_expr_leaf_string (an_item: STRING): EXPR_LEAF
			-- node is a string value
   		do
			create Result.make_string(an_item)
		end

	create_expr_leaf_character(an_item: CHARACTER): EXPR_LEAF
			-- node is a character value
   		do
			create Result.make_character(an_item)
		end

	create_expr_leaf_ordinal (an_item: ORDINAL): EXPR_LEAF
			-- node is a ordinal value
   		do
			create Result.make_ordinal (an_item)
		end

	create_expr_leaf_coded_term (an_item: C_CODE_PHRASE): EXPR_LEAF
			-- node is a coded term value
   		do
			create Result.make_coded_term (an_item)
		end

	create_expr_leaf_constraint(an_item: C_PRIMITIVE): EXPR_LEAF
			-- node is a constraint on a primitive type; can only be used with "matches" function
			-- an_item is C_STRING, C_INTEGER, C_REAL, C_DOUBLE, C_BOOLEAN
   		do
			create Result.make_constraint(an_item)
		end

	create_expr_unary_operator_node (an_operator: OPERATOR_KIND; an_operand: EXPR_ITEM): EXPR_UNARY_OPERATOR
			-- operators with one operand, e.g. not x, -5 etc
   		do
			create Result.make(an_operator, an_operand)
		end

	create_expr_binary_operator_node (an_operator: OPERATOR_KIND; a_left_operand, a_right_operand: EXPR_ITEM): EXPR_BINARY_OPERATOR
			-- operators with boolean results, e.g.
			-- and, or, xor, etc
   		do
			create Result.make (an_operator, a_left_operand, a_right_operand)
		end

	create_assertion (an_expr: EXPR_ITEM; a_tag: STRING): ASSERTION
			-- make assertion with an expression and an optional tag
		require
			Tag_valid: a_tag /= Void implies not a_tag.is_empty
   		do
			create Result.make(an_expr, a_tag)
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
--| The Original Code is assertion_factory.e.
--|
--| The Initial Developer of the Original Code is Thomas Beale.
--| Portions created by the Initial Developer are Copyright (C) 2003-2004
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
