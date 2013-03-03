note
	component:   "openEHR Archetype Project"
	description: "[
				 Any complex OBJECT node in object parse tree
			 ]"
	keywords:    "object graph, ADL"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2004- The openEHR Foundation <http://www.openEHR.org>"
	license:     "See notice at bottom of class"

class OG_OBJECT_NODE

inherit
	OG_OBJECT
		undefine
			default_create
		redefine
			parent
		end

	OG_NODE
		redefine
			child_type, parent
		end

create
	make, make_anonymous

feature -- Access

	parent: detachable OG_ATTRIBUTE_NODE

	all_paths: HASH_TABLE [detachable OG_OBJECT, OG_PATH]
			-- all paths below this point, including this node
		do
			Result := generate_all_paths (False)
			if is_root then
				Result.put (Current, path)
			end
		end

	all_unique_paths: HASH_TABLE [detachable OG_OBJECT, OG_PATH]
			-- all paths below this point, including this node, including with auto-generate
			-- uniqueness predicates, e.g. like [1] or [unknown_1] etc
		do
			Result := generate_all_paths (True)
		end

	object_node_at_path (a_path: OG_PATH): detachable OG_OBJECT
			-- find the object node at the relative path `a_path'
		require
			Path_valid: has_path (a_path)
		local
			s_path: OG_PATH
		do
			if a_path.is_root then
				Result := Current
			else
				-- check for compressed paths & convert path if necessary
				s_path := compress_path(a_path)
				s_path.start
				Result := internal_object_node_at_path (s_path)
			end
		end

	attribute_node_at_path (a_path: OG_PATH): detachable OG_ATTRIBUTE_NODE
			-- find the attribute node corresponding the the terminal segment of `a_path'
		require
			Path_valid: has_path(a_path)
		local
			s_path: OG_PATH
		do
			-- check for compressed paths & convert path if necessary
			s_path := compress_path(a_path)
			s_path.start
			Result := internal_attribute_node_at_path (s_path)
		end

