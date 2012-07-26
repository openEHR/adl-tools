note
	component:   "openEHR Archetype Project"
	description: "EV_TREE form of EVX_TREE_CONTROL_I"
	keywords:    "UI"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2012 Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"


class EVX_TREE_CONTROL_TREE

inherit
	EVX_TREE_CONTROL_I

	EVX_UTILITIES
		export
			{NONE} all
		end

create
	make

feature -- Initialisation

	make (a_tree: EV_TREE)
		do
			ev_tree := a_tree
			ev_root_widget := ev_tree
		end

feature -- Access

	ev_tree: EV_TREE

	ev_tree_do_all (an_action: attached PROCEDURE [ANY, TUPLE [EV_TREE_NODE]])
			-- do `an_action' to all nodes in the structure
		do
			from ev_tree.start until ev_tree.off loop
				ev_tree_do_all_nodes (ev_tree.item, an_action)
				ev_tree.forth
			end
		end

feature -- Events

	collapse_one_level (test: FUNCTION [ANY, TUPLE [EV_TREE_NODE], BOOLEAN])
		do
			create ev_tree_node_list.make (0)
			ev_tree.recursive_do_all (agent ev_tree_item_collapse_one_level)
			from ev_tree_node_list.start until ev_tree_node_list.off loop
				if not attached test or else test.item ([ev_tree_node_list.item]) then
					ev_tree_node_list.item.collapse
				end
				ev_tree_node_list.forth
			end
		end

	expand_one_level (test: FUNCTION [ANY, TUPLE [EV_TREE_NODE], BOOLEAN])
		do
			do_with_wait_cursor (ev_tree, agent do_expand_one_level (test))
		end

	expand_all (test: FUNCTION [ANY, TUPLE [EV_TREE_NODE], BOOLEAN])
		do
			do_with_wait_cursor (ev_tree,
				agent ev_tree.recursive_do_all (
					agent (an_ev_tree_node: EV_TREE_NODE; test_agt: FUNCTION [ANY, TUPLE [EV_TREE_NODE], BOOLEAN])
						do
							if an_ev_tree_node.is_expandable and (not attached test_agt or else test_agt.item ([an_ev_tree_node])) then
								an_ev_tree_node.expand
							end
						end (?, test)
				)
			)
		end

	collapse_all
		do
			ev_tree.recursive_do_all (
				agent (an_ev_tree_node: attached EV_TREE_NODE)
					do
						if an_ev_tree_node.is_expandable then
							an_ev_tree_node.collapse
						end
					end
			)
		end

	collapse_except (test: FUNCTION [ANY, TUPLE [EV_GRID_ROW], BOOLEAN])
		do
			-- TODO
		end

feature {NONE} -- Implementation

	ev_tree_item_expand_one_level (an_ev_tree_node: attached EV_TREE_NODE)
			--
		do
			if an_ev_tree_node.is_expanded then
				from an_ev_tree_node.start until an_ev_tree_node.off loop
					if an_ev_tree_node.item.is_expandable and then not an_ev_tree_node.item.is_expanded then
						ev_tree_node_list.extend (an_ev_tree_node.item)
					end
					an_ev_tree_node.forth
				end
			elseif an_ev_tree_node = ev_tree.item then
				ev_tree_node_list.extend (an_ev_tree_node)
			end
		end

	ev_tree_item_collapse_one_level (an_ev_tree_node: attached EV_TREE_NODE)
			--
		do
			if an_ev_tree_node.is_expanded then
				from
					an_ev_tree_node.start
				until
					an_ev_tree_node.off or else (an_ev_tree_node.item.is_expandable and then an_ev_tree_node.item.is_expanded)
				loop
					an_ev_tree_node.forth
				end

				if an_ev_tree_node.off then -- didn't find any expanded children
					ev_tree_node_list.extend (an_ev_tree_node)
				end
			end
		end

	ev_tree_node_list: ARRAYED_LIST [EV_TREE_NODE]

	ev_tree_do_all_nodes (a_target: attached EV_TREE_NODE; an_action: PROCEDURE[ANY, TUPLE [EV_TREE_NODE]])
		do
			from a_target.start until a_target.off loop
				ev_tree_do_all_nodes (a_target.item, an_action)
				a_target.forth
			end
			an_action.call ([a_target])
		end

	do_expand_one_level (test: FUNCTION [ANY, TUPLE [EV_TREE_NODE], BOOLEAN])
		do
			create ev_tree_node_list.make (0)
			ev_tree.recursive_do_all (agent ev_tree_item_expand_one_level)
			from ev_tree_node_list.start until ev_tree_node_list.off loop
				if not attached test or else test.item ([ev_tree_node_list.item]) then
					ev_tree_node_list.item.expand
				end
				ev_tree_node_list.forth
			end
		end

	resize_columns_to_content (grid_expansion_factor: REAL)
		do
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
--| The Original Code is gui_grid_treeview_control.e
--|
--| The Initial Developer of the Original Code is Thomas Beale.
--| Portions created by the Initial Developer are Copyright (C) 2012
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
