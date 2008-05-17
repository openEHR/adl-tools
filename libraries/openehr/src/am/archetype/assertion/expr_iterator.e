indexing
	component:   "openEHR Archetype Project"
	description: "[
				 Expression tree iterator. This iterator currently supplies the standard 'do_all'
				 function which performs an action on entry to each node, descends, and then performs
				 an action on exiting each node; there are two agent actions supplied: node_enter_action
				 and node_exit_action. This allows signficantly more power than just a single action per 
				 node type.
				 ]"
	keywords:    "expressions, invariant, assertion, recursive iterator"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2008 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL: http://www.openehr.org/svn/ref_impl_eiffel/TRUNK/libraries/openehr/src/am/archetype/assertion/expr_iterator.e $"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate: 2008-03-12 00:23:45 +0000 (Wed, 12 Mar 2008) $"

class EXPR_ITERATOR

create
	make

feature -- Initialisation

	make(a_target: EXPR_ITEM) is
		require
			a_target /= Void
		do
			target := a_target
		end

feature -- Access

	target: EXPR_ITEM

feature -- Traversal

	do_all(node_enter_action, node_exit_action: PROCEDURE[ANY, TUPLE[EXPR_ITEM, INTEGER]]) is
			-- do enter_action and exit_action to all nodes in the structure
		require
			Enter_action_valid: node_enter_action /= Void
			Exit_action_valid: node_exit_action /= Void
		do
			depth := 0
			do_all_nodes(target, node_enter_action, node_exit_action)
		end

feature {NONE} -- Implementation

	do_all_nodes(a_target: EXPR_ITEM; node_enter_action, node_exit_action: PROCEDURE[ANY, TUPLE[EXPR_ITEM, INTEGER]]) is
		require
			Target_exists: a_target /= Void
		local
			a_binary_op: EXPR_BINARY_OPERATOR
			a_unary_op: EXPR_UNARY_OPERATOR
		do
			depth := depth + 1
			node_enter_action.call([a_target, depth])
			a_binary_op ?= a_target
			if a_binary_op /= Void then
				do_all_nodes(a_binary_op.left_operand, node_enter_action, node_exit_action)
				do_all_nodes(a_binary_op.right_operand, node_enter_action, node_exit_action)
			else
				a_unary_op ?= a_target
				if a_unary_op /= Void then
					do_all_nodes(a_unary_op.operand, node_enter_action, node_exit_action)
				end
			end
			node_exit_action.call([a_target, depth])
			depth := depth - 1
		end

	depth: INTEGER

invariant
	target_exists: target /= Void

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
--| The Original Code is cadl_tree_iterator.e.
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
