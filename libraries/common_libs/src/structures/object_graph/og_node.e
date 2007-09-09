indexing
	component:   "openEHR Archetype Project"
	description: "node in ADL parse tree"
	keywords:    "test, ADL"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2003. 2004 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

deferred class OG_NODE

inherit
	OG_ITEM
		redefine
			default_create
		end

feature -- Initialisation

	default_create is
			--
		do
			create children.make(0)
			create children_ordered.make(0)
			create children_sorted.make
		end

feature -- Access

	child_with_id(a_node_id: STRING): like child_type is
			-- find the child node with `a_node_id'
		require
			has_child_with_id(a_node_id)
		do
			-- FIXME: should just be able to search with node_id, but we are still
			-- using the 'unknown; node_ids rather than empty strings
			if a_node_id.is_empty then
				Result := first_child
			else
				Result := children.item(a_node_id)
			end
		ensure
			Result_exists: Result /= Void
		end

	first_child: like child_type is
			-- 	get first child; typically used when it is known that there is only one child
			-- and we don't care what it is called
		do
			if using_children_sorted then
				Result := children_sorted.first
			else
				Result := children_ordered.first
			end
		end

	item_for_iteration: like child_type is
			--
		do
			if using_children_sorted then
				Result := children_sorted.item
			else
				Result := children_ordered.item
			end
		end

	child_count: INTEGER is
			-- number of child nodes
		do
			Result := children.count
		end

feature -- Status Report

	has_children: BOOLEAN is
			-- true if any children
		do
			Result := not children.is_empty
		end

	has_child_with_id(a_node_id: STRING): BOOLEAN is
		require
			node_id_valid: a_node_id /= Void
		do
			-- FIXME: should just be able to search with node_id, but we are still
			-- using the 'unknown; node_ids rather than empty strings
			if a_node_id.is_empty then
				Result := has_children
			else
				Result := children.has(a_node_id)
			end
		end

	has_child(a_node: like child_type): BOOLEAN is
		require
			node_valid: a_node /= Void
		do
			Result := children.has_item (a_node)
		end

	off: BOOLEAN is
			--
		do
			if using_children_sorted then
				Result := children_sorted.off
			else
				Result := children_ordered.off
			end
		end

	valid_child_for_insertion(a_node: like child_type):BOOLEAN is
		do
			Result := not has_child(a_node)
		end

	using_children_sorted: BOOLEAN
			-- True if using sorted order list for iteration rather than
			-- added order

feature -- Status Setting

	use_children_sorted is
			-- use sorted list
		do
			using_children_sorted := True
		end

feature -- Cursor Movement

	start is
			-- iteration children in insertion order
		do
			if using_children_sorted then
				children_sorted.start
			else
				children_ordered.start
			end
		end

	forth is
			--
		do
			if using_children_sorted then
				children_sorted.forth
			else
				children_ordered.forth
			end
		end

feature -- Modification

	put_child(a_node: like child_type) is
			-- put a new child node
		require
			Node_exists: a_node /= Void and then valid_child_for_insertion(a_node)
		do
			children.put(a_node, a_node.node_id)
			a_node.set_parent(Current)
			a_node.set_sibling_order(children.count)
			children_ordered.extend(a_node)
			children_sorted.extend(a_node)
		ensure
			has_child (a_node)
		end

	remove_child(a_node_id: STRING) is
			-- remove the child node identified by a_node_id
		require
			Node_exists: a_node_id /= Void and then has_child_with_id(a_node_id)
		do
			children_ordered.prune_all (children.item (a_node_id))
			children_sorted.prune_all (children.item (a_node_id))
			children.remove (a_node_id)
		ensure
			not has_child_with_id (a_node_id)
		end

	remove_all_children is
			-- remove all children
		do
			create children.make(0)
			create children_ordered.make(0)
			create children_sorted.make
		end

feature {OG_NODE} -- Implementation

	children: HASH_TABLE [like child_type, STRING]
			-- next nodes, keyed by node id or attribute name

	children_ordered: ARRAYED_LIST[like child_type]
			-- reference list of child, in order of insertion (i.e. order of original parsing)

	children_sorted: SORTED_TWO_WAY_LIST[like child_type]
			-- reference list of child, in lexical order of node_ids

	child_type: OG_ITEM

invariant
	Children_exists: children /= Void
	Childred_ordered_exists: children_ordered /= Void
	Child_lists_valid: children.count = children_ordered.count

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
--| The Original Code is cadl_node.e.
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
