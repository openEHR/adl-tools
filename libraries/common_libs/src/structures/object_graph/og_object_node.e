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
			child_node: like child_type
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
					child_paths := child_node.all_paths
							
					from
						child_paths.start
					until
						child_paths.off
					loop
						a_path := child_paths.item
						a_path.items.put_front(path_id)
						if is_root then
							a_path.set_absolute
						end
						Result.extend(a_path)
						child_paths.forth
					end
					children.forth
				end
			end

			if is_root then
				create a_path.make_absolute(path_id)
			else
				create a_path.make_relative(path_id)
			end
			if Result.is_empty then	-- this node is last addressable node on this branch
				a_path.set_terminal
			end
			Result.extend(a_path)		
		end
	
feature {NONE} -- Implementation

	child_type: OG_ATTRIBUTE_NODE
			-- relationship target type

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
