indexing
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
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2003, 2004 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class C_COMPLEX_OBJECT

inherit
	C_DEFINED_OBJECT
		redefine
			default_create, representation, out, is_valid
		end

create
	make_identified, make_anonymous

feature -- Initialisation

	default_create is
			--
		do
			precursor
			create attributes.make(0)
		end

	make_identified(a_rm_type_name, an_object_id:STRING) is
			-- set type name, object_id
		require
			Rm_type_name_valid: a_rm_type_name /= Void and then not a_rm_type_name.is_empty
			Object_id_valid: an_object_id /= Void and then not an_object_id.is_empty
		do
			default_create
			create representation.make(an_object_id, Current)
			rm_type_name := a_rm_type_name
		end

	make_anonymous(a_rm_type_name:STRING) is
			-- set type name
		require
			Rm_type_name_valid: a_rm_type_name /= Void and then not a_rm_type_name.is_empty
		do
			default_create
			create representation.make_anonymous(Current)
			rm_type_name := a_rm_type_name
		end

feature -- Access

	attributes: ARRAYED_LIST [C_ATTRIBUTE]

	c_attribute_at_path(a_path: STRING): C_ATTRIBUTE is
			-- get C_ATTRIBUTE at a path (which doesn't terminate in '/')
		require
			a_path_valid: a_path /= Void and then has_path(a_path)
		do
			Result ?= representation.attribute_node_at_path (create {OG_PATH}.make_from_string(a_path)).content_item
		end

	c_object_at_path(a_path: STRING): C_OBJECT is
			-- get C_OBJECT at a path (which terminates in '/')
		require
			a_path_valid: a_path /= Void and then has_path(a_path)
		do
			Result ?= representation.object_node_at_path (create {OG_PATH}.make_from_string(a_path)).content_item
		end

	all_paths_at_path(a_path: STRING): HASH_TABLE[C_OBJECT, STRING] is
			-- all paths starting at node found at a_path, including itself
		require
			Path_valid: a_path /= Void and then has_path(a_path)
		local
			og_paths: HASH_TABLE [OG_OBJECT, OG_PATH]
			og_node: OG_OBJECT_NODE
			c_obj: C_OBJECT
		do
			og_node ?= representation.object_node_at_path(create {OG_PATH}.make_from_string(a_path))
			og_paths := og_node.all_paths
			create Result.make(0)
			from
				og_paths.start
			until
				og_paths.off
			loop
				c_obj ?= og_paths.item_for_iteration.content_item
				Result.put(c_obj, og_paths.key_for_iteration.as_string)
				og_paths.forth
			end
		ensure
			Result_exists: Result /= Void
		end

	all_paths: HASH_TABLE [C_OBJECT, STRING] is
			-- All paths below this point, including this node.
		local
			og_paths: HASH_TABLE [OG_OBJECT, OG_PATH]
			og_obj: OG_OBJECT
		do
			og_paths := representation.all_paths
			create Result.make (0)

			from
				og_paths.start
			until
				og_paths.off
			loop
				og_obj := og_paths.item_for_iteration

				if og_obj /= Void then
					if {c_obj: !C_OBJECT} og_obj.content_item then
						Result.put (c_obj, og_paths.key_for_iteration.as_string)
					end
				end

				og_paths.forth
			end
		ensure
			Result_exists: Result /= Void -- and then Result.object_comparison
		end

	default_value: ANY is
			-- 	generate a default value from this constraint object
		do
		end

feature -- Status Report

	any_allowed: BOOLEAN is
			-- True if any value allowed ('*' received in parsed input)
			-- i.e. no attributes
		do
			Result := attributes.is_empty
		end

	has_path(a_path: STRING): BOOLEAN is
			-- does a_path exist from this node?
		require
			Path_valid: a_path /= Void
		do
			Result := representation.has_path(create {OG_PATH}.make_from_string(a_path))
		end

	has_object_path(a_path: STRING): BOOLEAN is
			-- does a_path exist to an object node from this node?
		require
			Path_valid: a_path /= Void
		do
			Result := representation.has_object_path(create {OG_PATH}.make_from_string(a_path))
		end

	has_attribute_path(a_path: STRING): BOOLEAN is
			-- does a_path to an object node exist from this node?
		require
			Path_valid: a_path /= Void
		do
			Result := representation.has_attribute_path(create {OG_PATH}.make_from_string(a_path))
		end

	has_attribute(an_attr_name: STRING): BOOLEAN is
		require
			an_attr_name_valid: an_attr_name /= Void and then not an_attr_name.is_empty
		do
			Result := representation.has_child_with_id(an_attr_name)
		end

	is_valid: BOOLEAN is
			-- report on validity
		do
			if precursor then
				if any_allowed and representation.has_children then
					invalid_reason.append("cannot have both 'any_allowed' and have children")
				else
					Result := True
					from
						attributes.start
					until
						not Result or else attributes.off
					loop
						Result := attributes.item.is_valid
						if Result then
							attributes.forth
						else
							invalid_reason.append("(invalid child node) " + attributes.item.invalid_reason)
						end
					end
				end
			end
		end

	valid_value (a_value: like default_value): BOOLEAN is
		do
			-- FIXME: to be implemented
		end

feature -- Modification

	put_attribute(an_attr: C_ATTRIBUTE) is
			-- put a new attribute
		require
			Attribute_exists: an_attr /= Void
		do
			representation.put_child(an_attr.representation)
			attributes.extend(an_attr)
			an_attr.set_parent(Current)
		end

	remove_attribute(an_attr: C_ATTRIBUTE) is
			-- remove an existing attribute
		require
			Attribute_exists: an_attr /= Void and has_attribute (an_attr.rm_attribute_name)
		do
			attributes.prune_all(an_attr)
			representation.remove_child (an_attr.rm_attribute_name)
		end

	remove_all_attributes is
			--
		do
			representation.remove_all_children
			attributes.wipe_out
		end

feature -- Output

	out: STRING is
			--
		do
			create Result.make(0)
			Result.append(rm_type_name + "[" + representation.node_id + "] " + occurrences.as_string)
		end

feature -- Representation

	representation: !OG_OBJECT_NODE

feature -- Visitor

	enter_subtree(visitor: C_VISITOR; depth: INTEGER) is
			-- perform action at start of block for this node
		do
			visitor.start_c_complex_object(Current, depth)
		end

	exit_subtree(visitor: C_VISITOR; depth: INTEGER) is
			-- perform action at end of block for this node
		do
			visitor.end_c_complex_object(Current, depth)
		end

feature {NONE} -- Implementation

	child_type: C_ATTRIBUTE
			-- child parse nodes

invariant
	attributes_valid: attributes /= Void
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
