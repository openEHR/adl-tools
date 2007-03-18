indexing
	component:   "openEHR Common Reference Model"
	description: "[
				 Abstract parent of all classes whose instances are reachable by paths, and 
				 which know how to locate child object by paths. The parent feature may be 
				 implemented as a function or attribute.
			     ]"
	keywords:    "path"

	design:      "openEHR Common Reference Model"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2007 The openEHR Foundation <http://www.openEHR.org>"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

deferred class PATHABLE

feature -- Access

	path_of_item (an_item: PATHABLE): STRING is
			-- The path to an item relative to the root of this archetyped structure.
		require
			item_valid: an_item /= Void
		deferred
		end

	item_at_path (a_path: STRING): ANY is
			-- The item at a path (relative to this item).
		require
			Path_valid: a_path /= Void and then path_exists(a_path)
		deferred
		ensure
			Result /= Void
		end

	items_at_path (a_path: STRING): LIST[ANY] is
			-- The item at a path (relative to this item); only valid
			-- for unique paths, i.e. paths that resolve to a single item.
		require
			Path_valid: a_path /= Void and then path_unique(a_path)
		do
		ensure
			Result /= Void
		end

	parent: PATHABLE is
			-- parent node of this node in compositional structure
		deferred
		end

feature -- Status Report

	path_exists (a_path: STRING): BOOLEAN is
			-- True if the path is valid with respect to the current item.
		require
			Path_valid: a_path /= Void and then not a_path.is_empty
		deferred
		end

	path_unique (a_path: STRING): BOOLEAN is
			-- True if the path corresponds to a single item in the data.
		require
  			path_valid: a_path /= Void and then path_exists(a_path)
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
--| The Original Code is locatable.e.
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
