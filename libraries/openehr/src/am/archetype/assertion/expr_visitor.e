note
	component:   "openEHR Archetype Project"
	description: "Generic visitor class for ASSERTION objects"
	keywords:    "visitor, assertion expressions"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2008-2012 Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "See notice at bottom of class"
	void_safety: "initial"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

deferred class EXPR_VISITOR

feature -- Initialisation

	initialise (an_assertion: ASSERTION)
			-- set assertion
		do
			assertion := an_assertion
		end

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

feature {NONE} -- Implementation

	assertion: ASSERTION

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
--| The Original Code is constraint_model_visitor.e.
--|
--| The Initial Developer of the Original Code is Thomas Beale.
--| Portions created by the Initial Developer are Copyright (C) 2007
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
