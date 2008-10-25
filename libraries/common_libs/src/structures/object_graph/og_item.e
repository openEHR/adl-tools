indexing
	component:   "openEHR Archetype Project"
	description: "item in an OBJECT/ATTRIBUTE parse tree"
	keywords:    "test, ADL"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2003, 2004 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

deferred class OG_ITEM

inherit
	ANY
		export
			{NONE} all
			{ANY} generating_type
		undefine
			is_equal
		end

	ARCHETYPE_TERM_CODE_TOOLS
		export
			{NONE} all;
			{ANY} specialisation_depth_from_code, is_valid_code;
		undefine
			is_equal
		end

	COMPARABLE

feature -- Definitions

	Anonymous_node_id: STRING is "unknown"

feature -- Initialisation

	make (a_node_id: STRING; a_content_item: VISITABLE) is
			-- create with node id and optional content_item
		require
			Node_id_valid: a_node_id /= Void and then not a_node_id.is_empty
		do
			default_create
			node_id := a_node_id
			content_item := a_content_item
		ensure
			Node_id_set: node_id = a_node_id
		end

feature -- Access

	node_id: STRING
				-- id of this node

	node_key: STRING is
			-- uses compressed path if it exists
		do
			Result := node_id
		end

	content_item: VISITABLE
				-- content of this node

	path: OG_PATH is
			-- absolute path of this node relative to the root; may produce non-unique paths
		do
			Result := generate_path(False)
		end

	unique_path: OG_PATH is
			-- absolute unique path of this node relative to the root
		do
			Result := generate_path(True)
		end

	parent: OG_NODE

	specialisation_depth: INTEGER
			-- specialisation level of this node if identified
		require
			is_valid_code (node_id)
		do
			Result := specialisation_depth_from_code(node_id)
		end

	ultimate_parent: OG_NODE is
			-- return the root node of the tree
		require
			not is_root
		do
			from
				Result := parent
			until
				Result.is_root
			loop
				Result := Result.parent
			end
		end

	has_parent(a_node: OG_NODE): BOOLEAN is
			-- return True if `a_node' found in line of parent nodes back to ultimate_parent,
			-- including if it is the immediate parent
		require
			a_node /= Void
		local
			csr: OG_NODE
		do
			from
				csr := parent
			until
				csr.is_root or csr = a_node
			loop
				csr := csr.parent
			end
			Result := csr = a_node
		end

feature -- Comparison

	infix "<" (other: like Current): BOOLEAN is
			-- compare based on node_id
		do
			Result := node_id < other.node_id
		end

feature -- Status Report

	is_addressable: BOOLEAN is
			-- True if this node has a non-anonymous node_id
		deferred
		end

	is_object_node: BOOLEAN is
			-- True if this node is an object type
		deferred
		end

	is_root: BOOLEAN is
			-- True if is root of parse tree structure
		do
			Result := parent = Void
		end

	is_leaf: BOOLEAN is
			-- True if this object is a leaf object
		deferred
		end

feature -- Modification

	set_root is
			-- set this node to root, i.e. remove its parent
		do
			parent := Void
		ensure
			is_root
		end

	set_node_id(a_node_id:STRING) is
		require
			Node_id_valid: a_node_id /= Void and then not a_node_id.is_empty
		do
			node_id := a_node_id
		end

	set_parent(a_node: like parent) is
			-- connect child to parent
		require
			a_node /= Void
		do
			parent := a_node
		end

	set_content (a_content_item: VISITABLE) is
			-- set item
		require
			Content_item_valid: a_content_item /= Void
		do
			content_item := a_content_item
		ensure
			Content_set: content_item = a_content_item
		end

feature -- Serialisation

	enter_subtree(visitor: ANY; depth: INTEGER) is
			-- perform action at start of block for this node
		require
			Visitor_exists: visitor /= Void
			Depth_valid: depth >= 0
		do
			content_item.enter_subtree(visitor, depth)
		end

	exit_subtree(visitor: ANY; depth: INTEGER) is
			-- perform action at end of block for this node
		require
			Visitor_exists: visitor /= Void
			Depth_valid: depth >= 0
		do
			content_item.exit_subtree(visitor, depth)
		end

feature {NONE} -- Implementation

	generate_path(unique_flag: BOOLEAN): OG_PATH is
			-- absolute path of this node relative to the root; if unique_flag set then
			-- generate a completely unique path by including the "unknown" ids that are
			-- automatically set at node-creation time on nodes that otherwise would have no id
		local
			csr: OG_NODE
			og_nodes: ARRAYED_LIST [OG_ITEM]
			a_path_item: OG_PATH_ITEM
			og_attr: OG_ATTRIBUTE_NODE
		do
			-- get the node list from here back up to the root, but don't include the root OG_OBJECT_NODE
			create og_nodes.make(0)
			if parent /= Void then
				og_nodes.extend(Current)
				from
					csr := parent
				until
					csr.parent = Void
				loop
					og_nodes.put_front(csr)
					csr := csr.parent
				end
			end

			if og_nodes.is_empty then
				create Result.make_root
			else -- process the node list; we are starting on an OG_ATTR_NODE
				from
					og_nodes.start
					og_attr ?= og_nodes.item
					if og_attr.has_differential_path then
						Result := og_attr.differential_path.deep_twin
					end
				until
					og_nodes.off
				loop
					-- now on an OG_ATTR_NODE
					og_attr ?= og_nodes.item
					create a_path_item.make(og_attr.node_id)
					if Result = Void then
						create Result.make_absolute(a_path_item)
					else
						Result.append_segment (a_path_item)
					end

					og_nodes.forth
					if not og_nodes.off then -- now on an OG_OBJECT_NODE
						if unique_flag or og_attr.is_multiple or
								(og_attr.is_single and og_attr.child_count > 1 and og_nodes.item.is_addressable) then
							a_path_item.set_object_id(og_nodes.item.node_id)
						end
						og_nodes.forth
					end
				end
			end
		ensure
			not unique_flag implies not Result.as_string.has_substring (anonymous_node_id)
		end

invariant
	Node_id_exists: node_id /= Void and then not node_id.is_empty

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
