note
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

	default_create
			--
		do
			create children.make(0)
			create children_ordered.make(0)
			create children_sorted.make
		end

feature -- Access

	child_with_id(a_node_key: STRING): like child_type
			-- find the child node with `a_node_key'
		require
			has_child_with_id(a_node_key)
		do
			-- FIXME: should just be able to search with node_key, but we are still
			-- using the 'unknown' node_keys rather than empty strings
			if a_node_key.is_empty then
				Result := first_child
			else
				Result := children.item(a_node_key)
			end
		ensure
			Result_exists: Result /= Void
		end

	first_child: like child_type
			-- 	get first child; typically used when it is known that there is only one child
			-- and we don't care what it is called
		do
			if using_children_sorted then
				Result := children_sorted.first
			else
				Result := children_ordered.first
			end
		end

	item_for_iteration: like child_type
			--
		do
			if using_children_sorted then
				Result := children_sorted.item
			else
				Result := children_ordered.item
			end
		end

	child_count: INTEGER
			-- number of child nodes
		do
			Result := children.count
		end

feature -- Status Report

	is_leaf: BOOLEAN
			-- true if no children
		do
			Result := children.is_empty
		end

	has_children: BOOLEAN
			-- true if any children
		do
			Result := not children.is_empty
		end

	has_child_with_id(a_node_key: STRING): BOOLEAN
		require
			node_key_valid: a_node_key /= Void
		do
			-- FIXME: should just be able to search with node_key, but we are still
			-- using the 'unknown' node_keys rather than empty strings
			if a_node_key.is_empty then
				Result := has_children
			else
				Result := children.has(a_node_key)
			end
		end

	has_child(a_node: like child_type): BOOLEAN
		require
			node_valid: a_node /= Void
		do
			Result := children.has_item (a_node)
		end

	off: BOOLEAN
			--
		do
			if using_children_sorted then
				Result := children_sorted.off
			else
				Result := children_ordered.off
			end
		end

	valid_child_for_insertion(a_node: like child_type): BOOLEAN
		do
			Result := not has_child(a_node)
		end

	using_children_sorted: BOOLEAN
			-- True if using sorted order list for iteration rather than
			-- added order

feature -- Status Setting

	use_children_sorted
			-- use sorted list
		do
			using_children_sorted := True
		end

feature -- Cursor Movement

	start
			-- iteration children in insertion order
		do
			if using_children_sorted then
				children_sorted.start
			else
				children_ordered.start
			end
		end

	forth
			--
		do
			if using_children_sorted then
				children_sorted.forth
			else
				children_ordered.forth
			end
		end

feature -- Modification

	put_child(a_node: like child_type)
			-- put a new child node at the end of the list
		require
			Node_exists: a_node /= Void and then valid_child_for_insertion(a_node)
		do
			children.put(a_node, a_node.node_key)
			a_node.set_parent(Current)
			children_ordered.extend(a_node)
			children_sorted.extend(a_node)
		ensure
			has_child (a_node)
		end

	put_child_left(a_node, before_node: like child_type)
			-- insert a new child node before another node in the list
		require
			Node_valid: a_node /= Void and then valid_child_for_insertion(a_node)
			Before_node_valid: before_node /= Void and then has_child(before_node)
		do
			children.put(a_node, a_node.node_key)
			a_node.set_parent(Current)
			children_ordered.go_i_th (children_ordered.index_of (before_node, 1))
			children_ordered.put_left (a_node)
			children_sorted.extend(a_node)
		ensure
			has_child (a_node)
		end

	put_child_right(a_node, after_node: like child_type)
			-- insert a new child node before another node in the list
		require
			Node_valid: a_node /= Void and then valid_child_for_insertion(a_node)
			After_node_valid: after_node /= Void and then has_child(after_node)
		do
			children.put(a_node, a_node.node_key)
			a_node.set_parent(Current)
			children_ordered.go_i_th (children_ordered.index_of (after_node, 1))
			children_ordered.put_right (a_node)
			children_sorted.extend(a_node)
		ensure
			has_child (a_node)
		end

	replace_child_by_id(a_node: like child_type; an_id: STRING)
			-- replace node with id `an_id' by `an_obj'
		do
			children_ordered.go_i_th (children_ordered.index_of (child_with_id(an_id), 1))
			children_ordered.replace (a_node)
			children_sorted.go_i_th (children_sorted.index_of (child_with_id(an_id), 1))
			children_sorted.replace (a_node)
			children.replace (a_node, an_id)
			a_node.set_parent(Current)
		end

	remove_child(a_node: like child_type)
			-- remove the child node `a_node'
		require
			Node_exists: a_node /= Void and then has_child(a_node)
		do
			children_ordered.prune_all (a_node)
			children_sorted.prune_all (a_node)
			children.remove (a_node.node_key)
			a_node.set_root
		ensure
			Child_removed: not has_child (a_node)
		end

	remove_child_by_id(a_node_key: STRING)
			-- remove the child node identified by a_node_key
		require
			Node_exists: a_node_key /= Void and then has_child_with_id(a_node_key)
		local
			c: OG_ITEM
		do
			c := child_with_id (a_node_key)
			remove_child(c)
		ensure
			Child_removed: not has_child_with_id (a_node_key)
		end

	remove_all_children
			-- remove all children
		do
			create children.make(0)
			create children_ordered.make(0)
			create children_sorted.make
		ensure
			Children_removed: children.is_empty
		end

	replace_node_id(an_old_node_key, a_new_node_key: STRING)
			-- replace `an_old_node_key' with `a_new_node_key' in the children
			-- this has the effect of making an object indexed by a new node id,
			-- that it doesn't itself carry
		require
			Keys_different: not an_old_node_key.is_equal (a_new_node_key)
		do
			children.replace_key (a_new_node_key, an_old_node_key)
		ensure
			Child_indexed_by_path_not_id: not child_with_id (a_new_node_key).node_id.is_equal (a_new_node_key)
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
