note
	component:   "openEHR Archetype Project"
	description: "item in an OBJECT/ATTRIBUTE parse tree"
	keywords:    "test, ADL"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2003- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "See notice at bottom of class"

deferred class OG_ITEM

inherit
	OG_DEFINITIONS
		export
			{NONE} all
		undefine
			is_equal
		end

	COMPARABLE

feature -- Initialisation

	make (a_node_id: STRING)
			-- create with node id and optional content_item
		require
			Node_id_valid: not a_node_id.is_empty
		do
			node_id := a_node_id
		ensure
			Node_id_set: node_id = a_node_id
		end

feature -- Access

	node_id: STRING
				-- id of this node

	node_key: STRING
			-- uses compressed path if it exists
		do
			Result := node_id
		end

	content_item: detachable VISITABLE
				-- content of this node

	path: OG_PATH
			-- absolute path of this node relative to the root; may produce non-unique paths
		do
			Result := generate_path (False, Void)
		end

	path_to_node (a_node: OG_ITEM): OG_PATH
			-- absolute path of this node relative to the root; may produce non-unique paths
		do
			Result := generate_path (False, a_node)
		end

	unique_path: OG_PATH
			-- absolute unique path of this node relative to the root
		do
			Result := generate_path (True, Void)
		end

	parent: detachable OG_NODE

	ultimate_parent: detachable OG_NODE
			-- return the root node of the tree
		require
			not is_root
		do
			from Result := parent until Result.is_root loop
				Result := Result.parent
			end
		end

	has_parent (a_node: OG_NODE): BOOLEAN
			-- return True if `a_node' found in line of parent nodes back to ultimate_parent,
			-- including if it is the immediate parent
		local
			csr: detachable OG_NODE
		do
			from csr := parent until csr.is_root or csr = a_node loop
				csr := csr.parent
			end
			Result := csr = a_node
		end

feature -- Comparison

	is_less alias "<" (other: like Current): BOOLEAN
			-- compare based on node_id
		do
			Result := node_id < other.node_id
		end

feature -- Status Report

	is_addressable: BOOLEAN
			-- True if this node has a non-anonymous node_id
		deferred
		end

	is_object_node: BOOLEAN
			-- True if this node is an object type
		deferred
		end

	is_root: BOOLEAN
			-- True if is root of parse tree structure
		do
			Result := parent = Void
		end

	is_leaf: BOOLEAN
			-- True if this object is a leaf object
		deferred
		end

feature -- Modification

	set_root
			-- set this node to root, i.e. remove its parent
		do
			parent := Void
		ensure
			is_root
		end

	set_node_id (a_node_id: STRING)
		require
			Node_id_valid: not a_node_id.is_empty
		do
			node_id := a_node_id
		end

	set_parent (a_node: like parent)
			-- connect child to parent
		do
			parent := a_node
		end

	set_content (a_content_item: VISITABLE)
			-- set item
		do
			content_item := a_content_item
		ensure
			Content_set: content_item = a_content_item
		end

feature -- Serialisation

	enter_subtree (visitor: ANY; depth: INTEGER)
			-- perform action at start of block for this node
		require
			Depth_valid: depth >= 0
		do
			content_item.enter_subtree (visitor, depth)
		end

	exit_subtree (visitor:  ANY; depth: INTEGER)
			-- perform action at end of block for this node
		require
			Depth_valid: depth >= 0
		do
			content_item.exit_subtree (visitor, depth)
		end

feature {NONE} -- Implementation

	generate_path (unique_flag: BOOLEAN; stop_node: detachable OG_ITEM): OG_PATH
			-- absolute path of this node relative to the root; if unique_flag set then
			-- generate a completely unique path by including the "unknown" ids that are
			-- automatically set at node-creation time on nodes that otherwise would have no id
		local
			csr: detachable OG_NODE
			og_nodes: ARRAYED_LIST [OG_ITEM]
			a_path_item: OG_PATH_ITEM
			og_path: detachable OG_PATH
		do
			-- get the node list from here back up to the root, but don't include the root OG_OBJECT_NODE
			create og_nodes.make(0)
			if attached parent as p then
				og_nodes.extend (Current)
				from csr := p until csr = Void or csr.parent = Void or csr ~ stop_node loop
					og_nodes.put_front (csr)
					csr := csr.parent
				end
			end

			if og_nodes.is_empty then
				create og_path.make_root
			else -- process the node list; we are starting on an OG_ATTR_NODE
				from
					og_nodes.start
					if attached {OG_ATTRIBUTE_NODE} og_nodes.item as og_attr and then og_attr.has_differential_path then
						og_path := og_attr.differential_path.deep_twin
					end
				until
					og_nodes.off
				loop
					-- now on an OG_ATTR_NODE
					if attached {OG_ATTRIBUTE_NODE} og_nodes.item as og_attr then
						create a_path_item.make (og_attr.node_id)
						if attached og_path as ogp then
							ogp.append_segment (a_path_item)
						else
							create og_path.make_absolute (a_path_item)
						end

						og_nodes.forth
						if not og_nodes.off then -- now on an OG_OBJECT_NODE
							if unique_flag or og_attr.is_multiple or
									(og_attr.is_single and og_nodes.item.is_addressable) then
								-- use this line of code to get rid of codes on single attributes
								--	(og_attr.is_single and og_attr.child_count > 1 and og_nodes.item.is_addressable) then
								a_path_item.set_object_id (og_nodes.item.node_id)
							end
							og_nodes.forth
						end
					end
				end
			end
			check attached og_path as ogp then
				Result := ogp
			end
		ensure
			not unique_flag implies not Result.as_string.has_substring (anonymous_node_id)
		end

invariant
	Node_id_valid: not node_id.is_empty

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
--| The Original Code is cadl_item.e.
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
