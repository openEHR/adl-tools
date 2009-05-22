note
	component:   "openEHR Archetype Project"
	description: "[
				 Generic Iterator for C_XXX class structures; this just applies various routines to
				 Constraint model nodes. To send a visitor around, use C_VISITOR_ITERATOR.
		         ]"
	keywords:    "visitor, constraint model"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2007 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class C_ITERATOR

inherit
	SPECIALISATION_STATUSES
		export
			{NONE} all
		end

create
	make

feature -- Initialisation

	make(a_target: C_COMPLEX_OBJECT)
			-- create a new iterator targetted to the parse tree `a_target'
		require
			Target_exists: a_target /= Void
		do
			target := a_target
			create tree_iterator.make(a_target.representation)
		end

feature -- Access

	target: C_COMPLEX_OBJECT

	c_node_enter_action: PROCEDURE [ANY, TUPLE[ARCHETYPE_CONSTRAINT, INTEGER]]

	c_node_exit_action: PROCEDURE [ANY, TUPLE[ARCHETYPE_CONSTRAINT, INTEGER]]

	c_node_test: FUNCTION [ANY, TUPLE[ARCHETYPE_CONSTRAINT], BOOLEAN]

feature -- Command

	do_all(a_c_node_enter_action, a_c_node_exit_action: PROCEDURE [ANY, TUPLE [ARCHETYPE_CONSTRAINT, INTEGER]])
		do
			c_node_enter_action := a_c_node_enter_action
			c_node_exit_action := a_c_node_exit_action
			tree_iterator.do_all(agent node_enter_action(?, ?), agent node_exit_action(?, ?))
		end

	do_at_surface(a_c_node_enter_action: PROCEDURE [ANY, TUPLE [ARCHETYPE_CONSTRAINT, INTEGER]]; a_c_node_test: FUNCTION [ANY, TUPLE [ARCHETYPE_CONSTRAINT], BOOLEAN])
			-- do the enter action at the surface detected by a_c_node_test
		do
			c_node_enter_action := a_c_node_enter_action
			c_node_test := a_c_node_test
			tree_iterator.do_at_surface(agent node_action(?, ?), agent node_is_included(?))
		end

	do_until_surface(a_c_node_enter_action: PROCEDURE [ANY, TUPLE [ARCHETYPE_CONSTRAINT, INTEGER]]; a_c_node_test: FUNCTION [ANY, TUPLE [ARCHETYPE_CONSTRAINT], BOOLEAN])
			-- do the enter action while a_c_node_test returns true; where it is false, stop processing child nodes
		do
			c_node_enter_action := a_c_node_enter_action
			c_node_test := a_c_node_test
			tree_iterator.do_until_surface(agent node_action(?, ?), agent node_is_included(?))
		end

feature {NONE} -- Implementation

	tree_iterator: OG_ITERATOR

	node_enter_action(a_node: OG_ITEM; depth: INTEGER)
		require
			Node_exists: a_node /= Void
		do
			arch_node ?= a_node.content_item
			c_node_enter_action.call([arch_node, depth])
		end

	node_exit_action(a_node: OG_ITEM; depth: INTEGER)
		require
			Node_exists: a_node /= Void
		do
			c_node_exit_action.call([arch_node, depth])
		end

	node_is_included(a_node: OG_ITEM): BOOLEAN
		require
			Node_exists: a_node /= Void
		do
			arch_node ?= a_node.content_item
			Result := arch_node /= Void and then c_node_test.item([arch_node])
		end

	node_action(a_node: OG_ITEM; depth: INTEGER)
		require
			Node_exists: a_node /= Void
		do
--			if arch_node = Void then
--				arch_node ?= a_node.content_item
--			end
			c_node_enter_action.call([arch_node, depth])
		end

	arch_node: ARCHETYPE_CONSTRAINT

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
