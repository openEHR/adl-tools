note
	component:   "openEHR ADL Tools"
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
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


deferred class PATHABLE

feature -- Access

	path_of_item (an_item: PATHABLE): STRING
			-- The path to an item relative to the root of this archetyped structure.
		require
			item_valid: an_item /= Void
		deferred
		end

	item_at_path (a_path: STRING): ANY
			-- The item at a path (relative to this item).
		require
			Path_valid: a_path /= Void and then path_exists(a_path)
		deferred
		ensure
			Result /= Void
		end

	items_at_path (a_path: STRING): LIST[ANY]
			-- The item at a path (relative to this item); only valid
			-- for unique paths, i.e. paths that resolve to a single item.
		require
			Path_valid: a_path /= Void and then path_unique(a_path)
		do
		ensure
			Result /= Void
		end

	parent: PATHABLE
			-- parent node of this node in compositional structure
		deferred
		end

feature -- Status Report

	path_exists (a_path: STRING): BOOLEAN
			-- True if the path is valid with respect to the current item.
		require
			Path_valid: a_path /= Void and then not a_path.is_empty
		deferred
		end

	path_unique (a_path: STRING): BOOLEAN
			-- True if the path corresponds to a single item in the data.
		require
  			path_valid: a_path /= Void and then path_exists(a_path)
		do
		end

end


