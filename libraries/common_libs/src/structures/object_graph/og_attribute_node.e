indexing
	component:   "openEHR Archetype Project"
	description: "Attribute node in ADL parse tree"
	keywords:    "ADL"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2004 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class OG_ATTRIBUTE_NODE

inherit
	OG_NODE
		redefine
			parent, child_type, put_child, valid_child_for_insertion
		end

create
	make, make_generic

feature -- Definitions

	Generic_attr_name: STRING is "gENERIC"
			-- name given to assumed multiple attribute of container types
			
feature -- Initialisation

	make_generic (a_content_item: SERIALISABLE) is
			-- create with pseudo-node id indicating that it is an unnamed
			-- container attribute of a generic type
		do
			default_create
			node_id := Generic_attr_name.twin
			content_item := a_content_item
			is_generic := True
		ensure
			Node_id_set: node_id.is_equal(Generic_attr_name)
			Is_generic: is_generic
		end
	
feature -- Access

	parent: OG_OBJECT_NODE
	
	path_id: OG_PATH_ITEM is
		do
			if not is_generic then
				create Result.make_attribute(node_id.twin)
			else			
				create Result.make_attribute("")
			end
		end
	
	all_paths: ARRAYED_LIST[OG_PATH] is
			-- all paths below this point, including this node
		local
			child_paths: ARRAYED_LIST[OG_PATH]
			obj_node: OG_OBJECT_NODE
			child_node: OG_OBJECT
			a_path: OG_PATH
		do
			create Result.make(0)
			Result.compare_objects
			
			if has_children then
				from 
					children.start
				until
					children.off
				loop
					child_node := children.item_for_iteration
			--		if child_node.is_addressable then
						obj_node ?= child_node
						if obj_node /= Void then
							child_paths := obj_node.all_paths
							from
								child_paths.start
							until
								child_paths.off
							loop
								a_path := child_paths.item
								a_path.items.put_front(path_id)
								Result.extend(a_path)
								child_paths.forth
							end
						else -- must be an object leaf node
							create a_path.make_relative(child_node.path_id)		
							a_path.items.put_front(path_id)
							Result.extend(a_path)
						end
			--		end
					children.forth
				end
			end
		end

feature -- Status Report

	is_multiple: BOOLEAN is
			-- True if there is more than one child
		do
			Result := children.count > 1
		end

	is_generic: BOOLEAN
			-- True if this attribute is a created pseudo attribute
			-- representing an unnamed attribute in a generic class like List<T>
			
	is_addressable: BOOLEAN is True
			-- True if this node has a non-anonymous node_id

	is_object_node: BOOLEAN is False

	valid_child_for_insertion(a_node: like child_type):BOOLEAN is
			-- valid OBJ children of a REL node might not all be unique
		do
			Result := not children_ordered.has(a_node)
		end
		
feature -- Modification
		
	put_child(obj_node: like child_type) is
			-- put a new child node
		local
			new_id: STRING
		do
			-- if new child is an OBJECT_NODE id is known in children, generate a unique id for it
			if children.has(obj_node.node_id) then
				duplicate_child_id_count := duplicate_child_id_count + 1
				new_id := obj_node.path_id.value + "_" + duplicate_child_id_count.out
				obj_node.set_node_id(new_id)
			end			
			precursor(obj_node)
		end

feature {NONE} -- Implementation

	child_type: OG_OBJECT
			-- relationship target type

	duplicate_child_id_count: INTEGER
			-- cumulative count of children with 'unknown' ids - used to generate unique ids
			
invariant
	Multiplicity_validity: children.count > 1 implies is_multiple
	Generic_validity: not (is_generic xor node_id.is_equal(Generic_attr_name))

-- FIXME: the following would be preferable, but means all OG_ATTRIBUTE_NODEs need
-- to have OG_OBJECT_NODE parent supplied to make routines; which is probably ok, but
-- causes a fair few changes elsewhere
--	Not_is_root: not is_root
	
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
--| The Original Code is cadl_rel_node.e.
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
