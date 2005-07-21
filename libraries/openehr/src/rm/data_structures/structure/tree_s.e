indexing
	component:   "openEHR Data Structures Reference Model"

	description: "[
	             A data structure in the form of a tree.
			 Structure is as follows:
				root: CLUSTER
					branch_1: CLUSTER
						branch_1.1: CLUSTER
							value_1: ELEMENT
							....
							value_N: ELEMENT

						branch_1.2: CLUSTER
							value_1: ELEMENT
							....
							value_N: ELEMENT

						value_1: ELEMENT
						value_2: ELEMENT
						....
						value_N: ELEMENT

					branch_2: CLUSTER
						branch_2.1: CLUSTER
							value_1: ELEMENT
							....
							value_N: ELEMENT

						branch_2.2: CLUSTER
							value_1: ELEMENT
							....
							value_N: ELEMENT

						value_1: ELEMENT
						value_2: ELEMENT
						....
						value_N: ELEMENT

					branch_N: CLUSTER
						branch_N.1: CLUSTER
							value_1: ELEMENT
							....
							value_N: ELEMENT

						branch_N.2: CLUSTER
							value_1: ELEMENT
							....
							value_N: ELEMENT

						value_1: ELEMENT
						value_2: ELEMENT
						....
						value_N: ELEMENT
	             	
	             Valid paths are of the form:	
	             	whole tree: |<root-name>
	             				
	             	branch: |<root-name>|branch=<brach-name>|value=<value_name>
	             	value: |<root-name>|value=<n>
	  	       ]"
	keywords:    "content, spatial, data structure"

	requirements:"ISO 18308 TS V1.0 ???"
	design:      "openEHR Data Structures Reference Model 1.2.1"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2000-2004 The openEHR Foundation <http://www.openEHR.org>"
	license:     "See notice at bottom of class"

	file:        "$Source: C:/project/openehr/spec-dev/architecture/computable/eiffel/rm/data_structures/structure/SCCS/s.tree_s.e $"
	revision:    "$Revision$"
	last_change: "$Date: 05/02/17 22:23:04+00:00 $"

class ITEM_TREE

inherit
	ITEM_STRUCTURE

feature -- Access

	root: CLUSTER
			-- root of tree

	element_at_path(a_path:STRING): ELEMENT is
			-- Return the leaf element at the path ‘a_path’
		require
			has_element_path(a_path)	
		do
		end

	path_of_item (a_loc: LOCATABLE): STRING is
			-- The path to an item relative to the root of this archetyped structure.
		do
		end

	item_at_path (a_path: STRING): LOCATABLE is
			-- The item at a path (relative to this item).
		do
		end

feature -- Status Report

	valid_path (a_path: STRING): BOOLEAN is
			-- True if the path is valid with respect to the current item.
		do
		end

	has_element_path(a_path:STRING): BOOLEAN is
			-- True if path ‘a_path’ is a valid leaf path
		do
		end

feature -- Conversion

	as_hierarchy: CLUSTER is
			-- the physical representation as a CEN 13606-compliant structure
		do
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
--| The Original Code is tree_s.e.
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
