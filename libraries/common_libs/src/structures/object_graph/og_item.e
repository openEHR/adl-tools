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
		
	COMPARABLE

feature -- Definitions

	Anonymous_node_id: STRING is "unknown"

feature -- Initialisation

	make (a_node_id: STRING; a_content_item: SERIALISABLE) is
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
				
	content_item: SERIALISABLE
				-- content of this node

	path: OG_PATH is
			-- absolute path of this node relative to the root
		local
			csr: OG_NODE
		do
			create Result.make_absolute(path_id)
			from
				csr := parent
			until
				csr = Void
			loop
				Result.items.put_front(csr.path_id)
				csr := csr.parent
			end
		end
								
	path_id: OG_PATH_ITEM is
		deferred
		ensure
			Result_exists: Result /= Void
		end
	
	sibling_order: INTEGER
			-- position of this sibling as child of parent in parsed input
			
	parent: OG_NODE

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
		
feature -- Modification

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
		
	set_sibling_order(i: INTEGER) is
			-- set sibling order
		require
			i >= 1
		do
			sibling_order := i
		end
	
	set_content (a_content_item: SERIALISABLE) is
			-- set item
		require
			Content_item_valid: a_content_item /= Void
		do
			content_item := a_content_item
		ensure
			Content_set: content_item = a_content_item
		end
		
feature -- Serialisation

	enter_block(serialiser: ANY_SERIALISER; depth: INTEGER) is
			-- perform serialisation at start of block for this node
		require
			Serialiser_exists: serialiser /= Void
			Depth_valid: depth >= 0
		do
			content_item.enter_block(serialiser, depth)
		end
		
	exit_block(serialiser: ANY_SERIALISER; depth: INTEGER) is
			-- perform serialisation at end of block for this node
		require
			Serialiser_exists: serialiser /= Void
			Depth_valid: depth >= 0
		do
			content_item.exit_block(serialiser, depth)
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
