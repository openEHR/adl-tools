note
	component:   "openEHR Archetype Project"
	description: "[
			     Object node representing any non-simple type in ADL parse tree. 
			     Can be any of the following:
			     	- normal object with child properties
			     	- constraint referring to other archetype(s)
			     	- coded reference to a constraint defined somewhere else 
			     		(usually in the terminology part of the archetype)
			     	- 'any' node, meaning no constraint other than the type
			     ]"
	keywords:    "test, ADL"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.com>"
	copyright:   "Copyright (c) 2003-2009 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class C_COMPLEX_OBJECT

inherit
	C_DEFINED_OBJECT
		redefine
			default_create, representation, out
		end

create
	make_identified, make_anonymous

feature -- Initialisation

	default_create
			--
		do
			create attributes.make(0)
		end

	make_identified (a_rm_type_name, an_object_id: attached STRING)
			-- set type name, object_id
		require
			Rm_type_name_valid: not a_rm_type_name.is_empty
			Object_id_valid: not an_object_id.is_empty
		do
			default_create
			create representation.make(an_object_id, Current)
			rm_type_name := a_rm_type_name
		end

	make_anonymous (a_rm_type_name: attached STRING)
			-- set type name
		require
			Rm_type_name_valid: not a_rm_type_name.is_empty
		do
			default_create
			create representation.make_anonymous(Current)
			rm_type_name := a_rm_type_name
		end

feature -- Access

	attributes: attached ARRAYED_LIST [C_ATTRIBUTE]

	c_attribute (an_attr_name: attached STRING): C_ATTRIBUTE
		require
			an_attr_name_valid: has_attribute(an_attr_name)
		do
			Result ?= representation.child_with_id(an_attr_name).content_item
		end

	c_attribute_at_path (a_path: attached STRING): C_ATTRIBUTE
			-- get C_ATTRIBUTE at a path (which doesn't terminate in '/')
		require
			a_path_valid: has_path(a_path)
		do
			Result ?= representation.attribute_node_at_path (create {OG_PATH}.make_from_string(a_path)).content_item
		end

	c_object_at_path (a_path: attached STRING): C_OBJECT
			-- get C_OBJECT at a path (which terminates in '/')
		require
			a_path_valid: has_path(a_path)
		do
			Result ?= representation.object_node_at_path (create {OG_PATH}.make_from_string(a_path)).content_item
		end

	all_paths_at_path (a_path: attached STRING): attached HASH_TABLE[C_OBJECT, STRING]
			-- all paths starting at node found at a_path, including itself
		require
			Path_valid: has_path(a_path)
		local
			og_paths: HASH_TABLE [OG_OBJECT, OG_PATH]
			og_node: OG_OBJECT_NODE
		do
			og_node ?= representation.object_node_at_path(create {OG_PATH}.make_from_string(a_path))
			og_paths := og_node.all_paths
			create Result.make(0)
			from og_paths.start until og_paths.off loop
				if attached {OG_OBJECT} og_paths.item_for_iteration as og_obj then
					if attached {C_OBJECT} og_obj.content_item as c_obj then
						Result.put (c_obj, og_paths.key_for_iteration.as_string)
					end
				else
					Result.put (Void, og_paths.key_for_iteration.as_string)
				end
				og_paths.forth
			end
		end

	all_paths: attached HASH_TABLE [C_OBJECT, STRING]
			-- All paths below this point, including this node.
		local
			og_paths: HASH_TABLE [OG_OBJECT, OG_PATH]
		do
			og_paths := representation.all_paths
			create Result.make (0)
			from og_paths.start until og_paths.off loop
				if attached {OG_OBJECT} og_paths.item_for_iteration as og_obj then
					if attached {C_OBJECT} og_obj.content_item as c_obj then
						Result.put (c_obj, og_paths.key_for_iteration.as_string)
					end
				else
					Result.put (Void, og_paths.key_for_iteration.as_string)
				end
				og_paths.forth
			end
		end

	prototype_value: ANY
			-- 	generate a default value from this constraint object
		do
			-- FIXME: to be implemented
		end

feature -- Status Report

	any_allowed: BOOLEAN
			-- True if any value allowed ('*' received in parsed input)
			-- i.e. no attributes
		do
			Result := attributes.is_empty and not is_prohibited
		end

	has_attributes: BOOLEAN
			-- True if any attribute nodes below this node
		do
			Result := attributes.count > 0
		end

	has_path (a_path: attached STRING): BOOLEAN
			-- does a_path exist from this node?
		do
			Result := representation.has_path (create {OG_PATH}.make_from_string(a_path))
		end

	has_object_path (a_path: attached STRING): BOOLEAN
			-- does a_path exist to an object node from this node?
		do
			Result := representation.has_object_path (create {OG_PATH}.make_from_string(a_path))
		end

	has_attribute_path (a_path: attached STRING): BOOLEAN
			-- does a_path to an object node exist from this node?
		do
			Result := representation.has_attribute_path (create {OG_PATH}.make_from_string(a_path))
		end

	has_attribute (an_attr_name: attached STRING): BOOLEAN
		require
			an_attr_name_valid: not an_attr_name.is_empty
		do
			Result := representation.has_child_with_id (an_attr_name)
		end

	valid_value (a_value: like prototype_value): BOOLEAN
		do
			-- FIXME: to be implemented
		end

feature -- Modification

	put_attribute (an_attr: attached C_ATTRIBUTE)
			-- put a new attribute
		require
			Attribute_valid: not has_attribute (an_attr.rm_attribute_path)
		do
			representation.put_child (an_attr.representation)
			attributes.extend (an_attr)
			an_attr.set_parent (Current)
		end

	remove_attribute (an_attr: attached C_ATTRIBUTE)
			-- remove an existing attribute
		require
			Attribute_valid: has_attribute (an_attr.rm_attribute_path)
		do
			attributes.prune_all(an_attr)
			representation.remove_child (an_attr.representation)
		ensure
			not has_attribute (an_attr.rm_attribute_path)
		end

	remove_attribute_by_name (an_attr_name: attached STRING)
			-- remove an existing attribute
		require
			Attribute_name_valid: has_attribute (an_attr_name)
		local
			ca: C_ATTRIBUTE
		do
			ca := c_attribute (an_attr_name)
			attributes.prune_all(ca)
			representation.remove_child (ca.representation)
		ensure
			not has_attribute (an_attr_name)
		end

	remove_all_attributes
			--
		do
			representation.remove_all_children
			attributes.wipe_out
		end

feature -- Output

	out: attached STRING
			--
		do
			create Result.make(0)
			Result.append (rm_type_name + "[" + node_id + "] ")
			if attached occurrences then
				Result.append(occurrences.as_string)
			end
		end

feature -- Representation

	representation: attached OG_OBJECT_NODE

feature -- Visitor

	enter_subtree (visitor: C_VISITOR; depth: INTEGER)
			-- perform action at start of block for this node
		do
			visitor.start_c_complex_object (Current, depth)
		end

	exit_subtree (visitor: C_VISITOR; depth: INTEGER)
			-- perform action at end of block for this node
		do
			visitor.end_c_complex_object (Current, depth)
		end

feature {NONE} -- Implementation

	child_type: C_ATTRIBUTE
			-- child parse nodes
		note
			option: transient
		attribute
		end

invariant
	Any_allowed_validity: any_allowed xor not attributes.is_empty

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
--| The Original Code is cadl_object_node.e.
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