feature -- Status Report

	has_path (a_path: attached OG_PATH): BOOLEAN
			-- `a_path' exists in object structure
		require
			Path_valid: a_path.is_absolute implies is_root
		local
			s_path: OG_PATH
		do
			if a_path.is_root then
				Result := True
			else
				-- check for compressed paths & convert path if necessary
				s_path := compress_path(a_path)
				s_path.start
				Result := internal_has_path(s_path)
			end
		end

	has_object_path (a_path: attached OG_PATH): BOOLEAN
			-- `a_path' refers to an object node in structure
		require
			Path_valid: a_path.is_absolute implies is_root
		local
			s_path: OG_PATH
		do
			if a_path.is_root then
				Result := True
			else
				-- check for compressed paths & convert path if necessary
				s_path := compress_path(a_path)
				s_path.start
				Result := internal_object_node_at_path(s_path) /= Void
			end
		end

	has_attribute_path (a_path: OG_PATH): BOOLEAN
			-- `a_path' refers to an attribute node in structure
		require
			Path_valid: a_path.is_absolute implies is_root
		local
			s_path: OG_PATH
		do
			if a_path.is_root then
				Result := True
			else
				-- check for compressed paths & convert path if necessary
				s_path := compress_path (a_path)
				s_path.start
				Result := attached internal_attribute_node_at_path (s_path)
			end
		end

feature -- Modification

	replace_attribute_name (old_name, new_name: STRING)
			-- change the name of an attribute
		require
			Old_name_valid: has_child_with_id (old_name)
			New_name_valid: not new_name.is_empty
		do
			child_with_id (old_name).set_node_id (new_name)
			children.replace_key (new_name, old_name)
		end

feature {OG_OBJECT_NODE} -- Implementation

	child_type: OG_ATTRIBUTE_NODE
			-- relationship target type
		once
			create Result.make_single (Anonymous_node_id)
		end

	internal_has_path (a_path: OG_PATH): BOOLEAN
			-- find the child at the path `a_path'
		do
			-- find child node relating to first relation path item
			if has_object_at_path_segment(a_path.item) and then attached object_at_path_segment (a_path.item) as child_obj then
				a_path.forth
				if not a_path.off then
					if attached {OG_OBJECT_NODE} child_obj as child_obj_node then
						Result := child_obj_node.internal_has_path(a_path)
					end
				else
					Result := True
				end
				a_path.back
			else -- if it's the last segment, it could be valid as an attribute name, only if no object_id
				Result := a_path.is_last and not a_path.last.is_addressable and has_child_with_id (a_path.last.attr_name)
			end
		end

	internal_object_node_at_path (a_path: OG_PATH): detachable OG_OBJECT
			-- find the child at the path `a_path'
		do
			if has_object_at_path_segment (a_path.item) and then attached object_at_path_segment (a_path.item) as child_obj then
				a_path.forth
				if not a_path.off then
					if attached {OG_OBJECT_NODE} child_obj as child_obj_node then
						Result := child_obj_node.internal_object_node_at_path (a_path)
					end
				else
					Result := child_obj
				end
			end
		end

	internal_attribute_node_at_path(a_path: OG_PATH): detachable OG_ATTRIBUTE_NODE
			-- find the child at the path `a_path'
		do
			if has_object_at_path_segment (a_path.item) and then attached object_at_path_segment (a_path.item) as child_obj then
				a_path.forth
				if not a_path.off then
					if attached {OG_OBJECT_NODE} child_obj as child_obj_node then
						Result := child_obj_node.internal_attribute_node_at_path (a_path)   -- if no predicate in segment, only gets first item
					end
				else
					Result := child_with_id (a_path.last.attr_name)
				end
			elseif a_path.is_last and has_child_with_id (a_path.last.attr_name) then
				Result := child_with_id (a_path.last.attr_name)
			end
		end

	has_object_at_path_segment (a_path_segment: OG_PATH_ITEM): BOOLEAN
			-- True if this object node has an attribute node and an object node below that
			-- that match the path_segment
		do
			if children.has (a_path_segment.attr_name) and then attached children.item (a_path_segment.attr_name) as an_attr_node then
				Result := an_attr_node.has_children and then an_attr_node.has_child_with_id (a_path_segment.object_id)
			end
		end

	object_at_path_segment (a_path_segment: OG_PATH_ITEM): detachable OG_OBJECT
			-- object node at path_segment - strict match on object part
		require
			has_object_at_path_segment (a_path_segment)
		do
			if attached children.item (a_path_segment.attr_name) as an_attr_node then
				Result := an_attr_node.child_with_id (a_path_segment.object_id)
			end
		end

	generate_all_paths (is_unique: BOOLEAN): HASH_TABLE [detachable OG_OBJECT, OG_PATH]
			-- all paths below this point, including this node; if unique_flag is True,
			-- then include the "unknown" ids on non-identified object nodes to give
			-- completely unique paths
		local
			child_paths: like all_paths
			attr_node: like child_type
			a_path: OG_PATH
			child_objs: HASH_TABLE [OG_OBJECT, STRING]
			obj_predicate_required, created_attr_path: BOOLEAN
		do
			create Result.make(0)
			Result.compare_objects

			-- get the attributes of this object
			if has_children then
				across children as child_csr loop
					attr_node := child_csr.item

					-- get the objects of this attribute
					child_objs := attr_node.children
					created_attr_path := False
					across child_objs as child_objs_csr loop
						if attached {OG_OBJECT} child_objs_csr.item as child_obj then
							obj_predicate_required := is_unique or
													(attr_node.is_single and child_obj.is_addressable) or
													-- use this line of code to get rid of node ids on single nodes	
													--	(attr_node.is_single and attr_node.child_count > 1 and child_obj.is_addressable) or
													attr_node.is_multiple
							if attached {OG_OBJECT_NODE} child_obj as child_obj_node then
								child_paths := child_obj_node.all_paths
								across child_paths as child_paths_csr loop
									a_path := child_paths_csr.key.twin
									if obj_predicate_required then
										a_path.prepend_segment (create {OG_PATH_ITEM}.make_with_object_id (attr_node.node_id, child_obj_node.node_id))
									else
										a_path.prepend_segment (create {OG_PATH_ITEM}.make (attr_node.node_id))
									end
									if attr_node.has_differential_path then
										a_path.prepend_path (attr_node.differential_path.deep_twin)
									end
									if is_root then
										a_path.set_absolute
									end
									Result.put (child_paths_csr.item, a_path)
								end
							end

							-- add path for the current child
							if obj_predicate_required then
								create a_path.make_relative (create {OG_PATH_ITEM}.make_with_object_id (attr_node.node_id, child_obj.node_id))
							else
								create a_path.make_relative (create {OG_PATH_ITEM}.make (attr_node.node_id))
								created_attr_path := True -- this kind of path (with no node id) is the same as the path to the attribute...
							end
							if attr_node.has_differential_path then
								a_path.prepend_path (attr_node.differential_path.deep_twin)
							end
							if is_root then
								a_path.set_absolute
							end
							Result.put (child_obj, a_path)
						end
					end

					if not created_attr_path then
						create a_path.make_relative (create {OG_PATH_ITEM}.make (attr_node.node_id))
						if is_root then
							a_path.set_absolute
						end
						Result.put (Void, a_path)
					end
				end
			end
		end

	compress_path (a_path: OG_PATH): OG_PATH
			-- if there is an attribute under this object node with a differential path matching `a_path',
			-- generate a new path whose first attribute contains the differential section in it;
			-- else return the original `a_path'
		require
			Path_valid: not a_path.is_compressed
		local
			cand_path, a_path_str: STRING
		do
			if is_root then
				a_path_str := a_path.as_string
				create cand_path.make (0)
				across children as child_csr loop
					-- if there is a differential path and it fits inside the search path, the search path could be off that attribute
					if child_csr.item.has_differential_path and then a_path_str.substring_index (child_csr.key, 1) = 1 and
						child_csr.key.count > cand_path.count
					then
						cand_path := child_csr.key
					end
				end
				if not cand_path.is_empty then
					a_path.go_i_th (children.item (cand_path).differential_path.count + 1)
					Result := a_path.sub_path_from_item
					Result.compress_path (cand_path)
					if a_path.is_absolute then
						Result.set_absolute
					end
				else
					Result := a_path
				end
			else
				Result := a_path
			end
		end

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
--| The Original Code is cadl_object_item.e.
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
