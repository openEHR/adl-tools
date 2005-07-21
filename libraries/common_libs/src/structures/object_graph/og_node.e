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

	child_at_node_id(a_node_id: STRING): like child_type is
			-- find the child node with `a_node_id'
		require
			has_child_node(a_node_id)
		do
			Result := children.item(a_node_id)
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
		
	node_at_path(a_path: OG_PATH): OG_ITEM is
			-- find the child at the relative path `a_path'
		require
			Path_valid: a_path /= Void and then has_path(a_path)
		local
			a_key: STRING
			a_node: OG_NODE
		do
			-- deal with absolute part if it exists
			a_path.start
			if a_path.is_absolute then
				a_path.forth
			end
			
			-- find child node relating to first relation path item
			if not a_path.off then
				a_key := a_path.item.value
				a_path.forth
				Result ?= children.item(a_key)
				if not a_path.off then
					a_node ?= Result
					if a_node /= Void then
						Result := a_node.node_at_path(a_path.sub_path_from_item)
					end
				end
			else
				Result ?= Current
			end			
		ensure
			Result_exists: Result /= Void
		end
		
	all_paths: ARRAYED_LIST[OG_PATH] is
			-- all paths below this point, including this node
		deferred
		ensure
			Result_exists: Result /= Void and then Result.object_comparison
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

feature -- Status Report

	has_children: BOOLEAN is
			-- true if any children
		do
			Result := not children.is_empty
		end

	has_child_node(a_path_id: STRING): BOOLEAN is
		require
			path_id_valid: a_path_id /= Void and then not a_path_id.is_empty
		do
			Result := children.has(a_path_id)
		end

	has_path(a_path: OG_PATH): BOOLEAN is
			-- find the child at the path `a_path'
		require
			Path_valid: a_path /= Void and then a_path.is_absolute implies is_root
		local
			a_key: STRING
			a_node: OG_NODE
		do
			Result := True
			
			-- deal with absolute part if it exists
			if a_path.is_absolute then
				a_path.start
				Result := path_id.is_equal(a_path.item)
				a_path.forth
			else
				a_path.start
			end
			
			-- find child node relating to first relation path item
			if Result and not a_path.off then
				a_key := a_path.item.value
				a_path.forth
				if children.has(a_key) then
					if not a_path.off then
						a_node ?= children.item(a_key)
						if a_node /= Void then
							Result := a_node.has_path(a_path.sub_path_from_item)
						end
					end
				else
					Result := False
				end
			end			
		end
		
	off:BOOLEAN is
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
			Result := not has_child_node(a_node.node_id)
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
			children.put(a_node, a_node.path_id.value)
			a_node.set_parent(Current)
			a_node.set_sibling_order(children.count)
			children_ordered.extend(a_node)
			children_sorted.extend(a_node)
		end

	remove_all_children is
			-- remove all children
		do
			create children.make(0)
			create children_ordered.make(0)
			create children_sorted.make
		end
		
feature {NONE} -- Implementation

	children: HASH_TABLE [like child_type, STRING]
			-- next nodes, keyed by node id or attribute name
			
	children_ordered: ARRAYED_LIST[like child_type]
			-- refence list of child, in order of insertion (i.e. order of original parsing)

	children_sorted: SORTED_TWO_WAY_LIST[like child_type]
			-- refence list of child, in lexical order of node_ids

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
