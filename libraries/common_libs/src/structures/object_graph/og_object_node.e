indexing
	component:   "openEHR Archetype Project"
	description: "[
				 Any complex OBJECT node in object parse tree
			 ]"
	keywords:    "object graph, ADL"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2004 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

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

	parent: OG_ATTRIBUTE_NODE
	
	all_paths: ARRAYED_LIST[OG_PATH] is
			-- all paths below this point, including this node
		local
			child_paths: ARRAYED_LIST[OG_PATH]
			attr_node: like child_type
			a_path: OG_PATH
			attr_children: HASH_TABLE [OG_OBJECT, STRING]
			child_obj_node: OG_OBJECT_NODE
		do
			create Result.make(0)
			Result.compare_objects
			
			-- get the attributes of this object
			if has_children then
				from 
					children.start
				until
					children.off
				loop
					attr_node := children.item_for_iteration
					
					-- get the objects of this attribute
		--			if attr_node.has_children then
						attr_children := attr_node.children						
						from	
							attr_children.start
						until
							attr_children.off
						loop
							child_obj_node ?= attr_children.item_for_iteration
							if child_obj_node /= Void then
								child_paths := child_obj_node.all_paths
								from
									child_paths.start
								until
									child_paths.off
								loop
									a_path := child_paths.item
									a_path.prepend_segment(create {OG_PATH_ITEM}.make_with_object_id(attr_node.node_id, child_obj_node.node_id))
									if is_root then
										a_path.set_absolute
									end
									Result.extend(a_path)
									child_paths.forth
								end
								-- add the current object
								if child_obj_node.is_addressable then
									create a_path.make_relative(create {OG_PATH_ITEM}.make_with_object_id(attr_node.node_id, child_obj_node.node_id))	
									if is_root then
										a_path.set_absolute
									end
									Result.extend(a_path)														
								end
							end
							attr_children.forth
						end
	--				else
					-- add current attribute
					create a_path.make_relative(create {OG_PATH_ITEM}.make(attr_node.node_id))						
					if is_root then
						a_path.set_absolute
					end
					Result.extend(a_path)
--					end
					children.forth
				end
			end
		end	

	node_at_path(a_path: OG_PATH): OG_OBJECT is
			-- find the object node at the relative path `a_path'
		require
			Path_valid: a_path /= Void and then has_path(a_path)
		do
			a_path.start				
			Result := internal_node_at_path(a_path)		
		ensure
			Result_exists: Result /= Void
		end

	attribute_node_at_path(a_path: OG_PATH): OG_ATTRIBUTE_NODE is
			-- find the attribute node corresponding the the terminal segment of `a_path'
		require
			Path_valid: a_path /= Void and then has_path(a_path)
		do
			a_path.start				
			Result := internal_attribute_node_at_path(a_path)		
		ensure
			Result_exists: Result /= Void
		end

feature -- Status Report

	has_path(a_path: OG_PATH): BOOLEAN is
			-- find the child at the path `a_path'
		require
			Path_valid: a_path /= Void and then a_path.is_absolute implies is_root
		local
			a_key: STRING
			a_node: OG_NODE
		do
			a_path.start
			Result := internal_has_path(a_path)
		end

feature {OG_OBJECT_NODE} -- Implementation

	child_type: OG_ATTRIBUTE_NODE
			-- relationship target type

	internal_has_path(a_path: OG_PATH): BOOLEAN is
			-- find the child at the path `a_path'
		local
			child_obj_node: OG_OBJECT_NODE
			child_obj: OG_OBJECT
		do			
			-- find child node relating to first relation path item
			if has_object_at_path_segment(a_path.item) then
				child_obj := object_at_path_segment(a_path.item)
				a_path.forth
				if not a_path.off then
					child_obj_node ?= child_obj
					if child_obj_node /= Void then
						Result := child_obj_node.internal_has_path(a_path)
					end
				else
					Result := True
				end
				a_path.back
			else
				Result := a_path.is_last and has_child_node(a_path.last.attr_name)
			end
		end
		
	internal_node_at_path(a_path: OG_PATH): OG_OBJECT is
			-- find the child at the path `a_path'
		local
			child_obj: OG_OBJECT
			child_obj_node: OG_OBJECT_NODE
		do		
			child_obj := object_at_path_segment(a_path.item)
			a_path.forth
			if not a_path.off then
				child_obj_node ?= child_obj -- must exist since path has been checked
				Result := child_obj_node.internal_node_at_path(a_path)
			else
				Result := child_obj
			end
		end
		
	internal_attribute_node_at_path(a_path: OG_PATH): OG_ATTRIBUTE_NODE is
			-- find the child at the path `a_path'
		local
			child_obj_node: OG_OBJECT_NODE
		do
			if has_object_at_path_segment(a_path.item) then
				child_obj_node ?= object_at_path_segment(a_path.item)
					a_path.forth
				if not a_path.off then
					Result := child_obj_node.internal_attribute_node_at_path(a_path)
				else
					Result := child_at_node_id(a_path.last.attr_name)
				end
			elseif a_path.is_last then
				Result := child_at_node_id(a_path.last.attr_name)
			end
		end
		
	has_object_at_path_segment(a_path_segment: OG_PATH_ITEM): BOOLEAN is
			-- True if this object node has an attribute node and an object node below that
			-- that match the path_segment
		local
			an_attr_node: OG_ATTRIBUTE_NODE
		do
			if children.has(a_path_segment.attr_name) then
				an_attr_node := children.item(a_path_segment.attr_name)
				if an_attr_node.has_children then 
					Result := an_attr_node.has_child_node (a_path_segment.object_id)
				end
			end
		end

	object_at_path_segment(a_path_segment: OG_PATH_ITEM): OG_OBJECT is
			-- object node at path_segment - strict match on object part
		require
			has_object_at_path_segment(a_path_segment)
		local
			an_attr_node: OG_ATTRIBUTE_NODE
		do
			Result := children.item(a_path_segment.attr_name).child_at_node_id (a_path_segment.object_id)
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
