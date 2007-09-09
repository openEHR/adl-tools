indexing
	component:   "openEHR Archetype Project"
	description: "node in ADL parse tree"
	keywords:    "test, ADL"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2003-2005 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class DT_ATTRIBUTE_NODE

inherit
	DT_ITEM
		redefine
			parent, representation, default_create
		end

creation
	make_single, make_multiple, make_multiple_generic

feature -- Initialisation

	default_create is
			--
		do
			create children.make (0)
			create children_sorted.make
		end

	make_single(a_name:STRING) is
			-- make as a single relationship; set attr name
		require
			a_name_valid: a_name /= Void and then not a_name.is_empty
		do
			default_create
			create representation.make (a_name, Current)
		end

	make_multiple(a_name:STRING) is
			-- make as a multiple relationship; set attr name
		require
			a_name_valid: a_name /= Void and then not a_name.is_empty
		do
			default_create
			create representation.make (a_name, Current)
			is_multiple := True
		ensure
			is_multiple
		end

	make_multiple_generic is
			-- make as a multiple generic relationship;
			-- create attr name = "gENERIC"
		do
			default_create
			create representation.make_generic (Current)
			is_multiple := True
		ensure
			is_multiple
			is_generic
		end

feature -- Access

	parent: DT_COMPLEX_OBJECT_NODE

	children: ARRAYED_LIST [DT_OBJECT_ITEM]
			-- next nodes, keyed by node id or attribute name

	children_sorted: SORTED_TWO_WAY_LIST[DT_OBJECT_ITEM]

	rm_attr_name: STRING is
			-- attribute name in reference model
		do
			Result := representation.node_id
		end

	child_with_id(a_node_id: STRING): DT_OBJECT_ITEM is
			-- find the child node with `a_path_id'
		do
			Result ?= representation.child_with_id(a_node_id).content_item
		ensure
			Result_exists: Result /= Void
		end

	first_child: DT_OBJECT_ITEM is
			--
		do
			Result := children.first
		end

	child_count: INTEGER is
			-- number of children
		do
			Result := children.count
		end

feature -- Iteration

	start is
		do
			if using_children_sorted then
				children_sorted.start
			else
				children.start
			end
		end

	forth is
		do
			if using_children_sorted then
				children_sorted.forth
			else
				children.forth
			end
		end

	off: BOOLEAN is
		do
			if using_children_sorted then
				Result := children_sorted.off
			else
				Result := children.off
			end
		end

	item: DT_OBJECT_ITEM is
		do
			if using_children_sorted then
				Result := children_sorted.item
			else
				Result := children.item
			end
		end

feature -- Status Report

	is_multiple: BOOLEAN
			-- True if relationship is 1:N

	is_generic: BOOLEAN is
			-- True if relationship represents an assumed
			-- attribute of a container class
		do
			Result := representation.is_generic
		end

	is_valid: BOOLEAN is
			-- report on validity
		do
			create invalid_reason.make(0)
			invalid_reason.append(rm_attr_name)
			Result := True
			if not children.is_empty then
				from
					children.start
				until
					not Result or else representation.off
				loop
					Result := children.item.is_valid
					if Result then
						children.forth
					else
						invalid_reason.append("(invalid child node) " + children.item.invalid_reason)
					end
				end
			end
		end

	has_child_with_id(a_node_id: STRING): BOOLEAN is
			-- valid OBJ children of a REL node might not all be unique
		do
			Result := representation.has_child_with_id(a_node_id)
		end

	has_child(a_node: DT_OBJECT_ITEM): BOOLEAN is
			-- True if a_node is among children of this node
		do
			Result := children.has (a_node)
		end

	using_children_sorted: BOOLEAN
			-- True if using sorted child list

	is_empty: BOOLEAN is
		do
			Result := children.is_empty
		end

feature -- Modification

	set_attr_name(a_name:STRING) is
			-- set attr name
		require
			a_name_valid: a_name /= Void and then not a_name.is_empty
		do
			representation.set_node_id(a_name)
		end

	set_multiple is
			-- set an attribute created single to be multiple
		do
			is_multiple := True
		ensure
			is_multiple
		end

	put_child(a_node: DT_OBJECT_ITEM) is
			-- put a new child node
		require
			Node_valid: a_node /= Void and then not has_child(a_node)
			Multiplicity_validity: is_multiple or else children.is_empty
		do
			representation.put_child (a_node.representation)
			children.extend(a_node)
			children_sorted.extend(a_node)
			a_node.set_parent(Current)
		end

	use_children_sorted is
			-- use sorted list
		do
			using_children_sorted := True
			representation.use_children_sorted
		end

feature -- Representation

	representation: OG_ATTRIBUTE_NODE

feature -- Serialisation

	enter_subtree(serialiser: DT_SERIALISER; depth: INTEGER) is
			-- perform serialisation at start of block for this node
		do
			serialiser.start_attribute_node(Current, depth)
		end

	exit_subtree(serialiser: DT_SERIALISER; depth: INTEGER) is
			-- perform serialisation at end of block for this node
		do
			serialiser.end_attribute_node(Current, depth)
		end

invariant
	Children_exists: children /= Void
	Generic_multiple_validity: is_generic implies is_multiple

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
--| The Original Code is dadl_rel_node.e.
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
