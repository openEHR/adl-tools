indexing
	component:   "openEHR Archetype Project"
	description: "operand in an expression tree"
	keywords:    "assertion, ADL"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2004 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class ASSERTION_FACTORY

feature -- Factory
	
	create_expr_leaf_feature_call(a_ref: STRING): EXPR_LEAF is
			-- leaf node represents a feature call on Archetype object itself
		require
			ref_exists: a_ref /= Void and then not a_ref.is_empty
		do
			create Result.make_feature_call(a_ref)
		end
	
	create_expr_leaf_attribute_ref(a_ref_path: STRING): EXPR_LEAF is
			-- node refers to an attribute in the runtime data
		require
			ref_exists: a_ref_path /= Void and then not a_ref_path.is_empty
		do
			create Result.make_attribute_ref(create {OG_PATH}.make_from_string(a_ref_path))
		end
	
	create_expr_leaf_object_ref(a_ref_path: STRING): EXPR_LEAF is
			-- node refers to an object in the runtime data
		require
			ref_exists: a_ref_path /= Void and then not a_ref_path.is_empty
		do
			create Result.make_attribute_ref(create {OG_PATH}.make_from_string(a_ref_path))
		end
	
	create_expr_leaf_boolean(an_item: BOOLEAN): EXPR_LEAF is
			-- node is a boolean value
   		do
			create Result.make_boolean(an_item)
		end

	create_expr_leaf_real(an_item: REAL): EXPR_LEAF is
			-- node is a real value
   		do
			create Result.make_real(an_item)
		end

	create_expr_leaf_integer(an_item: INTEGER): EXPR_LEAF is
			-- node is an integer value
   		do
			create Result.make_integer(an_item)
		end

	create_expr_leaf_string(an_item: STRING): EXPR_LEAF is
			-- node is a string value
		require
			Item_exists: an_item /= Void
   		do
			create Result.make_string(an_item)
		end

	create_expr_leaf_character(an_item: CHARACTER): EXPR_LEAF is
			-- node is a character value
   		do
			create Result.make_character(an_item)
		end

	create_expr_leaf_ordinal(an_item: ORDINAL): EXPR_LEAF is
			-- node is a ordinal value
   		do
			create Result.make_ordinal(an_item)
		end

	create_expr_leaf_coded_term(an_item: CODE_PHRASE): EXPR_LEAF is
			-- node is a coded term value
   		do
			create Result.make_coded_term(an_item)
		end

	create_expr_leaf_constraint(an_item: C_PRIMITIVE): EXPR_LEAF is
			-- node is a constraint on a primitive type; can only be used with "matches" function
			-- an_item is C_STRING, C_INTEGER, C_REAL, C_DOUBLE, C_BOOLEAN 
		require
			Item_exists: an_item /= Void
   		do
			create Result.make_constraint(an_item)
		end

	create_expr_unary_operator_node(an_operator: OPERATOR_KIND; an_operand: EXPR_ITEM): EXPR_UNARY_OPERATOR is
			-- operators with one operand, e.g. not x, -5 etc
		require
			an_operator_exists: an_operator /= Void
			an_operand_exists: an_operand /= Void
   		do
			create Result.make(an_operator)
			Result.set_operand(an_operand)
		end

	create_expr_binary_operator_node(an_operator: OPERATOR_KIND; a_left_operand, a_right_operand: EXPR_ITEM): EXPR_BINARY_OPERATOR is
			-- operators with boolean results, e.g.
			-- and, or, xor, etc
		require
			an_operator_exists: an_operator /= Void
			a_left_operand_exists: a_left_operand /= Void
			a_right_operand_exists: a_right_operand /= Void
   		do
			create Result.make(an_operator)
			Result.set_left_operand(a_left_operand)
			Result.set_right_operand(a_right_operand)
		end

	create_assertion(an_expr: EXPR_ITEM; a_tag:STRING): ASSERTION is
			-- make assertion with an expression and an optional tag
		require
			Tag_valid: a_tag /= Void implies not a_tag.is_empty
			Expr_valid: an_expr /= Void
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
