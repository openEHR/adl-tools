note
	component:   "openEHR ADL Tools"
	description: "Item representing a 'use' reference in an ADL parse tree. The referenced node must be an object node."
	keywords:    "test, ADL"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2003- The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class C_COMPLEX_OBJECT_PROXY

inherit
	C_OBJECT
		redefine
			representation_cache
		end

create
	make

feature -- Initialisation

	make (a_rm_type_name, an_object_id, a_path: STRING)
			-- make with id
		require
			rm_type_name_valid: not a_rm_type_name.is_empty
			object_id_valid: not an_object_id.is_empty
			path_valid: not a_path.is_empty
		do
			rm_type_name := a_rm_type_name
			set_target_path (a_path)
			create representation_cache.make (an_object_id, a_path)
			representation_cache.set_content (Current)
		ensure
			Use_target_occurrences: use_target_occurrences
		end

feature -- Access

	has_sibling_target: BOOLEAN
		do
			Result := representation.has_sibling_target
		end

	target_path: STRING
			-- path to the referenced node

feature -- Status Report

	use_target_occurrences: BOOLEAN
			-- True if target occurrences are to be used as the value of occurrences in this object;
			-- by the time of runtime use, the target occurrences value has to be set into this object
		do
			Result := not attached occurrences
		end

feature -- Modification

	set_target_path (a_path: STRING)
			-- set reference path with a valid ADL path string
		do
			target_path := a_path
		end

feature -- Visitor

	enter_subtree (visitor: C_VISITOR; depth: INTEGER)
			-- perform action at start of block for this node
		do
			visitor.start_c_complex_object_proxy (Current, depth)
		end

	exit_subtree (visitor: C_VISITOR; depth: INTEGER)
			-- perform action at end of block for this node
		do
			visitor.end_c_complex_object_proxy (Current, depth)
		end

feature {NONE} -- Implementation

	representation_cache: detachable OG_OBJECT_PROXY
		note
			option: transient
		attribute
		end

	create_default_representation: attached like representation_cache
			-- create a reasonable `representation' instance
		do
			create Result.make ("id1", "/")
		end

end


