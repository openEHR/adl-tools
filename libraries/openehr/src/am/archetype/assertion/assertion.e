note
	component:   "openEHR Archetype Project"
	description: "ADL assertion"
	keywords:    "test, ADL"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2003 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"
	void_safety: "initial"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

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
			-- extract regex from id matches {/regex/} style assertion used in slots
		do
			if attached {EXPR_BINARY_OPERATOR} expression as bin_op and then bin_op.operator.value = op_matches then
				if attached {EXPR_LEAF} bin_op.right_operand as a_leaf then
					if attached {C_STRING} a_leaf.item as c_str then
						Result := c_str.regexp
					end
				end
			end
		end

feature -- Status Report

	matches_any: BOOLEAN
			-- True if the regex = {/.*/} i.e. matches anything
		do
			Result := extract_regex.is_equal (Regex_any_pattern)
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
--| The Original Code is adl_assertion.e.
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
